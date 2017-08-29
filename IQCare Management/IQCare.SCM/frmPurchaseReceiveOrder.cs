﻿using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using Application.Common;
using Application.Presentation;
using Interface.SCM;
using CrystalDecisions.CrystalReports.Engine;


namespace IQCare.SCM
{
    public partial class frmPurchaseReceiveOrder : Form
    {
        public int StoreID = 0;
        DataSet dsPOItems = new DataSet();
        DataSet dsPOItemsDetail = new DataSet();
        public bool deletedGridByKey = false;

        public Form PreviousForm;

        public ComboBox theGrdCombo;
        //   bool IsHandleAdded;
        DataTable dtOrdermaster;
        DataTable dtOrderItem;
        /* No used 
          /////// <summary>
          /////// if IsPO = 2 then No interstore transfer and no Purchase Order  Selected
          /////// if IsPO = 1 then  Purchase Order  Selected
          /////// if IsPO = 0 then  Interstore transfer  Selected
          /////// </summary>
          ////int IsPurchaseOrder = 2;
            */
        /// <summary>
        /// GblIQCare.ModePurchaseOrder =1 then Purchase Order 
        /// GblIQCare.ModePurchaseOrder = 2 then InterStore Transfer 
        /// </summary>
        bool IsPOUpdated = false;

        public frmPurchaseOrder()
        {
            InitializeComponent();
        }

        private void frmPurchaseOrder_Load(object sender, EventArgs e)
        {
            SetRights();
            dtpOrderDate.CustomFormat = "dd-MMM-yyyy";
            dtpOrderDate.Text = GblIQCare.CurrentDate;
            dtpOrderDate.Enabled = false;
            clsCssStyle theStyle = new clsCssStyle();
            chkRejectedStatus.Visible = false;
            theStyle.setStyle(this);
            dgwItemSubitemDetails.AllowUserToAddRows = false;
            BindStoreName();
            lblSupplier.Tag = "lblLabelRequired";
            ddlDestinationStore.Enabled = false;
            ddlSupplier.Enabled = true;
            BindSupplierDropdown();
            theStyle.setStyle(lblSupplier);
          
            if (GblIQCare.PurchaseOrderID != 0)
            {
                formInit();
            }
            else
            {
                BindGrid(GblIQCare.ModePurchaseOrder);
            }
        }

        public void SetRights()
        {
            //form level permission set
            if (GblIQCare.HasFunctionRight(ApplicationAccess.PurchaseOrder, FunctionAccess.Add, GblIQCare.dtUserRight) == false)
            {
                btnSave.Enabled = false;
            }

        }

        private void dgwItemSubitemDetails_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {


        }
        private DataTable CreateOrderMasterTable()
        {

            DataTable dtOrdermaster = new DataTable();
            dtOrdermaster.Columns.Add("IsPO", typeof(int));
            dtOrdermaster.Columns.Add("POID", typeof(int));
            dtOrdermaster.Columns.Add("PONumber", typeof(string));
            dtOrdermaster.Columns.Add("OrderDate", typeof(DateTime));
            dtOrdermaster.Columns.Add("SupplierID", typeof(int));
            dtOrdermaster.Columns.Add("SrcStore", typeof(int));
            dtOrdermaster.Columns.Add("DestStore", typeof(int));
            dtOrdermaster.Columns.Add("UserID", typeof(int));
            dtOrdermaster.Columns.Add("PreparedBy", typeof(int));
            dtOrdermaster.Columns.Add("AthorizedBy", typeof(int));
            dtOrdermaster.Columns.Add("LocationID", typeof(int));
            dtOrdermaster.Columns.Add("IsRejectedStatus", typeof(int));
            return dtOrdermaster;
        }
        private DataTable CreateOrderItemTable()
        {
            DataTable dtOrderItem = new DataTable();
            dtOrderItem.Columns.Add("ItemId", typeof(int));
            dtOrderItem.Columns.Add("ItemTypeId", typeof(int));
            dtOrderItem.Columns.Add("SupplierId", typeof(int));
            dtOrderItem.Columns.Add("ItemName", typeof(string));
            dtOrderItem.Columns.Add("PurchaseUnit", typeof(int));
            dtOrderItem.Columns.Add("Quantity", typeof(int));
            dtOrderItem.Columns.Add("IssuedQuantity", typeof(int));
            dtOrderItem.Columns.Add("IssuedQuantityDU", typeof(int));
            dtOrderItem.Columns.Add("priceperunit", typeof(decimal));
            dtOrderItem.Columns.Add("totPrice", typeof(int));
            dtOrderItem.Columns.Add("BatchName", typeof(string));
            dtOrderItem.Columns.Add("AvaliableQty", typeof(int));
            dtOrderItem.Columns.Add("ExpiryDate", typeof(DateTime));
            dtOrderItem.Columns.Add("UnitQuantity", typeof(int));
            dtOrderItem.Columns.Add("IsPOorIST", typeof(int));
            //dtOrderItem.Columns.Add("Delete", typeof(String));
            // dtOrderItem.Columns.Add("IsFunded", typeof(int));
            return dtOrderItem;
        }

