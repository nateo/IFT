<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Products.aspx.cs" Inherits="Website.Admin.Products1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Category:"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
                <asp:Button ID="btnAddCategory" runat="server" Text="Add" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gvCategories" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" DataKeyNames="CategoryID" DataSourceID="sdsCategories"
                    OnSelectedIndexChanged="gvCategories_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="Order" HeaderText="Order" SortExpression="Order" />
                        <asp:BoundField DataField="DateAdded" HeaderText="Added On" SortExpression="DateAdded"
                            ReadOnly="True" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="DateModified" HeaderText="Modified On" SortExpression="DateModified"
                            ReadOnly="True" DataFormatString="{0:d}" />
                    </Columns>
                    <SelectedRowStyle BackColor="LightGray" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSubcategoryName" runat="server" Text="Subcategory: " Visible="False"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtSubCategory" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="btnAddSubCategory" runat="server" Text="Add" Visible="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gvSubcategory" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" DataKeyNames="SubcategoryID" DataSourceID="sdsSubcategory">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="Order" HeaderText="Order" SortExpression="Order" />
                        <asp:BoundField DataField="DateAdded" HeaderText="Added On" SortExpression="DateAdded"
                            DataFormatString="{0:d}" ReadOnly="True" />
                        <asp:BoundField DataField="DateModified" HeaderText="Modified On" SortExpression="DateModified"
                            ReadOnly="True" DataFormatString="{0:d}" />
                    </Columns>
                    <SelectedRowStyle BackColor="LightGray" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
                    DataSourceID="sdsProducts" AllowPaging="True" AllowSorting="True" OnInit="gvProducts_Init">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="ProductNumber" HeaderText="ProductNumber" SortExpression="ProductNumber" />
                        <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued" />
                        <asp:BoundField DataField="DateAdded" HeaderText="Added On" SortExpression="DateAdded"
                            ReadOnly="True" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="DateModified" HeaderText="Modified On" SortExpression="DateModified"
                            ReadOnly="True" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" ReadOnly="True" SortExpression="ModifiedBy" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="sdsCategories" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:iftDB %>" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = @original_CategoryID "
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Categories] ORDER BY [Order]"
        UpdateCommand="UPDATE [Categories] SET [Description] = @Description, [Order] = @Order, [DateModified] = (GetDate()) WHERE [CategoryID] = @original_CategoryID  AND [Description] = @original_Description AND [Order] = @original_Order">
        <DeleteParameters>
            <asp:Parameter Name="original_CategoryID" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_DateAdded" Type="DateTime" />
            <asp:Parameter Name="original_DateModified" Type="DateTime" />
            <asp:Parameter Name="original_Order" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Order" Type="Int32" />
            <asp:Parameter Name="original_CategoryID" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Order" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsSubcategory" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:iftDB %>" DeleteCommand="DELETE FROM [Subcategory] WHERE [SubcategoryID] = @original_SubcategoryID AND [CategoryID] = @original_CategoryID AND [Description] = @original_Description AND [Order] = @original_Order AND [DateAdded] = @original_DateAdded AND [DateModified] = @original_DateModified AND [rowguid] = @original_rowguid"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Subcategory] where CategoryID = @CategoryID ORDER BY [Order]"
        UpdateCommand="UPDATE [Subcategory] SET [Description] = @Description, [Order] = @Order, [DateModified] = GetDate() WHERE [SubcategoryID] = @original_SubcategoryID ">
        <DeleteParameters>
            <asp:Parameter Name="original_SubcategoryID" Type="Int32" />
            <asp:Parameter Name="original_CategoryID" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Order" Type="Int32" />
            <asp:Parameter Name="original_DateAdded" Type="DateTime" />
            <asp:Parameter Name="original_DateModified" Type="DateTime" />
            <asp:Parameter Name="original_rowguid" Type="Object" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvCategories" Name="CategoryID" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Order" Type="Int32" />
            <asp:Parameter Name="DateModified" Type="DateTime" />
            <asp:Parameter Name="original_SubcategoryID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsProducts" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:iftDB %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @original_ProductID AND (([ProductNumber] = @original_ProductNumber) OR ([ProductNumber] IS NULL AND @original_ProductNumber IS NULL)) AND [ListPrice] = @original_ListPrice AND [Description] = @original_Description AND [Discontinued] = @original_Discontinued AND [DateAdded] = @original_DateAdded AND [DateModified] = @original_DateModified AND [ModifiedBy] = @original_ModifiedBy AND [CategoryID] = @original_CategoryID AND [SubcategoryID] = @original_SubcategoryID"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Products] WHERE ([SubcategoryID] = @SubcategoryID)"
        UpdateCommand="UPDATE [Products] SET [ProductNumber] = @ProductNumber, [ListPrice] = @ListPrice, [Description] = @Description, [Discontinued] = @Discontinued, [DateModified] = (GetDate()), [ModifiedBy] = @ModifiedBy WHERE [ProductID] = @original_ProductID">
        <DeleteParameters>
            <asp:Parameter Name="original_ProductID" Type="Int32" />
            <asp:Parameter Name="original_ProductNumber" Type="String" />
            <asp:Parameter Name="original_ListPrice" Type="Decimal" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Discontinued" Type="Boolean" />
            <asp:Parameter Name="original_DateAdded" Type="DateTime" />
            <asp:Parameter Name="original_DateModified" Type="DateTime" />
            <asp:Parameter Name="original_ModifiedBy" Type="String" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvSubcategory" Name="SubcategoryID" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductNumber" Type="String" />
            <asp:Parameter Name="ListPrice" Type="Decimal" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Discontinued" Type="Boolean" />
            <asp:Parameter Name="ModifiedBy" />
            <asp:Parameter Name="DateModified" Type="DateTime" />
            <asp:Parameter Name="original_ProductID" Type="Int32" />
            <asp:Parameter Name="original_ProductNumber" Type="String" />
            <asp:Parameter Name="original_ListPrice" Type="Decimal" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Discontinued" Type="Boolean" />
            <asp:Parameter Name="original_DateModified" Type="DateTime" />
            <asp:Parameter Name="original_ModifiedBy" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
