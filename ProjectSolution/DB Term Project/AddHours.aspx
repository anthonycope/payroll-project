<%@ Page Title="Add Hours" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="AddHours.aspx.cs" Inherits="DB_Term_Project.AddHours" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent"> 
    <h2>
        Add/Edit Daily HourS</h2>
<p>
        Enter Eid&nbsp; // change to use the eid of person logged in automatically</p>
    <p>
        <asp:TextBox ID="EidTextBox" runat="server" 
            ontextchanged="EidTextBox_TextChanged"></asp:TextBox>
    &nbsp;</p>
<p>
        Select Day
        <asp:Calendar ID="Calendar1" runat="server" 
            onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            ShowHeaderWhenEmpty="True">
            <Columns>
                <asp:BoundField DataField="Hours_Worked" HeaderText="Hours_Worked" 
                    SortExpression="Hours_Worked" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString2 %>" 
            SelectCommand="SELECT [Hours_Worked] FROM [Daily_Hours] WHERE (([Day_Of] = @Day_Of) AND ([Eid] = @Eid))">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Day_Of" 
                    PropertyName="SelectedDate" />
                <asp:SessionParameter Name="Eid" SessionField="Eid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    Enter number of hours worked<br />
    <asp:TextBox ID="HoursTextBox" runat="server" 
        ontextchanged="HoursTextBox_TextChanged"></asp:TextBox>
    <asp:Literal ID="InvalidInput1" runat="server" 
            Text="<span style='color:red;'>Invalid Hours</span>" 
            Visible="False"></asp:Literal>
    <br />
    <br />
    <asp:Button ID="SubmitHoursButton" runat="server" onclick="Button1_Click" Text="Submit Hours" />
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="SelectDateLabel" runat="server" Text="Please select a date" Visible="False"></asp:Label>
    <br />
</asp:Content>
