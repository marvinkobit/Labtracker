<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="Labtracker.report" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>

  <title>TBGEN Lab Monitor - Sample Receiving </title>

  <script lang="javaScript" type="text/javascript" src="crystalreportviewers13/js/crviewer/crv.js"></script> 
  <!-- Custom fonts for this template-->
  <link href="Content/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"/>

  <!-- Custom styles for this template-->
  <link href="Content/css/sb-admin-2.min.css" rel="stylesheet"/>
  <link href="Content/css/sb-admin-2.css" rel="stylesheet" />
</head>
<body>
    <body id="page-top">

    <form id="form1" runat="server">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="">
        <div class="sidebar-brand-icon rotate-n-15">
        <!--  <i class="fas fa-laugh-wink"></i> -->
        </div>
        <div class="sidebar-brand-text mx-3">
        <img width="120%" height="120%" src="Images/logo.png" /> <sup></sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

    

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
       <h3> TBGEN Lab Monitor </h3>
      </div>

      <!-- Nav Item - Pages Collapse Menu -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="dashboard.aspx">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
   
      </li>
          <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="sample-receiving.aspx">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Receiving</span></a>
      </li>

      <!-- Nav Item - Charts 
      <li class="nav-item">
        <a class="nav-link" href="">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Preprocessing</span></a>
      </li> -->

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="progress.aspx">
          <i class="fas fa-fw fa-table"></i>
          <span>Progress and Result</span></a>
      </li>

        <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="storage.aspx">
          <i class="fas fa-fw fa-table"></i>
          <span>Isolate Storage</span></a>
      </li>
        <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="sequencing.aspx">
          <i class="fas fa-fw fa-table"></i>
          <span>Sequencing</span></a>
      </li>
         <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="">
          <i class="fas fa-fw fa-table"></i>
          <span>Report</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter">3+</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">September 12, 2019</div>
                    <span class="font-weight-bold">New samples (batch 5) has been recived!</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fas fa-donate text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">September 14, 2019</div>
                    Preprocessing of batch 5 samples has started!
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">September 25, 2019</div>
                    Batch 5 culture result updated.
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter">1</span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="Images/beth.png" alt=""/>
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">Hi there! would you please update Browser?.</div>
                    <div class="small text-gray-500">User</div>
                  </div>
                </a>
              

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><asp:Literal runat="server"  id="UsernameText"/></span>
                <img class="img-profile rounded-circle" src="Images/user-profile.png"/>
                
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                  <a class="dropdown-item" href="Admin/adminpage.aspx">
                  <i class="fas fa-edit fa-sm fa-fw mr-2 text-gray-400"></i>
                  Admin Panel
                </a>
                  
                <a class="dropdown-item" href="Account/Manage.aspx">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Report</h1>
           
                         </div>

       

          <!-- Content Row -->

          

          <!-- Content Row -->
          <div class="row">
            
            <!-- Content Column -->
            <div class="col-lg-12 mb-4">
               
            
               Report Type <asp:DropDownList ID="DropDownList1" runat="server" Height="26px"  Width="150px">
                    <asp:ListItem>Sample Recieving</asp:ListItem>
                    <asp:ListItem>Progress</asp:ListItem>
                    <asp:ListItem>General</asp:ListItem>
                </asp:DropDownList>
               <%-- <br />
                <br />--%>
               <%-- Date From <asp:TextBox  Type="date" ID="TextBox2" runat="server"></asp:TextBox>
                Date To <asp:TextBox  Type="date" ID="TextBox1" runat="server"></asp:TextBox>--%>
                <asp:Button ID="Button1" CssClass="btn-primary" runat="server" Text="Generate" OnClick="Button1_Click" />
            
          </div>

              
             <%-- <asp:GridView ID="GridView2" runat="server"></asp:GridView>--%>
        </div>
            
            <div>
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" ReportSourceID="CrystalReportSource1" HasRefreshButton="True" ToolbarImagesFolderUrl="" BestToFitPage="False" ToolPanelWidth="200px" Width="1104px" />
                  <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                      <Report FileName="CrystalReport1.rpt">
                      </Report>
                  </CR:CrystalReportSource>
             </div>

            <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">

                   
              <div class="card shadow mb-4">
               
                  <%--<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                      <EditRowStyle BackColor="#999999" />
                      <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                      <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                      <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                      <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                      <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                      <SortedAscendingCellStyle BackColor="#E9E7E2" />
                      <SortedAscendingHeaderStyle BackColor="#506C8C" />
                      <SortedDescendingCellStyle BackColor="#FFFDF8" />
                      <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                  </asp:GridView>--%>






               
               






               
              </div>
            </div>

           
          </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; TBGEN AFRICA 2022</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">You are about to Leave this page?</h5> 
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
      <!--  <div class="modal-body">Select "Logout" if you are sure to leave the page.</div>-->
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <asp:Button ID="btnLogout" class="btn btn-primary" runat="server" Text="Logout" OnClick="SignOut" />
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

  <!-- Page level plugins -->
  <script src="Content/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="Content/js/demo/chart-bar-demo.js"></script>
  <script src="Content/js/demo/chart-pie-demo.js"></script>

    </form>

</body>
</body>
</html>
