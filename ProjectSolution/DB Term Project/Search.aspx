<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Search.aspx.cs" Inherits="DB_Term_Project.Search" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Search
    </h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" 
            DataKeyNames="Eid" DataSourceID="SqlDataSource1" CellPadding="4" 
            ForeColor="#333333" GridLines="None" Width="689px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Eid" HeaderText="Eid" ReadOnly="True" 
                    SortExpression="Eid" />
                <asp:BoundField DataField="name" HeaderText="name" 
                    SortExpression="name" />
                <asp:BoundField DataField="address" HeaderText="address" 
                    SortExpression="address" />
                <asp:BoundField DataField="birthdate" HeaderText="birthdate" 
                    SortExpression="birthdate" />
                <asp:BoundField DataField="position" HeaderText="position" 
                    SortExpression="position" />
                <asp:BoundField DataField="mgrid" 
                    HeaderText="mgrid" SortExpression="mgrid" />
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
            ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>" 
            
            SelectCommand="Search" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="eid" Type="Int32" />
                <asp:Parameter DbType="Date" Name="birthdate" />
                <asp:Parameter Name="hours" Type="Single" />
                <asp:Parameter Name="position" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" Height="20px" 
            Width="147px">
            <asp:ListItem>Eid</asp:ListItem>
            <asp:ListItem>Name</asp:ListItem>
            <asp:ListItem>Position</asp:ListItem>
            <asp:ListItem>Birthdate</asp:ListItem>
            <asp:ListItem>ManagerID</asp:ListItem>
        </asp:ListBox>
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
