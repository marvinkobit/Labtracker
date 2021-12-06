<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Labtracker._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContentDS" runat="server">

    <div class="jumbotron">
        <h1>TBGEN Labtracker</h1>
        <p class="lead">track and monitor the lab activities of TBGEN project. It's intended to be used by Project members.</p>
        <p><a href="dashboard" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Recieving</h2>
            <p>
                Data capture of samples 
            </p>
            <p>
                <a class="btn btn-default" href="sample-receiving.aspx">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Progress</h2>
            <p>
                data on results of progress test on the samples.
            </p>
            <p>
                <a class="btn btn-default" href="progress.aspx">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Report</h2>
            <p>
                generate reports in pdf,excel and other formats on multiple data.
            </p>
            <p>
                <a class="btn btn-default" href="report.aspx">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