        private void BindSupplierDropdown()
        {
            IQCareUtils theUtils = new IQCareUtils();

            try
            {
                BindFunctions theBind = new BindFunctions();
                ddlSupplier.DataSource = null;
                DataSet XMLDS = new DataSet();
                XMLDS.ReadXml(GblIQCare.GetXMLPath() + "\\AllMasters.con");
                BindFunctions theBindManager = new BindFunctions();
                DataView theDV = new DataView(XMLDS.Tables["Mst_Supplier"]);
                theDV.RowFilter = "(DeleteFlag = 0 or  DeleteFlag is null)";
                DataTable theStoreDT = theDV.ToTable();
                theBind.Win_BindCombo(ddlSupplier, theStoreDT, "SupplierName", "Id");


            }
            catch (Exception err)
            {
                MsgBuilder theBuilder = new MsgBuilder();
                theBuilder.DataElements["MessageText"] = err.Message.ToString();
                IQCareWindowMsgBox.ShowWindowConfirm("#C1", theBuilder, this);
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (ddlSupplier.SelectedValue.ToString() == "0")
            {
                MsgBuilder theBuilder = new MsgBuilder();
                theBuilder.DataElements["Control"] = "Supplier Name";
                IQCareWindowMsgBox.ShowWindow("BlankDropDown", theBuilder, this);
                ddlSupplier.Focus();
                return;
            }
            if (ddlDestinationStore.SelectedValue.ToString() == "0")
            {
                MsgBuilder theBuilder = new MsgBuilder();
                theBuilder.DataElements["Control"] = "Destination Store";
                IQCareWindowMsgBox.ShowWindow("BlankDropDown", theBuilder, this);
                ddlSupplier.Focus();
                return;
            }
            if (ddlPreparedBy.SelectedValue.ToString() == "0")
            {
                MsgBuilder theBuilder = new MsgBuilder();
                theBuilder.DataElements["Control"] = "Prepared By";
                IQCareWindowMsgBox.ShowWindow("BlankDropDown", theBuilder, this);
                ddlSupplier.Focus();
                return;
            }
            dtOrdermaster = CreateOrderMasterTable();
            DataRow theDRow = dtOrdermaster.NewRow();

            theDRow["OrderDate"] = dtpOrderDate.Text;
            if (txtOrderNumber.Text != "") { theDRow["PONumber"] = txtOrderNumber.Text.Trim(); }

            theDRow["DestStore"] = Convert.ToInt32(ddlDestinationStore.SelectedValue);
            theDRow["SupplierID"] = Convert.ToInt32(ddlSupplier.SelectedValue);
            theDRow["PreparedBy"] = Convert.ToInt32(ddlPreparedBy.SelectedValue);
            theDRow["AthorizedBy"] = Convert.ToInt32(ddlAuthorisedBy.SelectedValue);

            theDRow["UserID"] = Convert.ToInt32(GblIQCare.AppUserId);
            theDRow["LocationID"] = Convert.ToInt32(GblIQCare.AppLocationId);
            if (IsPOUpdated)
            {
                theDRow["IsRejectedStatus"] = chkRejectedStatus.Checked ? 1 : 0;
                theDRow["POID"] = GblIQCare.PurchaseOrderID;
            }
            dtOrdermaster.Rows.Add(theDRow);

            //DataTable theGrdTable = (DataTable)dgwItemSubitemDetails.DataSource;
            dtOrderItem = CreateOrderItemTable();

            for (int i = 0; i < dgwItemSubitemDetails.Rows.Count; i++)
            {
                // if (Convert.ToInt32(dgwItemSubitemDetails.Rows[i].Cells[0].Value) > 0)
                if (!string.IsNullOrEmpty(Convert.ToString(dgwItemSubitemDetails.Rows[i].Cells[0].Value)))
                {
                    if (Convert.ToString(dgwItemSubitemDetails.Rows[i].Cells["Units"].Value) == "")
                    {
                        IQCareWindowMsgBox.ShowWindow("PurchaseOrderUnitempty", this);
                        return;
                    }

                    if (Convert.ToString(dgwItemSubitemDetails.Rows[i].Cells["OrderQuantity"].Value) == "0")
                    {
                        IQCareWindowMsgBox.ShowWindow("PurchaseOrderQuantityZero", this);
                        return;
                    }
                    if (string.IsNullOrEmpty(Convert.ToString(dgwItemSubitemDetails.Rows[i].Cells["OrderQuantity"].Value)))
                    {
                        dgwItemSubitemDetails.Rows[i].Cells["OrderQuantity"].Value = 0;
                        IQCareWindowMsgBox.ShowWindow("PurchaseOrderQuantityZero", this);
                        return;
                    }

                    if (string.IsNullOrEmpty(Convert.ToString(dgwItemSubitemDetails.Rows[i].Cells["BatchName"].Value)))
                    {
                        IQCareWindowMsgBox.ShowWindow("MissingBatchNumber", this);
                        return;
                    }
                    if (string.IsNullOrEmpty(Convert.ToString(dgwItemSubitemDetails.Rows[i].Cells["ExpiryDate"].Value)))
                    {
                        IQCareWindowMsgBox.ShowWindow("MissingExpiryDate", this);
                        return;
                    }

                    if (Convert.ToString(dgwItemSubitemDetails.Rows[i].Cells["IssuedQuantity"].Value) == "0")
                    {
                        IQCareWindowMsgBox.ShowWindow("PurchaseOrderIssuedQuantityZero", this);
                        return;
                    }
                    if (string.IsNullOrEmpty(Convert.ToString(dgwItemSubitemDetails.Rows[i].Cells["IssuedQuantity"].Value)))
                    {
                        dgwItemSubitemDetails.Rows[i].Cells["IssuedQuantity"].Value = 0;
                        IQCareWindowMsgBox.ShowWindow("PurchaseOrderIssuedQuantityZero", this);
                        return;
                    }

                    if (string.IsNullOrEmpty(Convert.ToString(dgwItemSubitemDetails.Rows[i].Cells["IssuedQuantityDU"].Value)))
                    {
                        dgwItemSubitemDetails.Rows[i].Cells["IssuedQuantityDU"].Value = 0;
                        IQCareWindowMsgBox.ShowWindow("PurchaseOrderIssuedQuantityDUZero", this);
                        return;
                    }

                    DataRow theDRowItem = dtOrderItem.NewRow();
                    if (GblIQCare.ModePurchaseOrder == 1)
                    {
                        theDRowItem["ItemID"] = Convert.ToInt32(dgwItemSubitemDetails.Rows[i].Cells[0].Value);
                        theDRowItem["SupplierId"] = Convert.ToInt32(ddlSupplier.SelectedValue);
                        //theDRowItem["BatchID"] = 0;
                        //theDRowItem["ExpiryDate"] = DBNull.Value;
                        theDRowItem["AvaliableQty"] = 0;
                    }
                    theDRowItem["ItemTypeId"] = Convert.ToInt32(dgwItemSubitemDetails.Rows[i].Cells["ItemTypeId"].Value);
                    theDRowItem["ItemName"] = dgwItemSubitemDetails.Rows[i].Cells[0].FormattedValue.ToString();
                    theDRowItem["Quantity"] = Convert.ToInt32(dgwItemSubitemDetails.Rows[i].Cells["OrderQuantity"].Value);
                    theDRowItem["IssuedQuantity"] = Convert.ToInt32(dgwItemSubitemDetails.Rows[i].Cells["IssuedQuantity"].Value);
                    theDRowItem["IssuedQuantityDU"] = Convert.ToInt32(dgwItemSubitemDetails.Rows[i].Cells["IssuedQuantityDU"].Value);
                    theDRowItem["BatchName"] = dgwItemSubitemDetails.Rows[i].Cells["BatchName"].Value.ToString();
                    theDRowItem["ExpiryDate"] = Convert.ToDateTime(dgwItemSubitemDetails.Rows[i].Cells["ExpiryDate"].Value);
                    theDRowItem["priceperunit"] = Convert.ToDecimal(dgwItemSubitemDetails.Rows[i].Cells["Price"].Value);
                    theDRowItem["UnitQuantity"] = Convert.ToDecimal(dgwItemSubitemDetails.Rows[i].Cells["UnitQuantity"].Value);
                    theDRowItem["IsPOorIST"] = 1;
                    dtOrderItem.Rows.Add(theDRowItem);


                }
            }

            if (dtOrderItem.Rows.Count <= 0)
            {
                IQCareWindowMsgBox.ShowWindow("PurchaseOrderItem", this);
                return;
            }
            //bool isDuplicate = false;
            for (int iDupitem = 0; iDupitem < dtOrderItem.Rows.Count; iDupitem++)
            {
                for (int x = iDupitem + 1; x < dtOrderItem.Rows.Count; x++)
                {
                    if (dtOrderItem.Rows[iDupitem]["ItemName"].ToString() == dtOrderItem.Rows[x]["ItemName"].ToString())
                    {
                        //pass message builder message
                        MsgBuilder theBuilder = new MsgBuilder();
                        theBuilder.DataElements["Control"] = dtOrderItem.Rows[iDupitem]["ItemName"].ToString();
                        IQCareWindowMsgBox.ShowWindow("DuplicatePOItems", theBuilder, this);

                        //isDuplicate = true;
                        //break;
                        return;
                    }
                }
            }



            IPurchase objMasterlist = (IPurchase)ObjectFactory.CreateInstance("BusinessProcess.SCM.BPurchase,BusinessProcess.SCM");
            int ret = objMasterlist.SavePurchaseOrder(dtOrdermaster, dtOrderItem, IsPOUpdated);

            if (ret > 0)
            {
                IQCareWindowMsgBox.ShowWindow("ProgramSave", this);
                if (GblIQCare.PurchaseOrderID == 0)
                {
                    GblIQCare.PurchaseOrderID = ret;
                }
                formInit();
                return;
            }

        }



        private void btnclose_Click(object sender, EventArgs e)
        {
           
            string frmname;
            if (GblIQCare.theArea == "PO")
            {

                frmname = "IQCare.SCM.frmViewPurchaseOrder, IQCare.SCM";
                Form theForm = (Form)Activator.CreateInstance(Type.GetType(frmname.ToString()));
                theForm.MdiParent = this.MdiParent;
                theForm.Top = 2;
                theForm.Left = 2;
                theForm.Show();
            }
           

            this.Close();
        }
        private void BindStoreName()
        {
            StoreID = GblIQCare.intStoreId;
            //ddlSourceStore.Enabled = true;
            BindFunctions theBind = new BindFunctions();
            DataSet XMLDS = new DataSet();
            XMLDS.ReadXml(GblIQCare.GetXMLPath() + "\\AllMasters.con");
            DataView theDV;
            DataTable theStoreDT;

            IMasterList objItemCommonlist = (IMasterList)ObjectFactory.CreateInstance("BusinessProcess.SCM.BMasterList,BusinessProcess.SCM");
            IQCareUtils theUtils = new IQCareUtils();
            DataSet theDS = objItemCommonlist.GetStoreDetail();

            theDV = new DataView(XMLDS.Tables["Mst_Store"]);
            theDV.RowFilter = "(DeleteFlag =0 or DeleteFlag is null) and  ( Id =" + StoreID + ")";
            theStoreDT = theDV.ToTable();
            //theBind.Win_BindCombo(ddlDestinationStore, theStoreDT, "Name", "Id");
            ddlDestinationStore.DataSource = theStoreDT;
            ddlDestinationStore.DisplayMember = "Name";
            ddlDestinationStore.ValueMember = "Id";

        }
        private void BindGrid(DataSet theDS)
        {
            try
            {
                dgwItemSubitemDetails.Columns.Clear();
                dgwItemSubitemDetails.AutoGenerateColumns = false;
                dgwItemSubitemDetails.AllowUserToAddRows = false;
                DataGridViewComboBoxColumn theColumnItemName = new DataGridViewComboBoxColumn();
                // ComboBox theColumnItemName = new ComboBox();
                theColumnItemName.HeaderText = "Item Name";
                theColumnItemName.Name = "ItemName";
                theColumnItemName.DataPropertyName = "ItemId";
                if (GblIQCare.ModePurchaseOrder == 1)
                {
                    DataView theItemDV;
                    theItemDV = new DataView(theDS.Tables[0]);
                   
                        theItemDV.RowFilter = "SupplierId =" + ddlSupplier.SelectedValue.ToString();
                  
                    DataTable theComDT = theItemDV.ToTable();

                    DataRow drItemSelect;
                    drItemSelect = theComDT.NewRow();
                    drItemSelect["ItemId"] = 0;
                    drItemSelect["ItemName"] = "Select";
                    drItemSelect["SupplierId"] = ddlSupplier.SelectedValue.ToString();
                    theComDT.Rows.InsertAt(drItemSelect, 0);

                    theColumnItemName.DataSource = theComDT;
                }
                else if (GblIQCare.ModePurchaseOrder == 2)
                {
                    DataRow drItemSelect;
                    drItemSelect = theDS.Tables[0].NewRow();
                    drItemSelect["ItemId"] = 0;
                    drItemSelect["ItemTypeId"] = 0;
                    drItemSelect["ItemName"] = "Select";
                    theDS.Tables[0].Rows.InsertAt(drItemSelect, 0);

                    theColumnItemName.DataSource = theDS.Tables[0];
                }
                theColumnItemName.DisplayMember = "ItemName";
                theColumnItemName.ValueMember = "ItemId";
                theColumnItemName.Width = 250;
                theColumnItemName.ReadOnly = false;
                //theColumnItemName.AutoComplete = true;
                theColumnItemName.DefaultCellStyle.NullValue = "Select";


                DataGridViewTextBoxColumn theColumnItemCode = new DataGridViewTextBoxColumn();
                theColumnItemCode.HeaderText = "Item Code";
                theColumnItemCode.Name = "ItemCode";
                theColumnItemCode.DataPropertyName = "ItemCode";
                theColumnItemCode.ReadOnly = true;
                theColumnItemCode.Visible = false;

                DataGridViewTextBoxColumn theColumnItemTypeId = new DataGridViewTextBoxColumn();
                theColumnItemTypeId.HeaderText = "Item Type";
                theColumnItemTypeId.Name = "ItemTypeId";
                theColumnItemTypeId.DataPropertyName = "ItemTypeId";
                theColumnItemTypeId.ReadOnly = true;
                theColumnItemTypeId.Visible = false;

                DataGridViewTextBoxColumn theColumnUnit = new DataGridViewTextBoxColumn();
                theColumnUnit.HeaderText = "Purchase Units";
                theColumnUnit.Name = "Units";
                theColumnUnit.DataPropertyName = "Units";
                theColumnUnit.ReadOnly = true;

                DataGridViewTextBoxColumn theColumnUnitQuantity = new DataGridViewTextBoxColumn();
                theColumnUnitQuantity.HeaderText = "Unit Quantity";
                theColumnUnitQuantity.DataPropertyName = "UnitQuantity";
                theColumnUnitQuantity.Name = "UnitQuantity";
                theColumnUnitQuantity.ReadOnly = false;

                DataGridViewTextBoxColumn theColumnQuantity = new DataGridViewTextBoxColumn();
                theColumnQuantity.HeaderText = "Order Quantity";
                theColumnQuantity.DataPropertyName = "OrderQuantity";
                theColumnQuantity.Name = "OrderQuantity";
                theColumnQuantity.ReadOnly = false;

                DataGridViewTextBoxColumn theColumnPrice = new DataGridViewTextBoxColumn();
                theColumnPrice.HeaderText = "Price /Unit";
                theColumnPrice.DataPropertyName = "Price";
                theColumnPrice.Name = "Price";
                theColumnPrice.ReadOnly = false;

                DataGridViewTextBoxColumn theColumnTotPrice = new DataGridViewTextBoxColumn();
                theColumnTotPrice.HeaderText = "Total Price";
                theColumnTotPrice.DataPropertyName = "TotPrice";
                theColumnTotPrice.Name = "TotPrice";
                theColumnTotPrice.ReadOnly = true;

                DataGridViewTextBoxColumn theColumnIssuedQuantity = new DataGridViewTextBoxColumn();
                theColumnIssuedQuantity.HeaderText = "Issued Quantity - Purchase Unit";
                theColumnIssuedQuantity.DataPropertyName = "IssuedQuantity";
                theColumnIssuedQuantity.Name = "IssuedQuantity";
                theColumnIssuedQuantity.ReadOnly = false;

                DataGridViewTextBoxColumn theColumnIssuedQuantityDU = new DataGridViewTextBoxColumn();
                theColumnIssuedQuantityDU.HeaderText = "Issued Quantity - Disp Unit";
                theColumnIssuedQuantityDU.DataPropertyName = "IssuedQuantityDU";
                theColumnIssuedQuantityDU.Name = "IssuedQuantityDU";
                theColumnIssuedQuantityDU.ReadOnly = true;

                DataGridViewTextBoxColumn theColumnBatchNo = new DataGridViewTextBoxColumn();
                theColumnBatchNo.HeaderText = "Batch No";
                theColumnBatchNo.DataPropertyName = "BatchName";
                theColumnBatchNo.Name = "BatchName";
                theColumnBatchNo.ReadOnly = false;

                CalendarColumn theColumnExpiryDate = new CalendarColumn();
                theColumnExpiryDate.HeaderText = "Expiry Date";
                theColumnExpiryDate.DataPropertyName = "ExpiryDate";
                theColumnExpiryDate.Name = "ExpiryDate";
                theColumnExpiryDate.ReadOnly = false;

                dgwItemSubitemDetails.DataSource = dsPOItems.Tables[2];
                dgwItemSubitemDetails.Columns.Add(theColumnItemName);
                dgwItemSubitemDetails.Columns.Add(theColumnItemCode);
                dgwItemSubitemDetails.Columns.Add(theColumnBatchNo);
                dgwItemSubitemDetails.Columns.Add(theColumnExpiryDate);
                dgwItemSubitemDetails.Columns.Add(theColumnUnit);
                dgwItemSubitemDetails.Columns.Add(theColumnUnitQuantity);
                dgwItemSubitemDetails.Columns.Add(theColumnQuantity);
                dgwItemSubitemDetails.Columns.Add(theColumnIssuedQuantity);
                dgwItemSubitemDetails.Columns.Add(theColumnIssuedQuantityDU);
                dgwItemSubitemDetails.Columns.Add(theColumnPrice);
                //if (GblIQCare.ModePurchaseOrder == 1)
                //{
                //    theColumnItemCode.Width = 100;
                //    theColumnUnit.Width = 90;
                //    theColumnQuantity.Width = 90;
                //    theColumnPrice.Width = 90;
                //    theColumnTotPrice.Width = 85;
                //}

                dgwItemSubitemDetails.Columns.Add(theColumnTotPrice);
                dgwItemSubitemDetails.Columns.Add(theColumnItemTypeId);
            }
            catch (Exception err)
            {
                MsgBuilder theBuilder = new MsgBuilder();
                theBuilder.DataElements["MessageText"] = err.Message.ToString();
                IQCareWindowMsgBox.ShowWindow("#C1", theBuilder, this);
                return;
            }
        }

        private void BindGrid(int PurchaseMode)
        {
            //IMasterList objPOItem = (IMasterList)ObjectFactory.CreateInstance("BusinessProcess.SCM.BMasterList,BusinessProcess.SCM");
            IPurchase objPOItem = (IPurchase)ObjectFactory.CreateInstance("BusinessProcess.SCM.BPurchase,BusinessProcess.SCM");
            if (PurchaseMode == 1)
            {
                dsPOItems = objPOItem.GetPurcaseOrderItem(PurchaseMode, GblIQCare.AppUserId, 0);
            }




            BindGrid(dsPOItems);
            BindAuthorPreparedBy();
        }
        private void BindAuthorPreparedBy()
        {
            BindFunctions theBind = new BindFunctions();
            theBind.Win_BindCombo(ddlAuthorisedBy, dsPOItems.Tables[3], "EmpName", "EmployeeID");
            DataTable theDT = dsPOItems.Tables[3].Copy();

            theBind.Win_BindCombo(ddlPreparedBy, theDT, "EmpName", "EmployeeID");
        }
        // TextBox txtItem;
        private void dgwItemSubitemDetails_EditingControlShowing(object sender, DataGridViewEditingControlShowingEventArgs e)
        {
            if (e.Control.GetType().ToString() == "System.Windows.Forms.DataGridViewComboBoxEditingControl")
            {

                theGrdCombo = (ComboBox)e.Control;
                theGrdCombo.SelectedValueChanged += null;
                deletedGridByKey = false;
                theGrdCombo.SelectedValueChanged += new EventHandler(theCombo_SelectedValueChanged);

            }
            DataGridView dgwDataGridForEvent = sender as DataGridView;
            //!IsHandleAdded &&
            //if (dgwDataGridForEvent.CurrentCell.ColumnIndex == 3)
            //{
            //    TextBox txtQuantity = e.Control as TextBox;
            //    if (txtQuantity != null)
            //    {
            //        txtQuantity.KeyPress += new KeyPressEventHandler(txtQuantity_KeyPress);
            //        //IsHandleAdded = true;
            //    }
            //}

            if (dgwDataGridForEvent.CurrentCell.OwningColumn.Name == "OrderQuantity")//.ColumnIndex==3)
            {
                int f = dgwDataGridForEvent.CurrentCell.ColumnIndex;
                TextBox txtQuantity = e.Control as TextBox;
                if (txtQuantity != null)
                {
                    txtQuantity.KeyPress += new KeyPressEventHandler(txtQuantity_KeyPress);
                    //IsHandleAdded = true;
                }
            }
            if (dgwDataGridForEvent.CurrentCell.OwningColumn.Name == "IssuedQuantity")//.ColumnIndex==3)
            {
                int f = dgwDataGridForEvent.CurrentCell.ColumnIndex;
                TextBox txtIssuedQuantity = e.Control as TextBox;
                if (txtIssuedQuantity != null)
                {
                    txtIssuedQuantity.KeyPress += new KeyPressEventHandler(txtQuantity_KeyPress);
                    //IsHandleAdded = true;
                }
            }

            if (dgwDataGridForEvent.CurrentCell.OwningColumn.Name == "IssuedQuantityDU")//.ColumnIndex==3)
            {
                int f = dgwDataGridForEvent.CurrentCell.ColumnIndex;
                TextBox txtIssuedQuantityDU = e.Control as TextBox;
                if (txtIssuedQuantityDU != null)
                {
                    txtIssuedQuantityDU.KeyPress += new KeyPressEventHandler(txtQuantity_KeyPress);
                    //IsHandleAdded = true;
                }
            }

            if (e.Control.GetType().ToString() == "System.Windows.Forms.DataGridViewButtonColumn")
            {


            }


        }


        void txtQuantity_KeyPress(object sender, KeyPressEventArgs e)
        {
            BindFunctions theBind = new BindFunctions();
            theBind.Win_decimal(e);
        }

        void theCombo_SelectedValueChanged(object sender, EventArgs e)
        {

            try
            {
                if (theGrdCombo.Focused == true && theGrdCombo.SelectedValue != null)
                {

                    if (theGrdCombo.DataSource != null && theGrdCombo.SelectedValue.GetType().ToString() != "System.Data.DataRowView")
                    {


                        string strdrug = theGrdCombo.SelectedValue.ToString();
                        string[] strArry = strdrug.Split('-');
                        DataTable theDT = new DataTable();
                        theDT = dsPOItems.Tables[1].Copy();
                        DataView dvFilteredRow = theDT.DefaultView;
                        DataTable dtRow = new DataTable();
                        dvFilteredRow.RowFilter = "Drug_Pk=" + strArry[0];

                        dtRow = dvFilteredRow.ToTable();
                        if (dtRow.Rows.Count > 0)
                        {
                            if (!deletedGridByKey)
                            {
                                dgwItemSubitemDetails.CurrentRow.Cells["ItemCode"].Value = dtRow.Rows[0]["DrugId"].ToString();
                                dgwItemSubitemDetails.CurrentRow.Cells["ItemTypeId"].Value = dtRow.Rows[0]["ItemTypeId"].ToString();
                                dgwItemSubitemDetails.CurrentRow.Cells["ItemCode"].ReadOnly = true;
                                dgwItemSubitemDetails.CurrentRow.Cells["Units"].Value = dtRow.Rows[0]["PurchaseUnitName"].ToString();
                                dgwItemSubitemDetails.CurrentRow.Cells["Units"].ReadOnly = true;
                                dgwItemSubitemDetails.CurrentRow.Cells["Price"].Value = Convert.ToDecimal(dtRow.Rows[0]["PurchaseUnitPrice"].ToString());
                                dgwItemSubitemDetails.CurrentRow.Cells["Price"].ReadOnly = false;
                                if (Convert.ToString(dtRow.Rows[0]["QtyPerPurchaseunit"]) != "")
                                {
                                    dgwItemSubitemDetails.CurrentRow.Cells["UnitQuantity"].Value = Convert.ToDecimal(dtRow.Rows[0]["QtyPerPurchaseunit"].ToString());
                                }
                                else { dgwItemSubitemDetails.CurrentRow.Cells["UnitQuantity"].Value = ""; }
                                dgwItemSubitemDetails.CurrentRow.Cells["UnitQuantity"].ReadOnly = true;
                                dgwItemSubitemDetails.CurrentRow.Cells["OrderQuantity"].Value = 0;
                                dgwItemSubitemDetails.CurrentRow.Cells["TotPrice"].ReadOnly = true;

                                dgwItemSubitemDetails.AllowUserToAddRows = true;
                                dvFilteredRow = null;
                                dtRow = null;
                                theDT = null;
                            }
                        }
                        else
                        {

                            if (dgwItemSubitemDetails.SelectedRows.Count > 0)
                            {
                                foreach (DataGridViewRow row in dgwItemSubitemDetails.SelectedRows)
                                {
                                    dgwItemSubitemDetails.Rows.Remove(row);
                                    //theGrdCombo.SelectedValueChanged += null;
                                    deletedGridByKey = true;

                                }
                            }
                        }

                    }
                }

            }           
            catch (Exception err)
            {
                MsgBuilder theBuilder = new MsgBuilder();
                theBuilder.DataElements["MessageText"] = err.Message.ToString();
                IQCareWindowMsgBox.ShowWindow("#C1", theBuilder, this);
                return;
            }

            finally
            {


            }
        }

        private void dgwItemSubitemDetails_CellLeave(object sender, DataGridViewCellEventArgs e)
        {
            if ((theGrdCombo != null))
            {
                // theGrdCombo.SelectedIndex = theGrdCombo.FindStringExact(theGrdCombo.Text);
            }
        }

        private void dgwItemSubitemDetails_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (e.ColumnIndex > -1 && e.RowIndex > -1)
                {
                    DataGridView dgwDataGrid = sender as DataGridView;

                    if (dgwDataGrid.Columns[e.ColumnIndex].Name == "OrderQuantity" && dgwDataGrid.Rows[e.RowIndex].Cells["OrderQuantity"].Value != null && dgwDataGrid.Rows[e.RowIndex].Cells["Price"].Value != null)
                    {
                        if (Convert.ToString(dgwDataGrid.Rows[e.RowIndex].Cells["OrderQuantity"].Value) != "" && Convert.ToString(dgwDataGrid.Rows[e.RowIndex].Cells["Price"].Value) != "")
                        {
                            dgwDataGrid.Rows[e.RowIndex].Cells["TotPrice"].Value = Convert.ToDecimal(Convert.ToDecimal(dgwDataGrid.Rows[e.RowIndex].Cells["OrderQuantity"].Value.ToString()) * Convert.ToDecimal(dgwDataGrid.Rows[e.RowIndex].Cells["Price"].Value.ToString()));
                        }
                    }
                    if (dgwDataGrid.Columns[e.ColumnIndex].Name == "Price" && dgwDataGrid.Rows[e.RowIndex].Cells["Price"].Value != null && dgwDataGrid.Rows[e.RowIndex].Cells["OrderQuantity"].Value != null)
                    {
                        if (Convert.ToString(dgwDataGrid.Rows[e.RowIndex].Cells["OrderQuantity"].Value) != "" && Convert.ToString(dgwDataGrid.Rows[e.RowIndex].Cells["Price"].Value) != "")
                        {
                            dgwDataGrid.Rows[e.RowIndex].Cells["TotPrice"].Value = Convert.ToDecimal(Convert.ToDecimal(dgwDataGrid.Rows[e.RowIndex].Cells["OrderQuantity"].Value.ToString()) * Convert.ToDecimal(dgwDataGrid.Rows[e.RowIndex].Cells["Price"].Value.ToString()));
                        }
                    }
                    if (dgwDataGrid.Columns[e.ColumnIndex].Name == "TotPrice" && dgwDataGrid.Rows[e.RowIndex].Cells["TotPrice"].Value != null)
                    {
                        decimal sumPrice = 0;
                        foreach (DataGridViewRow theDR in dgwDataGrid.Rows)
                        {
                            if (!string.IsNullOrEmpty(Convert.ToString(theDR.Cells["TotPrice"].Value)))
                            {
                                sumPrice = sumPrice + Convert.ToDecimal(theDR.Cells["TotPrice"].Value);
                            }
                        }
                        lblTotalAmount.Text = Convert.ToString(sumPrice);
                    }

                    if (dgwDataGrid.Columns[e.ColumnIndex].Name == "IssuedQuantity" && dgwDataGrid.Rows[e.RowIndex].Cells["IssuedQuantity"].Value != null)
                    {
                        if (Convert.ToString(dgwDataGrid.Rows[e.RowIndex].Cells["OrderQuantity"].Value) != "" && Convert.ToString(dgwDataGrid.Rows[e.RowIndex].Cells["IssuedQuantity"].Value) != "")
                        {
                            if (Convert.ToDecimal(dgwDataGrid.Rows[e.RowIndex].Cells["OrderQuantity"].Value.ToString()) < Convert.ToDecimal(dgwDataGrid.Rows[e.RowIndex].Cells["IssuedQuantity"].Value.ToString()))
                            {
                                MessageBox.Show("Quantity issued is greater than Quantity Ordered.");
                                //dgwDataGrid.Rows[e.RowIndex].Cells["IssuedQuantity"].Value = 0;

                            }
                        }
                    }

                    if (dgwDataGrid.Columns[e.ColumnIndex].Name == "IssuedQuantity" && dgwDataGrid.Rows[e.RowIndex].Cells["IssuedQuantity"].Value != null)
                    {
                        if (Convert.ToString(dgwDataGrid.Rows[e.RowIndex].Cells["UnitQuantity"].Value) != "" && Convert.ToString(dgwDataGrid.Rows[e.RowIndex].Cells["IssuedQuantity"].Value) != "")
                        {
                            if (Convert.ToString(dgwDataGrid.Rows[e.RowIndex].Cells["UnitQuantity"].Value) == "" && Convert.ToString(dgwDataGrid.Rows[e.RowIndex].Cells["UnitQuantity"].Value) == "0")
                            {
                                MessageBox.Show("Kindly Configure this item. Unit quantity for purchase unit is missing");
                                dgwDataGrid.Rows[e.RowIndex].Cells["IssuedQuantityDU"].Value = 0;
                            }
                            else
                            {
                                dgwDataGrid.Rows[e.RowIndex].Cells["IssuedQuantityDU"].Value = Convert.ToDecimal(dgwDataGrid.Rows[e.RowIndex].Cells["UnitQuantity"].Value.ToString()) * Convert.ToDecimal(dgwDataGrid.Rows[e.RowIndex].Cells["IssuedQuantity"].Value.ToString());
                            }
                                

                            //if (Convert.ToDecimal(dgwDataGrid.Rows[e.RowIndex].Cells["UnitQuantity"].Value.ToString()) < Convert.ToDecimal(dgwDataGrid.Rows[e.RowIndex].Cells["IssuedQuantity"].Value.ToString()))
                            //{
                            //    MessageBox.Show("Quantity issued cannot be greater than Quantity Ordered");
                            //    dgwDataGrid.Rows[e.RowIndex].Cells["IssuedQuantity"].Value = 0;

                            //}
                        }
                    }

                    if (dgwDataGrid.Columns[e.ColumnIndex].Name == "ExpiryDate" && dgwDataGrid.Rows[e.RowIndex].Cells["ExpiryDate"].Value != null)
                    {
                        if (Convert.ToString(dgwDataGrid.Rows[e.RowIndex].Cells["ExpiryDate"].Value) != "")
                        {
                            if (Convert.ToDateTime(dgwDataGrid.Rows[e.RowIndex].Cells["ExpiryDate"].Value.ToString()) < DateTime.Now)
                            {
                                IQCareWindowMsgBox.ShowWindow("ExpiryDate", this);
                                //dgwDataGrid.Rows[e.RowIndex].Cells["ExpiryDate"].Value = "";

                            }
                        }
                    }
                }
            }
            catch (Exception err)
            {
                MsgBuilder theBuilder = new MsgBuilder();
                theBuilder.DataElements["MessageText"] = err.Message.ToString();
                IQCareWindowMsgBox.ShowWindow("#C1", theBuilder, this);
                return;
            }
        }

