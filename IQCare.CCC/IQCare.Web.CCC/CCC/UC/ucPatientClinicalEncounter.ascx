﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucPatientClinicalEncounter.ascx.cs" Inherits="IQCare.Web.CCC.UC.ucPatientClinicalEncounter" %>

<%@ Register Src="~/CCC/UC/ucIpt.ascx" TagPrefix="uc" TagName="Ipt" %>
<%@ Register Src="~/CCC/UC/ucIptClientWorkup.ascx" TagPrefix="uc" TagName="IptClientWorkup" %>
<%@ Register Src="~/CCC/UC/ucIptOutcome.ascx" TagPrefix="uc" TagName="IptOutcome" %>
<%@ Register Src="~/CCC/UC/ucPharmacyPrescription.ascx" TagPrefix="uc" TagName="ucPharmacyPrescription" %>
<%@ Register Src="~/CCC/UC/ucPatientLabs.ascx" TagPrefix="uc" TagName="ucPatientLabs" %>


<div class="col-md-12" style="padding-top: 20px">

    <div class="col-md-12">
        <div class="wizard" data-initialize="wizard" id="myWizard">
            <div class="steps-container">
                <ul class="steps">

                    <li data-step="1" data-name="template" class="active">
                        <span class="badge">1</span>Presenting Complaints
			                    <span class="chevron"></span>
                    </li>

                    <li data-step="2">
                        <span class="badge">2</span>Patient Chronic Illness
			                    <span class="chevron"></span>
                    </li>
                    <li data-step="3" id="dsPatientExamination" data-name="">
                        <span class="badge">3</span>Patient Examination
			                    <span class="chevron"></span>
                    </li>

                    <li data-step="4" id="dsPatientManagement" data-name="">
                        <span class="badge">4</span>Patient Management
			                    <span class="chevron"></span>
                    </li>
                </ul>
            </div>

            <%--<div class="actions">
                <button type="button" class="btn btn-default btn-prev">
                    <span class="glyphicon glyphicon-arrow-left"></span>Prev</button>
                <button type="button" class="btn btn-primary btn-next" data-last="Complete">
                    Next
		                    <span class="glyphicon glyphicon-arrow-right"></span>
                </button>
            </div>--%>

            <div class="step-content">

                <div class="step-pane active sample-pane" id="datastep1" data-parsley-validate="true" data-show-errors="true" data-step="1">

                    <div class="col-md-12">
                        <div class="col-md-4">
                            <div class="col-md-12 form-group">
                                <div class="col-md-12">
                                    <label class="control-label  pull-left text-primary">*Visit Date</label>
                                </div>
                                <div class="col-md-12">
                                    <div class="datepicker" id="DateOfVisit">
                                        <div class="input-group">
                                            <asp:TextBox ID="VisitDate" runat="server" class="form-control input-sm" data-parsley-required="true" onblur="DateFormat(this,this.value,event,false,'3')" onkeyup="DateFormat(this,this.value,event,false,'3')"></asp:TextBox>
                                            <%--<input class="form-control input-sm" id="VisitDate" type="text" runat="server" data-parsley-required="true" />--%>
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-default dropdown-toggle input-sm" data-toggle="dropdown">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                    <span class="sr-only">Toggle Calendar</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right datepicker-calendar-wrapper" role="menu">
                                                    <div class="datepicker-calendar">
                                                        <div class="datepicker-calendar-header">
                                                            <button type="button" class="prev"><span class="glyphicon glyphicon-chevron-left input-sm"></span><span class="sr-only">Previous Month</span></button>
                                                            <button type="button" class="next"><span class="glyphicon glyphicon-chevron-right input-sm"></span><span class="sr-only">Next Month</span></button>
                                                            <button type="button" class="title" data-month="11" data-year="2014">
                                                                <span class="month">
                                                                    <span data-month="0">January</span>
                                                                    <span data-month="1">February</span>
                                                                    <span data-month="2">March</span>
                                                                    <span data-month="3">April</span>
                                                                    <span data-month="4">May</span>
                                                                    <span data-month="5">June</span>
                                                                    <span data-month="6">July</span>
                                                                    <span data-month="7">August</span>
                                                                    <span data-month="8">September</span>
                                                                    <span data-month="9">October</span>
                                                                    <span data-month="10">November</span>
                                                                    <span data-month="11" class="current">December</span>
                                                                </span><span class="year">2014</span>
                                                            </button>
                                                        </div>
                                                        <table class="datepicker-calendar-days">
                                                            <thead>
                                                                <tr>
                                                                    <th>Su</th>
                                                                    <th>Mo</th>
                                                                    <th>Tu</th>
                                                                    <th>We</th>
                                                                    <th>Th</th>
                                                                    <th>Fr</th>
                                                                    <th>Sa</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody></tbody>
                                                        </table>
                                                        <div class="datepicker-calendar-footer">
                                                            <button type="button" class="datepicker-today">Today</button>
                                                        </div>
                                                    </div>
                                                    <div class="datepicker-wheels" aria-hidden="true">
                                                        <div class="datepicker-wheels-month">
                                                            <h2 class="header">Month</h2>
                                                            <ul>
                                                                <li data-month="0">
                                                                    <button type="button">Jan</button></li>
                                                                <li data-month="1">
                                                                    <button type="button">Feb</button></li>
                                                                <li data-month="2">
                                                                    <button type="button">Mar</button></li>
                                                                <li data-month="3">
                                                                    <button type="button">Apr</button></li>
                                                                <li data-month="4">
                                                                    <button type="button">May</button></li>
                                                                <li data-month="5">
                                                                    <button type="button">Jun</button></li>
                                                                <li data-month="6">
                                                                    <button type="button">Jul</button></li>
                                                                <li data-month="7">
                                                                    <button type="button">Aug</button></li>
                                                                <li data-month="8">
                                                                    <button type="button">Sep</button></li>
                                                                <li data-month="9">
                                                                    <button type="button">Oct</button></li>
                                                                <li data-month="10">
                                                                    <button type="button">Nov</button></li>
                                                                <li data-month="11">
                                                                    <button type="button">Dec</button></li>
                                                            </ul>
                                                        </div>
                                                        <div class="datepicker-wheels-year">
                                                            <h2 class="header">Year</h2>
                                                            <ul></ul>
                                                        </div>
                                                        <div class="datepicker-wheels-footer clearfix">
                                                            <button type="button" class="btn datepicker-wheels-back"><span class="glyphicon glyphicon-arrow-left"></span><span class="sr-only">Return to Calendar</span></button>
                                                            <button type="button" class="btn datepicker-wheels-select">Select <span class="sr-only">Month and Year</span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="col-md-12 form-group">
                                <div class="col-md-12">
                                    <label class="control-label  pull-left text-primary">*Visit Scheduled?</label>
                                </div>
                                <div class="col-md-12">

                                    <label class="pull-left" style="padding-right: 10px">
                                        <input id="vsYes" type="radio" name="Scheduled" value="1" clientidmode="Static" runat="server" />Yes
                                    </label>
                                    <label class="pull-left" style="padding-right: 10px">
                                        <input id="vsNo" type="radio" name="Scheduled" value="0" clientidmode="Static" runat="server" data-parsley-required="true" />No
                                    </label>

                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="col-md-12 form-group">
                                <div class="col-md-12">
                                    <label class="control-label  pull-left text-primary">*Visit By</label>
                                </div>
                                <div class="col-md-12">
                                    <asp:DropDownList runat="server" ID="ddlVisitBy" ClientIDMode="Static" CssClass="form-control" data-parsley-min="1" data-parsley-min-message="Value Required" onchange="showHideVisitByTS();" />
                                </div>
                               
                            </div>
                        </div>
                        
                   </div>
                    <div class="col-md 12 form-group">
                        <div class="col-md-4"></div>
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                                <div id="divTreatmentSupporter" class="col-md-12">
                                <button type="button" class="btn btn-info btn-lg fa" id="btnTreatmentSupporterVisit" onclick="savePatientEncounterTS();">Complete Encounter</button>
                            </div>
                        </div>
                    </div>

                    
                    <div class="col-md-12">
                        <hr />
                    </div>
                    <%--to here--%>

                   <div id="step1Div">

                     <div class="col-md-12 form-group" <%-- style="height:100%"--%>>
                        <div class="col-md-12"  <%--style="height:100%"--%>>
                                <div class="panel panel-info"<%-- style="height:100%"--%>>

                                    <div class="panel-body">
                                        <div class="col-md-12 form-group">
                                            <div>
                                                <label class="control-label  pull-left text-primary">*Any Presenting Complaints</label>
                                            </div>

                                            <div>
                                                <label class="pull-left" style="padding-right: 10px">
                                                    <input id="rdAnyComplaintsYes" type="radio" name="anyComplaints" value="1" clientidmode="Static" runat="server" onclick="showHidePresentingComplaintsDivs();" />Yes
                                                </label>
                                                <label class="pull-left" style="padding-right: 10px">
                                                    <input id="rdAnyComplaintsNo" type="radio" name="anyComplaints" value="0" clientidmode="Static" runat="server" data-parsley-required="true" onclick="showHidePresentingComplaintsDivs();" />No
                                                </label>

                                            </div>
                                        </div>

                                        <div id="presentingComplaintsCtrls" class="col-md-12 form-group">
                                            <div class="col-md-5">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left">Presenting Complaints</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtPresentingComplaintsID" runat="server" ClientIDMode="Static"></asp:TextBox>
                                                    <asp:TextBox runat="server" CssClass="form-control input-sm" ID="txtPresentingComplaints" ClientIDMode="Static" placeholder="Presenting Complaints.."></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="col-md-12">
                                                    <label class="control-label  pull-left">Onset Date</label>
                                                </div>
                                                <div class="col-md-12">
                                        <div class="datepicker" id="PCDateOfOnset">
                                            <div class="input-group">
                                                <asp:TextBox ID="txtPCOnsetDate" runat="server" class="form-control input-sm" ClientIDMode="Static" onblur="DateFormat(this,this.value,event,false,'3')" onkeyup="DateFormat(this,this.value,event,false,'3')"></asp:TextBox>
                                                <%--<input class="form-control input-sm" id="VisitDate" type="text" runat="server" data-parsley-required="true" />--%>
                                                <div class="input-group-btn">
                                                    <button type="button" class="btn btn-default dropdown-toggle input-sm" data-toggle="dropdown">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                        <span class="sr-only">Toggle Calendar</span>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-right datepicker-calendar-wrapper" role="menu">
                                                        <div class="datepicker-calendar">
                                                            <div class="datepicker-calendar-header">
                                                                <button type="button" class="prev"><span class="glyphicon glyphicon-chevron-left input-sm"></span><span class="sr-only">Previous Month</span></button>
                                                                <button type="button" class="next"><span class="glyphicon glyphicon-chevron-right input-sm"></span><span class="sr-only">Next Month</span></button>
                                                                <button type="button" class="title" data-month="11" data-year="2014">
                                                                    <span class="month">
                                                                        <span data-month="0">January</span>
                                                                        <span data-month="1">February</span>
                                                                        <span data-month="2">March</span>
                                                                        <span data-month="3">April</span>
                                                                        <span data-month="4">May</span>
                                                                        <span data-month="5">June</span>
                                                                        <span data-month="6">July</span>
                                                                        <span data-month="7">August</span>
                                                                        <span data-month="8">September</span>
                                                                        <span data-month="9">October</span>
                                                                        <span data-month="10">November</span>
                                                                        <span data-month="11" class="current">December</span>
                                                                    </span><span class="year">2014</span>
                                                                </button>
                                                            </div>
                                                            <table class="datepicker-calendar-days">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Su</th>
                                                                        <th>Mo</th>
                                                                        <th>Tu</th>
                                                                        <th>We</th>
                                                                        <th>Th</th>
                                                                        <th>Fr</th>
                                                                        <th>Sa</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody></tbody>
                                                            </table>
                                                            <div class="datepicker-calendar-footer">
                                                                <button type="button" class="datepicker-today">Today</button>
                                                            </div>
                                                        </div>
                                                        <div class="datepicker-wheels" aria-hidden="true">
                                                            <div class="datepicker-wheels-month">
                                                                <h2 class="header">Month</h2>
                                                                <ul>
                                                                    <li data-month="0">
                                                                        <button type="button">Jan</button></li>
                                                                    <li data-month="1">
                                                                        <button type="button">Feb</button></li>
                                                                    <li data-month="2">
                                                                        <button type="button">Mar</button></li>
                                                                    <li data-month="3">
                                                                        <button type="button">Apr</button></li>
                                                                    <li data-month="4">
                                                                        <button type="button">May</button></li>
                                                                    <li data-month="5">
                                                                        <button type="button">Jun</button></li>
                                                                    <li data-month="6">
                                                                        <button type="button">Jul</button></li>
                                                                    <li data-month="7">
                                                                        <button type="button">Aug</button></li>
                                                                    <li data-month="8">
                                                                        <button type="button">Sep</button></li>
                                                                    <li data-month="9">
                                                                        <button type="button">Oct</button></li>
                                                                    <li data-month="10">
                                                                        <button type="button">Nov</button></li>
                                                                    <li data-month="11">
                                                                        <button type="button">Dec</button></li>
                                                                </ul>
                                                            </div>
                                                            <div class="datepicker-wheels-year">
                                                                <h2 class="header">Year</h2>
                                                                <ul></ul>
                                                            </div>
                                                            <div class="datepicker-wheels-footer clearfix">
                                                                <button type="button" class="btn datepicker-wheels-back"><span class="glyphicon glyphicon-arrow-left"></span><span class="sr-only">Return to Calendar</span></button>
                                                                <button type="button" class="btn datepicker-wheels-select">Select <span class="sr-only">Month and Year</span></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left"></label>
                                                </div>
                                                <div class="col-md-12">
                                                    <button type="button" class="btn btn-info btn-lg fa fa-plus-circle" id="btnAddPresentingComplaints" onclick="AddPresentingComplaints();">Add</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--.panel-body--%>
                                    <div class="col-md-12">
                                       <div id="presentingComplaintsTable" class="panel panel-primary">
                                       <div class="panel-heading">Presenting Complaints</div>
                                        <div style="min-height: 10px; max-height: 550px; overflow-y: auto; overflow-x: hidden;">
                                            <table id="dtlPresentingComplaints" class="table table-bordered table-striped" style="width:100%">
                                                <thead>
                                                    <tr>
                                                        <th><span class="text-primary">Presenting ComplaintsID</span></th>
                                                        <th><span class="text-primary">Presenting Complaints</span></th>
                                                        <th><span class="text-primary">Date of Onset</span></th>
                                                        <th><span class="text-primary"></span></th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>

                                            
                                        </div>
            
                                    </div>
                                    </div>
                                    <div id="presentingComplaintsNotes">
                                        <label class="control-label pull-left text-primary" for="complaints">Presenting Complaints Notes :</label>
                                        <textarea runat="server" clientidmode="Static" id="complaints" class="form-control input-sm" placeholder="complaints...." rows="3" ></textarea>
                                    </div> 

                                </div>
                                <%--.panel--%>
                        </div>
                    </div>
                     
                    <div class="col-md-12 form-group">
                        <div class="col-md-12">
                            <div class="panel panel-info">
                                <div class="panel-body">
                                    <div class="col-md-12 form-group">
                                        <label class="control-label pull-left">TB Intensified Case Findings(ICF)</label>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <div class="col-md-6">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">On Anti TB drugs?</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:DropDownList runat="server" AutoPostBack="False" CssClass="form-control input-sm" ID="tbInfected" ClientIDMode="Static" onChange="tbInfectedChange();" required="true" data-parsley-required="true">
                                                    <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                                                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">On IPT?</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:DropDownList runat="server" AutoPostBack="False" CssClass="form-control input-sm" ID="onIpt" ClientIDMode="Static" onChange="onIptChange();" required="true" data-parsley-required="true">
                                                    <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                                                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-12" clientidmode="Static" id="IcfForm">
                                            <div class="col-md-3">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left">Cough</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:DropDownList runat="server" AutoPostBack="False" CssClass="form-control input-sm" ID="cough" ClientIDMode="Static" onChange="IcfChange();">
                                                        <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                                                        <asp:ListItem Text="No" Value="False" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="col-md-12">
                                                    <label class="control-label">Fever</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:DropDownList runat="server" AutoPostBack="False" CssClass="form-control input-sm" ID="fever" ClientIDMode="Static" onChange="IcfChange();">
                                                        <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                                                        <asp:ListItem Text="No" Value="False" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left">Noticable Weight Loss</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:DropDownList runat="server" AutoPostBack="False" CssClass="form-control input-sm" ID="weightLoss" ClientIDMode="Static" onChange="IcfChange();">
                                                        <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                                                        <asp:ListItem Text="No" Value="False" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left">Night Sweats</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:DropDownList runat="server" AutoPostBack="False" CssClass="form-control input-sm" ID="nightSweats" ClientIDMode="Static" onChange="IcfChange();">
                                                        <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                                                        <asp:ListItem Text="No" Value="False" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 form-group" clientidmode="Static" id="IcfActionForm">
                        <div class="col-md-12">
                            <div class="panel panel-info">
                                <div class="panel-body">
                                    <div class="col-md-12 form-group">
                                        <label class="control-label pull-left">ICF Action Taken</label>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <div class="col-md-4">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Sputum Smear/ Gene Xpert</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:DropDownList runat="server" AutoPostBack="False" CssClass="form-control input-sm" ID="sputum" ClientIDMode="Static" onChange="IcfActionChange();">
                                                    <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Positive" Value="True"></asp:ListItem>
                                                    <asp:ListItem Text="Negative" Value="False"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Chest X-ray</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:DropDownList runat="server" AutoPostBack="False" CssClass="form-control input-sm" ID="chest" ClientIDMode="Static" onChange="IcfActionChange();">
                                                    <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Suggestive" Value="True"></asp:ListItem>
                                                    <asp:ListItem Text="Normal" Value="False"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Start Anti-TB</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:DropDownList runat="server" AutoPostBack="False" CssClass="form-control input-sm" ID="antiTb" ClientIDMode="Static" onChange="IcfActionChange();">
                                                    <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                                                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <div class="col-md-4">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Invitation of Contacts</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:DropDownList runat="server" AutoPostBack="False" CssClass="form-control input-sm" ID="contactsInvitation" ClientIDMode="Static" onChange="IcfActionChange();">
                                                    <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                                                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Evaluated for IPT</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:DropDownList runat="server" AutoPostBack="False" CssClass="form-control input-sm" ID="iptEvaluation" ClientIDMode="Static" onChange="IcfActionChange();">
                                                    <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                                                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 form-group" clientidmode="Static" id="IptForm">
                        <div class="col-md-12">
                            <div class="panel panel-info">
                                <div class="panel-body">
                                    <div class="col-md-12 form-group">
                                        <label class="control-label pull-left">Isoniazad Preventive Therapy(IPT)</label>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-info btn-lg fa fa-plus-circle" id="btnAddIptWorkUp" data-toggle="modal" data-target="#IptClientWorkupModal">IPT Client Workup</button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-info btn-lg fa fa-plus-circle" id="btnAddIpt" data-toggle="modal" data-target="#IptDetailsModal">IPT</button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-info btn-lg fa fa-plus-circle" id="btnAddIptOutcome" data-toggle="modal" data-target="#IptOutcomeModal">IPT Outcome</button>
                                        </div>
                                    </div>

                                    <div id="IptClientWorkupModal" class="modal fade" role="dialog" data-parsley-validate="true" data-show-errors="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header bg-info">
                                                    <h4 class="modal-title">Isoniazid Preventive Therapy Client Work Up</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <uc:IptClientWorkup ID="IptCw" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <div class="col-md-12 form-group">
                                                        <div class="col-md-6">
                                                            <button type="button" id="btnSaveIptWorkup" class="btn btn-default" onclientclick="return false;">Save</button>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <button type="button" id="btnCancelIptWorkup" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="IptDetailsModal" class="modal fade" role="dialog" data-parsley-validate="true" data-show-errors="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header bg-info">
                                                    <h4 class="modal-title">Isoniazid Preventive Therapy(IPT)</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <uc:Ipt ID="IptDetails" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <div class="col-md-12 form-group">
                                                        <div class="col-md-6">
                                                            <button type="button" id="btnSaveIptDetails" class="btn btn-default" onclientclick="return false;">Save</button>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <button type="button" id="btnCancelIptDetails" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="IptOutcomeModal" class="modal fade" role="dialog" data-parsley-validate="true" data-show-errors="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header bg-info">
                                                    <h4 class="modal-title">Isoniazid Preventive Therapy Outcome</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <uc:IptOutcome ID="IptOutcomeForm" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <div class="col-md-12 form-group">
                                                        <div class="col-md-6">
                                                            <button type="button" id="btnSaveIptOutcome" class="btn btn-default" onclientclick="return false;">Save</button>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <button type="button" id="btnCancelIptOutcome" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 form-group">
                        <div class="col-md-12">
                            <div class="panel panel-info">
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <div class="col-md-12 form-group">
                                                
                                            </div>
                                        </div>
                                    </div>                        

                                    <div class="col-md-12">
                                        <div class="col-md-6  form-group">
                                            <div class="col-md-6">
                                                <label class="control-label pull-left input-sm text-primary" for="tbscreeningstatus">*TB Screening</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:DropDownList runat="server" CssClass="form-control input-sm" ID="tbscreeningstatus" ClientIDMode="Static" data-parsley-min="1" data-parsley-min-message="Value Required" />
                                            </div>
                                        </div>
                                        <div class="col-md-6  form-group"></div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left input-sm">Height (cm)</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtHeight" CssClass="form-control input-sm" ClientIDMode="Static" Enabled="false" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left input-sm">Weight (Kg)</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtWeight" CssClass="form-control input-sm" ClientIDMode="Static" Enabled="false" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left input-sm">BMI</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtBMI" CssClass="form-control input-sm" ClientIDMode="Static" Enabled="false" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left input-sm text-primary" for="nutritionscreeningstatus">*Nutrition Status</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:DropDownList runat="server" CssClass="form-control" ID="nutritionscreeningstatus" ClientIDMode="Static" data-parsley-min="1" data-parsley-min-message="Value Required" />

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 form-group">
                        
                            <div class="col-md-12">
                                <div class="panel panel-info">

                                    <div class="panel-body">
                                        <div class="col-md-12 form-group">
                                            <label class="control-label pull-left">Adverse Event(s)</label>
                                        </div>

                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left">Adverse event</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:TextBox runat="server" CssClass="form-control input-sm" ID="adverseEvent" ClientIDMode="Static" placeholder="adverse event.."></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="col-md-12">
                                                    <label class="control-label">Medicine Causing A/E</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:TextBox runat="server" CssClass="form-control input-sm" ID="AdverseEventCause" ClientIDMode="Static" placeholder="cause..."></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left">Severity</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:DropDownList runat="server" CssClass="form-control input-sm" ID="ddlAdverseEventSeverity" ClientIDMode="Static" />
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left">Action</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:DropDownList runat="server" ID="AdverseEventAction" CssClass="form-control input-sm" ClientIDMode="Static" />

                                                </div>
                                            </div>
                                            <div class="col-md-1">
                                                <div class="col-md-12">
                                                    <label class="control-label pull-left"></label>
                                                </div>
                                                <div class="col-md-12">
                                                    <button type="button" class="btn btn-info btn-lg fa fa-plus-circle" id="btnAddMilestones" onclick="AddAdverseReaction();">Add</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--.panel-body--%>
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">Adverse Events</div>
                                        <div style="min-height: 10px; max-height: 550px; overflow-y: auto; overflow-x: hidden;">
                                            <table id="dtlAdverseEvents" class="table table-bordered table-striped" style="width:100%">
                                                <thead>
                                                    <tr>
                                                        <th><span class="text-primary">SeverityID</span></th>
                                                        <th><span class="text-primary">Adverse Event</span></th>
                                                        <th><span class="text-primary">Medicine Causing A/E</span></th>
                                                        <th><span class="text-primary">Severity</span></th>
                                                        <th><span class="text-primary">Action</span></th>
                                                        <th><span class="text-primary"></span></th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>

                                        </div>
                                    </div>

                                </div>
                                <%--.panel--%>
                            </div>
                        
                        <%--col-md-11--%>
                    </div>
                    </div>
                </div>
                <%-- .data-step-1--%>

                <div class="step-pane sample-pane" data-step="2">
                    <%--<div class="col-md-12"><small class="muted pull-left"><strong>PATIENT Chronic Illness </strong></small></div> <div class="col-md-12"><hr /> </div>--%>
                    <div class="col-md-12">

                        <div class="col-md-12">
                            <%--<div class="col-md-12"><hr /></div>--%>
                            <div class="panel panel-info">
                                <div class="panel-body">
                                    <div class="col-md-12 form-group">
                                        <label class="control-label pull-left">Chronic Illnesses & Comorbidities</label>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <div class="col-md-3 form-group">
                                            <div class="col-md-12">
                                                <label for="ChronicIllnessName" class="control-label pull-left">Illness</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:DropDownList runat="server" ID="ChronicIllnessName" CssClass="form-control input-sm" ClientIDMode="Static" />
                                            </div>
                                        </div>

                                        <div class="col-md-3 form-group">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Current Treatment</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:TextBox runat="server" ID="illnessTreatment" CssClass="form-control input-sm" ClientIDMode="Static" placeholder="treatment.."></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-2 form-group">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Dose</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:TextBox runat="server" ID="treatmentDose" CssClass="form-control input-sm" ClientIDMode="Static" placeholder="dose.."></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3 form-group">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Onset Date</label>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                <div class="datepicker fuelux" id="ChronicIllnessOnsetDate">
                                                    <div class="input-group pull-left">
                                                        <input class="form-control input-sm pull-left" id="txtOnsetDate" type="text" runat="server" clientidmode="Static" onblur="DateFormat(this,this.value,event,false,'3')" onkeyup="DateFormat(this,this.value,event,false,'3')" />
                                                        <div class="input-group-btn">
                                                            <button type="button" class="btn btn-default dropdown-toggle input-sm" data-toggle="dropdown">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                                <span class="sr-only">Toggle Calendar</span>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-right datepicker-calendar-wrapper" role="menu">
                                                                <div class="datepicker-calendar">
                                                                    <div class="datepicker-calendar-header">
                                                                        <button type="button" class="prev"><span class="glyphicon glyphicon-chevron-left input-sm"></span><span class="sr-only">Previous Month</span></button>
                                                                        <button type="button" class="next"><span class="glyphicon glyphicon-chevron-right input-sm"></span><span class="sr-only">Next Month</span></button>
                                                                        <button type="button" class="title" data-month="11" data-year="2014">
                                                                            <span class="month">
                                                                                <span data-month="0">January</span>
                                                                                <span data-month="1">February</span>
                                                                                <span data-month="2">March</span>
                                                                                <span data-month="3">April</span>
                                                                                <span data-month="4">May</span>
                                                                                <span data-month="5">June</span>
                                                                                <span data-month="6">July</span>
                                                                                <span data-month="7">August</span>
                                                                                <span data-month="8">September</span>
                                                                                <span data-month="9">October</span>
                                                                                <span data-month="10">November</span>
                                                                                <span data-month="11" class="current">December</span>
                                                                            </span><span class="year">2014</span>
                                                                        </button>
                                                                    </div>
                                                                    <table class="datepicker-calendar-days">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Su</th>
                                                                                <th>Mo</th>
                                                                                <th>Tu</th>
                                                                                <th>We</th>
                                                                                <th>Th</th>
                                                                                <th>Fr</th>
                                                                                <th>Sa</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody></tbody>
                                                                    </table>
                                                                    <div class="datepicker-calendar-footer">
                                                                        <button type="button" class="datepicker-today">Today</button>
                                                                    </div>
                                                                </div>
                                                                <div class="datepicker-wheels" aria-hidden="true">
                                                                    <div class="datepicker-wheels-month">
                                                                        <h2 class="header">Month</h2>
                                                                        <ul>
                                                                            <li data-month="0">
                                                                                <button type="button">Jan</button></li>
                                                                            <li data-month="1">
                                                                                <button type="button">Feb</button></li>
                                                                            <li data-month="2">
                                                                                <button type="button">Mar</button></li>
                                                                            <li data-month="3">
                                                                                <button type="button">Apr</button></li>
                                                                            <li data-month="4">
                                                                                <button type="button">May</button></li>
                                                                            <li data-month="5">
                                                                                <button type="button">Jun</button></li>
                                                                            <li data-month="6">
                                                                                <button type="button">Jul</button></li>
                                                                            <li data-month="7">
                                                                                <button type="button">Aug</button></li>
                                                                            <li data-month="8">
                                                                                <button type="button">Sep</button></li>
                                                                            <li data-month="9">
                                                                                <button type="button">Oct</button></li>
                                                                            <li data-month="10">
                                                                                <button type="button">Nov</button></li>
                                                                            <li data-month="11">
                                                                                <button type="button">Dec</button></li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="datepicker-wheels-year">
                                                                        <h2 class="header">Year</h2>
                                                                        <ul></ul>
                                                                    </div>
                                                                    <div class="datepicker-wheels-footer clearfix">
                                                                        <button type="button" class="btn datepicker-wheels-back"><span class="glyphicon glyphicon-arrow-left"></span><span class="sr-only">Return to Calendar</span></button>
                                                                        <button type="button" class="btn datepicker-wheels-select">Select <span class="sr-only">Month and Year</span></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        </div>

                                        <div class="col-md-1">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left"><span class="fa fa-cog">Action</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <button type="button" class="btn btn-info btn-lg fa fa-plus-circle" id="btnAddChronicIllness" onclick="AddChronicIllness();">Add</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">Chronic Conditions</div>
                                            <div style="min-height: 10px; max-height: 550px; overflow-y: auto; overflow-x: hidden;">
                                                <table id="dtlChronicIllness" class="table table-bordered table-striped" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th><span class="text-primary">IllnessID</span></th>
                                                            <th><span class="text-primary">Illness</span></th>
                                                            <th><span class="text-primary">Current Treatment</span></th>
                                                            <th><span class="text-primary">Dose</span></th>
                                                            <th><span class="text-primary">Onset Date</span></th>
                                                            <th><span class="text-primary">Active</span></th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                </table>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="panel panel-info">
                                <div class="panel-body">
                                    <div class="col-md-12 form-group">
                                        <label class="control-label pull-left">Patient Allergies</label>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <div class="col-md-3 form-group">
                                            <div class="col-md-12">
                                                <label for="AllergyName" class="control-label pull-left">Substance Causing Allergy</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:TextBox ID="txtAllergyId" Enabled="false" runat="server" ClientIDMode="Static"></asp:TextBox>
                                                <asp:TextBox ID="txtAllergy" runat="server" CssClass="form-control input-sm" ClientIDMode="Static" placeholder="allergy.."></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-3 form-group">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Type of reaction</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:TextBox ID="txtReactionTypeID" Enabled="false" runat="server" ClientIDMode="Static"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txtReactionType" CssClass="form-control input-sm" ClientIDMode="Static" placeholder="reaction.."></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-2 form-group">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Severity</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:DropDownList ID="ddlAllergySeverity" runat="server" CssClass="form-control input-sm" ClientIDMode="Static"></asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="col-md-12">
                                                <label class="control-label  pull-left">Allergy Date</label>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="datepicker fuelux" id="AllergyDate">
                                                    <div class="input-group">
                                                        <input class="form-control input-sm" id="txtAllergyDate" type="text" runat="server" clientidmode="Static" onblur="DateFormat(this,this.value,event,false,'3')" onkeyup="DateFormat(this,this.value,event,false,'3')" />
                                                        <div class="input-group-btn">
                                                            <button type="button" class="btn btn-default dropdown-toggle input-sm" data-toggle="dropdown">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                                <span class="sr-only">Toggle Calendar</span>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-right datepicker-calendar-wrapper" role="menu">
                                                                <div class="datepicker-calendar">
                                                                    <div class="datepicker-calendar-header">
                                                                        <button type="button" class="prev"><span class="glyphicon glyphicon-chevron-left input-sm"></span><span class="sr-only">Previous Month</span></button>
                                                                        <button type="button" class="next"><span class="glyphicon glyphicon-chevron-right input-sm"></span><span class="sr-only">Next Month</span></button>
                                                                        <button type="button" class="title" data-month="11" data-year="2014">
                                                                            <span class="month">
                                                                                <span data-month="0">January</span>
                                                                                <span data-month="1">February</span>
                                                                                <span data-month="2">March</span>
                                                                                <span data-month="3">April</span>
                                                                                <span data-month="4">May</span>
                                                                                <span data-month="5">June</span>
                                                                                <span data-month="6">July</span>
                                                                                <span data-month="7">August</span>
                                                                                <span data-month="8">September</span>
                                                                                <span data-month="9">October</span>
                                                                                <span data-month="10">November</span>
                                                                                <span data-month="11" class="current">December</span>
                                                                            </span><span class="year">2014</span>
                                                                        </button>
                                                                    </div>
                                                                    <table class="datepicker-calendar-days">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Su</th>
                                                                                <th>Mo</th>
                                                                                <th>Tu</th>
                                                                                <th>We</th>
                                                                                <th>Th</th>
                                                                                <th>Fr</th>
                                                                                <th>Sa</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody></tbody>
                                                                    </table>
                                                                    <div class="datepicker-calendar-footer">
                                                                        <button type="button" class="datepicker-today">Today</button>
                                                                    </div>
                                                                </div>
                                                                <div class="datepicker-wheels" aria-hidden="true">
                                                                    <div class="datepicker-wheels-month">
                                                                        <h2 class="header">Month</h2>
                                                                        <ul>
                                                                            <li data-month="0">
                                                                                <button type="button">Jan</button></li>
                                                                            <li data-month="1">
                                                                                <button type="button">Feb</button></li>
                                                                            <li data-month="2">
                                                                                <button type="button">Mar</button></li>
                                                                            <li data-month="3">
                                                                                <button type="button">Apr</button></li>
                                                                            <li data-month="4">
                                                                                <button type="button">May</button></li>
                                                                            <li data-month="5">
                                                                                <button type="button">Jun</button></li>
                                                                            <li data-month="6">
                                                                                <button type="button">Jul</button></li>
                                                                            <li data-month="7">
                                                                                <button type="button">Aug</button></li>
                                                                            <li data-month="8">
                                                                                <button type="button">Sep</button></li>
                                                                            <li data-month="9">
                                                                                <button type="button">Oct</button></li>
                                                                            <li data-month="10">
                                                                                <button type="button">Nov</button></li>
                                                                            <li data-month="11">
                                                                                <button type="button">Dec</button></li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="datepicker-wheels-year">
                                                                        <h2 class="header">Year</h2>
                                                                        <ul></ul>
                                                                    </div>
                                                                    <div class="datepicker-wheels-footer clearfix">
                                                                        <button type="button" class="btn datepicker-wheels-back"><span class="glyphicon glyphicon-arrow-left"></span><span class="sr-only">Return to Calendar</span></button>
                                                                        <button type="button" class="btn datepicker-wheels-select">Select <span class="sr-only">Month and Year</span></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-md-1">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left"><span class="fa fa-cog">Action</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <button type="button" class="btn btn-info btn-lg fa fa-plus-circle" id="btnAddAllergy" onclick="AddAllergy();">Add</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">Allergies</div>
                                            <div style="min-height: 10px; max-height: 550px; overflow-y: auto; overflow-x: hidden;">
                                                <table id="dtlAllergy" class="table table-bordered table-striped" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th><span class="text-primary">AllergyID</span></th>
                                                            <th><span class="text-primary">ReactionID</span></th>
                                                            <th><span class="text-primary">severityID</span></th>
                                                            <th><span class="text-primary">Allergy</span></th>
                                                            <th><span class="text-primary">Reaction Type</span></th>
                                                            <th><span class="text-primary">Severity</span></th>
                                                            <th><span class="text-primary">Date</span></th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                </table>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div id="divAntigenToday" class="panel panel-info">

                                <div class="panel-body">
                                    <div class="col-md-12 form-group">
                                        <label class="control-label pull-left">Antigen Today</label>
                                    </div>

                                    <div class="col-md-12 form-group ">
                                        <div class="col-md-4">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Vaccine</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:DropDownList ID="ddlVaccine" runat="server" CssClass="form-control input-sm" ClientIDMode="Static"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Vaccine Stage</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:DropDownList ID="ddlVaccineStage" runat="server" CssClass="form-control input-sm" ClientIDMode="Static"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="col-md-12">
                                                <label class="control-label  pull-left">Vaccination Date</label>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="datepicker fuelux" id="vaccineDate">
                                                    <div class="input-group">
                                                        <input class="form-control input-sm" id="txtVaccinationDate" type="text" runat="server" clientidmode="Static" onblur="DateFormat(this,this.value,event,false,'3')" onkeyup="DateFormat(this,this.value,event,false,'3')" />
                                                        <div class="input-group-btn">
                                                            <button type="button" class="btn btn-default dropdown-toggle input-sm" data-toggle="dropdown">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                                <span class="sr-only">Toggle Calendar</span>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-right datepicker-calendar-wrapper" role="menu">
                                                                <div class="datepicker-calendar">
                                                                    <div class="datepicker-calendar-header">
                                                                        <button type="button" class="prev"><span class="glyphicon glyphicon-chevron-left input-sm"></span><span class="sr-only">Previous Month</span></button>
                                                                        <button type="button" class="next"><span class="glyphicon glyphicon-chevron-right input-sm"></span><span class="sr-only">Next Month</span></button>
                                                                        <button type="button" class="title" data-month="11" data-year="2014">
                                                                            <span class="month">
                                                                                <span data-month="0">January</span>
                                                                                <span data-month="1">February</span>
                                                                                <span data-month="2">March</span>
                                                                                <span data-month="3">April</span>
                                                                                <span data-month="4">May</span>
                                                                                <span data-month="5">June</span>
                                                                                <span data-month="6">July</span>
                                                                                <span data-month="7">August</span>
                                                                                <span data-month="8">September</span>
                                                                                <span data-month="9">October</span>
                                                                                <span data-month="10">November</span>
                                                                                <span data-month="11" class="current">December</span>
                                                                            </span><span class="year">2014</span>
                                                                        </button>
                                                                    </div>
                                                                    <table class="datepicker-calendar-days">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Su</th>
                                                                                <th>Mo</th>
                                                                                <th>Tu</th>
                                                                                <th>We</th>
                                                                                <th>Th</th>
                                                                                <th>Fr</th>
                                                                                <th>Sa</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody></tbody>
                                                                    </table>
                                                                    <div class="datepicker-calendar-footer">
                                                                        <button type="button" class="datepicker-today">Today</button>
                                                                    </div>
                                                                </div>
                                                                <div class="datepicker-wheels" aria-hidden="true">
                                                                    <div class="datepicker-wheels-month">
                                                                        <h2 class="header">Month</h2>
                                                                        <ul>
                                                                            <li data-month="0">
                                                                                <button type="button">Jan</button></li>
                                                                            <li data-month="1">
                                                                                <button type="button">Feb</button></li>
                                                                            <li data-month="2">
                                                                                <button type="button">Mar</button></li>
                                                                            <li data-month="3">
                                                                                <button type="button">Apr</button></li>
                                                                            <li data-month="4">
                                                                                <button type="button">May</button></li>
                                                                            <li data-month="5">
                                                                                <button type="button">Jun</button></li>
                                                                            <li data-month="6">
                                                                                <button type="button">Jul</button></li>
                                                                            <li data-month="7">
                                                                                <button type="button">Aug</button></li>
                                                                            <li data-month="8">
                                                                                <button type="button">Sep</button></li>
                                                                            <li data-month="9">
                                                                                <button type="button">Oct</button></li>
                                                                            <li data-month="10">
                                                                                <button type="button">Nov</button></li>
                                                                            <li data-month="11">
                                                                                <button type="button">Dec</button></li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="datepicker-wheels-year">
                                                                        <h2 class="header">Year</h2>
                                                                        <ul></ul>
                                                                    </div>
                                                                    <div class="datepicker-wheels-footer clearfix">
                                                                        <button type="button" class="btn datepicker-wheels-back"><span class="glyphicon glyphicon-arrow-left"></span><span class="sr-only">Return to Calendar</span></button>
                                                                        <button type="button" class="btn datepicker-wheels-select">Select <span class="sr-only">Month and Year</span></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <div class="col-md-12">
                                                <label class="control-label pull-left">Action</label>
                                            </div>
                                            <div class="col-md-12">
                                                <button type="button" class="btn btn-info btn-lg fa fa-plus-circle" id="btnAddVaccine" onclick="AddVaccine();">Add</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">Antigen Today</div>
                                            <div style="min-height: 10px; max-height: 550px; overflow-y: auto; overflow-x: hidden;">
                                                <table id="dtlVaccines" class="table table-bordered table-striped" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th><span class="text-primary">VaccineID</span></th>
                                                            <th><span class="text-primary">VaccineStageID</span></th>
                                                            <th><span class="text-primary">Vaccine</span></th>
                                                            <th><span class="text-primary">Vaccine Stage</span></th>
                                                            <th><span class="text-primary">Vaccination Date</span></th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                </table>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <%-- .panel-body--%>
                            </div>
                            <%--.panel--%>
                        </div>

                    </div>


                </div>
                <%-- .data-step-2--%>

                <div class="step-pane sample-pane" id="datastep3" data-step="3">
                    <div class="col-md-12"><small class="muted pull-left"><strong>PATIENT Examination</strong></small></div>
                    <div class="col-md-12">
                        <hr />
                    </div>
                    <div class="col-md-12">

                        <div class="col-md-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">General Examination</div>
                                <div style="min-height: 10px; max-height: 550px; overflow-y: auto; overflow-x: hidden; text-align:left; padding-left:10px">
                                    <asp:CheckBoxList ID="cblGeneralExamination" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" Width="100%" ClientIDMode="Static" ></asp:CheckBoxList>
                                </div>
                            </div>

                            
                            <div class="col-md-12"><hr /></div>

                            <div class="col-md-12 form-group">
                                <div class="col-md-3 form-group">
                                    <div class="col-md-12">
                                        <label for="ChronicIllnessName" class="control-label pull-left">Review of Systems</label>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:DropDownList runat="server" ID="ddlExaminationType" CssClass="form-control input-sm" ClientIDMode="Static" onchange="loadSystemReviews();" />
                                    </div>
                                </div>

                                <div class="col-md-3 form-group">
                                    <div class="col-md-12">
                                        <label class="control-label pull-left">Findings</label>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:DropDownList runat="server" ID="ddlExamination" CssClass="form-control input-sm" ClientIDMode="Static" />
                                    </div>
                                </div>

                                <div class="col-md-5 form-group">
                                    <div class="col-md-12">
                                        <label class="control-label pull-left">Findings Notes..</label>
                                    </div>
                                    <div class="col-md-12">

                                        <asp:TextBox runat="server" ID="txtExamFindings" CssClass="form-control input-sm" ClientIDMode="Static" placeholder="Findings.." Rows="3" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-1">
                                    <div class="col-md-12">
                                        <label class="control-label pull-left"><span class="fa fa-cog">Action</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-info btn-lg fa fa-plus-circle" id="btnAddPhysicalExam" onclick="AddPhysicalExam();">Add</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 form-group">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">Patient Examination</div>
                                    <div style="min-height: 10px; max-height: 550px; overflow-y: auto; overflow-x: hidden;">
                                        <table id="dtlPhysicalExam" class="table table-bordered table-striped" width="100%">
                                            <thead>
                                                <tr>
                                                    <th><span class="text-primary">ExaminationTypeID</span></th>
                                                    <th><span class="text-primary">ExaminationID</span></th>
                                                    <th><span class="text-primary">Review of systems</span></th>
                                                    <th><span class="text-primary">Findings</span></th>
                                                    <th><span class="text-primary">Findings</span></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                        </table>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <%-- .data-step-3--%>

                <div class="step-pane sample-pane" data-step="4">
                    <div class="col-md-12"><small class="muted pull-left"><strong>PATIENT MANAGEMENT</strong></small></div>
                    <div class="col-md-12">
                        <hr />
                    </div>


                    <div class="col-md-12">
                        
                        <div class="col-md-12">
                            <div class="col-md-12 form-group">
                                <label class="control-label pull-left">Work Plan</label>
                            </div>
                            <div class="form-group col-md-12" style="text-align: left">
                                <asp:TextBox ID="txtWorkPlan" CssClass ="form-control input-sm" ClientIDMode="Static" runat="server" TextMode="MultiLine" Rows="4" Width="100%"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <hr />
                        </div>

                    <div class="col-md-12">
                        <div class="col-md-12 form-group">
                            <label class="control-label pull-left">Select services offered from the list below</label>
                        </div>
                        <div class="form-group col-md-12" style="text-align: left">
                            <asp:CheckBoxList ID="cblPHDP" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" Width="100%"></asp:CheckBoxList>
                        </div>
                    </div>
                        <div class="col-md-12">
                            <hr />
                        </div>

                        <div class="col-md-12">
                            <div class="col-md-12 form-group">
                                <label class="control-label pull-left">Lab Order</label>
                            </div>
                            <div class="form-group col-md-12" style="text-align: left">
                                <button type="button" class="btn btn-info btn-sm pull-left" data-toggle="modal" data-target="#labModal">Order Lab Tests</button>
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                            <hr />
                        </div>

                    <div class="col-md-12">
                        
                        <div class="col-md-12 form-group">
                            <label class="control-label pull-left">Patient Diagnosis and Treatment</label>
                        </div>
                       
                        

                        <div class="col-md-12">
                            <div class="col-md-6">
                                <label class="control-label pull-left">Diagnosis (ICD 10 Codes)</label>
                            </div>
                            <div class="col-md-5">
                                <label class="control-label pull-left">Treatment</label>
                            </div>
                            <div class="col-md-1">
                                <label class="control-label pull-left">Action</label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-6 form-group">
                                <asp:TextBox ID="txtDiagnosisID" Enabled="false" runat="server" ClientIDMode="Static"></asp:TextBox>
                                <input type="text" id="Diagnosis" class="form-control input-sm" placeholder="Type Diagnosis......" runat="server" clientidmode="Static" />
                            </div>

                            <div class="col-md-5 form-group">
                                <input type="text" id="DiagnosisTreatment" class="form-control input-sm" placeholder="treatment" runat="server" clientidmode="Static" />
                            </div>
                            <div class="col-md-1 form-group">
                                <button type="button" class="btn btn-info btn-lg fa fa-plus-circle" id="btnAddDiagnosis" onclick="AddDiagnosis();">Add</button>
                            </div>
                        </div>

                        <div class="col-md-12 form-group">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Diagnosis</div>
                                <div style="min-height: 10px; max-height: 550px; overflow-y: auto; overflow-x: hidden;">
                                    <table id="dtlDiagnosis" class="table table-bordered table-striped" width="100%">
                                        <thead>
                                            <tr>
                                                <th><span class="text-primary">DiagnosisID</span></th>
                                                <th><span class="text-primary">Diagnosis</span></th>
                                                <th><span class="text-primary">Treatment</span></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>

                        
                        <div class="col-md-12">
                            <hr />
                        </div>

                        <div class="col-md-12">
                            <div class="col-md-2">
                                <button type="button" class="btn btn-info btn-sm pull-left" data-toggle="modal" data-target="#adherenceAssessmentModal">Adherence Assessment</button>
                            </div>
                            <div class="col-md-5">
                                <div class="col-md-12 form-group">
                                    <div class="col-md-6">
                                        <label class="control-label pull-left">ARV Adherence</label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList runat="server" ID="arvAdherance" CssClass="form-control input-sm" ClientIDMode="Static" Enabled="False" />
                                    </div>
                                </div>

                                
                            </div>
                            <div class="col-md-5">
                                <div class="col-md-12 form-group">
                                    <div class="col-md-6">
                                        <label class="control-label pull-left">CTX/Dapsone Adherence</label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList runat="server" CssClass="form-control input-sm" ID="ctxAdherance" ClientIDMode="Static" Enabled="False" />
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Modal -->
                        <div id="adherenceAssessmentModal" class="modal fade" role="dialog" data-parsley-validate="true" data-show-errors="true">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header bg-info">
                                        <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                                        <h4 class="modal-title">Adherence Assessment</h4>

                                    </div>
                                    <div class="modal-body">
                                        <div class="row">

                                            <div class="col-md-12 form-group">
                                                <div class="col-md-9">Questions</div>
                                                <div class="col-md-3">
                                                    <div class="col-md-6">Yes</div>
                                                    <div class="col-md-6">No</div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 form-group">
                                                <div class="col-md-9">
                                                    <label class="control-label pull-left">Do you ever forget to take your medicine?</label>
                                                </div>
                                                <div class="col-md-3">

                                                    <div class="col-md-6">
                                                        <asp:RadioButton ID="Question1_Yes" runat="server" GroupName="Question1" ClientIDMode="Static" Value="1" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <asp:RadioButton ID="Question1_No" runat="server" GroupName="Question1" ClientIDMode="Static" Value="0" />
                                                    </div>

                                                    <div class="errorBlock1" style="color: red;">Please select one option </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 form-group">
                                                <div class="col-md-9">
                                                    <label class="control-label pull-left">Are you careless at times about taking your medicine?</label>
                                                </div>
                                                <div class="col-md-3">

                                                    <div class="col-md-6">
                                                        <asp:RadioButton ID="Question2_Yes" runat="server" GroupName="Question2" ClientIDMode="Static" Value="1" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <asp:RadioButton ID="Question2_No" runat="server" GroupName="Question2" ClientIDMode="Static" Value="0" />
                                                    </div>

                                                    <div class="errorBlock2" style="color: red;">Please select one option </div>
                                                </div>
                                            </div>


                                            <div class="col-md-12 form-group">
                                                <div class="col-md-9">
                                                    <label class="control-label pull-left">Sometimes if you feel worse when you take the medicine, do you stop taking it?</label>
                                                </div>
                                                <div class="col-md-3">

                                                    <div class="col-md-6">
                                                        <asp:RadioButton ID="Question3_Yes" runat="server" GroupName="Question3" ClientIDMode="Static" Value="1" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <asp:RadioButton ID="Question3_No" runat="server" GroupName="Question3" ClientIDMode="Static" Value="0" />
                                                    </div>

                                                    <div class="errorBlock3" style="color: red;">Please select one option </div>
                                                </div>
                                            </div>


                                            <div class="col-md-12 form-group">
                                                <div class="col-md-9">
                                                    <label class="control-label pull-left">When you feel better do you sometimes stop taking your medicine?</label>
                                                </div>
                                                <div class="col-md-3">

                                                    <div class="col-md-6">
                                                        <asp:RadioButton ID="Question4_Yes" runat="server" GroupName="Question4" ClientIDMode="Static" Value="1" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <asp:RadioButton ID="Question4_No" runat="server" GroupName="Question4" ClientIDMode="Static" Value="0" />
                                                    </div>

                                                    <div class="errorBlock4" style="color: red;">Please select one option </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 form-group" style="background-color: lightblue;">
                                                <div class="col-md-9 pull-left">Total Score</div>
                                                <div class="col-md-3 pull-left">
                                                    <asp:Label ID="adherenceScore" runat="server"></asp:Label>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <div class="col-md-12">
                                            <button type="button" id="btnAdherenceAssessment" class="btn btn-default" onclientclick="return false;">Save</button>
                                            <button type="button" id="btnAdherenceAssessmentCancel" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>

                            </div>

                        </div>

                        <div id="pharmacyModal" class="modal fade" role="dialog" data-parsley-validate="true" data-show-errors="true" style="width:100%">
                            <div class="modal-dialog" style="width:100%">
                                <!-- Modal content-->
                                <div class="modal-content" style="width:100%">
                                    <div class="modal-body" style="width:100%">
                                        <div class="row">
                                            <uc:ucPharmacyPrescription runat="server" ID="ucPharmacyPrescription" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="labModal" class="modal fade" role="dialog" data-parsley-validate="true" data-show-errors="true" style="width:100%">
                            <div class="modal-dialog" style="width:100%">
                                <!-- Modal content-->
                                <div class="modal-content" style="width:100%">
                                    <div class="modal-body" style="width:100%">
                                        <div class="row">
                                            <uc:ucPatientLabs runat="server" ID="ucPatientLabs" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <hr />
                        </div>

                        <div class="col-md-12">
                            <button type="button" class="btn btn-info btn-sm pull-left" data-toggle="modal" data-target="#pharmacyModal">Prescibe Drugs</button>
                            <button type="button" class="btn btn-info btn-lg fa fa-plus-circle" data-toggle="modal" id="AddAppointment" onclientclick="return false">Add Appointment</button>

                        </div>

                        <div class="col-md-12">
                            <hr />
                        </div>
                    </div>
                </div>

                <div id="prevNextButton" class="actions">
                    <button type="button" class="btn btn-default btn-prev">
                        <span class="glyphicon glyphicon-arrow-left"></span>Prev</button>
                    <button type="button" class="btn btn-primary btn-next" data-last="Complete">
                        Next
		                        <span class="glyphicon glyphicon-arrow-right"></span>
                    </button>
                </div>
            </div>
        </div>
    </div>


