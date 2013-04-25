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
            SelectCommand="SELECT [Eid] FROM [Employees] WHERE mgrid = @eid">
            <SelectParameters>
                <asp:SessionParameter Name="eid" SessionField="Eid" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p class="style3">
        <strong>Approved Hours</strong></p>
    <p class="style2">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="weekOf" HeaderText="weekOf" 
                    SortExpression="weekOf" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" DataFormatString="{0:c}" />
                <asp:BoundField DataField="Hours" HeaderText="Hours" 
                    SortExpression="Hours" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>" 
            SelectCommand="SELECT [weekOf], [Amount], [Hours] FROM [Approval] WHERE eid = 0 AND Approved = 'Approved'">
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p class="style3">
        <strong>Hours Pending Approval</strong></p>
    <p class="style2">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="weekOf" HeaderText="weekOf" 
                    SortExpression="weekOf" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                    SortExpression="Amount" DataFormatString="{0:c}" />
                <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>" 
            SelectCommand="SELECT [weekOf], [Amount], [Hours] FROM [Approval] WHERE eid = 0 AND APPROVED = 'Awaiting Approval'">
        </asp:SqlDataSource>
    </p>
</asp:Content>
