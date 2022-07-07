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
                                            
                                            
                                         
                                            
                                            <%--<asp:RadioButton ID="RadioButton7" Text=" Sputum " Checked="True" GroupName="RadioGroup2" runat="server" />
                                            <asp:RadioButton ID="RadioButton8" Text=" Blood " Checked="False" GroupName="RadioGroup2" runat="server" />--%>

                                        </div>
                                        <div class=" row col-sm-6 mb-3 mb-sm-0">
                                         <asp:Label>Sample Type: </asp:Label>
                                          <asp:DropDownList ID="ddlSampleType" class="form-control" ToolTip="" DataTextField="" runat="server">
                                            <asp:ListItem Value="1" Selected="True">Culture</asp:ListItem>
                                            <asp:ListItem Value="2">B-PRNA</asp:ListItem>
                                            <asp:ListItem Value="3">B-PDNA</asp:ListItem>
                                            <asp:ListItem Value="4">B-Plasma</asp:ListItem>
                                              <asp:ListItem Value="2">HeatKilled</asp:ListItem>
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
                                                        <asp:ListItem Value="1" data-group="1">7H9</asp:ListItem>
                                                        <asp:ListItem Value="2" data-group="1">Skim Milk</asp:ListItem>
                                                        <asp:ListItem Value="3" data-group="1">Glycerol</asp:ListItem>

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
                                                        <asp:TextBox ID="txtFreezer" class="form-control " placeholder="Freezer" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="* Freezer required." ControlToValidate="txtStorageRack" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <br />
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:TextBox ID="txtStorageRack" class="form-control " placeholder="Rack" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvLabTechPr" runat="server" Text="* Rack required." ControlToValidate="txtStorageRack" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <br />
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:TextBox ID="txtStorageBox" class="form-control " placeholder="Box" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="* Box required." ControlToValidate="txtStorageBox" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <br />
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px;">
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio1" Text="01" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio2" Text="02" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio3" Text="03" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio4" Text="04" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio5" Text="05" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio6" Text="06" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio7" Text="07" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio8" Text="08" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio9" Text="09" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio10" Text="10" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </asp:Table>
                                                    </div>
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px;">
                                                            <tr>                                                          
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio11" Text="11" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio12" Text="12" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio13" Text="13" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio14" Text="14" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio15" Text="15" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio16" Text="16" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio17" Text="17" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio18" Text="18" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio19" Text="19" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio20" Text="20" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </table>
                                                     </div>
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px;">
                                                            <tr>                                                          
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio21" Text="21" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio22" Text="22" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio23" Text="23" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio24" Text="24" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio25" Text="25" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio26" Text="26" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio27" Text="27" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio28" Text="28" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio29" Text="29" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio30" Text="30" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="col-sm-6 col-lg-12">
                                                        <asp:Table Style="border: 1px solid black; border-radius: 10px;">
                                                            <tr>                                                          
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio31" Text="31" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio32" Text="32" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio33" Text="33" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio34" Text="34" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                 <td>
                                                                    <asp:RadioButton ID="Radio35" Text="35" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio36" Text="36" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio37" Text="37" Checked="True" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio38" Text="38" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio39" Text="39" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
                                                                <td>
                                                                    <asp:RadioButton ID="Radio40" Text="40" Checked="False" GroupName="RadioGroup1" runat="server" /></td>
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



</script>
</body>
</html>

