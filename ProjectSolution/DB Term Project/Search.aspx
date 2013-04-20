<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Search.aspx.cs" Inherits="DB_Term_Project.Search" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Search
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" CellPadding="4" 
            DataMember="DefaultView" ForeColor="#333333" 
            GridLines="None" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
            <Columns>
            <asp:BoundField DataField="Eid" HtmlEncode="False" HeaderText="Eid" ReadOnly="True" />
            <asp:BoundField DataField="Username" HtmlEncode="False" HeaderText="Username" ReadOnly="True" />
            <asp:BoundField DataField="Firstname" HtmlEncode="False" HeaderText="Firstname" ReadOnly="True" />
            <asp:BoundField DataField="Lastname" HtmlEncode="False" HeaderText="Lastname" ReadOnly="True" />
            <asp:BoundField DataField="Address" HtmlEncode="False" HeaderText="Address" ReadOnly="True" />
            <asp:BoundField DataField="Birthdate" HtmlEncode="False" DataFormatString = "{0:d}" HeaderText="Birthdate" ReadOnly="True" />
            <asp:BoundField DataField="Position" HtmlEncode="False" HeaderText="Position" ReadOnly="True" />
            <asp:BoundField DataField="Mgrid" HtmlEncode="False" HeaderText="Mgrid" ReadOnly="True" />
            <asp:BoundField DataField="Wage" HtmlEncode="False" DataFormatString = "{0:c}" HeaderText="Wage" ReadOnly="True" />
            </Columns>            
        </asp:GridView>

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
            <asp:ListItem Value="5">ManagerID</asp:ListItem>
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
    &nbsp;
        <asp:Literal ID="InvalidInput" runat="server" 
            Text="<span style='color:red;'>Invalid Input. Please try again.</span>" 
            Visible="False"></asp:Literal>
    </p>
</asp:Content>
