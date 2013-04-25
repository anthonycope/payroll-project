<%@ Page Title="View Hours" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="ViewHours.aspx.cs" Inherits="DB_Term_Project.ViewHours" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent"> 
    <h2>
        View daily hours</h2>
<p>
       <asp:Literal ID="LiteralEid" runat="server" Visible="false">Enter Eid</asp:Literal></p>
    <p>
        <asp:TextBox ID="EidTextBox" runat="server" 
            ontextchanged="EidTextBox_TextChanged" Visible="false"></asp:TextBox>
    &nbsp;</p>
<p>
        Select Day
        <asp:Calendar ID="Calendar1" runat="server" 
            onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
    </p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Eid,Day_Of" DataSourceID="SqlDataSource1" 
        ShowHeaderWhenEmpty="True">
        <Columns>
            <asp:BoundField DataField="Eid" HeaderText="Eid" ReadOnly="True" 
                SortExpression="Eid" />
            <asp:BoundField DataField="Day_Of" HeaderText="Day_Of" ReadOnly="True" 
                SortExpression="Day_Of" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Hours_Worked" HeaderText="Hours_Worked" 
                SortExpression="Hours_Worked" />
        </Columns>
    </asp:GridView>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>">
        </asp:SqlDataSource>
    </p>
    &nbsp;&nbsp;&nbsp;
    <br />
</asp:Content>
