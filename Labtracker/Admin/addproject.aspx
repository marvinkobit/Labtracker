<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addproject.aspx.cs" Inherits="Labtracker.Admin.addproject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
head>

  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>

  <title>TBGE Lab Monitor  - Register</title>

  <!-- Custom fonts for this template-->
  <link href="../Content/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../Content/css/sb-admin-2.min.css" rel="stylesheet">

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
                <h1 class="h4 text-gray-900 mb-4">Labtracker</h1>
                <h2 class="h4 text-gray-900 mb-4">Create a Project Here</h2>
              </div>
              <form class="user" runat="server">
                  <asp:Literal runat="server"  id="StatusMessage"/>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox runat="server" class="form-control form-control-user" id="txtProjectName" placeholder="Project Name"/>
                  </div>
                  <div class="col-sm-6">
                    
                    <asp:TextBox runat="server" class="form-control form-control-user" id="txtProjectStr" placeholder="Unique String(Project Identifier)"/>
             <asp:RequiredFieldValidator ID="rfvDC" runat="server" Text="* Unique String for Project Identifier required." ControlToValidate="txtProjectStr" SetFocusOnError="true" Display="Dynamic">

             </asp:RequiredFieldValidator>
                
                      
                  </div>
                </div>
                <div class="form-group">
                     <asp:TextBox  class="form-control form-control-user" runat="server" ID="txtProjectDesc"  placeholder="Project Description"/>

                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                      <asp:Label runat="server">Start Date:</asp:Label>
                      <asp:TextBox class="form-control form-control-user"  runat="server" ID="dtStartDate" TextMode="Date" placeholder="Start Date"/>
                       </div>
                  <div class="col-sm-6">
                      <asp:Label runat="server">End Date:</asp:Label>
                       <asp:TextBox class="form-control form-control-user"  runat="server" ID="dtEndDate" TextMode="Date"  placeholder="End Date" />
                   </div>
                </div>
                <asp:Button runat="server" OnClick="CreateProject_Click" Text="Create" CssClass="btn  btn-primary btn-user btn-block" />
             
                  
               
              </form>
              <hr>
            
              <div class="text-center">
                <a class="small" href="login.aspx">Already have an account? Login!</a>
                  <asp:Label runat="server" ID="asSavelbl"></asp:Label>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="../Content/vendor/jquery/jquery.min.js"></script>
  <script src="../Content/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../Content/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../Content/js/sb-admin-2.min.js"></script>

</body>
</html>

