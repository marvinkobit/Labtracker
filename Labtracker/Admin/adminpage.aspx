<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpage.aspx.cs" Inherits="Labtracker.Admin.adminpage"  EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />


    <title>TBGEN Lab Monitor - Sample Receiving </title>

    <!-- Custom fonts for this template-->
    <link href="../Content/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <%-- <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"/>--%>

    <!-- Custom styles for this template-->
    <link href="../Content/css/sb-admin-2.min.css" rel="stylesheet" />
    <link href="../Content/css/sb-admin-2.css" rel="stylesheet" />
    <style type="text/css">
        .table-responsive {
            min-height: .01%;
            overflow-x: auto
        }

        @media screen and (max-width:767px) {
            .table-responsive {
                width: 100%;
                margin-bottom: 15px;
                overflow-y: hidden;
                -ms-overflow-style: -ms-autohiding-scrollbar;
                border: 1px solid #ddd
            }
        }

        fieldset {
            min-width: 0;
            padding: 0;
            margin: 0;
            border: 0
        }

        legend {
            display: block;
            width: 100%;
            padding: 0;
            margin-bottom: 20px;
            font-size: 21px;
            line-height: inherit;
            color: #333;
            border: 0;
            border-bottom: 1px solid #e5e5e5
        }

        label {
            display: inline-block;
            max-width: 100%;
            margin-bottom: 5px;
            font-weight: 700
        }

        input[type=search] {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box
        }

        input[type=checkbox], input[type=radio] {
            margin: 4px 0 0;
            margin-top: 1px\9;
            line-height: normal
        }

        input[type=file] {
            display: block
        }

        input[type=range] {
            display: block;
            width: 100%
        }

        select[multiple], select[size] {
            height: auto
        }

        input[type=file]:focus, input[type=checkbox]:focus, input[type=radio]:focus {
            outline: 5px auto -webkit-focus-ring-color;
            outline-offset: -2px
        }

        output {
            display: block;
            padding-top: 7px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555
        }

        .form-control {
            display: block;
            width: 100%;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
        }

        .table-bordered {
            border: 1px solid #ddd
        }

            .table-bordered > tbody > tr > td, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > td, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > thead > tr > th {
                border: 1px solid #ddd
            }

            .table-bordered > thead > tr > td, .table-bordered > thead > tr > th {
                border-bottom-width: 2px
            }

        .table-condensed > tbody > tr > td, .table-condensed > tbody > tr > th, .table-condensed > tfoot > tr > td, .table-condensed > tfoot > tr > th, .table-condensed > thead > tr > td, .table-condensed > thead > tr > th {
            padding: 5px
        }

        .rows {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: left;
            border: none 0px transparent;
        }

            .rows:hover

            .table-hover > tbody > tr:hover {
                background-color: #f5f5f5
            }

        table col[class*=col-] {
            position: static;
            display: table-column;
            float: none
        }

        table td[class*=col-], table th[class*=col-] {
            position: static;
            display: table-cell;
            float: none
        }
    </style>
    <script src="scripts/jquery.responsivetable.min.js"></script>
