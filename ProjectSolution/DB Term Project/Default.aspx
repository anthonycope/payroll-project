<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="DB_Term_Project._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Current Employees</h2>
    <h2>
        &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Eid" DataSourceID="SqlDataSource1" 
            EmptyDataText="There are no data records to display." CellPadding="4" 
            ForeColor="#333333" GridLines="None" Height="191px" BorderStyle="Solid" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Eid" HeaderText="Eid" ReadOnly="True" 
                    SortExpression="Eid" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="address" HeaderText="address" 
                    SortExpression="address" />
                <asp:BoundField DataField="birthdate" DataFormatString="{0:d}" 
                    HeaderText="birthdate" SortExpression="birthdate" />
                <asp:BoundField DataField="position" HeaderText="position" 
                    SortExpression="position" />
                <asp:BoundField DataField="mgrid" HeaderText="mgrid" SortExpression="mgrid" />
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
            ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString1 %>" 
            DeleteCommand="DELETE FROM [Employees] WHERE [Eid] = @Eid" 
            InsertCommand="INSERT INTO [Employees] ([Eid], [username], [password], [name], [address],
                           [birthdate], [position], [mgrid]) VALUES (@Eid, @username, @password, @name, @address, @birthdate, @position, @mgrid)" 
            ProviderName="<%$ ConnectionStrings:DBProjectConnectionString1.ProviderName %>" 
            SelectCommand="SELECT [Eid], [username], [password], [name], [address],
                           [birthdate], [position], [mgrid] FROM [Employees] WHERE ([position] = @position)" 
            
            UpdateCommand="UPDATE [Employees] SET [username] = @username, [password] = @password,
             [name] = @name, [address] = @address, [birthdate] = @birthdate, [position] = @position, [mgrid] = @mgrid WHERE [Eid] = @Eid">
            <DeleteParameters>
                <asp:Parameter Name="Eid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Eid" Type="Int32" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter DbType="Date" Name="birthdate" />
                <asp:Parameter Name="position" Type="String" />
                <asp:Parameter Name="mgrid" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="Engineer" 
                    Name="position" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter DbType="Date" Name="birthdate" />
                <asp:Parameter Name="position" Type="String" />
                <asp:Parameter Name="mgrid" Type="Int32" />
                <asp:Parameter Name="Eid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </h2>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" ontextchanged="TextBox1_TextChanged"></asp:TextBox>
    </p>
</asp:Content>
