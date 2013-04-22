<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeApproved.aspx.cs" Inherits="DB_Term_Project.EmployeeApproved" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            font-size: large;
        }
        .style3
        {
            font-size: large;
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 align="center">
        <b>Approval History</b>
    </h1>
    <p class="style3">
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource3" DataTextField="Eid" DataValueField="Eid" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>" 
            SelectCommand="SELECT [Eid] FROM [Employees]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p class="style3">
        <strong>Approved Hours</strong></p>
    <p class="style2">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="weekOf" HeaderText="weekOf" 
                    SortExpression="weekOf" />
                <asp:BoundField DataField="mgrid" HeaderText="mgrid" SortExpression="mgrid" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                    SortExpression="Amount" />
                <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>" 
            SelectCommand="SELECT [weekOf], [mgrid], [Amount], [Hours] FROM [Approval] WHERE eid = 0 AND Approved = 'Approved'">
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p class="style3">
        <strong>Hours Pending Approval</strong></p>
    <p class="style2">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="weekOf" HeaderText="weekOf" 
                    SortExpression="weekOf" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                    SortExpression="Amount" />
                <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
                <asp:BoundField DataField="mgrid" HeaderText="mgrid" SortExpression="mgrid" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>" 
            SelectCommand="SELECT [weekOf], [Amount], [Hours], [mgrid] FROM [Approval] WHERE eid = 0 AND APPROVED = 'Awaiting Approval'">
        </asp:SqlDataSource>
    </p>
</asp:Content>
