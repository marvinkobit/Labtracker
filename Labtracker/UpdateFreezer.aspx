<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateFreezer.aspx.cs" Inherits="Labtracker.UpdateFreezer" %>

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
                                    <h2 class="h4 text-gray-900 mb-4">Storage Freezer</h2>
                                </div>


                                <asp:ScriptManager ID="SMUpdateResult" runat="server"></asp:ScriptManager>

                                <asp:UpdatePanel ID="UPUpdateRes" runat="server">
                                    <ContentTemplate>
                                        <div class="row col-sm-6 mb-3 mb-sm-0">
                                            <asp:TextBox type="Text" class="form-control form-control-user col-sm-6" runat="server" ID="txtAhriUniqueId" placeholder="AHRI Unique Id">

                                            </asp:TextBox>
                                            
                                            <asp:RequiredFieldValidator ID="rfvtxtID" runat="server" Text="** Patient ID required." ControlToValidate="txtAhriUniqueId" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                           

                                        </div>
                                        <br/>
                                         <div class="form-group row ">

                                             <div id="rescol1" class="col-sm-6">

                                        <div class=" col-sm-6 mb-3 mb-sm-0 col-lg-12">
                                         <asp:Label>Manufacturer Name </asp:Label>
                                          <asp:TextBox type="Text" class="form-control form-control-user" runat="server" ID="txtManufacturer" placeholder="">

                                            </asp:TextBox>
                                        </div>
                                        <br />

                                        <div class="col-sm-6 mb-3 mb-sm-0 col-lg-12">
                                         <asp:Label>Model </asp:Label>
                                          <asp:TextBox type="Text" class="form-control" runat="server" ID="txtModel" placeholder="">

                                            </asp:TextBox>
                                        </div>
                                        <br />
                                      

                                       
                                            
                                             
                                                <div id="DRESVAL" class="col-sm-6 mb-3 mb-sm-0 col-lg-12">
                                                    <asp:DropDownList ID="ddlEquipCond" class="form-control" runat="server" ToolTip="Choose Result" onchange="ToogleDstval(); return false;">
                                                    
                                                        <asp:ListItem Value="1" data-group="1">Functional</asp:ListItem>
                                                        <asp:ListItem Value="2" data-group="1">Not Functional</asp:ListItem>                                                       
                                                     </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="* Result required." ControlToValidate="ddlEquipCond" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                                <br />
                                                <div class="col-sm-6 col-lg-12">
                                                    <asp:Label>Calibration Date </asp:Label>
                                                    <asp:TextBox ID="txtDateCalibration" class="form-control" DataFormatString="dd/mm/yyyy" TextMode="Date" ToolTip="Date sample was processed" placeholder="Date Processed" runat="server"></asp:TextBox>     
                                                   <%-- <input class="form-control" asp-for="DateTime"  asp-format="{0:yyyy-MM-ddTHH:mm}" />--%>
                                                    <asp:RequiredFieldValidator ID="rfvDP" runat="server" Text="* Processing date required." ControlToValidate="txtDateCalibration" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>

                                                <div class="col-sm-6 col-lg-12">
                                                    <asp:Label>Next Calibration Date </asp:Label>
                                                    <asp:TextBox ID="txtDateCalibrationNext" class="form-control" DataFormatString="dd/mm/yyyy" TextMode="Date" ToolTip="Date sample was processed" placeholder="Date Processed" runat="server"></asp:TextBox>     
                                                   <%-- <input class="form-control" asp-for="DateTime"  asp-format="{0:yyyy-MM-ddTHH:mm}" />--%>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="* Processing date required." ControlToValidate="txtDateCalibrationNext" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                                <br />


                                                
                                                <div class="col-sm-6 col-lg-12">
                                                    <asp:TextBox ID="txtRemarks" class="form-control " placeholder="Remarks" runat="server"></asp:TextBox>
                                                </div>

                                                <br />
                                            </div>

                                            <div id="rescol2" class="col-sm-6 ">

                                                <div id="IsolateStorageDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12">
                                                    <div class="col-sm-6 col-lg-12">

                                                        <asp:Label>Current Location </asp:Label>
                                                        <asp:TextBox ID="txtCurrrentLocation" class="form-control " placeholder="" runat="server"></asp:TextBox>
                                                      
                                                    </div>
                                                    <br/>
                                                    <div class="col-sm-6 col-lg-12">

                                                        <asp:Label>Serial Number</asp:Label>
                                                        <asp:TextBox ID="txtSerialNumber" class="form-control " placeholder="" runat="server"></asp:TextBox>
                                                      
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

