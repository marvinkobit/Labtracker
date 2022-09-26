<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updatestorage.aspx.cs" Inherits="Labtracker.updatestorage" %>

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
      <style>
* {
  box-sizing: border-box;
}

body {
  font: 16px Arial;  
}

/*the container must be positioned relative:*/
.autocomplete {
  position: relative;
  display: inline-block;
}

input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
</style>
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
                                <asp:LinkButton class="rounded-circle button-back button-back-hover" ID="goBack" runat="server" OnClick="btnGoback_Click">
                                <i class="arrow-back"></i>
                                </asp:LinkButton>

                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">TBGEN Lab Monitor</h1>
                                    <h2 class="h4 text-gray-900 mb-4">Isolate/Aliquot Storage</h2>
                                </div>


                                <asp:ScriptManager ID="SMUpdateResult" runat="server"></asp:ScriptManager>

                                <asp:UpdatePanel ID="UPUpdateRes" runat="server">
                                    <ContentTemplate>
                                        <div class=" row col-sm-6 mb-3 mb-sm-0">
                                            <asp:TextBox type="Text" class="form-control form-control-user col-sm-6" runat="server" ID="txtSampleIdUpdate" placeholder="Patient Id">

                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvtxtID" runat="server" Text="** Patient ID required." ControlToValidate="txtSampleIdUpdate" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <%-- <asp:Button ID="btnGo"  class="btn btn-primary btn-user btn-block col-sm-2" runat="server" Text=">"  /> --%>
                                            
                                            
                                         
                                            
                                            <%--<asp:RadioButton ID="Radio" Text=" Sputum " Checked="True" GroupName="RadioGroup2" runat="server" />
                                            <asp:RadioButton ID="Radio" Text=" Blood " Checked="False" GroupName="RadioGroup2" runat="server" />--%>

                                        </div>
                                        <div class=" row col-sm-6 mb-3 mb-sm-0">
                                         <asp:Label>Sample Type: </asp:Label>
                                          <asp:DropDownList ID="ddlSampleType" class="form-control" ToolTip="" DataTextField="" runat="server">
                                            <asp:ListItem Value="1" Selected="True">Culture</asp:ListItem>
                                            <asp:ListItem Value="2">B-PRNA</asp:ListItem>
                                            <asp:ListItem Value="3">B-PDNA</asp:ListItem>
                                            <asp:ListItem Value="4">B-Plasma</asp:ListItem>
                                              <asp:ListItem Value="5">HeatKilled</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <br />
                                        <!--  
            <a href="" class="" style="visibility:hidden" >
                  x information is updated yet for this sample.
                </a>
              -->

                                        <div class="form-group row ">
                                            <div id="rescol1" class="col-sm-6">
                                                <%--<div class="col-sm-12 mb-3 mb-sm-0 col-lg-12">
                                                    <asp:DropDownList ID="DDLResType" class="form-control" runat="server" ToolTip="Choose Result Type" AutoPostBack="true" onchange="ToggleVisible();ToogleResval(); return false;" on>

                                                        <asp:ListItem Selected hidden>Choose Storage Type</asp:ListItem>
                                                        <asp:ListItem Value="1" data-group="1"></asp:ListItem>
                                                        <asp:ListItem Value="2" data-group="2"></asp:ListItem>
                                                    


                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*Result type required." ControlToValidate="DDLResType" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                                <br />--%>

                                                <div id="DRESVAL" class="col-sm-6 mb-3 mb-sm-0 col-lg-12">
                                                    <asp:DropDownList ID="DDLRESVAL" class="form-control" runat="server" ToolTip="Choose Result" onchange="ToogleDstval(); return false;">

                                                        <asp:ListItem Value="0" Selected hidden>Choose Media</asp:ListItem>
                                                        <asp:ListItem Value="1" data-group="1">Glycerol</asp:ListItem>
                                                        <asp:ListItem Value="2" data-group="1">7H9</asp:ListItem>
                                                        <asp:ListItem Value="3" data-group="1">Skim Milk</asp:ListItem>
                                                       

                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="* Result required." ControlToValidate="DDLRESVAL" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                                <br />
                                                <div class="col-sm-6 col-lg-12">
                                                    <asp:TextBox ID="txtDateProcess" class="form-control" DataFormatString="dd/mm/yyyy" TextMode="Date" ToolTip="Date sample was processed" placeholder="Date Processed" runat="server"></asp:TextBox>     
                                                   <%-- <input class="form-control" asp-for="DateTime"  asp-format="{0:yyyy-MM-ddTHH:mm}" />--%>
                                                    <asp:RequiredFieldValidator ID="rfvDP" runat="server" Text="* Processing date required." ControlToValidate="txtDateProcess" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                                <br />


                                                <br />
                                                <div class="col-sm-6 col-lg-12">
                                                    <asp:TextBox ID="txtRemarks" class="form-control " placeholder="Remarks" runat="server"></asp:TextBox>
                                                </div>

                                                <br />
                                            </div>

                                            <div id="rescol2" class="col-sm-6 ">

                                                <div id="IsolateStorageDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12">
                                                    <div class="col-sm-6 col-lg-12">
                                                         <asp:Label>Freezer ID:</asp:Label>
                                                        <asp:DropDownList ID="ddlFreezer" DataSourceID="SqlDataSource4" class="form-control" runat="server" ToolTip="Choose Freezer"  DataTextField="Freezer_AHRIUniqueId" DataValueField="Freezer_AHRIUniqueId" >                               
                                                        </asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>" SelectCommand="SELECT * FROM [Labtracker].[dbo].[Freezers]"></asp:SqlDataSource>
                                                    </div>
                                                    <br />
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:TextBox ID="txtDrawer" class="form-control " placeholder="Drawer" runat="server"></asp:TextBox>
                                                         </div>
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:TextBox ID="txtStorageRack" class="form-control " placeholder="Rack" runat="server"></asp:TextBox>
                                                     </div>
                                                    <br />
                                                      <div class="col-sm-6 col-lg-12">
                                                        <asp:TextBox ID="txtShelf" class="form-control " placeholder="Shelf" runat="server"></asp:TextBox>
                                                     </div>
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:TextBox ID="txtStorageBox" class="form-control " placeholder="Box" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="* Box required." ControlToValidate="txtStorageBox" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <br />
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px; padding:2px; padding-left:10px;">
                                                            <tr> A
                                                                <td>
                                                                    <asp:RadioButton ID="Radio1" Text="1" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio2" Text="2" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio3" Text="3" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio4" Text="4" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio5" Text="5" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio6" Text="6" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio7" Text="7" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio8" Text="8" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio9" Text="9" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio10" Text="10" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </asp:Table>
                                                    </div>
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px; padding:2px; padding-left:10px;">
                                                            <tr> B                                                         
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio11" Text="1" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio12" Text="2" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio13" Text="3" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio14" Text="4" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio15" Text="5" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio16" Text="6" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio17" Text="7" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio18" Text="8" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio19" Text="9" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio20" Text="10" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </table>
                                                     </div>
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px; padding:2px; padding-left:10px;">
                                                            <tr>  C                                                        
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio21" Text="1" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio22" Text="2" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio23" Text="3" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio24" Text="4" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio25" Text="5" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio26" Text="6" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio27" Text="7" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio28" Text="8" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio29" Text="9" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio30" Text="10" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </table>
                                                    </div>

                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px; padding:2px; padding-left:10px;">
                                                            <tr>   D                                                       
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio31" Text="1" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio32" Text="2" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio33" Text="3" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio34" Text="4" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio35" Text="5" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio36" Text="6" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio37" Text="7" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio38" Text="8" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio39" Text="9" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio40" Text="10" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </table>
                                                    </div>

                                                      <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px; padding:2px; padding-left:10px;">
                                                            <tr>  E                                                        
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio41" Text="1" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio42" Text="2" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio43" Text="3" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio44" Text="4" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio45" Text="5" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio46" Text="6" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio47" Text="7" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio48" Text="8" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio49" Text="9" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio50" Text="10" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </table>
                                                    </div>

                                                      <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px; padding:2px; padding-left:10px;">
                                                            <tr>  F                                                        
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio51" Text="1" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio52" Text="2" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio53" Text="3" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio54" Text="4" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio55" Text="5" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio56" Text="6" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio57" Text="7" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio58" Text="8" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio59" Text="9" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio60" Text="10" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                      <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px; padding:2px; padding-left:10px;">
                                                            <tr>  G                                                       
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio61" Text="1" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio62" Text="2" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio63" Text="3" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio64" Text="4" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio65" Text="5" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio66" Text="6" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio67" Text="7" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio68" Text="8" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio69" Text="9" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio70" Text="10" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                      <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px; padding:2px; padding-left:10px;">
                                                            <tr>  H                                                        
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio71" Text="1" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio72" Text="2" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio73" Text="3" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio74" Text="4" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio75" Text="5" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio76" Text="6" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio77" Text="7" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio78" Text="8" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio79" Text="9" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio80" Text="10" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                      <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px; padding:2px; padding-left:10px;">
                                                            <tr>  I                                                        
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio81" Text="1" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio82" Text="2" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio83" Text="3" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio84" Text="4" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio85" Text="5" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio86" Text="6" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio87" Text="7" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio88" Text="8" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio89" Text="9" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio90" Text="10" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                      <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px; padding:2px; padding-left:10px;">
                                                            <tr>  J                                                        
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio91" Text="1" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio92" Text="2" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio93" Text="3" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio94" Text="4" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio95" Text="5" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio96" Text="6" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio97" Text="7" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio98" Text="8" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio99" Text="9" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio100" Text="10" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                     


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

            function autocomplete(inp, arr) {
                /*the autocomplete function takes two arguments,
                the text field element and an array of possible autocompleted values:*/
                var currentFocus;
                /*execute a function when someone writes in the text field:*/
                inp.addEventListener("input", function (e) {
                    var a, b, i, val = this.value;
                    /*close any already open lists of autocompleted values*/
                    closeAllLists();
                    if (!val) { return false; }
                    currentFocus = -1;
                    /*create a DIV element that will contain the items (values):*/
                    a = document.createElement("DIV");
                    a.setAttribute("id", this.id + "autocomplete-list");
                    a.setAttribute("class", "autocomplete-items");
                    /*append the DIV element as a child of the autocomplete container:*/
                    this.parentNode.appendChild(a);
                    /*for each item in the array...*/
                    for (i = 0; i < arr.length; i++) {
                        /*check if the item starts with the same letters as the text field value:*/
                        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                            /*create a DIV element for each matching element:*/
                            b = document.createElement("DIV");
                            /*make the matching letters bold:*/
                            b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                            b.innerHTML += arr[i].substr(val.length);
                            /*insert a input field that will hold the current array item's value:*/
                            b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                            /*execute a function when someone clicks on the item value (DIV element):*/
                            b.addEventListener("click", function (e) {
                                /*insert the value for the autocomplete text field:*/
                                inp.value = this.getElementsByTagName("input")[0].value;
                                /*close the list of autocompleted values,
                                (or any other open lists of autocompleted values:*/
                                closeAllLists();
                            });
                            a.appendChild(b);
                        }
                    }
                });
                /*execute a function presses a key on the keyboard:*/
                inp.addEventListener("keydown", function (e) {
                    var x = document.getElementById(this.id + "autocomplete-list");
                    if (x) x = x.getElementsByTagName("div");
                    if (e.keyCode == 40) {
                        /*If the arrow DOWN key is pressed,
                        increase the currentFocus variable:*/
                        currentFocus++;
                        /*and and make the current item more visible:*/
                        addActive(x);
                    } else if (e.keyCode == 38) { //up
                        /*If the arrow UP key is pressed,
                        decrease the currentFocus variable:*/
                        currentFocus--;
                        /*and and make the current item more visible:*/
                        addActive(x);
                    } else if (e.keyCode == 13) {
                        /*If the ENTER key is pressed, prevent the form from being submitted,*/
                        e.preventDefault();
                        if (currentFocus > -1) {
                            /*and simulate a click on the "active" item:*/
                            if (x) x[currentFocus].click();
                        }
                    }
                });
                function addActive(x) {
                    /*a function to classify an item as "active":*/
                    if (!x) return false;
                    /*start by removing the "active" class on all items:*/
                    removeActive(x);
                    if (currentFocus >= x.length) currentFocus = 0;
                    if (currentFocus < 0) currentFocus = (x.length - 1);
                    /*add class "autocomplete-active":*/
                    x[currentFocus].classList.add("autocomplete-active");
                }
                function removeActive(x) {
                    /*a function to remove the "active" class from all autocomplete items:*/
                    for (var i = 0; i < x.length; i++) {
                        x[i].classList.remove("autocomplete-active");
                    }
                }
                function closeAllLists(elmnt) {
                    /*close all autocomplete lists in the document,
                    except the one passed as an argument:*/
                    var x = document.getElementsByClassName("autocomplete-items");
                    for (var i = 0; i < x.length; i++) {
                        if (elmnt != x[i] && elmnt != inp) {
                            x[i].parentNode.removeChild(x[i]);
                        }
                    }
                }
                /*execute a function when someone clicks in the document:*/
                document.addEventListener("click", function (e) {
                    closeAllLists(e.target);
                });
            }

            /*An array containing all the country names in the world:*/
            var countries = ["ET-AA-AK-AK-HC-", "ET-AA-YE-Y12H-", "ET-AA-KK-W3-HC-", "ET-AA-KK-MK-HC-", "ET-AA-KK-KE-HC-", "ET-AM-BD-BD-AAH-", "ET-AM-NS-DB-DBH-", "ET-AM-NS-SR-SRHC-", "ET-AM-NW-WO-WOH-", "ET-AM-SW-DE-DEH-", "ET-BG-AS-AS-AH-", "ET-GA-AN-GA-GH-", "ET-OR-AR-SH-SH-", "ET-OR-ES-AD-AH-", "ET-OR-GU-AD-AH-", "ET-OR-JI-SGH-", "ET-OR-SWS-BE-TBH-", "ET-OR-WH-CH-CHH-", "ET-OR-WS-AM-AH-", "ET-SN-GG-AM-AH-", "ET-SN-GE-DL-DH-", "ET-SN-HA-HO-HH-", "ET-SN-HA-HA-HH-", "ET-SN-SI-HA-HH-", "ET-SN-SI-YE-YH-", "ET-SN-WO-SO-SH-", "ET-SN-WO-SO-SH-", "ET-SO-KD-KDH-", "ET-SO-GO-GH-", "ER-AN-HA-HHC-", "ER-AN-KE-KRH-", "ER-DE-AK-AKH-", "ER-DE-AQ-AQH-", "ER-DE-DK-DHO-", "ER-DE-ME-MZH-", "ER-DK-AS-ARH-", "ER-GB-BA-BMH-", "ER-GB-BA-BRH-", "ER-GB-MO-MHC-", "ER-GB-TE-THO-", "ER-GN-AG-AHO-", "ER-MA-AK-AHC-", "ER-MA-GO-GCH-", "ER-MA-HA-ZRH-", "ER-MA-HAZ-ZRH-", "ER-MA-KE-HRH-", "ER-MA-SE-SHC-", "ER-MA-TS-ORH-", "ER-SK-AF-AFH-", "ER-SK-GH-GHO-", "ER-SK-MA-MRH-"];
            /*initiate the autocomplete function on the "txtPId" element, and pass along the countries array as possible autocomplete values:*/
            autocomplete(document.getElementById("txtSampleIdUpdate"), countries);

        </script>
</body>
</html>

