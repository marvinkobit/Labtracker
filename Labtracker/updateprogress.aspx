<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateprogress.aspx.cs" Inherits="Labtracker.updateprogress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>TBGEN Lab Monitor</title>

    <!-- Custom fonts for this template-->
    <link href="Content/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <%--<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> --%>

    <!-- Custom styles for this template-->
    <link href="Content/css/sb-admin-2.min.css" rel="stylesheet">
  
</head>
<body class="bg-gradient-secondary">



    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">

                    <!--<div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->
                    <div class="col-lg-12">

                        <div class="p-5">
                             <form id="form1" runat="server">
                            <asp:LinkButton class="rounded-circle button-back button-back-hover" id="goBack" runat="server" OnClick="btnGoback_Click">
                                <i class="arrow-back"></i>
                            </asp:LinkButton>

                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">TBGEN Lab Monitor</h1>
                                <h2 class="h4 text-gray-900 mb-4">Result & Progress</h2>
                            </div>
                           

                                <asp:ScriptManager ID="SMUpdateResult" runat="server"></asp:ScriptManager>

                                <asp:UpdatePanel ID="UPUpdateRes" runat="server">
                                    <ContentTemplate>
                                        <div class=" row col-sm-6 mb-3 mb-sm-0">
                                            <asp:TextBox type="Text" class="form-control form-control-user col-sm-6" runat="server" ID="txtSampleIdUpdate" placeholder="Patient Id">

                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvtxtID" runat="server" Text="** Patient ID required." ControlToValidate="txtSampleIdUpdate" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <%-- <asp:Button ID="btnGo"  class="btn btn-primary btn-user btn-block col-sm-2" runat="server" Text=">"  /> --%>
                                        </div>
                                        <br />
                                        <!--  
            <a href="" class="" style="visibility:hidden" >
                  x information is updated yet for this sample.
                </a>
              -->

                                        <div class="form-group row ">
                                            <div id="rescol1" class="col-sm-6">
                                                <div class="col-sm-12 mb-3 mb-sm-0 col-lg-12">
                                                    <asp:DropDownList ID="DDLResType" class="form-control" runat="server" ToolTip="Choose Result Type" AutoPostBack="true" onchange="ToggleVisible();ToogleResval(); return false;" on>

                                                        <asp:ListItem Selected hidden>Choose Result Type</asp:ListItem>
                                                        <asp:ListItem Value="1" data-group="1">Primary Smear</asp:ListItem>
                                                        <asp:ListItem Value="2" data-group="2">LJ-G</asp:ListItem>
                                                          <asp:ListItem Value="16" data-group="16">LJ-P</asp:ListItem>
                                                        <asp:ListItem Value="3" data-group="3">MGIT</asp:ListItem>
                                                        <asp:ListItem Value="4" data-group="4">RD9</asp:ListItem>

                                                        <asp:ListItem Value="6" data-group="6">Spoligo</asp:ListItem>
                                                        <asp:ListItem Value="7" data-group="7">DST</asp:ListItem>
                                                        <asp:ListItem Value="8" data-group="8">Culture Smear</asp:ListItem>

                                                        <%--<asp:ListItem Value="9" data-group="9">Heat Killed</asp:ListItem>--%>

                                                        <asp:ListItem Value="14" data-group="14">Heat Killing</asp:ListItem>
                                                        <asp:ListItem Value="10" data-group="10">Growth Detection</asp:ListItem>
                                                        <asp:ListItem Value="11" data-group="11">Growth Detection Weekly</asp:ListItem>
                                                        <asp:ListItem Value="12" data-group="12">Final Culture Result</asp:ListItem>
                                                        <asp:ListItem Value="13" data-group="13">BHI</asp:ListItem>


                                                        <asp:ListItem Value="5" data-group="5">DNA Extraction</asp:ListItem>
                                                        <asp:ListItem Value="15" data-group="15">Library Prep</asp:ListItem>


                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*Result type required." ControlToValidate="DDLResType" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                                <br />

                                                <div id="DRESVAL" class="col-sm-6 mb-3 mb-sm-0 col-lg-12">
                                                    <asp:DropDownList ID="DDLRESVAL" class="form-control" runat="server" ToolTip="Choose Result" onchange="ToogleDstval(); return false;">

                                                        <asp:ListItem Value="0" Selected hidden>Choose Result</asp:ListItem>
                                                        <asp:ListItem Value="1" data-group="1">1+</asp:ListItem>
                                                        <asp:ListItem Value="2" data-group="1">2+</asp:ListItem>
                                                        <asp:ListItem Value="3" data-group="1">3+</asp:ListItem>
                                                        <asp:ListItem Value="4" data-group="1">Scanty</asp:ListItem>
                                                        <asp:ListItem Value="5" data-group="1">Pos</asp:ListItem>
                                                        <asp:ListItem Value="6" data-group="1">Neg</asp:ListItem>

                                                        <asp:ListItem Value="5" data-group="2">Pos</asp:ListItem>
                                                        <asp:ListItem Value="6" data-group="2">Neg</asp:ListItem>
                                                        <asp:ListItem Value="7" data-group="2">Contaminated</asp:ListItem>
                                                        <asp:ListItem Value="8" data-group="2">Not Done</asp:ListItem>

                                                         <asp:ListItem Value="38" data-group="16">Pos</asp:ListItem>
                                                        <asp:ListItem Value="39" data-group="16">Neg</asp:ListItem>
                                                        <asp:ListItem Value="40" data-group="16">Contaminated</asp:ListItem>
                                                        <asp:ListItem Value="41" data-group="16">Not Done</asp:ListItem>

                                                        <asp:ListItem Value="9" data-group="3">Pos</asp:ListItem>
                                                        <asp:ListItem Value="10" data-group="3">Neg</asp:ListItem>
                                                        <asp:ListItem Value="11" data-group="3">Contaminated</asp:ListItem>
                                                        <asp:ListItem Value="12" data-group="3">Not Done</asp:ListItem>

                                                        <asp:ListItem Value="13" data-group="4">MTBC</asp:ListItem>
                                                        <asp:ListItem Value="14" data-group="4">NTM</asp:ListItem>
                                                        <asp:ListItem Value="14" data-group="4">MBOV</asp:ListItem>

                                                        <asp:ListItem Value="15" data-group="5">Good for library Prep</asp:ListItem>
                                                        <asp:ListItem Value="16" data-group="5">Failed-Repeat Extraction</asp:ListItem>
                                                        <asp:ListItem Value="17" data-group="5">Failed-Discard</asp:ListItem>

                                                        <asp:ListItem Value="18" data-group="7">First Line</asp:ListItem>
                                                        <asp:ListItem Value="19" data-group="7">Second Line</asp:ListItem>

                                                        <asp:ListItem Value="20" data-group="8">Pos</asp:ListItem>
                                                        <asp:ListItem Value="21" data-group="8">Neg</asp:ListItem>

                                                        <%--  <asp:ListItem Value="22" data-group="9">Yes</asp:ListItem>
                                                        <asp:ListItem Value="23" data-group="9">No</asp:ListItem>--%>

                                                        <asp:ListItem Value="24" data-group="10">Week 1</asp:ListItem>
                                                        <asp:ListItem Value="25" data-group="10">Week 2</asp:ListItem>
                                                        <asp:ListItem Value="26" data-group="10">Week 3</asp:ListItem>
                                                        <asp:ListItem Value="27" data-group="10">Week 4</asp:ListItem>
                                                        <asp:ListItem Value="28" data-group="10">Week 5</asp:ListItem>
                                                        <asp:ListItem Value="29" data-group="10">Week 6</asp:ListItem>
                                                        <asp:ListItem Value="30" data-group="10">Week 7</asp:ListItem>
                                                        <asp:ListItem Value="31" data-group="10">Week 8</asp:ListItem>

                                                        <asp:ListItem Value="32" data-group="12">Pos</asp:ListItem>
                                                        <asp:ListItem Value="33" data-group="12">Neg</asp:ListItem>

                                                        <asp:ListItem Value="34" data-group="13">Pos</asp:ListItem>
                                                        <asp:ListItem Value="35" data-group="13">Neg</asp:ListItem>

                                                        <asp:ListItem Value="36" data-group="14">LJ</asp:ListItem>
                                                        <asp:ListItem Value="37" data-group="14">7H9</asp:ListItem>



                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="* Result required." ControlToValidate="DDLRESVAL" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                                <br />
                                                <div class="col-sm-6 col-lg-12">
                                                    <asp:TextBox ID="txtDateProcess" class="form-control " TextMode="Date" ToolTip="Date sample was processed" placeholder="Date Processed" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvDP" runat="server" Text="* Processing date required." ControlToValidate="txtDateProcess" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                                <br />
                                                <div class="col-sm-6 col-lg-12">
                                                    <asp:TextBox ID="txtLabTechPr" class="form-control " placeholder="Initial(Performed By)" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvLabTechPr" runat="server" Text="* Lab technician required." ControlToValidate="txtLabTechPr" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>

                                                <br />
                                                <div class="col-sm-6 col-lg-12">
                                                    <asp:TextBox ID="txtRemarks" class="form-control " placeholder="Remarks" runat="server"></asp:TextBox>
                                                </div>

                                                <br />
                                            </div>

                                            <div id="rescol2" class="col-sm-6 ">

                                                <div id="LibPrepDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12" style="display: none">

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Library Concentration</asp:Label>

                                                        <asp:TextBox ID="txtLibConc" class="form-control " placeholder="" runat="server"></asp:TextBox>
                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Average Size</asp:Label>

                                                        <asp:TextBox ID="txtAvgsize" class="form-control " placeholder="ng/ml" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Average Size Percent</asp:Label>

                                                        <asp:TextBox ID="txtAvgPerct" class="form-control " placeholder="%" runat="server"></asp:TextBox>

                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>IndexI5</asp:Label>

                                                        <asp:TextBox ID="txtIndexi5" class="form-control " placeholder="" runat="server"></asp:TextBox>

                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>IndexI7</asp:Label>

                                                        <asp:TextBox ID="txtIndexi7" class="form-control " placeholder="" runat="server"></asp:TextBox>

                                                    </div>

                                                </div>

                                                <div id="HeatKillingDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12" style="display: none">

                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Date of Transfer</asp:Label>
                                                        <br />
                                                        <asp:TextBox ID="txtDateTransfer" class="form-control " TextMode="Date" ToolTip="Date sample result was Report" placeholder="Report Date" runat="server"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:TextBox ID="txtInitialRecievedBy" class="form-control " placeholder="Initial(Recieved By)" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div id="GrowthDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12" style="display: none">
                                                    <asp:Label>Please enter Primary media here</asp:Label>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:DropDownList ID="ddlGrowthdetail" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="d" DataTextField="" runat="server">
                                                            <asp:ListItem Selected hidden>Primary Media</asp:ListItem>
                                                            <asp:ListItem Value="1">LJ-1</asp:ListItem>
                                                            <asp:ListItem Value="2">LJ-2</asp:ListItem>
                                                            <asp:ListItem Value="3">LJ-P</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <asp:Label>Please enter details here</asp:Label>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:DropDownList ID="ddlGrowth" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="" DataTextField="" runat="server">
                                                            <asp:ListItem Selected hidden>details</asp:ListItem>
                                                            <asp:ListItem Value="1">O</asp:ListItem>
                                                            <asp:ListItem Value="2">P</asp:ListItem>
                                                            <asp:ListItem Value="3">C</asp:ListItem>
                                                        </asp:DropDownList>

                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Report Date</asp:Label>
                                                        <asp:TextBox ID="txtRepDate" class="form-control " TextMode="Date" ToolTip="Date sample result was Report" placeholder="Report Date" runat="server"></asp:TextBox>
                                                    </div>

                                                </div>
                                                <div id="weeklyGrowthDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12" style="display: none">
                                                    <asp:Label>Primary Media</asp:Label>

                                                    <div class="col-sm-6  mb-3 mb-sm-0 col-lg-12">
                                                        <asp:DropDownList ID="ddlGrowthMedia" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="d" DataTextField="" runat="server">
                                                            <asp:ListItem Value="0" Selected hidden>Primary Media</asp:ListItem>
                                                            <asp:ListItem Value="1">LJ-1</asp:ListItem>
                                                            <asp:ListItem Value="2">LJ-2</asp:ListItem>
                                                            <asp:ListItem Value="3">LJ-P</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="** Primary Media Required." ControlToValidate="ddlGrowthMedia" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>

                                                    </div>


                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Week 1</asp:Label>
                                                        <asp:DropDownList ID="ddlWeek1" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="" DataTextField="" runat="server">
                                                            <asp:ListItem Value="0" Selected hidden>details</asp:ListItem>
                                                            <asp:ListItem Value="1">O</asp:ListItem>
                                                            <asp:ListItem Value="2">P</asp:ListItem>
                                                            <asp:ListItem Value="3">C</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Week 2</asp:Label>
                                                        <asp:DropDownList ID="ddlWeek2" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="" DataTextField="" runat="server">
                                                            <asp:ListItem Value="0" Selected hidden>details</asp:ListItem>
                                                            <asp:ListItem Value="1">O</asp:ListItem>
                                                            <asp:ListItem Value="2">P</asp:ListItem>
                                                            <asp:ListItem Value="3">C</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Week 3</asp:Label>
                                                        <asp:DropDownList ID="ddlWeek3" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="" DataTextField="" runat="server">
                                                            <asp:ListItem Value="0" Selected hidden>details</asp:ListItem>
                                                            <asp:ListItem Value="1">O</asp:ListItem>
                                                            <asp:ListItem Value="2">P</asp:ListItem>
                                                            <asp:ListItem Value="3">C</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Week 4</asp:Label>
                                                        <asp:DropDownList ID="ddlWeek4" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="" DataTextField="" runat="server">
                                                            <asp:ListItem Value="0" Selected hidden>details</asp:ListItem>
                                                            <asp:ListItem Value="1">O</asp:ListItem>
                                                            <asp:ListItem Value="2">P</asp:ListItem>
                                                            <asp:ListItem Value="3">C</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Week 5</asp:Label>
                                                        <asp:DropDownList ID="ddlWeek5" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="" DataTextField="" runat="server">
                                                            <asp:ListItem Value="0" Selected hidden>details</asp:ListItem>
                                                            <asp:ListItem Value="1">O</asp:ListItem>
                                                            <asp:ListItem Value="2">P</asp:ListItem>
                                                            <asp:ListItem Value="3">C</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Week 6</asp:Label>
                                                        <asp:DropDownList ID="ddlWeek6" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="" DataTextField="" runat="server">
                                                            <asp:ListItem Value="0" Selected hidden>details</asp:ListItem>
                                                            <asp:ListItem Value="1">O</asp:ListItem>
                                                            <asp:ListItem Value="2">P</asp:ListItem>
                                                            <asp:ListItem Value="3">C</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Week 7</asp:Label>
                                                        <asp:DropDownList ID="ddlWeek7" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="" DataTextField="" runat="server">
                                                            <asp:ListItem Value="0" Selected hidden>details</asp:ListItem>
                                                            <asp:ListItem Value="1">O</asp:ListItem>
                                                            <asp:ListItem Value="2">P</asp:ListItem>
                                                            <asp:ListItem Value="3">C</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Week 8</asp:Label>
                                                        <asp:DropDownList ID="ddlWeek8" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="" DataTextField="" runat="server">
                                                            <asp:ListItem Value="0" Selected hidden>details</asp:ListItem>
                                                            <asp:ListItem Value="1">O</asp:ListItem>
                                                            <asp:ListItem Value="2">P</asp:ListItem>
                                                            <asp:ListItem Value="3">C</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Label>Report Date</asp:Label>
                                                        <asp:TextBox ID="txtReportDate" class="form-control " TextMode="Date" ToolTip="Date sample result was Report" placeholder="Report Date" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div id="DSTDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12" style="display: none">
                                                    <asp:Label>Please enter details here</asp:Label>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:DropDownList ID="ddlDSTdetail1" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="d" DataTextField="" runat="server">
                                                            <asp:ListItem Selected hidden>Select DST type</asp:ListItem>
                                                            <asp:ListItem Value="1" data-group="18">STM</asp:ListItem>
                                                            <asp:ListItem Value="2" data-group="18">INH</asp:ListItem>
                                                            <asp:ListItem Value="3" data-group="18">RIF</asp:ListItem>
                                                            <asp:ListItem Value="4" data-group="18">EMB</asp:ListItem>
                                                            <asp:ListItem Value="5" data-group="18">PZA</asp:ListItem>
                                                            <asp:ListItem Value="6" data-group="19">OFX</asp:ListItem>
                                                            <asp:ListItem Value="7" data-group="19">LEV</asp:ListItem>
                                                            <asp:ListItem Value="8" data-group="19">MOX</asp:ListItem>
                                                            <asp:ListItem Value="9" data-group="19">CIP</asp:ListItem>
                                                            <asp:ListItem Value="10" data-group="19">KAN</asp:ListItem>
                                                            <asp:ListItem Value="11" data-group="19">AMK</asp:ListItem>
                                                            <asp:ListItem Value="12" data-group="19">CAP</asp:ListItem>
                                                            <asp:ListItem Value="13" data-group="19">ETH</asp:ListItem>
                                                            <asp:ListItem Value="14" data-group="19">PTH</asp:ListItem>
                                                            <asp:ListItem Value="15" data-group="19">CS</asp:ListItem>
                                                            <asp:ListItem Value="16" data-group="19">PAS</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <asp:Label>Please enter details here</asp:Label>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:DropDownList ID="ddlDSTdetail2" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="d" DataTextField="" runat="server">
                                                            <asp:ListItem Selected hidden>Select DST result</asp:ListItem>
                                                            <asp:ListItem Value="1">R</asp:ListItem>
                                                            <asp:ListItem Value="2">S</asp:ListItem>

                                                        </asp:DropDownList>
                                                    </div>
                                                    <!--<asp:TextBox ID="txtCountry" class="form-control form-control-user" placeholder="Country" runat="server"></asp:TextBox> -->
                                                </div>

                                                <div id="SpoDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12" style="display: none">
                                                    <asp:Label>Please enter Spoligo details here</asp:Label>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:TextBox ID="txtSpold" class="form-control " placeholder="SIT Number" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvspold" runat="server" Text="* Spoligo detail required." ControlToValidate="txtSpold" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>


                                                <div id="EXDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12" style="display: none">
                                                    <asp:Label>Please enter extraction details here</asp:Label>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:TextBox ID="txtNDcon" class="form-control " placeholder="ND Concentration(ng/ml)" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvndcon" runat="server" Text="* ND concentration required." ControlToValidate="txtNDcon" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <br />
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:TextBox ID="txtPurity" class="form-control " placeholder="Purity" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvpurity" runat="server" Text="* Purity amount required." ControlToValidate="txtPurity" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <br />
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:TextBox ID="txtQUcon" class="form-control " placeholder="Qubit Concentration" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvcucon" runat="server" Text="* Qubit concentration required." ControlToValidate="txtQUcon" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <br />
                                                    <%-- <div class="col-sm-6 col-lg-12">
                                                        <asp:Label runat="server" ID="Label1" Text="Agaros picture: " />
                                                        <asp:FileUpload ID="FileUploadControl" runat="server" />
                                                        <asp:Button runat="server" ID="agarospic" Text="Upload" />
                                                        <br />
                                                        <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
                                                    </div>--%>
                                                </div>
                                            </div>
                                        </div>


                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <div class="row">
                                    <asp:Button ID="btnSaveup" class="btn btn-primary btn-user btn-block col-sm-6" runat="server" Text="Update" OnClick="btnSaveup_Click" />
                                    <asp:Button ID="btnCancelup" class="btn btn-primary btn-user btn-block col-sm-6" runat="server" Text="Clear" OnClientClick="ToggleVisible();ToogleResval(); this.form.reset(); return false;" />
                                </div>
                                <br />
                                <asp:Label ID="asSavelbl" runat="server" Text=""></asp:Label>
                                <hr>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Bootstrap core JavaScript-->
        <script src="Content/vendor/jquery/jquery.min.js"></script>
        <script src="Content/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="Content/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="Content/js/sb-admin-2.min.js"></script>
        <script src="Scripts/jquery-3.3.1.js"></script>
        <script src="Scripts/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <script type="text/javascript">

            /*   function ToggleVisible(ddl) {
                   var divs = document.getElementById('DSmearRes');
                   var divl = document.getElementById('DLJRes');
                   var divm = document.getElementById('DMJRes');
                   var value = ddl.options[ddl.selectedIndex].value;
                   if (value == "Smear") {
                       divs.style.display = "block";
                       divl.style.display = "none";
                   }
                   else if (value == "LJ"){
                       divl.style.display = "block";
                       divs.style.display = "none";
                   }
               
                   else if (value == "MIJT") { 
                     divm.style.display = "block";
                 }
                 
                   else {
                     //div.style.display = "none";
                 }
               }*/
            function ToogleDstval() {
                // var divResval = document.getElementById('#DRESVAL');
                // divResval.style.display = "block";
                $variable = $("#ddlDSTdetail1").html();
                $("#ddlDSTdetail1").html($variable);
                var val = $("#DDLRESVAL").find(":selected").val();
                $("#ddlDSTdetail1 option").show();
                $("#ddlDSTdetail1 option[data-group!=" + val + "]").hide();

            }
            function ToogleResval() {
                // var divResval = document.getElementById('#DRESVAL');
                // divResval.style.display = "block";
                $variable = $("#DDLRESVAL").html();
                $("#DDLRESVAL").html($variable);
                var val = $("#DDLResType").find(":selected").val();
                $("#DDLRESVAL option").show();
                $("#DDLRESVAL option[data-group!=" + val + "]").hide();

            }

            function ToggleVisible() {

                var exdiv = document.getElementById('EXDetail');
                var spodiv = document.getElementById('SpoDetail');
                var dstdiv = document.getElementById('DSTDetail');
                var comsel = document.getElementById('DRESVAL');
                var grodiv = document.getElementById('GrowthDetail');
                var weekgrodiv = document.getElementById('weeklyGrowthDetail');
                var heatkilldiv = document.getElementById('HeatKillingDetail');
                var lipprepdiv = document.getElementById('LibPrepDetail');


                //var ddval2 = $("#").find(":selected").val();

                //var val = $("#DDLResType").find(":selected").val();
                var ddlval = $("#DDLResType").find(":selected").val();


                switch (ddlval) {
                    case "5":
                        exdiv.style.display = "block";
                        comsel.style.display = "block";
                        spodiv.style.display = "none";
                        dstdiv.style.display = "none";
                        grodiv.style.display = "none";
                        weekgrodiv.style.display = "none";
                        heatkilldiv.style.display = "none";
                        lipprepdiv.style.display = "none";
                        break;

                    case "6":
                        spodiv.style.display = "block";
                        comsel.style.display = "none";
                        exdiv.style.display = "none";
                        dstdiv.style.display = "none";
                        grodiv.style.display = "none";
                        weekgrodiv.style.display = "none";
                        heatkilldiv.style.display = "none";
                        lipprepdiv.style.display = "none";
                        break;
                    case "7":
                        dstdiv.style.display = "block";
                        comsel.style.display = "block";
                        spodiv.style.display = "none";
                        exdiv.style.display = "none";
                        grodiv.style.display = "none";
                        weekgrodiv.style.display = "none";
                        heatkilldiv.style.display = "none";
                        lipprepdiv.style.display = "none";
                        break;
                    case "10":
                        grodiv.style.display = "block";
                        comsel.style.display = "block";
                        exdiv.style.display = "none";
                        spodiv.style.display = "none";
                        dstdiv.style.display = "none";
                        weekgrodiv.style.display = "none";
                        heatkilldiv.style.display = "none";
                        lipprepdiv.style.display = "none";
                        break;
                    case "11":
                        weekgrodiv.style.display = "block";
                        comsel.style.display = "none";
                        exdiv.style.display = "none";
                        spodiv.style.display = "none";
                        dstdiv.style.display = "none";
                        grodiv.style.display = "none";
                        heatkilldiv.style.display = "none";
                        lipprepdiv.style.display = "none";
                        break;
                    case "14":
                        heatkilldiv.style.display = "block";
                        weekgrodiv.style.display = "none";
                        comsel.style.display = "block";
                        exdiv.style.display = "none";
                        spodiv.style.display = "none";
                        dstdiv.style.display = "none";
                        grodiv.style.display = "none";
                        lipprepdiv.style.display = "none";
                        break;
                    case "15":
                        lipprepdiv.style.display = "block";
                        heatkilldiv.style.display = "none";
                        weekgrodiv.style.display = "none";
                        comsel.style.display = "none";
                        exdiv.style.display = "none";
                        spodiv.style.display = "none";
                        dstdiv.style.display = "none";
                        grodiv.style.display = "none";
                        break;


                    default:
                        comsel.style.display = "block";
                        exdiv.style.display = "none";
                        spodiv.style.display = "none";
                        dstdiv.style.display = "none";
                        grodiv.style.display = "none";
                        weekgrodiv.style.display = "none";
                        heatkilldiv.style.display = "none";
                        lipprepdiv.style.display = "none";
                }



                //if (ddlval == "1") {
                //    smdiv.style.display = "block";
                //    exdiv.style.display = "none";                
                //}

                //else if (ddlval == "5") {
                //    smdiv.style.display = "none";
                //    exdiv.style.display = "block";
                //}

            }

        </script>
</body>
</html>
