<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="approveHours.aspx.cs" Inherits="DB_Term_Project.approveHours" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
            font-size: medium;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="WeekHourGridView" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" 
        onselectedindexchanged="WeekHourGridView_SelectedIndexChanged" 
        DataKeyNames="Eid,weekOf">
        <Columns>
            <asp:CommandField SelectText="Approve" ShowSelectButton="True" 
                ButtonType="Button" />
            <asp:BoundField DataField="Eid" HeaderText="Eid" ReadOnly="True" 
                SortExpression="Eid" />
            <asp:BoundField DataField="weekOf" HeaderText="weekOf" ReadOnly="True" 
                SortExpression="weekOf" />
            <asp:BoundField DataField="Hours_Worked" HeaderText="Hours_Worked" 
                SortExpression="Hours_Worked" />
            <asp:BoundField DataField="PayCheck" HeaderText="PayCheck" ReadOnly="True" 
                SortExpression="PayCheck" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#0c543b" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#0c543b" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#094f39" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#094f39" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#094f39" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>" 
    SelectCommand="SELECT w.Eid, w.weekOf, w.Hours_Worked, w.Hours_Worked * e.Wage AS PayCheck FROM Weekly_Hours AS w INNER JOIN Employees AS e ON w.Eid = e.Eid AND e.Mgrid = 1">
    </asp:SqlDataSource>
    <span class="style1"><strong>
    <br />
    <br />
    Employees Weeks Awaiting Approval</strong></span><br />
    <asp:GridView ID="GridViewAwaitingApproval" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Eid,weekOf" DataSourceID="SqlDataSource3" AllowPaging="True" 
        AllowSorting="True" 
        onselectedindexchanged="GridViewAwaitingApproval_SelectedIndexChanged">
        <Columns>
            <asp:CommandField SelectText="Approve" ShowSelectButton="True" 
                ButtonType="Button" />
            <asp:BoundField DataField="Eid" HeaderText="Eid" ReadOnly="True" 
                SortExpression="Eid" />
            <asp:BoundField DataField="weekOf" HeaderText="weekOf" ReadOnly="True" 
                SortExpression="weekOf" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" 
                SortExpression="Amount" />
            <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
            <asp:BoundField DataField="Approved" HeaderText="Approved" 
                SortExpression="Approved" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#0c543b" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#0c543b" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#094f39" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#094f39" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#094f39" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>" 
        SelectCommand="SELECT [Eid], [weekOf], [mgrid], [Amount], [Hours], [Approved] FROM [Approval] WHERE ([Approved] = 'Awaiting Approval') AND mgrid = 1">
        <SelectParameters>
            <asp:Parameter DefaultValue="'Awaiting Approval'" Name="Approved" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <br />
    <asp:Literal ID="Literal2" runat="server"></asp:Literal>
    <br />
    <asp:Literal ID="Literal3" runat="server"></asp:Literal>
</asp:Content>
