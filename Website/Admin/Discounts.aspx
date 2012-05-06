<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Discounts.aspx.cs" Inherits="Website.Admin.Discounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DiscountID" 
        DataSourceID="sdsDiscounts">
        <Columns>
            <asp:BoundField DataField="DiscountID" HeaderText="DiscountID" 
                SortExpression="DiscountID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="RoleId" HeaderText="RoleId" 
                SortExpression="RoleId" />
            <asp:BoundField DataField="DiscountPercent" HeaderText="DiscountPercent" 
                SortExpression="DiscountPercent" />
            <asp:BoundField DataField="ModifiedDate" HeaderText="ModifiedDate" 
                SortExpression="ModifiedDate" />
            <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" 
                SortExpression="ModifiedBy" />
            <asp:BoundField DataField="rowguid" HeaderText="rowguid" 
                SortExpression="rowguid" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsDiscounts" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:iftDB %>" 
        DeleteCommand="DELETE FROM [Discounts] WHERE [DiscountID] = @original_DiscountID AND [RoleId] = @original_RoleId AND [DiscountPercent] = @original_DiscountPercent AND [ModifiedDate] = @original_ModifiedDate AND [ModifiedBy] = @original_ModifiedBy AND (([rowguid] = @original_rowguid) OR ([rowguid] IS NULL AND @original_rowguid IS NULL))" 
        InsertCommand="INSERT INTO [Discounts] ([RoleId], [DiscountPercent], [ModifiedDate], [ModifiedBy], [rowguid]) VALUES (@RoleId, @DiscountPercent, @ModifiedDate, @ModifiedBy, @rowguid)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Discounts]" 
        UpdateCommand="UPDATE [Discounts] SET [RoleId] = @RoleId, [DiscountPercent] = @DiscountPercent, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy, [rowguid] = @rowguid WHERE [DiscountID] = @original_DiscountID AND [RoleId] = @original_RoleId AND [DiscountPercent] = @original_DiscountPercent AND [ModifiedDate] = @original_ModifiedDate AND [ModifiedBy] = @original_ModifiedBy AND (([rowguid] = @original_rowguid) OR ([rowguid] IS NULL AND @original_rowguid IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_DiscountID" Type="Int32" />
            <asp:Parameter Name="original_RoleId" Type="Int32" />
            <asp:Parameter Name="original_DiscountPercent" Type="Decimal" />
            <asp:Parameter Name="original_ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="original_ModifiedBy" Type="String" />
            <asp:Parameter Name="original_rowguid" Type="Object" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="RoleId" Type="Int32" />
            <asp:Parameter Name="DiscountPercent" Type="Decimal" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="rowguid" Type="Object" />
        </InsertParameters>
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
</asp:Content>