        private void dgwItemSubitemDetails_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            if (e.Exception.Message.Contains("constrained to be unique") == true)
            {
                // IQCareWindowMsgBox.ShowWindow("CheckDuplicateValue", this);
                return;
            }
            else
            {
                MsgBuilder theBuilder = new MsgBuilder();
                theBuilder.DataElements["MessageText"] = e.Exception.Message.ToString();
                IQCareWindowMsgBox.ShowWindow("#C1", theBuilder, this);
                return;
            }
        }

        private void ddlSupplier_SelectedValueChanged(object sender, EventArgs e)
        {
            if (ddlSupplier.SelectedIndex > 0)
            {
                BindGrid(GblIQCare.ModePurchaseOrder);

            }
        }

        public void formInit()
        {
            try
            {
                //IMasterList objPOItem = (IMasterList)ObjectFactory.CreateInstance("BusinessProcess.SCM.BMasterList,BusinessProcess.SCM");
                IPurchase objPOItem = (IPurchase)ObjectFactory.CreateInstance("BusinessProcess.SCM.BPurchase,BusinessProcess.SCM");
                dsPOItemsDetail = objPOItem.GetPurchaseOrderDetailsByPoid(GblIQCare.PurchaseOrderID);
                if (dsPOItemsDetail.Tables.Count > 0)
                {
                    if (dsPOItemsDetail.Tables[0].Rows.Count > 0)
                    {

                        dtpOrderDate.Text = dsPOItemsDetail.Tables[0].Rows[0]["OrderDate"].ToString();
                        dtpOrderDate.CustomFormat = "dd-MMM-yyyy";
                        dtpOrderDate.Enabled = false;
                        txtOrderNumber.Text = dsPOItemsDetail.Tables[0].Rows[0]["PONumber"].ToString();
                        txtOrderNumber.Enabled = true;
                        // ddlSourceStore.SelectedValue = Convert.ToInt32(dsPOItemsDetail.Tables[0].Rows[0]["SourceStoreID"].ToString());


                        if (GblIQCare.ModePurchaseOrder == 1)
                        {
                            ddlSupplier.DataSource = null;
                            BindFunctions theBind = new BindFunctions();
                            ddlSupplier.DataSource = null;
                            DataSet XMLDS = new DataSet();
                            XMLDS.ReadXml(GblIQCare.GetXMLPath() + "\\AllMasters.con");
                            BindFunctions theBindManager = new BindFunctions();
                            DataView theDV = new DataView(XMLDS.Tables["Mst_Supplier"]);
                            theDV.RowFilter = "(DeleteFlag = 0 or  DeleteFlag is null) or  (Id = " + Convert.ToInt32(dsPOItemsDetail.Tables[0].Rows[0]["SupplierID"].ToString()) + ")";
                            DataTable theStoreDT = theDV.ToTable();
                            theBind.Win_BindCombo(ddlSupplier, theStoreDT, "SupplierName", "Id");

                            ddlSupplier.SelectedValue = Convert.ToInt32(dsPOItemsDetail.Tables[0].Rows[0]["SupplierID"].ToString());
                            ddlSupplier.Enabled = false;
                        }

                        ddlDestinationStore.SelectedValue = Convert.ToInt32(dsPOItemsDetail.Tables[0].Rows[0]["DestinStoreID"].ToString());
                        ddlDestinationStore.Enabled = false;
                        ddlPreparedBy.SelectedValue = Convert.ToInt32(dsPOItemsDetail.Tables[0].Rows[0]["PreparedBy"].ToString());
                        if (dsPOItemsDetail.Tables[0].Rows[0]["Status"].ToString() == "1")
                        {
                            chkRejectedStatus.Visible = true;
                            Btndelete.Enabled = true;
                            btnSave.Enabled = true;
                            IsPOUpdated = true;
                            btnPrint.Enabled = false;
                        }
                        else if (dsPOItemsDetail.Tables[0].Rows[0]["Status"].ToString() == "5")
                        {
                            btnSave.Enabled = false;
                            Btndelete.Enabled = false;
                            IsPOUpdated = false;
                            chkRejectedStatus.Visible = true;
                            chkRejectedStatus.Checked = true;
                            chkRejectedStatus.Enabled = false;
                            btnPrint.Enabled = true;
                        }
                        else
                        {
                            ddlAuthorisedBy.SelectedValue = Convert.ToInt32(dsPOItemsDetail.Tables[0].Rows[0]["AuthorizedBy"].ToString());
                            btnSave.Enabled = false;
                            Btndelete.Enabled = false;
                            chkRejectedStatus.Visible = false;
                            btnPrint.Enabled = true;

                        }
                        lblTotalAmount.Text = dsPOItemsDetail.Tables[1].Rows[0]["TotalAmount"].ToString();
                        BindGrid(dsPOItems);
                        dgwItemSubitemDetails.AllowUserToAddRows = true;
                        dgwItemSubitemDetails.DataSource = dsPOItemsDetail.Tables[1];

                    }
                }

            }
            catch (Exception err)
            {
                MsgBuilder theBuilder = new MsgBuilder();
                theBuilder.DataElements["MessageText"] = err.Message.ToString();
                IQCareWindowMsgBox.ShowWindow("#C1", theBuilder, this);
                return;
            }
        }

        private void dgwItemSubitemDetails_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
        }

        private void dgwItemSubitemDetails_KeyDown(object sender, KeyEventArgs e)
        {

        }



        private void Btndelete_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow row in dgwItemSubitemDetails.SelectedRows)
            {

                if (Convert.ToString(row.Cells[0].Value) != "")
                {
                    dgwItemSubitemDetails.Rows.Remove(row);
                }
            }
        }

        private void dgwItemSubitemDetails_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            try
            {

            }
            catch //(System.Data.DeletedRowInaccessibleException er)
            {
                //throw;
            }

            finally
            {


            }
        }



        private void btnPrint_Click(object sender, EventArgs e)
        {
            ReportDocument objRptDoc = new ReportDocument();
            DataSet dsPrintPOItemsDetail = new DataSet();
            //IMasterList objStockLedger = (IMasterList)ObjectFactory.CreateInstance("BusinessProcess.SCM.BMasterList,BusinessProcess.SCM");
            IPurchase objPOItem = (IPurchase)ObjectFactory.CreateInstance("BusinessProcess.SCM.BPurchase,BusinessProcess.SCM");
            dsPrintPOItemsDetail = objPOItem.GetPurchaseOrderDetailsByPoid(GblIQCare.PurchaseOrderID);
            dsPrintPOItemsDetail.WriteXmlSchema(GblIQCare.GetXMLPath() + "\\IntStorePO.xml");
            rptIntStorePOReport rep = new rptIntStorePOReport();
            rep.SetDataSource(dsPrintPOItemsDetail);
            //  rep.ParameterFields["FormDate","1"];
            rep.SetParameterValue("ModePurchaseOrder", GblIQCare.ModePurchaseOrder);
            rep.SetParameterValue("facilityname", GblIQCare.AppLocation);
            rep.SetParameterValue("CurrentUser", GblIQCare.AppUName);

            // , Convert.ToString(dtpFrom.Text)];

            frmReportViewer theRepViewer = new frmReportViewer();
            theRepViewer.MdiParent = this.MdiParent;
            theRepViewer.Location = new Point(0, 0);
            theRepViewer.crViewer.ReportSource = rep;
            theRepViewer.Show();
            this.Close();

        }

       
    }





}
