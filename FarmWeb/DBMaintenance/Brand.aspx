<%@ Page Title="" Language="VB" MasterPageFile="~/DBMaintenance/AdminMaster.master" AutoEventWireup="false" CodeFile="Brand.aspx.vb" Inherits="DBMaintenance_Brand" %>

<asp:Content ID="BrandMaintContent" ContentPlaceHolderID="adminMainContentHolder" Runat="Server">
<div class="tableHolder">
    <h2>
        Brand Maintenance Page
        <asp:ImageButton ID="btnBrand" runat="server" ImageUrl="~/Images/spacer.gif" 
            CausesValidation="False" TabIndex="1" Height="2px" Width="2px" />
    </h2>


    <asp:ListView ID="lvBrandAdmin" runat="server" 
        DataSourceID="BrandObjectDataSource1" InsertItemPosition="LastItem"
        DataKeyNames="BrandID,BrandName,BrandDealerName,Active">
        <AlternatingItemTemplate>
            <tr style="background-color: #C8FBF0;color: #284775;">
               
                <td>
                    <asp:Label ID="BrandIDLabel" runat="server" Text='<%# Eval("BrandID") %>' />
                </td>
                <td>
                    <asp:Label ID="BrandNameLabel" runat="server" Text='<%# Eval("BrandName") %>' />
                </td>
                <td>
                    <asp:Label ID="BrandDealerNameLabel" runat="server" 
                        Text='<%# Eval("BrandDealerName") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
                 <td>
                    
                    <asp:ImageButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit" ImageUrl="~/Images/edit20_20.png" />
                    <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" ImageUrl="~/Images/trash20_20.png" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #FFCC66;color: #000080;">
                
                <td>
                </td>
                <td>
                    <asp:TextBox ID="BrandNameTextBox"  MaxLength="50" runat="server" 
                        Text='<%# Bind("BrandName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandEdit" 
                        runat="server" ErrorMessage="<br>Required" CssClass="validation" 
                        Display="Dynamic" ValidationGroup="editBrand" 
                        ControlToValidate="BrandNameTextBox"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:TextBox ID="BrandDealerNameTextBox"  MaxLength="50" runat="server" 
                        Text='<%# Bind("BrandDealerName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandNameEdit" 
                        runat="server" ErrorMessage="<br>Required" CssClass="validation" 
                        Display="Dynamic" ValidationGroup="editBrand" 
                        ControlToValidate="BrandDealerNameTextBox"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Bind("Active") %>' />
                </td>
                <td>
                    <asp:ImageButton ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" ValidationGroup="editBrand" ImageUrl="~/Images/update20_20.png" Height="19" Width="19" />
                    <asp:ImageButton ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" CausesValidation="False" ImageUrl="~/Images/cancel20_20.png" />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                
                <td>
                </td>
                <td>
                    <asp:TextBox ID="BrandNameTextBox"  MaxLength="50" runat="server" 
                        Text='<%# Bind("BrandName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandNameInsert" 
                        runat="server" ErrorMessage="<br>Required" CssClass="validation" 
                        Display="Dynamic" ValidationGroup="insertBrand" 
                        ControlToValidate="BrandNameTextBox"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="BrandDealerNameTextBox"  MaxLength="50" runat="server" 
                        Text='<%# Bind("BrandDealerName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandDealerNameInsert" 
                        runat="server" ErrorMessage="<br>Required" CssClass="validation" 
                        Display="Dynamic" ValidationGroup="insertBrand" 
                        ControlToValidate="BrandDealerNameTextBox"></asp:RequiredFieldValidator>
                </td>
                <td>
                </td>
                <td>
                    <asp:ImageButton ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" ValidationGroup="insertBrand" ImageUrl="~/Images/insert20_20.png" />
                    <asp:ImageButton ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" CausesValidation="False" ImageUrl="~/Images/cancel20_20.png" />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #FFFBD6;color: #333333;">
                
                <td>
                    <asp:Label ID="BrandIDLabel" runat="server" Text='<%# Eval("BrandID") %>' />
                </td>
                <td>
                    <asp:Label ID="BrandNameLabel" runat="server" Text='<%# Eval("BrandName") %>' />
                </td>
                <td>
                    <asp:Label ID="BrandDealerNameLabel" runat="server" 
                        Text='<%# Eval("BrandDealerName") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
                <td>
                    <asp:ImageButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit" ImageUrl="~/Images/edit20_20.png" />
                    <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" ImageUrl="~/Images/trash20_20.png" />
                    
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="1" 
                            style="background-color: #FFFFFF;border-collapse: collapse;
                            border-color: #152737;border-style:solid;border-width:5px;
                            font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                
                                <th runat="server">
                                    <asp:LinkButton ID="lnkBrandID" CommandArgument="ID" 
                                        runat="server" OnClick="linkSort">ID</asp:LinkButton>
                                    </th>
                                <th runat="server">
                                    <asp:LinkButton ID="lnkBrandName" CommandArgument="BrandName" 
                                        runat="server" OnClick="linkSort">BrandName</asp:LinkButton>
                                    </th>
                                <th runat="server">
                                <asp:LinkButton ID="lnkBrandDealerName" CommandArgument="BrandDealerName" 
                                        runat="server" OnClick="linkSort">BrandDealerName</asp:LinkButton>
                                    </th>
                                    
                                <th runat="server">
                                    Active</th>
                                <th id="Th1" runat="server">
                                </th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" 
                        style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="BrandIDLabel" runat="server" Text='<%# Eval("BrandID") %>' />
                </td>
                <td>
                    <asp:Label ID="BrandNameLabel" runat="server" Text='<%# Eval("BrandName") %>' />
                </td>
                <td>
                    <asp:Label ID="BrandDealerNameLabel" runat="server" 
                        Text='<%# Eval("BrandDealerName") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:Label ID="lblSortBy" runat="server" Visible="False"></asp:Label>
    <asp:ObjectDataSource ID="BrandObjectDataSource1" runat="server" 
        ConflictDetection="CompareAllValues"
        DataObjectTypeName="Brand" DeleteMethod="DeleteBrand" InsertMethod="addBrand" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="fetchBrandList" 
        TypeName="BrandDB" UpdateMethod="UpdateBrand">
        <SelectParameters>
            <asp:Parameter DefaultValue="Select * FROM Brand" Name="Query" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="original_brand" Type="Object" />
            <asp:Parameter Name="brand" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>


    <p class="pageDBError">
        <asp:Label ID="brandLblError" runat="server" EnableViewState="False" >
        </asp:Label>
    </p>

</div>

</asp:Content>

