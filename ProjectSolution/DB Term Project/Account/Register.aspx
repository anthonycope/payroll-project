<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="DB_Term_Project.Account.Register" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <p>
    <h2 align="center"> Create a New Account </h2> <br />
        Use the form below to create a new account. <br />
        Passwords are required to be a minimum of <%= Membership.MinRequiredPasswordLength %> characters in length. <br />
    <span class="failureNotification">
        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
    <br />
    <asp:Label ForeColor="Red" ID="usernameErrorLabel" runat="server">Username Already Exists</asp:Label>
    </span></p>
<div class="accountInfo">
    <fieldset id="employeeField" class="register">
        <legend>Employee Information</legend>
        <p>
            <asp:Label ID="FirstnameLabel" runat="server" AssociatedControlID="FirstnameTextBox">First Name:</asp:Label>
            <asp:TextBox ID="FirstnameTextBox" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirstnameTextBox" 
                    CssClass="failureNotification" ErrorMessage="First name is required." ToolTip="First name is required." 
                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="LastnameLabel" runat="server" AssociatedControlID="LastnameTextBox">Last Name:</asp:Label>
            <asp:TextBox ID="LastnameTextBox" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastnameTextBox" 
                    CssClass="failureNotification" ErrorMessage="Last name is required." ToolTip="Last name is required." 
                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
        </p>
        <p>

            <asp:Label ID="PositionLabel" runat="server" AssociatedControlID="PositionTextBox">Position:</asp:Label>
            <asp:TextBox ID="PositionTextBox" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PositionTextBox" 
                    CssClass="failureNotification" ErrorMessage="Position is required." ToolTip="Position is required." 
                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="BirthdayLabel" runat="server" AssociatedControlID="BirthdayTextBox">Date of Birth (MM/DD/YYYY):</asp:Label>
            <asp:TextBox ID="BirthdayTextBox" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="BirthdayTextBox" 
                    CssClass="failureNotification" ErrorMessage="DOB is required." ToolTip="DOB is required." 
                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="AddressLabel" runat="server" AssociatedControlID="AddressTextBox">Address:</asp:Label>
            <asp:TextBox ID="AddressTextBox" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="AddressTextBox" 
                    CssClass="failureNotification" ErrorMessage="Address is required." ToolTip="Address is required." 
                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="WageLabel" runat="server" AssociatedControlID="WageTextBox">Wage:</asp:Label>
            <asp:TextBox ID="WageTextBox" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="WageTextBox" 
                    CssClass="failureNotification" ErrorMessage="Address is required." ToolTip="Wage is required" 
                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
        </p>
    </fieldset>
</div>
<asp:Label ID="AccountTypeLabel" runat="server" AssociatedControlID="AccountTypeDropDown">Account Type: </asp:Label>
<asp:DropDownList ID="AccountTypeDropDown" runat="server">
    <asp:ListItem  Value="user">User</asp:ListItem>
    <asp:ListItem Value="admin">Admin</asp:ListItem>
</asp:DropDownList>
<div id="accountField" class="accountInfo">
    <fieldset class="register">
        <legend>Account Information</legend>
        <p>
            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
            <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                    CssClass="failureNotification" ErrorMessage="Username is required." ToolTip="Username is required." 
                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                    CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
            <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" 
                    ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired" runat="server" 
                    ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                    CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                    ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
        </p>
    </fieldset>
    <p class="submitButton">
        <asp:Button ID="CreateUserButton" runat="server" CommandName="MoveNext" Text="Create User" 
                ValidationGroup="RegisterUserValidationGroup" 
            onclick="CreateUserButton_Click"/>
    </p>
</div>                
</asp:Content>
