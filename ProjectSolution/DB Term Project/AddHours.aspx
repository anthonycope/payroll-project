<%@ Page Title="Add Hours" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="AddHours.aspx.cs" Inherits="DB_Term_Project.AddHours" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent"> 
    <h2>
        Add/Edit Daily Hours</h2>
<p>
    <asp:Literal ID="LiteralEid" runat="server" Visible="false">Enter Eid</asp:Literal></p>
    <p>
        <asp:TextBox ID="EidTextBox" runat="server" 
            ontextchanged="EidTextBox_TextChanged" Visible="False"></asp:TextBox>
    &nbsp;<asp:Literal ID="InvalidInput2" runat="server" 
            Text="&lt;span style='color:red;'&gt;Invalid Input&lt;/span&gt;" 
            Visible="False"></asp:Literal>
    </p>
<p>
        Select Day
        <asp:Calendar ID="Calendar1" runat="server" 
            onselectionchanged="Calendar1_SelectionChanged" OnLoad="Calendar1_SelectionChanged"></asp:Calendar>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Hours_Worked" HeaderText="Hours_Worked" 
                    SortExpression="Hours_Worked" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#0c543b" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#0c543b" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString %>"> 
        </asp:SqlDataSource>
    </p>
    Enter number of hours worked<br />
    <asp:TextBox ID="HoursTextBox" runat="server" 
        ontextchanged="HoursTextBox_TextChanged"></asp:TextBox>
    <asp:Literal ID="InvalidInput1" runat="server" 
            Text="&lt;span style='color:red;'&gt;Invalid Input&lt;/span&gt;" 
            Visible="False"></asp:Literal>
    <br />
    <br />
    <asp:Button ID="SubmitHoursButton" runat="server" onclick="Button1_Click" Text="Submit Hours" />
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="SelectDateLabel" runat="server" Text="Please select a date" Visible="False"></asp:Label>
    <br />
</asp:Content>
