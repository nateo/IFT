<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Products.aspx.cs" Inherits="Website.Admin.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="ProductContent" style="position: relative; clear: both">
        <div id="ProductsLeft" style="position: relative; float: left; width: 160px;">
            <asp:Panel ID="panelProductNavigation" runat="server" BackColor="#DEE8ED">
                <br />
                <asp:Repeater ID="CategoriesRepeater" runat="server">
                    <ItemTemplate>
                        <b>
                            <%# DataBinder.Eval(Container.DataItem, "CategoryDescription")%></b><br />
                        <ul>
                            <asp:Repeater ID="TypesRepeater" runat="server" DataSource='<%# Eval("Category_Type_relation") %>'>
                                <ItemTemplate>
                                    <li><a href="Products.aspx?Type=<%# Eval("TypeID")%>">
                                        <%# Eval("TypeDescription")%></a> ()</li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>
        </div>
        <div id="ProductsRight" style="position: relative;">
            <asp:Panel ID="Panel1" runat="server">
                <table>
                    <tr>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
