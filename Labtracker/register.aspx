<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Labtracker.regster" %>

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
                <h2 class="h4 text-gray-900 mb-4">Create an Account Here</h2>
              </div>
              <form class="user" runat="server">
                  <asp:Literal runat="server"  id="StatusMessage"/>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="First Name">
                  </div>
                  <div class="col-sm-6">
                    
                    <input type="text" class="form-control form-control-user" id="exampleLastName" placeholder="Last Name">
                  </div>
                </div>
                <div class="form-group">
                     <asp:TextBox  class="form-control form-control-user" runat="server" ID="UserName" TextMode="Email" placeholder="Email Address"/>
                  <%--<input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address">--%>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                      <asp:TextBox class="form-control form-control-user"  runat="server" ID="Password" TextMode="Password" placeholder="Password"/>
                    <%--<input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">--%>
                  </div>
                  <div class="col-sm-6">
                       <asp:TextBox class="form-control form-control-user" runat="server" ID="Password2" TextMode="Password"  placeholder="Repeat Password" />
                   <%-- <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">--%>
                  </div>
                </div>
                  <div class="form-group row">
                      <div class="col-sm-6 mb-3 mb-sm-0">
                        Role:
                    <asp:DropDownList ID="ddlRole" class="form-control" ToolTip="Roles" DataTextField="Role" runat="server">
                        <asp:ListItem Selected="True">LabUser</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Reviewer</asp:ListItem>
                        </asp:DropDownList>
                  </div>
                   <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn  btn-primary btn-user btn-block" />
                <%--<a href="login.aspx" class="btn btn-primary btn-user btn-block">
                   
                  Register Account
                </a>--%>
                <%--<hr>
                <a href="" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Register with Google
                </a>
                <a href="" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                </a>--%>
              </form>
              <hr>
            <%--  <div class="text-center">
                <a class="small" href="forgot-password.aspx">Forgot Password?</a>
              </div>--%>
              <div class="text-center">
                <a class="small" href="login.aspx">Already have an account? Login!</a>
              </div>
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

</body>
</html>