</div>

<script type="text/javascript">
    var genderId = <%=genderID%>;
    var gender = "<%=gender%>";
    var Age = "<%=age%>";
    document.getElementById('txtPresentingComplaintsID').style.display = 'none';
    document.getElementById('txtAllergyId').style.display = 'none';
    document.getElementById('txtReactionTypeID').style.display = 'none';
    document.getElementById('txtDiagnosisID').style.display = 'none';
    

    $(document).ready(function () {
        $('.errorBlock1').hide();
        $('.errorBlock2').hide();
        $('.errorBlock3').hide();
        $('.errorBlock4').hide();
        if (($("#cough").val() === 'True')||($("#fever").val() === 'True')||($("#weightLoss").val() === 'True')||($("#nightSweats").val() === 'True')) {
            $("#IcfActionForm").show();
        } else {
            $("#IcfActionForm").hide();
        }
        /*$("#IcfActionForm").hide();*/
        $("#IptForm").hide();
        $("#IcfForm").hide();
        $("#IptClientWorkupForm").hide();
        $("#IptDetailsForm").hide();
        $("#IptOutcomeDetailsForm").hide();
        $("#onIpt").prop("disabled",true);
        //showHideFPControls();
        loadPresentingComplaints();
        loadAllergies();
        loadAllergyReactions();
        loadDiagnosis();
        showHidePresentingComplaintsDivs();
        showHideVisitByTS();


        //set nutrition status

        var txtBmi = $("#<%=txtBMI.ClientID%>").val();
        if (txtBmi < 16) {
            $("#nutritionscreeningstatus option").filter(function() {return $(this).text() === 'Severe Acute Malnutrition';}).prop('selected', true);
        } else if (txtBmi >= 16 && txtBmi < 18.5) {
            $("#nutritionscreeningstatus option").filter(function() {return $(this).text() === 'Moderate Acute Malnutrition';}).prop('selected', true);
        }else if (txtBmi >= 18.5 && txtBmi < 25) {
            $("#nutritionscreeningstatus option").filter(function() {return $(this).text() === 'Normal';}).prop('selected', true);
        } else if(txtBmi >= 25) {
            $("#nutritionscreeningstatus option").filter(function() {return $(this).text() === 'Overweight/Obese';}).prop('selected', true);
        }

        if(Age > 14)
        {
            document.getElementById('divAntigenToday').style.display = 'none';
        }
        else
        {
            document.getElementById('divAntigenToday').style.display = 'block';
        }


        var getVisitDateVal = "<%= this.visitdateval %>";
        var getFemaleLMPVal = "<%= this.LMPval %>";
        var getEDDPVal = "<%= this.EDDval %>";
        var getNxtAppDateVal = "<%= this.nxtAppDateval %>";
    
        if (getVisitDateVal == '' || getVisitDateVal == '01-Jan-1900')
            getVisitDateVal = 0;

        if (getFemaleLMPVal == '' || getFemaleLMPVal == '01-Jan-1900')
            getFemaleLMPVal = 0;

        if (getEDDPVal == '' || getEDDPVal == '01-Jan-1900')
            getEDDPVal = 0;

        if (getNxtAppDateVal == '' || getVisitDateVal == '01-Jan-1900') 
            getNxtAppDateVal = 0;
        //Date processing
        var today = new Date();
        var tomorrow = new Date();
        tomorrow.setDate(today.getDate() + 1);

        $('#DateOfVisit').datepicker({
            allowPastDates: true,
            date: getVisitDateVal,
            restricted: [{from: tomorrow, to: Infinity}],
            momentConfig: { culture: 'en', format: 'DD-MMM-YYYY' }
            //restricted: [{ from: '01-01-2013', to: '01-01-2014' }]
        });
        
        $('#PCDateOfOnset').datepicker({
            allowPastDates: true,
            momentConfig: { culture: 'en', format: 'DD-MMM-YYYY' },
            date: 0,
            restricted: [{from: tomorrow, to: Infinity}]
            //restricted: [{ from: '01-01-2013', to: '01-01-2014' }]
        });
        $('#OnsetDate').datepicker({
            allowPastDates: true,
            momentConfig: { culture: 'en', format: 'DD-MMM-YYYY' },
            restricted: [{from: tomorrow, to: Infinity}],
            //restricted: [{ from: '01-01-2013', to: '01-01-2014' }]
        });
           
        $('#ChronicIllnessOnsetDate').datepicker({
            allowPastDates: true,
            momentConfig: { culture: 'en', format: 'DD-MMM-YYYY' },
            date: 0,
            restricted: [{from: tomorrow, to: Infinity}],
            //restricted: [{ from: '01-01-2013', to: '01-01-2014' }]
        });
        
        $('#FemaleLMP').datepicker({
            allowPastDates: true,
            date: getFemaleLMPVal,
            restricted: [{from: tomorrow, to: Infinity}],
            momentConfig: { culture: 'en', format: 'DD-MMM-YYYY' }
                
            //restricted: [{ from: '01-01-2013', to: '01-01-2014' }]
        });
        $('#EDCD').datepicker({
            allowPastDates: true,
            date: getEDDPVal,
            momentConfig: { culture: 'en', format: 'DD-MMM-YYYY' }
            //restricted: [{ from: '01-01-2013', to: '01-01-2014' }]
        });
        $('#AllergyDate').datepicker({
            allowPastDates: true,
            date: 0,
            restricted: [{from: tomorrow, to: Infinity}],
            momentConfig: { culture: 'en', format: 'DD-MMM-YYYY' }
            //restricted: [{ from: '01-01-2013', to: '01-01-2014' }]
        });
        $('#AntigenDate').datepicker({
            allowPastDates: true,
            momentConfig: { culture: 'en', format: 'DD-MMM-YYYY' }
            //restricted: [{ from: '01-01-2013', to: '01-01-2014' }]
        });
        $('#vaccineDate').datepicker({
            allowPastDates: true,
            date: 0,
            restricted: [{from: tomorrow, to: Infinity}],
            momentConfig: { culture: 'en', format: 'DD-MMM-YYYY' }
            //restricted: [{ from: '01-01-2013', to: '01-01-2014' }]
        });
        $('#PCDateOfOnset').on('changed.fu.datepicker dateClicked.fu.datepicker', function(event,date) {
            presentingComplaintsDateChange();
        });
          
        ////////////////////////////////////////////////////////////////////////////////////////////
        //Gender validations
        var male = "Male";

        var advEventsTable = $('#dtlAdverseEvents').DataTable({
            ajax: {
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/GetAdverseEvents",
                dataSrc: 'd',
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            },
            paging: false,
            searching: false,
            info: false,
            ordering: false,
            columnDefs: [
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            }
            ]
        });


        var chronicTable = $('#dtlChronicIllness').DataTable({
            ajax: {
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/GetChronicIllness",
                dataSrc: 'd',
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            },
            paging: false,
            searching: false,
            info: false,
            ordering: false,
            columnDefs: [
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            }
            ]
        });

        var allergyTable = $('#dtlAllergy').DataTable({
            ajax: {
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/GetAllergies",
                dataSrc: 'd',
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            },
            paging: false,
            searching: false,
            info: false,
            ordering: false,
            columnDefs: [
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [1],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [2],
                "visible": false,
                "searchable": false
            }
            ]
        });

        var vaccineTable = $('#dtlVaccines').DataTable({
            ajax: {
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/GetVaccines",
                dataSrc: 'd',
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            },
            paging: false,
            searching: false,
            info: false,
            ordering: false,
            columnDefs: [
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [1],
                "visible": false,
                "searchable": false
            }
            ]
        });

        var examTable = $('#dtlPhysicalExam').DataTable({
            ajax: {
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/GetPhysicalExam",
                dataSrc: 'd',
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            },
            paging: false,
            searching: false,
            info: false,
            ordering: false,
            columnDefs: [
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [1],
                "visible": false,
                "searchable": false
            }
            ]
        });

        var diagnosisTable = $('#dtlDiagnosis').DataTable({
            ajax: {
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/GetDiagnosis",
                dataSrc: 'd',
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            },
            paging: false,
            searching: false,
            info: false,
            ordering: false,
            columnDefs: [
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            }
            ]
        });


        var presentingComplaintsTable = $('#dtlPresentingComplaints').DataTable({
            ajax: {
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/LoadComplaints",
                dataSrc: 'd',
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            },
            paging: false,
            searching: false,
            info: false,
            ordering: false,
            columnDefs: [
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            }
            ]
        });

        var index;

        $("#dtlAdverseEvents").on('click',
            '.btnDelete',
            function () {
                advEventsTable
                    .row($(this).parents('tr'))
                    .remove()
                    .draw();
                window.location.href = '<%=ResolveClientUrl("~/CCC/Encounter/PatientEncounter.aspx") %>';

                var index = reactionEventList.indexOf($(this).parents('tr').find('td:eq(0)').text());
                if (index > -1) {
                    reactionEventList.splice(index, 1);
                }

                //$(this).closest('tr').remove();
                //var y = $(this).closest('tr').find('td').eq(0).html();
                //index = arrAdverseEventUI.findIndex(x => x.adverseEvent == y);
                //if (index > -1) {
                //    arrAdverseEventUI.splice(index, 1);
                //}
            });

        ////dtlChronicIllness
        $("#dtlChronicIllness").on('click',
            '.btnDelete',
            function () {
                chronicTable
                    .row($(this).parents('tr'))
                    .remove()
                    .draw();

                var index = chronicIllnessList.indexOf($(this).parents('tr').find('td:eq(0)').text());
                if (index > -1) {
                    chronicIllnessList.splice(index, 1);
                }

            });

        ////dtlAllergy
        $("#dtlAllergy").on('click',
            '.btnDelete',
            function () {
                allergyTable
                    .row($(this).parents('tr'))
                    .remove()
                    .draw();

                var index = AllergyList.indexOf($(this).parents('tr').find('td:eq(0)').text());
                if (index > -1) {
                    AllergyList.splice(index, 1);
                }

            });

        ////dtlVaccines
        $("#dtlVaccines").on('click',
            '.btnDelete',
            function () {
                vaccineTable
                    .row($(this).parents('tr'))
                    .remove()
                    .draw();

                var index = vaccineList.indexOf($(this).parents('tr').find('td:eq(0)').text());
                if (index > -1) {
                    vaccineList.splice(index, 1);
                }

                var index1 = vaccineStageList.indexOf($(this).parents('tr').find('td:eq(1)').text());
                if (index1 > -1) {
                    vaccineStageList.splice(index1, 1);
                }
                   
            });


        ////dtlPhysicalExam
        $("#dtlPhysicalExam").on('click',
            '.btnDelete',
            function () {
                examTable
                    .row($(this).parents('tr'))
                    .remove()
                    .draw();

                var index = physicalExamList.indexOf($(this).parents('tr').find('td:eq(1)').text());
                if (index > -1) {
                    physicalExamList.splice(index, 1);
                }
                    
            });

        ////dtlDiagnosis
        $("#dtlDiagnosis").on('click',
            '.btnDelete',
            function () {
                diagnosisTable
                    .row($(this).parents('tr'))
                    .remove()
                    .draw();

                var index = diagnosisList.indexOf($(this).parents('tr').find('td:eq(0)').text());
                if (index > -1) {
                    diagnosisList.splice(index, 1);
                }
                    
            });

        ////dtlPresentingComplaints
        $("#dtlPresentingComplaints").on('click',
            '.btnDelete',
            function () {
                presentingComplaintsTable
                    .row($(this).parents('tr'))
                    .remove()
                    .draw();

                var index = PresentingComplaintsList.indexOf($(this).parents('tr').find('td:eq(0)').text());
                if (index > -1) {
                    PresentingComplaintsList.splice(index, 1);
                }
                    
            });
            
        ///////////////////////////////////////////////////////////////////////////////////////////////////

        //Save patient IPT client workup
        $("#btnSaveIptWorkup").click(function() {
            addPatientIptWorkup();
            $('#IptClientWorkupModal').modal('hide');
        });

        //Save patient IPT Details
        $("#btnSaveIptDetails").click(function() {
            var dob = $("#IptDateCollected").val();
                if (moment('' + dob + '').isAfter()) {
                    toastr.error("Date collected cannot be a future date.");
                    return false;
                } 
                else {
                    addIpt();
                    $('#IptDetailsModal').modal('hide');                   
                }
        });

        //Save patient IPT Outcome
        $("#btnSaveIptOutcome").click(function() {
            addPatientIptOutcome();
            $('#IptOutcomeModal').modal('hide');
        });

        //$('#myWizard').wizard();
        $("#myWizard")
                .on("actionclicked.fu.wizard", function (evt, data) {
                    var currentStep = data.step;
                    var nextStep = 0;
                    var previousStep = 0;
                    var totalError = 0;
                    var stepError = 0;
                    /*var form = $("form[name='form1']");*/

                    if (data.direction === 'next')
                        nextStep = currentStep += 1;
                    else
                        previousStep = nextStep -= 1;
                    if (data.step === 1) {

                        /* add constraints based on age*/

                        if ($('#datastep1').parsley().validate()) {
                                addPatientIcf();
                                if (($("#cough").val() === 'True')||($("#fever").val() === 'True')||($("#weightLoss").val() === 'True')||($("#nightSweats").val() === 'True')) {
                                    addPatientIcfAction();
                                }
                            savePatientEncounterPresentingComplaint();
                        } else {
                            stepError = $('.parsley-error').length === 0;
                            totalError += stepError;
                            evt.preventDefault();
                        }
                    }
                    else if (data.step === 2) {
                        savePatientEncounterChronicIllness();
                        //if ($("#datastep2").parsley().validate()) {

                        //} else {
                        //    stepError = $('.parsley-error').length === 0;
                        //    totalError += stepError;
                        //    evt.preventDefault();
                        //}
                    }
                    else if (data.step === 3) {
                            savePatientPhysicalExams();
                        
                        //if ($("#datastep3").parsley().validate()) {

                        //} else {
                        //    stepError = $('.parsley-error').length === 0;
                        //    totalError += stepError;
                        //    evt.preventDefault();
                        //}
                    }
                    else if (data.step === 4) {
                        //savePatientPatientManagement();
                        $.when(savePatientPatientManagement()).then(function() {
                            setTimeout(function() {
                                window.location
                                    .href =
                                    '<%=ResolveClientUrl( "~/CCC/Patient/PatientHome.aspx")%>';
                            },
                                            2000);
                        });
                    }
                })
                    .on("changed.fu.wizard",
                        function () {

                        })
                    .on('stepclicked.fu.wizard',
                        function () {

                        })
                    .on('finished.fu.wizard',
                        function (e) {

                        });

        function savePatientEncounterPresentingComplaint() {
            var visitDate = $("#<%=VisitDate.ClientID%>").val();
            var visitScheduled = $("input[name$=Scheduled]:checked").val();
            
            var visitBy = $("#<%=ddlVisitBy.ClientID%>").find(":selected").val();
            var anyComplaints = $("input[name$=anyComplaints]:checked").val();
            var complaints = $("#<%=complaints.ClientID%>").val();
            var tbscreening = $("#<%=tbscreeningstatus.ClientID%>").find(":selected").val();
            var nutritionscreening = $("#<%=nutritionscreeningstatus.ClientID%>").find(":selected").val();
            
            /////////////////////////////////////////////////////
            if(anyComplaints == 1)
            {
                if ( ! presentingComplaintsTable.data().any() ) {
                    toastr.error("Presenting Complaints", "Presenting complaints missing.");
                    evt.preventDefault();
                }
            }
                
            ///////////////////////////////////////////////////////
            var rowCount = $('#dtlAdverseEvents tbody tr').length;
            var adverseEventsArray = new Array();
            try {
                for (var i = 0 ; i < rowCount; i++) {
                    adverseEventsArray[i] = {
                        "adverseSeverityID": advEventsTable.row(i).data()[0],
                        "adverseEvent": advEventsTable.row(i).data()[1],
                        "medicineCausingAE": advEventsTable.row(i).data()[2],
                        "adverseSeverity": advEventsTable.row(i).data()[3],
                        "adverseAction": advEventsTable.row(i).data()[4]
                    }
                }
            }
            catch (ex) {  }

            

            var rowCount = $('#dtlPresentingComplaints tbody tr').length;
            var presentingComplaintsArray = new Array();
            try {
                for (var i = 0 ; i < rowCount; i++) {
                    presentingComplaintsArray[i] = {
                        "presentingComplaintID": presentingComplaintsTable.row(i).data()[0],
                        "presentingComplaint": presentingComplaintsTable.row(i).data()[1],
                        "onsetDate": presentingComplaintsTable.row(i).data()[2]
                    }
                }
            }
            catch (ex) {  }

            
            $.ajax({
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/savePatientEncounterPresentingComplaints",
                data: "{'VisitDate':'" + visitDate + "','VisitScheduled':'" + visitScheduled + "','VisitBy':'" + visitBy + "','anyComplaints':'" + anyComplaints + "','Complaints':'" + complaints + "','TBScreening':'" + tbscreening + "','NutritionalStatus':'" + nutritionscreening + "','adverseEvent':'" + JSON.stringify(adverseEventsArray) + "','presentingComplaints':'" + JSON.stringify(presentingComplaintsArray) + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                            
                    console.log(response.d);
                    if (response.d > 0)
                               
                        toastr.success(response.d, "Presenting Complaints");
                    else
                           
                        toastr.error(response.d,"Error occured while saving Presenting Complaints");
                },
                error: function (response) {
                         
                    toastr.error(response.d, "Error occured while saving Presenting Complaints");
                }
            });
        }
       


        function savePatientEncounterChronicIllness() {
            var rowCount = $('#dtlChronicIllness tbody tr').length;
            var chronicIllnessArray = new Array();
            try {
                var active = 0;
                for (var i = 0 ; i < rowCount; i++) {

                    if ($('#chkChronic' + chronicTable.row(i).data()[0] + '').is(":checked"))
                        active = 1;
                    else
                        active = 0;
          
                    chronicIllnessArray[i] = {
                        "chronicIllnessID": chronicTable.row(i).data()[0],
                        "chronicIllness": chronicTable.row(i).data()[1],
                        "treatment": chronicTable.row(i).data()[2],
                        "dose": chronicTable.row(i).data()[3],
                        "OnsetDate": chronicTable.row(i).data()[4],
                        "Active": active
                        //"Active": chronicTable.row(i).checkboxes.selected()[5]
                    }
                }
            }
            catch (ex) { }
            ///////////////////////////////////////////
            //var chronicIllnessTable = new Array();
            //$("#dtlChronicIllness tr").each(function (row, tr) {
            //    chronicIllnessTable[row] = {
            //        "chronicIllness": $(tr).find('td:eq(0)').text(),
            //        "treatment": $(tr).find('td:eq(1)').text(),
            //        "dose": $(tr).find('td:eq(2)').text(),
            //        "duration": $(tr).find('td:eq(3)').text()
            //    }
            //});
            ///////////////////////////////////////////////////////
            var rowCount = $('#dtlAllergy tbody tr').length;
            var AllergyArray = new Array();
            try {
                for (var i = 0 ; i < rowCount; i++) {
                    AllergyArray[i] = {
                        "allergyID": allergyTable.row(i).data()[0],
                        "reactionID": allergyTable.row(i).data()[1],
                        "severityID": allergyTable.row(i).data()[2],
                        "allergy": allergyTable.row(i).data()[3],
                        "reaction": allergyTable.row(i).data()[4],
                        "severity": allergyTable.row(i).data()[5],
                        "onsetDate": allergyTable.row(i).data()[6]
                    }
                }
            }
            catch (ex) { }
            ///////////////////////////////////////////////////////
            var rowCount = $('#dtlVaccines tbody tr').length;
            var vaccineArray = new Array();
            try {
                for (var i = 0 ; i < rowCount; i++) {
                    vaccineArray[i] = {
                        "vaccineID": vaccineTable.row(i).data()[0],
                        "vaccineStageID": vaccineTable.row(i).data()[1],
                        "vaccine": vaccineTable.row(i).data()[2],
                        "vaccineStage": vaccineTable.row(i).data()[3],
                        "vaccineDate": vaccineTable.row(i).data()[4],

                    }
                }
            }
            catch (ex) { }
               

            $.ajax({
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/savePatientEncounterChronicIllness",
                data: "{'chronicIllness':'" + JSON.stringify(chronicIllnessArray) + "','vaccines':'" + JSON.stringify(vaccineArray) + "','allergies':'" + JSON.stringify(AllergyArray) + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    toastr.success(response.d, "Chronic Illness");
                },
                error: function (response) {
                    toastr.error(response.d, "Chronic Illness Error");
                }
            });
        }

        function savePatientPhysicalExams() {
            var rowCount = $('#dtlPhysicalExam tbody tr').length;
            var generalExamination = getCheckBoxListItemsChecked('<%= cblGeneralExamination.ClientID %>');
            if(generalExamination == "")
            {
                toastr.error(generalExamination, "Please check at least one General Examination.");
                evt.preventDefault();
                return false;
            }
            var physicalExamArray = new Array();
            try {
                for (var i = 0 ; i < rowCount; i++) {
                    physicalExamArray[i] = {
                        "examTypeID": examTable.row(i).data()[0],
                        "examID": examTable.row(i).data()[1],
                        "examType": examTable.row(i).data()[2],
                        "exam": examTable.row(i).data()[3],
                        "findings": examTable.row(i).data()[4],

                    }
                }
            }
            catch (ex) { }

            $.ajax({
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/savePatientPhysicalExam",
                data: "{'physicalExam':'" + JSON.stringify(physicalExamArray) + "','generalExam':'" + generalExamination + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    toastr.success(response.d, "Physical Exam");
                },
                error: function (response) {
                    toastr.error(response.d, "Physical Exam Error");
                }
            });
        }


        function savePatientPatientManagement() {
            var workPlan =  $("#<%=txtWorkPlan.ClientID%>").val();
            var phdp = getCheckBoxListItemsChecked('<%= cblPHDP.ClientID %>');
            var arvAdherence = $("#<%=arvAdherance.ClientID%>").find(":selected").val();
            var ctxAdherence = $("#<%=ctxAdherance.ClientID%>").find(":selected").val();

            var rowCount = $('#dtlDiagnosis tbody tr').length;
            var diagnosisArray = new Array();
            try {
                for (var i = 0 ; i < rowCount; i++) {
                    diagnosisArray[i] = {
                        "diagnosis": diagnosisTable.row(i).data()[0],
                        "treatment": diagnosisTable.row(i).data()[2]
                    }
                }
            }
            catch (ex) { }
                
            $.ajax({
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/savePatientManagement",
                data: "{'workplan':'" + workPlan + "','phdp':'" + phdp + "','ARVAdherence':'" + arvAdherence + "','CTXAdherence':'" + ctxAdherence + "','diagnosis':'" + JSON.stringify(diagnosisArray) + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    toastr.success(response.d, "Patient Management");
                },
                error: function (response) {
                    toastr.error(response.d, "Patient Management Error");
                }
            });
        }

        function addPatientIcf() {
            var cough = $("#<%=cough.ClientID%>").val();
            var weightLoss = $("#<%=weightLoss.ClientID%>").val();
            var nightSweats = $("#<%=nightSweats.ClientID%>").val();
            var fever = $("#<%=fever.ClientID%>").val();
            var onIpt = $("#<%=onIpt.ClientID%>").val();
            var onAntiTbDrugs = $("#<%=tbInfected.ClientID%>").val();
            var patientId = <%=PatientId%>;
            var patientMasterVisitId = <%=PatientMasterVisitId%>;
            debugger;
            $.ajax({
                type: "POST",
                url: "../WebService/PatientTbService.asmx/AddPatientIcf",
                data: "{'patientId': '" + patientId + "','patientMasterVisitId': '" + patientMasterVisitId + "','cough': '" + cough + "','fever': '" + fever + "','nightSweats': '" + nightSweats + "','weightLoss': '" + weightLoss + "','onAntiTbDrugs': '" + onAntiTbDrugs + "','onIpt': '" + onIpt +"'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    toastr.success(response.d, "Patient ICF saved successfully");
                },
                error: function (response) {
                    toastr.error(response.d, "Patient ICF not saved");
                }
            });
        }

        function addPatientIcfAction() {
            var chestXray = $("#<%=chest.ClientID%>").val();
            var sputumSmear = $("#<%=sputum.ClientID%>").val();
            var invitationOfContacts = $("#<%=contactsInvitation.ClientID%>").val();
            var evaluatedForIpt = $("#<%=iptEvaluation.ClientID%>").val();
            var startAntiTb = $("#<%=antiTb.ClientID%>").val();
            var patientId = <%=PatientId%>;
            var patientMasterVisitId = <%=PatientMasterVisitId%>;
            $.ajax({
                type: "POST",
                url: "../WebService/PatientTbService.asmx/AddPatientIcfAction",
                data: "{'patientId': '" + patientId + "','patientMasterVisitId': '" + patientMasterVisitId + "','chestXray': '" + chestXray + "','evaluatedForIpt': '" + evaluatedForIpt + "','invitationOfContacts': '" + invitationOfContacts + "','sputumSmear': '" + sputumSmear +  "','startAntiTb': '" + startAntiTb + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    toastr.success(response.d, "Patient ICF Action saved successfully");
                },
                error: function (response) {
                    toastr.error(response.d, "Patient ICF Action not saved");
                }
            });
        }

        function addIpt() {
            var weight = $("#weight").val();
            if (weight === '') { weight = 0 }
            var hepatotoxicity = $("#hepatotoxicity").val();
            var iptDateCollected = moment($("#IptDateCollected").val()).format('DD-MMM-YYYY');
            var iptDueDate = moment($("#iptDuedate").val()).format('DD-MMM-YYYY');
            var peripheralneoropathy = $("#peripheralNeoropathy").val();
            var rash = $("#rash").val();
            var adheranceMeasurement = $("#adheranceMeasurement").val();
            var hepatotoxicityAction = $("#hepatotoxicityAction").val();
            var peripheralneoropathyAction = $("#peripheralAction").val();
            var rashAction = $("#rashAction").val();
            var adheranceMeasurementAction = $("#adheranceAction").val();
            var patientId = <%=PatientId%>;
            var patientMasterVisitId = <%=PatientMasterVisitId%>;
            debugger;
            $.ajax({
                type: "POST",
                url: "../WebService/PatientTbService.asmx/AddIpt",
                data: "{'patientId': '" + patientId + "','patientMasterVisitId': '" + patientMasterVisitId + "','weight': '" + weight + "','iptDueDate': '" + iptDueDate + "','iptDateCollected': '" + iptDateCollected + "','hepatotoxicity': '" + hepatotoxicity +  "','peripheralneoropathy': '" + peripheralneoropathy + "','rash': '" + rash + "','adheranceMeasurement': '" + adheranceMeasurement + "','hepatotoxicityAction': '" + hepatotoxicityAction + "','peripheralneoropathyAction': '" + peripheralneoropathyAction + "','rashAction': '" + rashAction + "','adheranceMeasurementAction': '" + adheranceMeasurementAction +"'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    toastr.success(response.d, "Patient IPT saved successfully");
                },
                error: function (response) {
                    toastr.error(response.d, "Patient IPT not saved");
                }
            });
        }

        function addPatientIptWorkup() {
            var abdominalTenderness = $("#abdominalTenderness").val();
            var yellownessOfEyes = $("#yellowEyes").val();
            var yellowColouredUrine = $("#urineColour").val();
            var numbness = $("#numbness").val();
            var liverFunctionTests = $("#liverTest").val();
            var patientId = <%=PatientId%>;
            var patientMasterVisitId = <%=PatientMasterVisitId%>;
            $.ajax({
                type: "POST",
                url: "../WebService/PatientTbService.asmx/AddPatientIptWorkup",
                data: "{'patientId': '" + patientId + "','patientMasterVisitId': '" + patientMasterVisitId + "','abdominalTenderness': '" + abdominalTenderness + "','numbness': '" + numbness + "','yellowColouredUrine': '" + yellowColouredUrine + "','yellownessOfEyes': '" + yellownessOfEyes +  "','liverFunctionTests': '" + liverFunctionTests +  "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    toastr.success(response.d, "Patient IPT Workup saved successfully");
                },
                error: function (response) {
                    toastr.error(response.d, "Patient IPT Workup not saved");
                }
            });
        }

        function addPatientIptOutcome() {
            var iptEvent = $("#iptEvent").val();
            var reasonForDiscontinuation = $("#discontinuation").val();
            var patientId = <%=PatientId%>;
            var patientMasterVisitId = <%=PatientMasterVisitId%>;
            $.ajax({
                type: "POST",
                url: "../WebService/PatientTbService.asmx/AddPatientIptOutcome",
                data: "{'patientId': '" + patientId + "','patientMasterVisitId': '" + patientMasterVisitId + "','iptEvent': '" + iptEvent + "','reasonForDiscontinuation': '" + reasonForDiscontinuation +  "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    toastr.success(response.d, "Patient IPT outcome saved successfully");
                },
                error: function (response) {
                    toastr.error(response.d, "Patient IPT outcome not saved");
                }
            });
        }

        function getCheckBoxListItemsChecked(elementId) {
            var elementRef = document.getElementById(elementId);
            var checkBoxArray = elementRef.getElementsByTagName('input');
            var checkedValues = '';

            for (var i = 0; i < checkBoxArray.length; i++) {
                var checkBoxRef = checkBoxArray[i];

                if (checkBoxRef.checked == true) {
                    var labelArray = checkBoxRef.parentNode.getElementsByTagName('label');

                    if (labelArray.length > 0) {
                        if (checkedValues.length > 0)
                            checkedValues += ',';

                        checkedValues += labelArray[0].innerHTML;
                    }
                }
            }
            return checkedValues;
        }

        $("#btnAdherenceAssessment").click(function() {

            var question1 = parseInt($("input[name='ctl00$IQCareContentPlaceHolder$ucPatientClinicalEncounter$Question1']:checked").val());
            var question2 = parseInt($("input[name='ctl00$IQCareContentPlaceHolder$ucPatientClinicalEncounter$Question2']:checked").val());
            var question3 = parseInt($("input[name='ctl00$IQCareContentPlaceHolder$ucPatientClinicalEncounter$Question3']:checked").val());
            var question4 = parseInt($("input[name='ctl00$IQCareContentPlaceHolder$ucPatientClinicalEncounter$Question4']:checked").val());

            $('.errorBlock1').hide();
            $('.errorBlock2').hide();
            $('.errorBlock3').hide();
            $('.errorBlock4').hide();

            if (isNaN(question1)) {
                $('.errorBlock1').show();
                return false;
            }

            if (isNaN(question2)) {
                $('.errorBlock2').show();
                return false;
            }

            if (isNaN(question3)) {
                $('.errorBlock3').show();
                return false;
            }

            if (isNaN(question4)) {
                $('.errorBlock4').show();
                return false;
            }

            $('.errorBlock1').hide();
            $('.errorBlock2').hide();
            $('.errorBlock3').hide();
            $('.errorBlock4').hide();

            /*
            console.log(question1);
            console.log(question2);
            console.log(question3);
            console.log(question4);
            */

            var adherenceScore = question1 + question2 + question3 + question4;

            //console.log(adherenceScore);

            $.ajax({
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/SavePatientAdherenceAssessment",
                data: "{'feelBetter': '" + question4 + "', 'carelessAboutMedicine': '" + question2 + "', 'feelWorse': '" + question3 + "', 'forgetMedicine': '" + question1 + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response.d);
                    var returnValue = JSON.parse(response.d);
                    toastr.success(returnValue[0], "Adherence Assessment");
                    $("#<%=arvAdherance.ClientID%>").val(returnValue[1]);
                    $("#<%=ctxAdherance.ClientID%>").val(returnValue[1]);
                    $('#adherenceAssessmentModal').modal('hide');
                },
                error: function (xhr, errorType, exception) {
                    var jsonError = jQuery.parseJSON(xhr.responseText);
                    toastr.error("" + xhr.status + "" + jsonError.Message + " " + jsonError.StackTrace + " " + jsonError.ExceptionType);
                    return false;
                }
            });
        });

        $('input[type=radio][name="ctl00$IQCareContentPlaceHolder$ucPatientClinicalEncounter$Question1"]').change(function() {
            calculateAdherenceScore();
        });

        $('input[type=radio][name="ctl00$IQCareContentPlaceHolder$ucPatientClinicalEncounter$Question2"]').change(function() {
            calculateAdherenceScore();
        });

        $('input[type=radio][name="ctl00$IQCareContentPlaceHolder$ucPatientClinicalEncounter$Question3"]').change(function() {
            calculateAdherenceScore();
        });

        $('input[type=radio][name="ctl00$IQCareContentPlaceHolder$ucPatientClinicalEncounter$Question4"]').change(function() {
            calculateAdherenceScore();
        });


        function calculateAdherenceScore() {
            var question1 = parseInt($("input[name='ctl00$IQCareContentPlaceHolder$ucPatientClinicalEncounter$Question1']:checked").val());
            var question2 = parseInt($("input[name='ctl00$IQCareContentPlaceHolder$ucPatientClinicalEncounter$Question2']:checked").val());
            var question3 = parseInt($("input[name='ctl00$IQCareContentPlaceHolder$ucPatientClinicalEncounter$Question3']:checked").val());
            var question4 = parseInt($("input[name='ctl00$IQCareContentPlaceHolder$ucPatientClinicalEncounter$Question4']:checked").val());

            var adherenceScore = 0;

            if (!isNaN(question1)) {
                adherenceScore = adherenceScore + question1;
            }

            if (!isNaN(question2)) {
                adherenceScore = adherenceScore + question2;
            }

            if (!isNaN(question3)) {
                adherenceScore = adherenceScore + question3;
            }

            if (!isNaN(question4)) {
                adherenceScore = adherenceScore + question4;
            }
            //var adherenceScore = question1 + question2 + question3 + question4;
            //console.log(adherenceScore);
            $("#<%=adherenceScore.ClientID%>").text(adherenceScore + "/4");
        }


        function getSelectedItemsList(elementId)
        {
            var x = document.getElementById(elementId);
            var selectedValues = '';
            for (var i = 0; i < x.options.length; i++) {
                if(x.options[i].selected){
                    selectedValues += x.options[i].value + ',';
                }
            }
            return selectedValues;
        }
    });

    function tbInfectedChange() {
        if ($("#tbInfected").val() === 'False') {
            $("#IptForm").show();
            $("#IcfForm").show();
            $("#tbscreeningstatus").val(35);
            $("#onIpt").prop("disabled",false);
        } else {
            $("#IptForm").hide(); 
            $("#IcfForm").hide();
            $("#IcfActionForm").hide();
            $("#tbscreeningstatus").val(37);
            $("#onIpt").prop("disabled",true);
            $("#onIpt").val("False");
        }
            
    }

    function onIptChange() {
        if ($("#onIpt").val() === 'False') {
            $("#btnAddIptWorkUp").prop("disabled",false);
            $("#btnAddIptOutcome").prop("disabled",true);
        } else {
            $("#btnAddIptWorkUp").prop("disabled",true);
            $("#btnAddIptOutcome").prop("disabled",false);
        }
            
    }

    function IcfChange() {
        if (($("#cough").val() === 'True')||($("#fever").val() === 'True')||($("#weightLoss").val() === 'True')||($("#nightSweats").val() === 'True')) {
            $("#IcfActionForm").show();
        } else {
            $("#IcfActionForm").hide();
            $("#tbscreeningstatus").val(35);
            $("#btnAddIptWorkUp").prop("disabled",false);
            $("#btnAddIpt").prop("disabled",false);
            $("#sputum").val("");
            $("#chest").val("");
            $("#antiTb").val("");
            $("#contactsInvitation").val("");
            $("#iptEvaluation").val("");

        }
    }

    function IcfActionChange() {
        if (($("#sputum").val() === 'True')||($("#chest").val() === 'True')||($("#antiTb").val() === 'True')||($("#contactsInvitation").val() === 'True')||($("#iptEvaluation").val() === 'True')) {
            $("#btnAddIptWorkUp").prop("disabled",true);
            $("#btnAddIpt").prop("disabled",true);
            $("#tbscreeningstatus option").filter(function() {return $(this).text() === 'PrTB';}).prop('selected', true);
        } else {
            $("#btnAddIptWorkUp").prop("disabled",false);
            $("#btnAddIpt").prop("disabled",false);
            $("#tbscreeningstatus option").filter(function() {return $(this).text() === 'NoTB';}).prop('selected', true);
        }
    }

    function IptWorkUp() {
        $("#IptClientWorkupForm").show();
        $("#IptDetailsForm").hide();
        $("#IptOutcomeDetailsForm").hide();
    }

    function Ipt() {
        $("#IptClientWorkupForm").hide();
        $("#IptDetailsForm").show();
        $("#IptOutcomeDetailsForm").hide();
    }

    function IptOutcome() {
        $("#IptOutcomeDetailsForm").show();
        $("#IptClientWorkupForm").hide();
        $("#IptDetailsForm").hide();
    }

    function loadPresentingComplaints() {      
        var pcInput = document.getElementById('<%= txtPresentingComplaints.ClientID %>');
        var awesomplete = new Awesomplete(pcInput, {
                   minChars: 1
               });
               
               document.getElementById('<%= txtPresentingComplaints.ClientID %>').addEventListener('awesomplete-selectcomplete',function(){
                   var result = this.value.split("~");
                   $("#<%=txtPresentingComplaintsID.ClientID%>").val(result[0]);
                   $("#<%=txtPresentingComplaints.ClientID%>").val(result[1]);
               });

        $.ajax({
            type: "POST",
            url: "../WebService/PatientEncounterService.asmx/GetPresentingComplaints",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
     
            success: function (data) {
                var serverData = data.d;
                var PCList = [];
                       
                for (var i = 0; i < serverData.length; i++) {
                    //drugList.push(serverData[i][1]);
                    PCList.push({ label: serverData[i][1], value: serverData[i][0] });
                }
                awesomplete.list = PCList;
            }
        });    
                
    }

    function loadAllergies() {      
        var pcInput = document.getElementById('<%= txtAllergy.ClientID %>');
        var awesomplete = new Awesomplete(pcInput, {
                   minChars: 1
               });
               
               document.getElementById('<%= txtAllergy.ClientID %>').addEventListener('awesomplete-selectcomplete',function(){
                   var result = this.value.split("~");
                   $("#<%=txtAllergyId.ClientID%>").val(result[0]);
                   $("#<%=txtAllergy.ClientID%>").val(result[1]);
               });

        $.ajax({
            type: "POST",
            url: "../WebService/PatientEncounterService.asmx/loadAllergies",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
     
            success: function (data) {
                var serverData = data.d;
                var PCList = [];
                       
                for (var i = 0; i < serverData.length; i++) {
                    //drugList.push(serverData[i][1]);
                    PCList.push({ label: serverData[i][1], value: serverData[i][0] });
                }
                awesomplete.list = PCList;
            }
        });    
                
    }

    function loadAllergyReactions() {      
        var pcInput = document.getElementById('<%= txtReactionType.ClientID %>');
        var awesomplete = new Awesomplete(pcInput, {
                   minChars: 1
               });
               
               document.getElementById('<%= txtReactionType.ClientID %>').addEventListener('awesomplete-selectcomplete',function(){
                   var result = this.value.split("~");
                   $("#<%=txtReactionTypeID.ClientID%>").val(result[0]);
                   $("#<%=txtReactionType.ClientID%>").val(result[1]);
               });

        $.ajax({
            type: "POST",
            url: "../WebService/PatientEncounterService.asmx/loadAllergyReactions",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
     
            success: function (data) {
                var serverData = data.d;
                var PCList = [];
                       
                for (var i = 0; i < serverData.length; i++) {
                    //drugList.push(serverData[i][1]);
                    PCList.push({ label: serverData[i][1], value: serverData[i][0] });
                }
                awesomplete.list = PCList;
            }
        });    
                
    }

    function loadDiagnosis() {      
        var diagnosisInput = document.getElementById('<%= Diagnosis.ClientID %>');
        var awesomplete = new Awesomplete(diagnosisInput, {
                   minChars: 1
               });
               
               document.getElementById('<%= Diagnosis.ClientID %>').addEventListener('awesomplete-selectcomplete',function(){
                   var result = this.value.split("~");
                   $("#<%=txtDiagnosisID.ClientID%>").val(result[0]);
                   $("#<%=Diagnosis.ClientID%>").val(result[1]);
               });

        $.ajax({
            type: "POST",
            url: "../WebService/PatientEncounterService.asmx/loadDiagnosis",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
     
            success: function (data) {
                var serverData = data.d;
                var DiagnosisList = [];
                       
                for (var i = 0; i < serverData.length; i++) {
                    //drugList.push(serverData[i][1]);
                    DiagnosisList.push({ label: serverData[i][1], value: serverData[i][0] });
                }
                awesomplete.list = DiagnosisList;
            }
        });    
                
    }

    function loadSystemReviews() {
        var systemReviewName = $('#ddlExaminationType').find(":selected").text();

        $.ajax({
            type: "POST",
            url: "../WebService/LookupService.asmx/GetLookUpItemViewByMasterName",
            data: "{'masterName': '" + systemReviewName + "'}",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
     
            success: function (data) {
                var serverData = data.d;
                var obj = $.parseJSON(serverData);
                
                $("#<%=ddlExamination.ClientID%>").find('option').remove().end();
			    $("#<%=ddlExamination.ClientID%>").append('<option value="0">Select</option>');
                for (var i = 0; i < obj.length; i++) {
                    $("#<%=ddlExamination.ClientID%>").append('<option value="' + obj[i]["ItemId"] + '">' + obj[i]["DisplayName"] + '</option>');
                }
            }
        });         
    }

    function showHidePresentingComplaintsDivs() { 
        var anyComplaints = $("input[name$=anyComplaints]:checked").val();
        if(anyComplaints == 1)
        {
            document.getElementById('presentingComplaintsCtrls').style.display = 'block';
            document.getElementById('presentingComplaintsTable').style.display = 'block';
            document.getElementById('presentingComplaintsNotes').style.display = 'block';
        }
        else{
            document.getElementById('presentingComplaintsCtrls').style.display = 'none';
            document.getElementById('presentingComplaintsTable').style.display = 'none';
            document.getElementById('presentingComplaintsNotes').style.display = 'none';
        }
    }

    function showHideVisitByTS() { 
        var visitByTS = $('#ddlVisitBy').find(":selected").text();

        if(visitByTS == "Treatment Supporter")
        {
            document.getElementById('divTreatmentSupporter').style.display = 'block';
            document.getElementById('step1Div').style.display = 'none';
            document.getElementById('prevNextButton').style.display = 'none';
        }
        else{
            document.getElementById('divTreatmentSupporter').style.display = 'none';
            document.getElementById('step1Div').style.display = 'block';
            document.getElementById('prevNextButton').style.display = 'block';
        }
    }

    function savePatientEncounterTS() {
            var visitDate = $("#<%=VisitDate.ClientID%>").val();
            var visitScheduled = $("input[name$=Scheduled]:checked").val();
            var visitBy = $("#<%=ddlVisitBy.ClientID%>").find(":selected").val();
        
            $.ajax({
                type: "POST",
                url: "../WebService/PatientEncounterService.asmx/savePatientEncounterTS",
                data: "{'VisitDate':'" + visitDate + "','VisitScheduled':'" + visitScheduled + "','VisitBy':'" + visitBy + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                            
                    console.log(response.d);
                    if (response.d > 0)
                               
                        toastr.success(response.d, "Presenting Complaints");
                    else
                           
                        toastr.error(response.d,"Error occured while saving Presenting Complaints");
                },
                error: function (response) {
                         
                    toastr.error(response.d, "Error occured while saving Presenting Complaints");
                }
            });
    }


    function presentingComplaintsDateChange() {
        var pcDate = $("#<%=txtPCOnsetDate.ClientID%>").val();
        if (moment('' + pcDate + '').isAfter()) {
            toastr.error("Presenting complaints date cannot be a future date.");
            $("#<%=txtPCOnsetDate.ClientID%>").val("");
            return false;
        }
    }
</script>
