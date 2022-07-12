<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="progress.aspx.cs" Inherits="Labtracker.progress" %>

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
    <link href="Content/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <%-- <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"/>--%>

    <!-- Custom styles for this template-->
    <link href="Content/css/sb-admin-2.min.css" rel="stylesheet" />
    <link href="Content/css/sb-admin-2.css" rel="stylesheet" />
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
                        <img width="120%" height="120%" src="Images/logo.png" />
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
                    <a class="nav-link" href="report.aspx">
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
                                            <img class="img-profile rounded-circle" src="Images/user-profile.png" />

                                        </a>
                                        <!-- Dropdown - User Information -->
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                            <a class="dropdown-item" href="#">
                                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                                Profile
                                            </a>
                                            <a class="dropdown-item" href="/register">
                                                <i class="fas fa-edit fa-sm fa-fw mr-2 text-gray-400"></i>
                                                Register
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

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Progress and Result </h1>
                            <a href="updateprogress.aspx" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                <i class="fas fa-download fa-sm text-white-50"></i>Update progress</a>
                            <%-- <a href="ProgressExcel" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" >
                <i class="fas fa-download fa-sm text-white-50"></i> Upload from file</a>--%>
                            <a href="report.aspx" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                <i class="fas fa-download fa-sm text-white-50"></i>Generate Report</a>
                        </div>



                        <!-- Content Row -->

                        <div class="row">

                            <!-- Area Chart -->
                            <div class="col-xl-8 col-lg-7">
                                <div class="card shadow mb-4">
                                    <p>Culture Results</p>
                                    <asp:GridView ID="gvResult" runat="server" Style="font-size: 12px" Width="1200px" CellPadding="3" AutoGenerateColumns="False" AutoGenerateEditButton="true" DataKeyNames="ResultID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoPostBack="true" OnSorting="gvResult_Sorting" OnPageIndexChanging="gvResult_PageIndexChanging" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnDataBound="gvResult_DataBound">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" />
                                            <%--<asp:BoundField DataField="ResultID" HeaderText="ResultID" InsertVisible="False" ReadOnly="True" SortExpression="ResultID" />--%>
                                            <asp:BoundField DataField="PatientId" HeaderText="PatientId" SortExpression="PatientId" />
                                            <asp:BoundField DataField="Smear_res" HeaderText="Primary Smear" SortExpression="Smear_res" />
                                            <asp:BoundField DataField="RD9_res" HeaderText="RD9" SortExpression="RD9_res" />

                                            <asp:BoundField DataField="LJ_res" HeaderText="LJ-G" SortExpression="LJ_res" />
                                            <asp:BoundField DataField="LJ_P_res" HeaderText="LJ-P" SortExpression="LJ_P_res" />
                                            <asp:BoundField DataField="MIJT_res" HeaderText="MGIT" SortExpression="MIJT_res" />
                                            <asp:BoundField DataField="HeatKilled_res" HeaderText="Heat Killed" SortExpression="HeatKilled_res" />
                                            <asp:BoundField DataField="BHI" HeaderText="BHI" SortExpression="BHI" />
                                            <asp:BoundField DataField="CultureSmear_res" HeaderText="Media/Culture Smear" SortExpression="CultureSmear_res" />
                                            <asp:BoundField DataField="FinalCultureResult" HeaderText="FinalCultureResult" SortExpression="FinalCultureResult" />
                                            <asp:BoundField DataField="Spoligo_res" HeaderText="Spoligo" SortExpression="Spoligo_res" />
                                            <asp:BoundField DataField="LabInitial" HeaderText="Initial" SortExpression="LabInitial" />
                                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />


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
                                        SelectCommand="SELECT [ResultID],[PatientId],[Smear_res],[HeatKilled_res],[RD9_res],[LJ_res],[LJ_P_res],[MIJT_res],[CultureSmear_res],[Spoligo_res],[BHI],[FinalCultureResult],[LabInitial],[Remark] FROM Results ORDER BY ResultID DESC"
                                        UpdateCommand="UPDATE Results SET [PatientId]=@PatientId,[Smear_res]=@Smear_res,[HeatKilled_res]=@HeatKilled_res,[RD9_res]=@RD9_res,[LJ_res]=@LJ_res,[LJ_P_res]=@LJ_P_res,[MIJT_res]=@MIJT_res,[CultureSmear_res]=@CultureSmear_res,[Spoligo_res]=@Spoligo_res,[BHI]=@BHI,[FinalCultureResult]=@FinalCultureResult,[LabInitial]=@LabInitial,[Remark]=@Remark
                      WHERE ResultID=@ResultID">
                                        <UpdateParameters>
                                            <asp:Parameter Name="PatientId" Type="String" />
                                            <asp:Parameter Name="Smear_res" Type="String" />
                                            <asp:Parameter Name="HeatKilled_res" Type="String" />
                                            <asp:Parameter Name="RD9_res" Type="String" />
                                            <asp:Parameter Name="LJ_res" Type="String" />
                                            <asp:Parameter Name="LJ_P_res" Type="String" />
                                            <asp:Parameter Name="MIJT_res" Type="String" />
                                            <asp:Parameter Name="CultureSmear_res" Type="String" />
                                            <asp:Parameter Name="Spoligo_res" Type="String" />
                                            <asp:Parameter Name="BHI" Type="String" />
                                            <asp:Parameter Name="FinalCultureResult" Type="String" />
                                            <asp:Parameter Name="LabInitial" Type="String" />
                                            <asp:Parameter Name="Remark" Type="String" />
                                            <asp:Parameter Name="ResultID" Type="Int32" />

                                        </UpdateParameters>
                                    </asp:SqlDataSource>

                                </div>
                            </div>


                        </div>

                         <div class="row">
                            Filter your search here 
                             <!-- Content Column -->
                            <div class="col-lg-12 mb-4">


                                <asp:DropDownList ID="ddlCOlVal" runat="server" Height="26px" Width="150px" DataTextField="column_name" DataValueField="column_name">
                                     <asp:ListItem>PatientId</asp:ListItem>
                                     <asp:ListItem>Smear_res</asp:ListItem>
                                     <asp:ListItem>CultureSmear_res</asp:ListItem>
                                     <asp:ListItem>LJ_res</asp:ListItem>
                                     <asp:ListItem>LJ_P_res</asp:ListItem>
                                     <asp:ListItem>MIJT_res</asp:ListItem>
                                     <asp:ListItem>RD9_res</asp:ListItem>
                                     <asp:ListItem>Spoligo_res</asp:ListItem>
                                     <asp:ListItem>HeatKilled_res</asp:ListItem>
                                     <asp:ListItem>BHI</asp:ListItem>
                                    <asp:ListItem>FinalCultureResult</asp:ListItem>
                                     <asp:ListItem>Labinitial</asp:ListItem>                                   
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>" SelectCommand="select column_name from information_schema.columns where table_name = 'Results'"></asp:SqlDataSource>

                                <asp:DropDownList ID="ddlCompare" runat="server" Height="26px" Width="155px">
                                    <asp:ListItem>equals</asp:ListItem>
                                    <asp:ListItem>starts with</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txtCompVal" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" CssClass="btn-primary" runat="server" Text="Filter" OnClick="btnFilter_Click" />

                            </div>

                        </div>

                        <!-- Content Row -->
                        <div class="row">

                            <!-- Area Chart -->
                            <div class="col-xl-8 col-lg-7">
                                <div class="card shadow mb-4">
                                    <p>Drug Susceptibility</p>

                                    <asp:GridView ID="gvDstResult" runat="server" Style="font-size: 12px" Width="1200px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="PatientId" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnDataBound="gvDstResult_DataBound">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" />
                                            <%--<asp:BoundField DataField="ResultID" HeaderText="ResultID" InsertVisible="False" ReadOnly="True" SortExpression="ResultID" />--%>
                                            <asp:BoundField DataField="PatientId" HeaderText="PatientId" SortExpression="PatientId" />
                                            <asp:BoundField DataField="DrugLine" HeaderText="Line" SortExpression="DrugLine" />
                                            <asp:BoundField DataField="Drug" HeaderText="Drug" SortExpression="Drug" />

                                            <asp:BoundField DataField="Sensitivity" HeaderText="Susceptbility" SortExpression="Sensitivity" />
                                            <asp:BoundField DataField="Dater" HeaderText="Date" SortExpression="Dater" />
                                            <asp:BoundField DataField="Initial" HeaderText="Initial" SortExpression="Initial" />



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

                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>" SelectCommand="SELECT DstID,PatientId,DrugLine,Drug,Sensitivity,Dater,Initial FROM Dsts"></asp:SqlDataSource>

                                </div>
                            </div>


                        </div>

                        <!-- Content Row -->
                        <div class="row">

                            <!-- Area Chart -->
                            <div class="col-xl-8 col-lg-7">
                                <div class="card shadow mb-4">
                                    <p>Growth Detection</p>
                                    <asp:GridView ID="gvGrowthResult" runat="server" Style="font-size: 12px" Width="1200px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="PatientId" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnDataBound="gvGrowthResult_DataBound">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" />
                                            <%--<asp:BoundField DataField="GrowthID" HeaderText="GrowthID" InsertVisible="False" ReadOnly="True" SortExpression="ResultID" />--%>
                                            <asp:BoundField DataField="PatientId" HeaderText="PatientId" SortExpression="PatientId" />
                                            <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
                                            <asp:BoundField DataField="dat1" HeaderText="Primary Media" SortExpression="Primary Media" />
                                            <asp:BoundField DataField="dat2" HeaderText="Detail" SortExpression="Result" />
                                            <asp:BoundField DataField="Dater" HeaderText="Date" SortExpression="Dater" />
                                            <asp:BoundField DataField="Initial" HeaderText="Initial" SortExpression="Initial" />
                                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />



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

                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>" SelectCommand="SELECT GrowthID,PatientId,Week,dat1,dat2,Dater,Initial,Remark FROM Growths ORDER BY PatientId,Week,dat1 ASC"></asp:SqlDataSource>

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
</html>
