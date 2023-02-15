<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addsampledynamic.aspx.cs" Inherits="Labtracker.addsampledynamic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>
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

  <title>TBGE Lab Monitor  - Register</title>

  <!-- Custom fonts for this template-->
  <link href="Content/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
  <%--<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">--%>

  <!-- Custom styles for this template-->
  <link href="Content/css/sb-admin-2.min.css" rel="stylesheet"/>
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
                 <form class="user" runat="server">
                 <asp:LinkButton class="rounded-circle button-back button-back-hover" id="goBacktosr" runat="server" OnClick="btnGoback_Click">
                                <i class="arrow-back"></i>
                 </asp:LinkButton>

              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">TBGEN Lab Monitor</h1>
                <h2 class="h4 text-gray-900 mb-4">Add new sample</h2>
              </div>
             
                <div class="form-group row">
                     <div class="col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox ID="txtSId" class="form-control " placeholder="Sample Id" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="* Sample Id required." ControlToValidate="txtSId" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                
                      <asp:Label>Sample Type: </asp:Label>
                      <asp:DropDownList ID="ddlSampleType" class="form-control" ToolTip="" DataTextField="" runat="server">
                        <asp:ListItem Value="1" Selected="True">Sputum</asp:ListItem>
                        <asp:ListItem Value="2">B-PRNA</asp:ListItem>
                        <asp:ListItem Value="3">B-PDNA</asp:ListItem>
                        <asp:ListItem Value="4">B-Plasma</asp:ListItem>
                        </asp:DropDownList>
                     <%-- <asp:RadioButton id="RadioSputum" Text=" Sputum " Checked="True" GroupName="RadioGroup1" runat="server" />
                      <asp:RadioButton id="RadioBlood" Text=" Blood " Checked="False" GroupName="RadioGroup1" runat="server" />--%>
                     <%-- <asp:TextBox ID="txtProject" class="form-control"  placeholder="TBGEN" runat="server"></asp:TextBox>--%>
               <%--   <asp:RequiredFieldValidator ID="rfvProject" runat="server" Text="* Project name required." ControlToValidate="txtProject" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>--%>



                  </div>
                    <br />
                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <asp:Label>Country</asp:Label>
                    <asp:DropDownList ID="ddlCountry" class="form-control" ToolTip="Country" DataTextField="" runat="server">
                        <asp:ListItem Selected="True">Ethiopia</asp:ListItem>
                        <asp:ListItem>Eritrea</asp:ListItem>
                        <asp:ListItem>Cameron</asp:ListItem>
                        <asp:ListItem>Sudan</asp:ListItem>
                        </asp:DropDownList>
                    <!--<asp:TextBox ID="txtCountry" class="form-control form-control-user" placeholder="Country" runat="server"></asp:TextBox> -->
                    
                  </div>
                     <div class="col-sm-6 mb-3 mb-sm-0">
                         <asp:Label>Patient Identification</asp:Label>
                             <asp:TextBox ID="txtPId" class="form-control " placeholder="Patient Id" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvPId" runat="server" Text="* Patient Id required." ControlToValidate="txtPId" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                  
                   </div>
                    <br />
                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <asp:Label>Card Number</asp:Label>
                    <asp:TextBox ID="txtCNo" class="form-control " placeholder="Card No" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvCardNo" runat="server" Text="* Card no required." ControlToValidate="txtCNo" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>

                   <div class="col-sm-6 mb-3 mb-sm-0">
                       <asp:Label>Sample Volume</asp:Label>
                    <asp:TextBox ID="txtVol" class="form-control " placeholder="Volume" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvVol" runat="server" Text="* Volume required." ControlToValidate="txtVol" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>

                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <asp:Label>Sample Quality</asp:Label>
                    <asp:TextBox ID="txtQly" class="form-control " placeholder="Quality Number" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvQly" runat="server" Text="* Quality required." ControlToValidate="txtQly" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>

                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <%--<asp:TextBox ID="txtRegion" class="form-control " placeholder="Region" runat="server"></asp:TextBox>--%>
                      <asp:Label>Region</asp:Label>
                       <asp:DropDownList ID="ddlRegion" class="form-control" DataSourceID="SqlDataSourceRegion" ToolTip="Region" DataTextField="Region"  AutoPostBack = "true" runat="server" onchange="ToogleZoneval(); return false;">
                        </asp:DropDownList>

                       <asp:SqlDataSource ID="SqlDataSourceRegion" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>" 
                      SelectCommand="SELECT Region FROM Sites"></asp:SqlDataSource>

                  <asp:RequiredFieldValidator ID="rfvRegion" runat="server" Text="* Region required." ControlToValidate="ddlRegion" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                    <div class="col-sm-6">
                    <%--<asp:TextBox ID="txtZone" class="form-control " placeholder="Zone" runat="server"></asp:TextBox>--%>
                        <asp:Label>Zone:</asp:Label>
                        <asp:DropDownList ID="ddlZone" DataSourceID="SqlDataSourceZone" DataTextField="Zone" class="form-control" runat="server" ToolTip="Choose ZONE"   >   
                        </asp:DropDownList>
                         <asp:SqlDataSource ID="SqlDataSourceZone" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>" 
                      SelectCommand="SELECT Zone FROM Sites"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfvZone" runat="server" Text="* Zone required." ControlToValidate="ddlZone" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                   </div>

                    <div class="col-sm-6 mb-3 mb-sm-0">
                   <%-- <asp:TextBox ID="txtWoreda" class="form-control" placeholder="Woreda" runat="server"></asp:TextBox>--%>
                        <asp:Label>Woreda</asp:Label>
                        <asp:DropDownList ID="ddlWoreda" class="form-control" ToolTip="Region" DataSourceID="SqlDataSourceWoreda" DataTextField="Woreda"  AutoPostBack = "true" runat="server" onchange="ToogleHealthFval(); return false;">
                            <asp:ListItem selected hidden>Choose Woreda</asp:ListItem>                         
                        </asp:DropDownList>
                         <asp:SqlDataSource ID="SqlDataSourceWoreda" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>" 
                      SelectCommand="SELECT Woreda FROM Sites"></asp:SqlDataSource>
                  <asp:RequiredFieldValidator ID="rfvWoreda" runat="server" Text="* Woreda required." ControlToValidate="ddlWoreda" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                  <div class="col-sm-6">
                    <%--<asp:TextBox ID="txtHealthF" class="form-control " placeholder="Health Facility" runat="server"></asp:TextBox>--%>
                      <asp:Label>Health Facility(Site)</asp:Label>
                      <asp:DropDownList ID="ddlHealthF" class="form-control" ToolTip="Health Facility" DataSourceID="SqlDataSourceHealthFacility" DataTextField="HealthFacility"  AutoPostBack = "true" runat="server">                             
                        </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSourceHealthFacility" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>" 
                      SelectCommand="SELECT HealthFacility FROM Sites"></asp:SqlDataSource>
                  <asp:RequiredFieldValidator ID="rfvHF" runat="server" Text="* Health Facility required." ControlToValidate="ddlHealthF" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                    <div class="col-sm-6">
                        <asp:Label>Collection Date</asp:Label>
                    <asp:TextBox ID="txtDateColl" class="form-control " TextMode="Date" ToolTip="Date sample was collected" placeholder="Date Collected" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDC" runat="server" Text="* Collection date required." ControlToValidate="txtDateColl" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                   </div>
                    <div class="col-sm-6">
                        <asp:Label>Recived Date</asp:Label>
                    <asp:TextBox ID="txtDateRec" class="form-control " TextMode="Date" ToolTip="Date sample was recived" placeholder="Date Recieved" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvDR" runat="server" Text="* Reciving date required." ControlToValidate="txtDateRec" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                     <div class="col-sm-6">
                         <asp:Label>Performed By</asp:Label>
                    <asp:TextBox ID="txtLabTech" class="form-control " placeholder="Initial" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvLabTech" runat="server" Text="* Lab technician required." ControlToValidate="txtLabTech" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                    <div class="col-sm-6">
