<%@ Page Title="Change Employee Information" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" 
    CodeBehind="ChangeEmployeeInfo.aspx.cs" Inherits="DB_Term_Project.ChangeEmployeeInfo" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
    <h1 align="center">
        <b>Change Employee Information</b>
    </h1>
    <p>
        Employee ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="EmployeeIDChangeTextBox" runat="server" 
            style="margin-bottom: 0px"></asp:TextBox> <br /> <br />
        Wage&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="WageChangeTextBox" runat="server"></asp:TextBox> <br /> <br />
        Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="AddressChangeTextBox" runat="server"></asp:TextBox> <br /> <br />
        Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="UsernameChangeTextBox" runat="server"></asp:TextBox><br /> <br />
        Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="PasswordChangeTextBox" runat="server"></asp:TextBox><br /> <br />
        Confirm Password&nbsp;&nbsp;&nbsp; <asp:TextBox ID="ConfirmPasswordChangeTextBox" runat="server"></asp:TextBox><br /> <br />
        Position&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="PositionChangeTextBox" runat="server"></asp:TextBox><br /> <br />
        Manager ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="MgrIDChangeTextbox" runat="server"></asp:TextBox> <br /><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SubmitChangesButton" runat="server" Text="Submit Changes" OnClick="SubmitChangesButton_Clicked" />     
    </p>   
</asp:Content>