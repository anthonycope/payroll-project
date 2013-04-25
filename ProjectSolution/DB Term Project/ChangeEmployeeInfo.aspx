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
        <asp:TextBox ID="EmployeeIDTextBox" runat="server" 
            style="margin-bottom: 0px"></asp:TextBox> 
            <asp:Label ID="employeeIDErrorLabel" runat="server" ForeColor="Red" Visible="false">Employee ID must be a number</asp:Label> 
        <br />(cannot change)<br />Wage&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="WageChangeTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="WageErrorLabel" runat="server" ForeColor="Red" Visible="false">Wage must be a number</asp:Label> <br /><br />
        Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="AddressChangeTextBox" runat="server"></asp:TextBox> <br /> <br />
        Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="UsernameChangeTextBox" runat="server"></asp:TextBox><br /> <br />
        Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="PasswordChangeTextBox" CssClass="passwordEntry" TextMode="Password" runat="server"></asp:TextBox><br /> <br />
        Confirm Password&nbsp;&nbsp;&nbsp; <asp:TextBox ID="ConfirmPasswordChangeTextBox" CssClass="passwordEntry" TextMode="Password" runat="server"></asp:TextBox><br /> <br />
        Position&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="PositionChangeTextBox" runat="server"></asp:TextBox><br /> <br />
        Manager ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="MgrIDChangeTextbox" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;<asp:Label ID="MgrIDErrorLabel" runat="server" ForeColor="Red" Visible="false">Manager ID must be a number</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br /><br />
        <asp:Button ID="SubmitChangesButton" runat="server" Text="Submit Changes" OnClick="SubmitChangesButton_Clicked" /> 
        <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" Visible="false">Employee ID is required <br /><br /></asp:Label>  
    </p>
</asp:Content>