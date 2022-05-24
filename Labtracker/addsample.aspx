<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addsample.aspx.cs" Inherits="Labtracker.addsample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>

  <title>TBGE Lab Monitor  - Register</title>

  <!-- Custom fonts for this template-->
  <link href="Content/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

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
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">TBGEN Lab Monitor</h1>
                <h2 class="h4 text-gray-900 mb-4">Add new sample</h2>
              </div>
              <form class="user" runat="server">
                <div class="form-group row">
                     <div class="col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox ID="txtSId" class="form-control " placeholder="Sample Id" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="* Sample Id required." ControlToValidate="txtSId" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                
                      <asp:Label>Project</asp:Label>
                      <asp:TextBox ID="txtProject" class="form-control"  placeholder="TBGEN" runat="server"></asp:TextBox>
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
                       <asp:DropDownList ID="ddlRegion" class="form-control" ToolTip="Region" DataTextField="Choose Region"  AutoPostBack = "true" runat="server" onchange="ToogleZoneval(); return false;">
                     <%--   <asp:ListItem selected hidden>Choose Zone</asp:ListItem>--%>
                        <asp:ListItem selected hidden>Choose Region</asp:ListItem>
                        <asp:ListItem value="1" data-group="1">Addis Ababa</asp:ListItem>
                        <asp:ListItem  value="2" data-group="2">Afar</asp:ListItem>
                        <asp:ListItem  value="3" data-group="3">Amhara</asp:ListItem>
                        <asp:ListItem  value="4" data-group="4">Benishangul Gumuz</asp:ListItem>
                        <asp:ListItem value="5" data-group="5" >Dire Dawa</asp:ListItem>
                        <asp:ListItem Value="6" data-group="6">Gambella</asp:ListItem>
                        <asp:ListItem Value="7" data-group="7" >Harari</asp:ListItem>
                        <asp:ListItem Value="8" data-group="8">Oromia</asp:ListItem>
                        <asp:ListItem Value="9" data-group="9">SNNP</asp:ListItem>
                        <asp:ListItem Value="10" data-group="10">Somali</asp:ListItem>
                        <asp:ListItem Value="11" data-group="11">Tigray</asp:ListItem>
                        </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="rfvRegion" runat="server" Text="* Region required." ControlToValidate="ddlRegion" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                    <div class="col-sm-6">
                    <%--<asp:TextBox ID="txtZone" class="form-control " placeholder="Zone" runat="server"></asp:TextBox>--%>
                        <asp:Label>Zone</asp:Label>
                        <asp:DropDownList ID="ddlZone"  class="form-control" runat="server" ToolTip="Choose ZONE"   >
                            
                            <asp:ListItem selected hidden>Choose Zone</asp:ListItem>
                            <asp:ListItem Value="1" data-group="1">Addis Ketema</asp:ListItem>
                            <asp:ListItem Value="2" data-group="1">Akaky Kaliti</asp:ListItem>
                            <asp:ListItem Value="3" data-group="1">Arada</asp:ListItem>
                            <asp:ListItem Value="4" data-group="1">Bole</asp:ListItem>
                            <asp:ListItem Value="5" data-group="1">Gullele</asp:ListItem>
                            <asp:ListItem Value="6" data-group="1">Bole</asp:ListItem>
                            <asp:ListItem Value="7" data-group="1">Kirkos</asp:ListItem>
                            <asp:ListItem Value="8" data-group="1">Kolfe Keranio</asp:ListItem>
                             <asp:ListItem Value="9" data-group="1">Nifas Silk-Lafto</asp:ListItem>
                             <asp:ListItem Value="10" data-group="1">Lideta</asp:ListItem>
                             <asp:ListItem Value="11" data-group="1">Yeka</asp:ListItem>
                    
                           

                             <asp:ListItem Value="12" data-group="2">Zone 1</asp:ListItem>
                            <asp:ListItem Value="13" data-group="2">Zone 2</asp:ListItem>
                            <asp:ListItem Value="14" data-group="2">Zone 3</asp:ListItem>
                            <asp:ListItem Value="15" data-group="2">Zone 4</asp:ListItem>
                            <asp:ListItem Value="16" data-group="2">Zone 5</asp:ListItem>

                            <asp:ListItem Value="17" data-group="3">Argoba Special Zone</asp:ListItem>                
                            <asp:ListItem Value="18" data-group="3">Awi</asp:ListItem>
                            <asp:ListItem Value="19" data-group="3">Bahir Dar</asp:ListItem>
                            <asp:ListItem Value="20" data-group="3">East Gojjam</asp:ListItem>
                            <asp:ListItem Value="21" data-group="3">North Gondar</asp:ListItem>
                            <asp:ListItem Value="22" data-group="3">North Shewa</asp:ListItem>
                            <asp:ListItem Value="23" data-group="3">North Wello</asp:ListItem>
                            <asp:ListItem Value="24" data-group="3">Oromiya Zone</asp:ListItem>
                            <asp:ListItem Value="25" data-group="3">South Gondar</asp:ListItem>
                            <asp:ListItem Value="26" data-group="3">South Wello</asp:ListItem>
                            <asp:ListItem Value="27" data-group="3">Waghemira</asp:ListItem>
                            <asp:ListItem Value="28" data-group="3">West Gojjam</asp:ListItem>


                            <asp:ListItem Value="29" data-group="4">Asossa</asp:ListItem>
                            <asp:ListItem Value="30" data-group="4">Kemashi</asp:ListItem>
                            <asp:ListItem Value="31" data-group="4">Mao Komo Special Wereda</asp:ListItem>
                            <asp:ListItem Value="32" data-group="4">Metekel</asp:ListItem>
                            <asp:ListItem Value="33" data-group="4">Pawe Special Wereda</asp:ListItem>
                            
                            <asp:ListItem Value="34" data-group="5">Dire Dawa</asp:ListItem>

                            <asp:ListItem Value="35" data-group="6">Agnewak</asp:ListItem>
                            <asp:ListItem Value="36" data-group="6">Nuwer</asp:ListItem>
                            <asp:ListItem Value="37" data-group="6">Mezhenger</asp:ListItem>
                            <asp:ListItem Value="38" data-group="6">Etang Special Wereda</asp:ListItem>
                            
                            <asp:ListItem Value="39" data-group="7">Harari</asp:ListItem>


                            <asp:ListItem Value="40" data-group="8">Arsi</asp:ListItem>
                            <asp:ListItem Value="41" data-group="8">Bale</asp:ListItem>
                            <asp:ListItem Value="42" data-group="8">Borana</asp:ListItem>
                            <asp:ListItem Value="43" data-group="8">Buno Bedele</asp:ListItem>
                            <asp:ListItem Value="44" data-group="8">East Hararghe</asp:ListItem>
                            <asp:ListItem Value="45" data-group="8">East Shewa</asp:ListItem>
                            <asp:ListItem Value="46" data-group="8">East Welega</asp:ListItem>
                            <asp:ListItem Value="47" data-group="8">Finfinne Zuria Special Zone</asp:ListItem>
                            <asp:ListItem Value="48" data-group="8">Guji</asp:ListItem>
                            <asp:ListItem Value="49" data-group="8">Horo Guduru Welega</asp:ListItem>
                            <asp:ListItem Value="50" data-group="8">Illubabor</asp:ListItem>
                            <asp:ListItem Value="51" data-group="8">Jimma</asp:ListItem>
                            <asp:ListItem Value="52" data-group="8">North Shewa</asp:ListItem>
                            <asp:ListItem Value="53" data-group="8">Southwest Shewa</asp:ListItem>
                            <asp:ListItem Value="54" data-group="8">West Arsi</asp:ListItem>
                            <asp:ListItem Value="55" data-group="8">West Guji</asp:ListItem>
                            <asp:ListItem Value="56" data-group="8">West Haraghe</asp:ListItem>
                            <asp:ListItem Value="57" data-group="8">West Shewa</asp:ListItem>
                            <asp:ListItem Value="58" data-group="8">West Welega</asp:ListItem>
                            
                            <asp:ListItem Value="59" data-group="9">Amaro Special Woreda</asp:ListItem>
                             <asp:ListItem Value="60" data-group="9">Gamo Gofa</asp:ListItem>
                             <asp:ListItem Value="61" data-group="9">Gedeo</asp:ListItem>
                             <asp:ListItem Value="62" data-group="9">Gurage</asp:ListItem>
                             <asp:ListItem Value="63" data-group="9">Hadiya</asp:ListItem>
                             <asp:ListItem Value="64" data-group="9">Halaba</asp:ListItem>
                             <asp:ListItem Value="65" data-group="9">Keffa</asp:ListItem>
                            
                              <asp:ListItem Value="66" data-group="9">Kembata Tembaro</asp:ListItem>
                             <asp:ListItem Value="67" data-group="9">Konso</asp:ListItem>
                             <asp:ListItem Value="68" data-group="9">Konta Special Woreda</asp:ListItem>
                             <asp:ListItem Value="69" data-group="9">Sheka</asp:ListItem>
                             <asp:ListItem Value="70" data-group="9">Sidama</asp:ListItem>
                             <asp:ListItem Value="71" data-group="9">Silte</asp:ListItem>
                             <asp:ListItem Value="72" data-group="9">South Omo</asp:ListItem>
                             <asp:ListItem Value="73" data-group="9">West Omo</asp:ListItem>
                             <asp:ListItem Value="74" data-group="9">Wolayita</asp:ListItem>
                          
               
                            <asp:ListItem Value="75" data-group="10">Afder</asp:ListItem>
                            <asp:ListItem Value="76" data-group="10">Liben</asp:ListItem>
                            <asp:ListItem Value="77" data-group="10">Shinile</asp:ListItem>
                            <asp:ListItem Value="78" data-group="10">Jijiga</asp:ListItem>
                            <asp:ListItem Value="79" data-group="10">Degehabur</asp:ListItem>
                            <asp:ListItem Value="80" data-group="10">Warder</asp:ListItem>
                            <asp:ListItem Value="81" data-group="10">Korahe</asp:ListItem>
                            <asp:ListItem Value="82" data-group="10">Fik</asp:ListItem>
                            <asp:ListItem Value="83" data-group="10">Gode</asp:ListItem>
                        </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvZone" runat="server" Text="* Zone required." ControlToValidate="ddlZone" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                   </div>

                    <div class="col-sm-6 mb-3 mb-sm-0">
                   <%-- <asp:TextBox ID="txtWoreda" class="form-control" placeholder="Woreda" runat="server"></asp:TextBox>--%>
                        <asp:Label>Woreda</asp:Label>
                        <asp:DropDownList ID="ddlWoreda" class="form-control" ToolTip="Region" DataTextField="Choose Region"  AutoPostBack = "true" runat="server" onchange="ToogleHealthFval(); return false;">
                            <asp:ListItem selected hidden>Choose Woreda</asp:ListItem>
                            <asp:ListItem value="1" data-group="1">Adama</asp:ListItem>
                            <asp:ListItem  value="2" data-group="2">Ambo</asp:ListItem>
                            <asp:ListItem  value="3" data-group="3">Arba Minch</asp:ListItem>
                            <asp:ListItem  value="4" data-group="4">Bahir Dar</asp:ListItem>
                            <asp:ListItem value="5" data-group="5" >Becho</asp:ListItem>
                            <asp:ListItem Value="6" data-group="6">Dale</asp:ListItem>
                            <asp:ListItem Value="7" data-group="7" >Dilla</asp:ListItem>
                            <asp:ListItem Value="8" data-group="8">Gambela</asp:ListItem>
                            <asp:ListItem Value="9" data-group="9">Gode</asp:ListItem>
                            <asp:ListItem Value="10" data-group="10">Halaba</asp:ListItem>
                            <asp:ListItem Value="11" data-group="11">Hawassa</asp:ListItem>
                             <asp:ListItem Value="12" data-group="12">Hosaina</asp:ListItem>
                             <asp:ListItem Value="13" data-group="13">Shashemene</asp:ListItem>
                             <asp:ListItem Value="14" data-group="14">Sodo</asp:ListItem>
                            <asp:ListItem Value="15" data-group="15">Woreda 3</asp:ListItem>
                             <asp:ListItem Value="16" data-group="16">Wereda 13</asp:ListItem>
                             <asp:ListItem Value="17" data-group="17">Woreda 8</asp:ListItem>
                             <asp:ListItem Value="18" data-group="18">Woreda 6</asp:ListItem>
                             <asp:ListItem Value="19" data-group="19">Addis Ketema</asp:ListItem>

                        </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="rfvWoreda" runat="server" Text="* Woreda required." ControlToValidate="ddlWoreda" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                  <div class="col-sm-6">
                    <%--<asp:TextBox ID="txtHealthF" class="form-control " placeholder="Health Facility" runat="server"></asp:TextBox>--%>
                      <asp:Label>Health Facility(Site)</asp:Label>
                      <asp:DropDownList ID="ddlHealthF" class="form-control" ToolTip="Health Facility" DataTextField="Choose Site"  AutoPostBack = "true" runat="server">
                            <asp:ListItem selected hidden>Choose Health Facility</asp:ListItem>
                            <asp:ListItem value="1" data-group="1">Adama Hospital</asp:ListItem>
                            <asp:ListItem  value="4" data-group="4">Addis Alem Hospital</asp:ListItem>
                            <asp:ListItem  value="2" data-group="2">Ambo Hospital</asp:ListItem>
                            <asp:ListItem  value="3" data-group="3">Arba Minch General Hospital</asp:ListItem>
                            <asp:ListItem value="7" data-group="7" >Dilla Hospital</asp:ListItem>
                            <asp:ListItem Value="8" data-group="8">Gambela General Hospital</asp:ListItem>
                            <asp:ListItem Value="9" data-group="9" >Gode Hospital</asp:ListItem>
                            <asp:ListItem Value="10" data-group="10">Halaba Primary Hospital</asp:ListItem>
                            <asp:ListItem Value="11" data-group="11">Hawasa CS Hl</asp:ListItem>
                            <asp:ListItem Value="12" data-group="12">Hosaina Hospital</asp:ListItem>
                            <asp:ListItem Value="16" data-group="16">Mikiland Health Center</asp:ListItem>
                            <asp:ListItem Value="13" data-group="13">Shashamane Hospital</asp:ListItem>
                           <asp:ListItem Value="14" data-group="14">Sodo Hospital</asp:ListItem>
                           <asp:ListItem Value="5" data-group="5">Tulubolo Hospital</asp:ListItem>
                           <asp:ListItem Value="14" data-group="14">Wolayita Sodo Tertiary Hospital</asp:ListItem>
                           <asp:ListItem Value="15" data-group="15">Woreda 3 Health Center</asp:ListItem>

                          <asp:ListItem Value="15" data-group="15">Addis Ketema Health Center</asp:ListItem>
                           <asp:ListItem Value="17" data-group="17">Keraniyo Health Center</asp:ListItem>

                           <asp:ListItem Value="18" data-group="18">Yekatit 12 Hospital</asp:ListItem>
                           <asp:ListItem Value="6" data-group="6">Yirgalem General Hospital</asp:ListItem>
                        </asp:DropDownList>
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
               <asp:Button ID="btnCancelas"  class="btn btn-primary btn-user btn-block col-sm-6" runat="server" Text="Cancel" OnClientClick="this.form.reset();return false;"  /> 
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

    </script>
</body>
</html>
