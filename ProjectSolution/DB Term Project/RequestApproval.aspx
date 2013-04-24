<%@ Page Title="Request Approval" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="RequestApproval.aspx.cs" Inherits="DB_Term_Project.RequestApproval" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent"> 
    <h2>
        Request TimeSheet Approval</h2>
<p>
        Select Week
        <asp:Calendar ID="Calendar1" runat="server" 
            onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
    </p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  CellPadding="4" 
        ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="weekOf" HeaderText="weekOf" 
                SortExpression="weekOf" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Hours_Worked" HeaderText="Hours_Worked" 
                SortExpression="Hours_Worked" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#0c543b" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#0c543b" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
<<<<<<< HEAD
        ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString2 %>" 
        SelectCommand="SELECT weekOf, Hours_Worked FROM Weekly_Hours WHERE (Eid = @eid) AND (weekOf = @weekOf)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="eid" SessionField="Eid" />
            <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="weekOf" 
                PropertyName="Value" />
        </SelectParameters>
=======
        ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>">
>>>>>>> origin/Jesse
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="SubmitApprovalButton" runat="server" onclick="ApprovalButton_Click" 
        Text="Request Approval" />
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="SelectDateLabel" runat="server" Text="Please select a date" Visible="False"></asp:Label>
    <br />
    <asp:HiddenField ID="HiddenField1" runat="server" 
         Visible="False" />
</asp:Content>
