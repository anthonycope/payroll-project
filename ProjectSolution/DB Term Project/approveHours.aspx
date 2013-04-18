<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="approveHours.aspx.cs" Inherits="DB_Term_Project.approveHours" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    Manager Id&#39;s<br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
        DataSourceID="SqlDataSource2" DataTextField="mgrid" DataValueField="mgrid" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString2 %>" 
        SelectCommand="SELECT DISTINCT [mgrid] FROM [Employees]">
    </asp:SqlDataSource>
    <asp:GridView ID="WeekHourGridView" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" 
        onselectedindexchanged="WeekHourGridView_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="mgrid" HeaderText="mgrid" SortExpression="mgrid" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString2 %>" 
        
        
    SelectCommand="SELECT w.Eid, w.weekOf, w.Hours_Worked FROM Weekly_Hours AS w INNER JOIN Employees AS e ON w.Eid = e.Eid AND e.Mgrid = 1">
    </asp:SqlDataSource>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <br />
    <asp:Literal ID="Literal2" runat="server"></asp:Literal>
    <br />
    <asp:Literal ID="Literal3" runat="server"></asp:Literal>
</asp:Content>