</head>
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
                        <img width="120%" height="120%" src="../Images/logo.png" />
                        <sup></sup>
                    </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Receiving 
      <li class="nav-item active">
        <a class="nav-link" href="">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Sample Receiving</span></a>
      </li>-->

                <!-- Divider 
      <hr class="sidebar-divider">-->

                <!-- Heading 
      <div class="sidebar-heading">
        Admin
      </div>-->

                <!-- Nav Item - Pages Collapse Menu 
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Setting</span>
        </a>-->
                <!--  <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item" href="buttons.html">Buttons</a>
            <a class="collapse-item" href="cards.html">Cards</a>
          </div>
        </div> -->
                </li>

      <!-- Nav Item - Utilities Collapse Menu -->
                <!--<li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Utilities</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="utilities-color.html">Colors</a>
            <a class="collapse-item" href="utilities-border.html">Borders</a>
            <a class="collapse-item" href="utilities-animation.html">Animations</a>
            <a class="collapse-item" href="utilities-other.html">Other</a>
          </div>
        </div>
      </li> -->

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    <h3>TBGEN Lab Monitor </h3>
                </div>

                <!-- Nav Item - Pages Collapse Menu -->

                <li class="nav-item">
                    <a class="nav-link collapsed" href="../dashboard.aspx">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>

                </li>
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="../sample-receiving.aspx">
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
                    <a class="nav-link" href="../progress.aspx">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Progress and Result</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="../storage.aspx">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Isolate Storage</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="../sequencing.aspx">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Sequencing</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="../report.aspx">
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

            <!-- ../Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main ../Content -->
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
                                    <h6 class="dropdown-header">Alerts Center
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
                                    <h6 class="dropdown-header">Message Center
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="" alt="" />
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div class="font-weight-bold">
                                            <div class="text-truncate">Hi there! would you please update your Browser?.</div>
                                            <div class="small text-gray-500">User</div>
                                        </div>
                                    </a>


                                    <div class="topbar-divider d-none d-sm-block"></div>

                                    <!-- Nav Item - User Information -->
                                    <li class="nav-item dropdown no-arrow">
                                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                                <asp:Literal runat="server" ID="UsernameText" /></span>
                                            <img class="img-profile rounded-circle" src="../Images/user-profile.png" />

                                        </a>
                                        <!-- Dropdown - User Information -->
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                            <a class="dropdown-item" href="#">
                                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                                Profile
                                            </a>
                                            <a class="dropdown-item" href="adminpage.aspx">
                                                <i class="fas fa-edit fa-sm fa-fw mr-2 text-gray-400"></i>
                                                Admin Panel
                                            </a>                                            
                                            <a class="dropdown-item" href="#">
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

                    <!-- Begin Page ../Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Admin Panel</h1>
                            <a href="../register.aspx" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                <i class="fas fa-download fa-sm text-white-50"></i>Register User</a>
                            <%-- <a href="ProgressExcel" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" >
                <i class="fas fa-download fa-sm text-white-50"></i> Upload from file</a>--%>
                            <a href="../registerSite.aspx" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                <i class="fas fa-download fa-sm text-white-50"></i>Register Site</a>
                        </div>



                        <!-- ../Content Row -->
                         <div class="row">

                            <!-- Area Chart -->
                            <div class="col-xl-12 col-lg-8">
                                <div class="card shadow mb-4 table-responsive">
                                    <p>Users:
                                        <asp:Label runat="server" ID="lblUsers" Text=""></asp:Label>
                                    </p>

                                    <asp:GridView ID="gvUsers" runat="server" Style="font-size: 12px" Width="100%" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoPostBack="true"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="table table-bordered table-condensed">

                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" />
                             
                                            
                                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                                             <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                                             <asp:BoundField DataField="LockoutEnabled" HeaderText="LockoutEnabled" SortExpression="LockoutEnabled" />
                                            <asp:BoundField DataField="AccessFailedCount" HeaderText="AccessFailedCount" SortExpression="AccessFailedCount" />
                                           

                                        </Columns>
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
                                    </asp:GridView>

                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>"
                                        SelectCommand="SELECT [Id],[Email],[UserName],PhoneNumber,LockoutEnabled,AccessFailedCount FROM [AspNetUsers]">                                       
                                    </asp:SqlDataSource>

                                </div>
                            </div>
                        </div>


                        <!-- Sites Content Row -->

                        <div class="row">

                            <!-- Area Chart -->
                            <div class="col-xl-12 col-lg-8">
                                <div class="card shadow mb-4 table-responsive">
                                    <p>
                                        Sites:
                                        <asp:Label runat="server" ID="lblSites" Text=""></asp:Label>
                                    </p>
                                    <asp:GridView ID="gvSite" runat="server" Style="font-size: 12px" Width="100%" CellPadding="3" AutoGenerateColumns="False" AutoGenerateEditButton="true" DataKeyNames="SiteId" DataSourceID="SqlDataSource3" AutoPostBack="true" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="table table-bordered table-condensed">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" />
                                            <%-- <asp:BoundField DataField="SampleID" HeaderText="SampleID" InsertVisible="False" ReadOnly="True" SortExpression="SampleID" />--%>
                                            <asp:BoundField DataField="HealthFacility" HeaderText="HealthFacility" SortExpression="HealthFacility" />
                                            <asp:BoundField DataField="SitePatientId" HeaderText="SitePatientId" SortExpression="SitePatientId" />
                                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                                            <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region" />
                                            <asp:BoundField DataField="Zone" HeaderText="Zone" SortExpression="Zone" />
                                            <asp:BoundField DataField="Woreda" HeaderText="Woreda" SortExpression="Woreda" />
                                            <asp:BoundField DataField="LocationLatitude" HeaderText="GPS_lat" SortExpression="LocationLatitude" />
                                            <asp:BoundField DataField="LocationLongitude" HeaderText="GPS_long" SortExpression="LocationLongitude" />

                                            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
                                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />

                                        </Columns>
                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                        <HeaderStyle BackColor="#17A2B8" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                        <RowStyle ForeColor="#000066" />
                                        <SelectedRowStyle BackColor="#A9C8E7" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                                    </asp:GridView>

                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>"
                                        SelectCommand="SELECT TOP 1000 
      SiteId,[SitePatientId]
      ,[Country]
      ,[Region]
      ,[Zone]
      ,[Woreda]
      ,[HealthFacility]
      ,[StartDate]
      ,LocationLatitude,LocationLongitude
      ,[Status]
      ,[Remark]
  FROM [Labtracker].[dbo].[Sites]"
                                        UpdateCommand="UPDATE Sites SET [SitePatientId]=@SitePatientId,[Country]=@Country,[Region]=@Region,[Zone]=@Zone,[Woreda]=@Woreda,[HealthFacility]=@HealthFacility,[StartDate]=@StartDate,[Status]=@Status,[Remark]=@Remark,LocationLatitude=@LocationLatitude,LocationLongitude=@LocationLongitude WHERE SiteId=@SiteId">
                                        <UpdateParameters>
                                            <asp:Parameter Name="SitePatientId" Type="String" />
                                            <asp:Parameter Name="Country" Type="String" />
                                            <asp:Parameter Name="Region" Type="String" />
                                            <asp:Parameter Name="Zone" Type="String" />
                                            <asp:Parameter Name="Woreda" Type="String" />
                                            <asp:Parameter Name="HealthFacility" Type="String" />
                                            <asp:Parameter Name="StartDate" Type="DateTime" />
                                            <asp:Parameter Name="Status" Type="String" />
                                            <asp:Parameter Name="Remark" Type="String" />
                                            <asp:Parameter Name="LocationLatitude" Type="String" />
                                            <asp:Parameter Name="LocationLongitude" Type="String" />
                                            <asp:Parameter Name="SiteId" Type="Int32" />
                                        </UpdateParameters>

                                    </asp:SqlDataSource>

                                </div>
                            </div>


                        </div>



                        <!-- /.container-fluid -->

                    </div>
                    <!-- End of Main ../Content -->

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
                <!--End of ../Content Wrapper -->

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
            <script src="../Content/vendor/jquery/jquery.min.js"></script>
            <script src="../Content/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="../Content/vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="../Content/js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src="../Content/vendor/chart.js/Chart.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="../Content/js/demo/chart-bar-demo.js"></script>
            <script src="../Content/js/demo/chart-pie-demo.js"></script>
    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>

