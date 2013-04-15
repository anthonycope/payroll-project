<%@ Page Title="Add Hours" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="AddHours.aspx.cs" Inherits="DB_Term_Project.AddHours" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Add Daily Hours</h2>
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
