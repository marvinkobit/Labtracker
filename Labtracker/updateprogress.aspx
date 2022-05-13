<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateprogress.aspx.cs" Inherits="Labtracker.updateprogress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>

  <title>TBGEN Lab Monitor</title>

  <!-- Custom fonts for this template-->
  <link href="Content/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

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
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">TBGEN Lab Monitor</h1>
                <h2 class="h4 text-gray-900 mb-4">Update Result</h2>
              </div>
                <form id="form1" runat="server">

 <asp:ScriptManager ID="SMUpdateResult" runat="server">  </asp:ScriptManager>
                
      <asp:UpdatePanel ID="UPUpdateRes" runat="server"> 
          <ContentTemplate>
                  <div class=" row col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox type="Text" class="form-control form-control-user col-sm-6" runat="server" ID="txtSampleIdUpdate" placeholder="Sample Id">

                    </asp:TextBox>
                     <%-- <asp:Button ID="btnGo"  class="btn btn-primary btn-user btn-block col-sm-2" runat="server" Text=">"  /> --%>
                  </div>
          <br/>
            <!--  
            <a href="" class="" style="visibility:hidden" >
                  x information is updated yet for this sample.
                </a>
              -->  
                    
                <div class="form-group row " >
                    <div id="rescol1" class=" col-sm-6"  >
                    <div class="col-sm-12 mb-3 mb-sm-0 col-lg-12">
                     <asp:DropDownList ID="DDLResType"  class="form-control form-control-user" runat="server" ToolTip="Choose Result Type" AutoPostBack = "true" onchange="ToggleVisible(); return false;"  >
                            
                            <asp:ListItem selected hidden>Choose Result Type</asp:ListItem>
                              
                            <asp:ListItem value="1" data-group="1">Primary Smear</asp:ListItem>
                            <asp:ListItem value="2" data-group="2">LJ</asp:ListItem>
                            <asp:ListItem value="3" data-group="3">MGIT</asp:ListItem>
                            <asp:ListItem value="4" data-group="4">RD9</asp:ListItem>
                            <asp:ListItem value="5" data-group="5">DNA Extraction</asp:ListItem>
                            <asp:ListItem value="6" data-group="6">Spoligo</asp:ListItem>
                            <asp:ListItem value="7" data-group="7">DST</asp:ListItem>
                          <asp:ListItem value="8" data-group="8">Culture Smear</asp:ListItem>
                          <asp:ListItem value="9" data-group="9">Heat Killed</asp:ListItem> 
                         <asp:ListItem value="10" data-group="10">Growth Detection</asp:ListItem>

                      

                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="* Processing date required." ControlToValidate="DDLResType" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                   </div>
                        <br />

           <div class="col-sm-6 mb-3 mb-sm-0 col-lg-12" >
                     <asp:DropDownList ID="DDLRESVAL"  class="form-control" runat="server" ToolTip="Choose Result"  >
                            
                            <asp:ListItem selected hidden>Choose Result</asp:ListItem>
                            <asp:ListItem Value="1" data-group="1">1+</asp:ListItem>
                            <asp:ListItem Value="1" data-group="1">2+</asp:ListItem>
                            <asp:ListItem Value="1" data-group="1">3+</asp:ListItem>
                            <asp:ListItem Value="1" data-group="1">Scanty</asp:ListItem>
                    
                            <asp:ListItem Value="2" data-group="2">Growth</asp:ListItem>
                            <asp:ListItem Value="2" data-group="2">NoGrowth</asp:ListItem>
                            <asp:ListItem Value="2" data-group="2">Contaminated</asp:ListItem>
                            <asp:ListItem Value="2" data-group="2">Not Done</asp:ListItem>

                             <asp:ListItem Value="3" data-group="3">Growth</asp:ListItem>
                            <asp:ListItem Value="3" data-group="3">NoGrowth</asp:ListItem>
                            <asp:ListItem Value="3" data-group="3">Contaminated</asp:ListItem>
                            <asp:ListItem Value="3" data-group="3">Not Done</asp:ListItem>

                            <asp:ListItem Value="4" data-group="4">MTBC</asp:ListItem>
                            <asp:ListItem Value="4" data-group="4">NTM</asp:ListItem>

                            <asp:ListItem Value="5" data-group="5">Good for library Prep</asp:ListItem>
                            <asp:ListItem Value="5" data-group="5">Failed-Repeat Extraction</asp:ListItem>
                            <asp:ListItem Value="5" data-group="5">Failed-Discard</asp:ListItem>

                             <asp:ListItem Value="7" data-group="7">First Line</asp:ListItem>  
                            <asp:ListItem Value="7" data-group="7">Second Line</asp:ListItem>
                            
                          <asp:ListItem Value="8" data-group="8">Pos</asp:ListItem>  
                            <asp:ListItem Value="8" data-group="8">Neg</asp:ListItem>

                          <asp:ListItem Value="9" data-group="9">Yes</asp:ListItem>  
                            <asp:ListItem Value="9" data-group="9">No</asp:ListItem>
                         
                            <asp:ListItem Value="10" data-group="10">Week 1</asp:ListItem>
                            <asp:ListItem Value="10" data-group="10">Week 2</asp:ListItem>
                            <asp:ListItem Value="10" data-group="10">Week 3</asp:ListItem>
                            <asp:ListItem Value="10" data-group="10">Week 4</asp:ListItem>
                            <asp:ListItem Value="10" data-group="10">Week 5</asp:ListItem>
                            <asp:ListItem Value="10" data-group="10">Week 6</asp:ListItem>
                            <asp:ListItem Value="10" data-group="10">Week 7</asp:ListItem>
                            <asp:ListItem Value="10" data-group="10">Week 8</asp:ListItem>
                        
                              

                        </asp:DropDownList>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="* Processing date required." ControlToValidate="DDLRESVAL" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
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
                        </div>
                  
              <div id="rescol2" class="col-sm-6 " >
                  

                  <div id="GrowthDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12" style="display:none">
                      <asp:Label>Please enter details here</asp:Label>

                      <div class="col-sm-6 col-lg-12">
                        <asp:DropDownList ID="ddlGrowthdetail" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="d" DataTextField="" runat="server">
                            <asp:ListItem Selected hidden>Primary media</asp:ListItem>
                           <asp:ListItem Value="1">LJ-1</asp:ListItem>   
                            <asp:ListItem Value="2">LJ-2</asp:ListItem>
                            <asp:ListItem Value="3">LJ-P</asp:ListItem>
                            <asp:ListItem Value="4">MGIT</asp:ListItem>
                
                         </asp:DropDownList>
                       </div>
                      <asp:Label>Please enter details here</asp:Label>

                      <div class="col-sm-6 col-lg-12">
                    <asp:TextBox ID="txtGrowth" class="form-control " placeholder="Input" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvgrowth" runat="server" Text="* detail required." ControlToValidate="txtGrowth" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                     </div>
                       
                  </div>
                  <div id="DSTDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12" style="display:none">
                      <asp:Label>Please enter details here</asp:Label>

                      <div class="col-sm-6 col-lg-12">
                        <asp:DropDownList ID="ddlDSTdetail1" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="d" DataTextField="" runat="server">
                            <asp:ListItem Selected hidden>Select DST type</asp:ListItem>
                           <asp:ListItem Value="1">STM</asp:ListItem>   
                            <asp:ListItem Value="2">INH</asp:ListItem>
                            <asp:ListItem Value="3">RIF</asp:ListItem>
                            <asp:ListItem Value="4">EMB</asp:ListItem>
                            <asp:ListItem Value="5">PZA</asp:ListItem>
                           
                         </asp:DropDownList>
                       </div>
                      <asp:Label>Please enter details here</asp:Label>

                      <div class="col-sm-6 col-lg-12">
                        <asp:DropDownList ID="ddlDSTdetail2" class="form-control col-sm-6 mb-3 mb-sm-0 col-lg-12" ToolTip="d" DataTextField="" runat="server">
                            <asp:ListItem selected hidden>Select DST result</asp:ListItem>
                            <asp:ListItem Value="1">R</asp:ListItem>
                            <asp:ListItem Value="2">S</asp:ListItem>
                          
                         </asp:DropDownList>
                       </div>
                    <!--<asp:TextBox ID="txtCountry" class="form-control form-control-user" placeholder="Country" runat="server"></asp:TextBox> -->     
                  </div>

                  <div id="SpoDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12" style="display:none">
                      <asp:Label>Please enter Spoligo details here</asp:Label>

                    <div class="col-sm-6 col-lg-12">
                    <asp:TextBox ID="txtSpold" class="form-control " placeholder="SIT Number" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvspold" runat="server" Text="* Spoligo detail required." ControlToValidate="txtSpold" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                     </div>
                  </div>


                  <div id="EXDetail" class="col-sm-6 mb-3 mb-sm-0 col-lg-12" style="display:none">
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
                    <asp:TextBox ID="txtCUcon" class="form-control " placeholder="Cubit Concentration" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvcucon" runat="server" Text="* Cubit concentration required." ControlToValidate="txtCUcon" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                      <br />
                 <div class="col-sm-6 col-lg-12">
                     <asp:Label runat="server" id="Label1" text="Agaros picture: " />
                    <asp:FileUpload id="FileUploadControl" runat="server" />
                    <asp:Button runat="server" id="agarospic" text="Upload"  />
                    <br />
                    <asp:Label runat="server" id="StatusLabel" text="Upload status: " />
                 </div>
                    
                  </div>
              </div>
             </div> 
        
              
          </ContentTemplate>
       </asp:UpdatePanel>
              
                 <div class="row">
               <asp:Button ID="btnSaveup"  class="btn btn-primary btn-user btn-block col-sm-6" runat="server" Text="Update" OnClick="btnSaveup_Click" /> 
               <asp:Button ID="btnCancelup"  class="btn btn-primary btn-user btn-block col-sm-6" runat="server" Text="Cancel" OnClientClick="this.form.reset();return false;"  /> 
               </div>
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

        //function ToogleResval() {
        //   // var divResval = document.getElementById('#DRESVAL');
        //   // divResval.style.display = "block";
        //    $variable = $("#DDLRESVAL").html();
        //    $("#DDLRESVAL").html($variable);
        //    var val = $("#DDLResType").find(":selected").val();
        //    $("#DDLRESVAL option").show();
        //    $("#DDLRESVAL option[value!=" + val + "]").hide();

        //}

        function ToggleVisible() {
           
            var exdiv = document.getElementById('EXDetail');
            var spodiv = document.getElementById('SpoDetail');
            var dstdiv = document.getElementById('DSTDetail');
            var comsel = document.getElementById('DRESVAL');
            var grodiv = document.getElementById('GrowthDetail')
            var ddlval = $("#DDLResType").find(":selected").val();
            //var ddval2 = $("#").find(":selected").val();
            $variable = $("#DDLRESVAL").html();
            $("#DDLRESVAL").html($variable);
            //var val = $("#DDLResType").find(":selected").val();
            $("#DDLRESVAL option").show();
            $("#DDLRESVAL option[value!=" + ddlval + "]").hide();

            switch (ddlval) {
                case "5":
                    exdiv.style.display = "block";
                    comsel.style.display = "block";
                    spodiv.style.display = "none";
                    dstdiv.style.display = "none";
                    grodiv.style.display = "none";
                    break;
            
                case "6":
                    spodiv.style.display = "block";
                    comsel.style.display = "none";
                    exdiv.style.display = "none";
                    dstdiv.style.display = "none";
                    grodiv.style.display = "none";
                    break;
                case "7":
                    dstdiv.style.display = "block";
                    comsel.style.display = "block";
                    spodiv.style.display = "none";
                    exdiv.style.display = "none";
                    grodiv.style.display = "none";
                    break;
                case "10":
                    grodiv.style.display = "block";
                    comsel.style.display = "block";
                    exdiv.style.display = "none";
                    spodiv.style.display = "none";
                    dstdiv.style.display = "none";
                    break;

                default:     
                    comsel.style.display = "block";
                    exdiv.style.display = "none";
                    spodiv.style.display = "none";
                    dstdiv.style.display = "none";
                    grodiv.style.display = "none";
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
