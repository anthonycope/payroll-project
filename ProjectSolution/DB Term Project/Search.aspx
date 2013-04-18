<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Search.aspx.cs" Inherits="DB_Term_Project.Search" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Search
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Eid" 
            DataMember="DefaultView" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" ShowHeaderWhenEmpty="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Eid" HeaderText="Eid" ReadOnly="True" 
                    SortExpression="Eid" />
                <asp:BoundField DataField="username" HeaderText="username" 
                    SortExpression="username" />
                <asp:BoundField DataField="firstname" HeaderText="firstname" 
                    SortExpression="firstname" />
                <asp:BoundField DataField="lastname" HeaderText="lastname" 
                    SortExpression="lastname" />
                <asp:BoundField DataField="address" HeaderText="address" 
                    SortExpression="address" />
                <asp:BoundField DataField="birthdate" HeaderText="birthdate" 
                    SortExpression="birthdate" />
                <asp:BoundField DataField="position" HeaderText="position" 
                    SortExpression="position" />
                <asp:BoundField DataField="mgrid" HeaderText="mgrid" SortExpression="mgrid" />
                <asp:BoundField DataField="wage" HeaderText="wage" SortExpression="wage" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString2 %>" 
            SelectCommand="IF @Choice = 0 SELECT Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (Eid = @text);
 ELSE IF @Choice = 1 SELECT Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (firstname = @text); 
ELSE IF @Choice = 2 SELECT Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (lastname = @text); 
ELSE IF @Choice = 3 SELECT Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (position = @text); 
ELSE IF @Choice = 4 SELECT Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (birthdate = @text); 
ELSE IF @Choice = 5 SELECT Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (mgrid = @text);
ELSE IF @Choice = 6 SELECT  Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (username = @text);
ELSE IF @Choice = 7 SELECT  Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (wage= @text);
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="CHOICE" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="SearchTextBox" DefaultValue="" Name="text" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </h2>
    <p>
        &nbsp;</p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="154px">
            <asp:ListItem Value="0">Eid</asp:ListItem>
            <asp:ListItem Value="1">FirstName</asp:ListItem>
            <asp:ListItem Value="2">LastName</asp:ListItem>
            <asp:ListItem Value="3">Position</asp:ListItem>
            <asp:ListItem Value="4">Birthdate</asp:ListItem>
            <asp:ListItem Value="5">MangerID</asp:ListItem>
            <asp:ListItem Value="6">Username</asp:ListItem>
            <asp:ListItem Value="7">Wage</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        Search Text</p>
    <p>
        <asp:TextBox ID="SearchTextBox" runat="server" 
            ontextchanged="SearchTextBox_Changed"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SearchButton" runat="server" onclick="SearchButton_Click" 
            Text="Search" />
    </p>
</asp:Content>
