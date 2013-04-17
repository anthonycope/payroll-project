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
        ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>" 
        SelectCommand="SELECT DISTINCT [mgrid] FROM [Employees]">
    </asp:SqlDataSource>
    <asp:GridView ID="WeekHourGridView" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Eid,weekOf" 
        DataSourceID="SqlDataSource1" 
        onselectedindexchanged="WeekHourGridView_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Approve" />
            <asp:BoundField DataField="Eid" HeaderText="Eid" ReadOnly="True" 
                SortExpression="Eid" />
            <asp:BoundField DataField="weekOf" HeaderText="weekOf" ReadOnly="True" 
                SortExpression="weekOf" />
            <asp:BoundField DataField="Hours_Worked" HeaderText="Hours_Worked" 
                SortExpression="Hours_Worked" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>" 
        
        SelectCommand="SELECT w.Eid, w.weekOf, w.Hours_Worked FROM Weekly_Hours AS w INNER JOIN Employees AS e ON w.Eid = e.Eid AND e.Mgrid = 1">
    </asp:SqlDataSource>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <br />
    <asp:Literal ID="Literal2" runat="server"></asp:Literal>
    <br />
    <asp:Literal ID="Literal3" runat="server"></asp:Literal>
</asp:Content>
