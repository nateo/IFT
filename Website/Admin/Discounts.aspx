<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Discounts.aspx.cs" Inherits="Website.Admin.Discounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Role:"></asp:Label>
    <asp:DropDownList ID="ddlRole" runat="server" DataSourceID="sdsRoles" 
        DataTextField="RoleName" DataValueField="RoleId">
    </asp:DropDownList>
    <asp:Label ID="Label2" runat="server" Text="Percentage"></asp:Label>
    <asp:TextBox ID="txtPercentage" runat="server" Width="40px"></asp:TextBox>
    <asp:Button ID="btnAddDiscount" runat="server" Text="Add discount" 
        onclick="btnAddDiscount_Click" />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DiscountID" 
        DataSourceID="sdsDiscounts">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="RoleName" HeaderText="RoleName" 
                SortExpression="RoleName" />
            <asp:BoundField DataField="DiscountPercent" HeaderText="DiscountPercent" 
                SortExpression="DiscountPercent" />
            <asp:BoundField DataField="ModifiedDate" HeaderText="ModifiedDate" 
                SortExpression="ModifiedDate" ReadOnly="True" />
            <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" 
                SortExpression="ModifiedBy" ReadOnly="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsDiscounts" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:iftDB %>" 
        DeleteCommand="DELETE FROM [Discounts] WHERE [DiscountID] = @original_DiscountID AND [RoleId] = @original_RoleId AND [DiscountPercent] = @original_DiscountPercent AND [ModifiedDate] = @original_ModifiedDate AND [ModifiedBy] = @original_ModifiedBy AND (([rowguid] = @original_rowguid) OR ([rowguid] IS NULL AND @original_rowguid IS NULL))" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="select Discounts.DiscountID, aspnet_Roles.RoleName, Discounts.DiscountPercent, ModifiedDate, ModifiedBy from Discounts, aspnet_Roles where discounts.RoleId = aspnet_Roles.RoleId" 
        UpdateCommand="UPDATE [Discounts] SET [RoleId] = @RoleId, [DiscountPercent] = @DiscountPercent, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy, [rowguid] = @rowguid WHERE [DiscountID] = @original_DiscountID AND [RoleId] = @original_RoleId AND [DiscountPercent] = @original_DiscountPercent AND [ModifiedDate] = @original_ModifiedDate AND [ModifiedBy] = @original_ModifiedBy AND (([rowguid] = @original_rowguid) OR ([rowguid] IS NULL AND @original_rowguid IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_DiscountID" Type="Int32" />
            <asp:Parameter Name="original_RoleId" Type="Int32" />
            <asp:Parameter Name="original_DiscountPercent" Type="Decimal" />
            <asp:Parameter Name="original_ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="original_ModifiedBy" Type="String" />
            <asp:Parameter Name="original_rowguid" Type="Object" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="RoleId" Type="Int32" />
            <asp:Parameter Name="DiscountPercent" Type="Decimal" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="rowguid" Type="Object" />
            <asp:Parameter Name="original_DiscountID" Type="Int32" />
            <asp:Parameter Name="original_RoleId" Type="Int32" />
            <asp:Parameter Name="original_DiscountPercent" Type="Decimal" />
            <asp:Parameter Name="original_ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="original_ModifiedBy" Type="String" />
            <asp:Parameter Name="original_rowguid" Type="Object" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsRoles" runat="server" 
        ConnectionString="<%$ ConnectionStrings:iftDB %>" 
        SelectCommand="SELECT * FROM [vw_aspnet_Roles] where rolename != 'Administrators'"></asp:SqlDataSource>
</asp:Content>
