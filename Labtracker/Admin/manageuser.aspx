<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageuser.aspx.cs" Inherits="Labtracker.Admin.manageuser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>TBGE Lab Monitor  - Register</title>

    <!-- Custom fonts for this template-->
    <link href="../Content/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="../Content/css/sb-admin-2.min.css" rel="stylesheet" />

</head>

<body runat="server" class="bg-gradient-secondary">

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
                                <h2 class="h4 text-gray-900 mb-4">User:
                                    <asp:Label runat="server" ID="txtUserSelected"></asp:Label></h2>
                            </div>
                            <form class="user" runat="server">
                                <asp:Literal runat="server" ID="StatusMessage" />
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        User Name:
                    <asp:TextBox runat="server" Enabled="false" class="form-control" ID="txtUserName" placeholder="UserName" />
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        Phone:
                    <asp:TextBox runat="server" Enabled="false" class="form-control form-control-user" ID="txtPhone" placeholder="" />

                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <asp:Label runat="server">User Role:</asp:Label>
                                        <asp:TextBox Enabled="false" class="form-control form-control-user" runat="server" ID="txtUserRole" placeholder="User Role" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <asp:Label runat="server">Grant Access:</asp:Label>
                                        <asp:DropDownList ID="ddlProjectGrant" DataSourceID="SqlDataSourceProjectGrant" class="form-control" ToolTip="Projects" DataTextField="ProjectStr" runat="server">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceProjectGrant" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>"
                                            SelectCommand="SELECT DISTINCT ProjectStr FROM Projects"></asp:SqlDataSource>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label runat="server">Revoke Access:</asp:Label>
                                        <asp:DropDownList ID="ddlProjectRevoke" DataSourceID="SqlDataSourceProjectRevoke" class="form-control" ToolTip="Projects" DataTextField="ProjectStr" runat="server">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceProjectRevoke" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>"
                                            SelectCommand="SELECT DISTINCT ProjectStr FROM Projects"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <asp:Button runat="server" OnClick="GrantUser_Click" Text="Grant" CssClass="btn  btn-primary btn-user btn-block" />
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <asp:Button runat="server" OnClick="RevokeUser_Click" Text="Revoke" CssClass="btn  btn-primary btn-user btn-block" />
                                    </div>
                                </div>

                                <hr>


                                <!-- ../Content Row -->
                                <div class="row">

                                    <!-- Area Chart -->
                                    <div class="col-xl-12 col-lg-8">
                                        <div class="card shadow mb-4 table-responsive">
                                            <p>
                                                Projects:
                                        <asp:Label runat="server" ID="lblUsers" Text=""></asp:Label>
                                            </p>

                                            <asp:GridView ID="gvUserProjects" runat="server" DataSourceID="SqlDataSourceUP" Style="font-size: 12px" Width="100%" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" AllowSorting="True" AutoPostBack="true" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="table table-bordered table-condensed">

                                                <Columns>
                                                    <asp:CommandField ShowSelectButton="True" />

                                                    <asp:BoundField DataField="ProjectStr" HeaderText="ProjectStr" SortExpression="ProjectStr" />
                                                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                                                    <asp:BoundField DataField="RoleName" HeaderText="Role" SortExpression="RoleName" />
                                                  

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
                                            <asp:SqlDataSource ID="SqlDataSourceUP" runat="server" ConnectionString="<%$ ConnectionStrings:Labtracker %>"
                                                SelectCommand="SELECT  U.[Id],P.[ProjectStr] ,U.PhoneNumber,U.LockoutEnabled,U.AccessFailedCount,U.[Email],U.[UserName],UR.UserId,UR.RoleId,R.Name as RoleName
FROM [AspNetUsers] AS U
JOIN AspNetUserRoles AS UR
ON U.Id = UR.[UserId]
JOIN AspNetRoles AS R
ON UR.RoleId = R.Id
JOIN AspNetUserClaims AS UC
ON U.Id = UC.UserId
JOIN Projects AS P
ON UC.ClaimValue = P.ProjectStr
WHERE U.Id=@UserID">
                                                <SelectParameters>
                                                    <asp:Parameter Name="UserID" DefaultValue="" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>




                                        </div>
                                    </div>
                                </div>


                            </form>





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


