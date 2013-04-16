<%@ Page Title="Add Hours" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="AddHours.aspx.cs" Inherits="DB_Term_Project.AddHours" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent"> 
    <h2>
        Add Daily HourS</h2>
<p>
        Enter Eid&nbsp; // change to use the eid of person logged in automatically</p>
    <p>
        <asp:TextBox ID="EidTextBox" runat="server" 
            ontextchanged="EidTextBox_TextChanged"></asp:TextBox>
    </p>
<p>
        Select Day
        <asp:Calendar ID="Calendar1" runat="server" 
            onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
    </p>
    Enter number of hours worked<br />
    <asp:TextBox ID="HoursTextBox" runat="server" 
        ontextchanged="HoursTextBox_TextChanged"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="SubmitHoursButton" runat="server" onclick="Button1_Click" Text="Submit Hours" />
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="SelectDateLabel" runat="server" Text="Please select a date" Visible="False"></asp:Label>
    <br />
</asp:Content>
