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
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" 
            onpageindexchanging="FormView1_PageIndexChanging">
            <EditItemTemplate>
                Hours_Worked:
                <asp:TextBox ID="Hours_WorkedTextBox" runat="server" 
                    Text='<%# Bind("Hours_Worked") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Hours_Worked:
                <asp:TextBox ID="Hours_WorkedTextBox" runat="server" 
                    Text='<%# Bind("Hours_Worked") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Hours_Worked:
                <asp:Label ID="Hours_WorkedLabel" runat="server" 
                    Text='<%# Bind("Hours_Worked") %>' />
                <br />

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DBProjectConnectionString2 %>" 
            SelectCommand="SELECT [Hours_Worked] FROM [Daily_Hours] WHERE (([Day_Of] = @Day_Of) AND ([Eid] = @Eid))">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="Day_Of" 
                    PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="EidTextBox" Name="Eid" PropertyName="Text" 
                    Type="Int32" />
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
