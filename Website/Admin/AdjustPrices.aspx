<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AdjustPrices.aspx.cs" Inherits="Website.Admin.AdjustPrices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <asp:Label ID="lblPercentage" runat="server" Text="Percentage change: "></asp:Label>
        <asp:TextBox ID="txtPercentage" runat="server" Width="40px">.03</asp:TextBox><br />
        <br />
        <asp:RadioButtonList ID="rblAdjustmentDirection" runat="server">
            <asp:ListItem Text="Lower" Value="Lower"></asp:ListItem>
            <asp:ListItem Text="Raise" Value="Raise"></asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="btnAdjustPrices" runat="server" Text="Let's do it" Width="140px"
            OnClick="btnAdjustPrices_Click" />
            <br />
            <br />
        <asp:Label ID="lblResult" runat="server" Text="" Visible="False"></asp:Label>
        <br /><br />
    <asp:GridView ID="gvPriceHistory" runat="server" AllowPaging="True" AllowSorting="True" 
            DataSourceID="SqlDataSource1">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:iftDB %>" 
            SelectCommand="SELECT * FROM [PriceHistory] ORDER BY [ModifiedDate] DESC"></asp:SqlDataSource>
</asp:Content>
