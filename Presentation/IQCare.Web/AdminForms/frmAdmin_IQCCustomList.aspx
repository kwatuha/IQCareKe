<%@ Page Language="C#" MasterPageFile="~/MasterPage/IQCare.master" AutoEventWireup="True" Inherits="IQCare.Web.Admin.CTCCustomList" Codebehind="frmAdmin_IQCCustomList.aspx.cs" %>

<%@ MasterType VirtualPath="~/MasterPage/IQCare.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IQCareContentPlaceHolder" runat="Server">

    <div>
        <h1 class="margin" style="padding-left: 10px;">
            <asp:Label ID="lblHeader" runat="server" Text=""></asp:Label></h1>
        <div class="center" style="padding: 5px;">
            <div class="border center">
                <table width="100%" border="0" cellpadding="0" cellspacing="6">
                    <tbody>
                        <tr>
                            <td class="pad5 formbg border">
                                <div class="grid">
                                    <div class="rounded">
                                        <div class="top-outer">
                                            <div class="top-inner">
                                                <div class="top">
                                                    <h2>
                                                    </h2>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mid-outer">
                                            <div class="mid-inner">
                                                <div class="mid" style="height:300px; overflow: auto">
                                                    <div id="grd_custom" class="GridView whitebg">
                                                        <asp:GridView ID="grdCustom" runat="server" AutoGenerateColumns="False" AllowSorting="true"
                                                            Width="100%" BorderColor="white" PageIndex="1" BorderWidth="0" GridLines="None"
                                                            CssClass="datatable table-striped table-responsive" CellPadding="0" CellSpacing="0" OnSelectedIndexChanging="grdCustom_SelectedIndexChanging"
                                                            OnSorting="grdCustom_Sorting" OnRowDataBound="grdCustom_RowDataBound">
                                                            <%--<HeaderStyle   CssClass="tableheaderstyle" ForeColor="Blue"  Font-Underline="true"  HorizontalAlign="Left" />--%>
                                                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                            <RowStyle CssClass="gridrow" />
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="bottom-outer">
                                            <div class="bottom-inner">
                                                <div class="bottom">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="pad5 center">
                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