<%--                   <asp:TextBox ID="txtFilepath" class="form-control " placeholder="File Path" runat="server"></asp:TextBox>--%>
                  </div>

                </div>
                  <!--
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="exampleInputEmail" placeholder="Zone">
                </div>
                <div class="form-group row">
                  
                </div> -->
               <div class="row">
               <asp:Button ID="btnSaveas"  class="btn btn-primary btn-user btn-block col-sm-6" runat="server" Text="Save" OnClick="btnSaveas_Click" /> 
               <asp:Button ID="btnCancelas"  class="btn btn-primary btn-user btn-block col-sm-6" runat="server" Text="Clear" OnClientClick="this.form.reset();return false;"  /> 
               </div>
                   <asp:Label ID="asSavelbl" runat="server" Text=""></asp:Label>
                  <hr/>
                  </form>
                </div>
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

    <script type="text/javascript">
        
        function ToogleZoneval() {
            // var divResval = document.getElementById('#DRESVAL');
            // divResval.style.display = "block";
            $variable = $("#ddlZone").html();
            $("#ddlZone").html($variable);
            var val = $("#ddlRegion").find(":selected").val();
            $("#ddlZone option").show();
            $("#ddlZone option[data-group!=" + val + "]").hide();

        }

        function ToogleHealthFval() {
            // var divResval = document.getElementById('#DRESVAL');
            // divResval.style.display = "block";
            $variable = $("#ddlHealthF").html();
            $("#ddlHealthF").html($variable);
            var val = $("#ddlWoreda").find(":selected").val();
            $("#ddlHealthF option").show();
            $("#ddlHealthF option[data-group!=" + val + "]").hide();

        }





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
        var countries = ["ET-AA-AK-AK-HC-", "ET-AA-YE-Y12H-", "ET-AA-KK-W3-HC-", "ET-AA-KK-MK-HC-", "ET-AA-KK-KE-HC-", "ET-AM-BD-BD-AAH-", "ET-AM-NS-DB-DBH-", "ET-AM-NS-SR-SRHC-", "ET-AM-NW-WO-WOH-", "ET-AM-SW-DE-DEH-", "ET-BG-AS-AS-AH-", "ET-GA-AN-GA-GH-", "ET-OR-AR-SH-SH-", "ET-OR-ES-AD-AH-", "ET-OR-GU-AT-ADH-", "ET-OR-JI-SGH-", "ET-OR-SWS-BE-TBH-", "ET-OR-WH-CH-CHH-", "ET-OR-WS-AM-AH-", "ET-SN-GG-AM-AH-", "ET-SN-GE-DL-DH-", "ET-SN-HA-HO-HH-", "ET-SN-HA-HA-HH-", "ET-SN-SI-HA-HH-", "ET-SN-SI-YE-YH-", "ET-SN-WO-SO-SH-", "ET-SN-BSH-MATH-", "ET-SO-KD-KDH-", "ET-SO-GO-GH-", "ER-AN-HA-HHC-", "ER-AN-KE-KRH-", "ER-DE-AK-AKH-", "ER-DE-AQ-AQH-", "ER-DE-DK-DHO-", "ER-DE-ME-MZH-", "ER-DK-AS-ARH-", "ER-GB-BA-BMH-", "ER-GB-BA-BRH-", "ER-GB-MO-MHC-", "ER-GB-TE-THO-", "ER-GN-AG-AHO-", "ER-MA-AK-AHC-", "ER-MA-GO-GCH-", "ER-MA-HA-ZRH-", "ER-MA-HAZ-ZRH-", "ER-MA-KE-HRH-", "ER-MA-SE-SHC-", "ER-MA-TS-ORH-", "ER-SK-AF-AFH-", "ER-SK-GH-GHO-", "ER-SK-MA-MRH-"];
        /*initiate the autocomplete function on the "txtPId" element, and pass along the countries array as possible autocomplete values:*/
        autocomplete(document.getElementById("txtPId"), countries);

    </script>
</body>
</html>

