<%@ Page Title="" Language="VB" MasterPageFile="~/DBMaintenance/AdminMaster.master" AutoEventWireup="false" CodeFile="ChemicalPage.aspx.vb" Inherits="DBMaintenance_ChemicalPage" %>

<asp:Content ID="ChemicalMaintContent" ContentPlaceHolderID="adminMainContentHolder" Runat="Server">
    
<div class="tableHolder">
    <div class="maint">
    <h2 >
        Chemical Maintenance Page
         <asp:ImageButton ID="btnChem" runat="server" ImageUrl="~/Images/spacer.gif" 
            CausesValidation="False" TabIndex="1" Height="2px" Width="2px" />
    </h2>
    </div>

    
    <asp:ListView ID="lvChemicalAdmin" runat="server" 
        DataSourceID="ChemObjectDataSource1" InsertItemPosition="LastItem"
        DataKeyNames="ChemicalID,ChemicalName,ChemicalBrand,ChemicalType,Active">
        <AlternatingItemTemplate>
            <tr style="background-color: #C8FBF0;color: #284775;">
                
                <td>
                    <asp:Label ID="ChemicalIDLabel" runat="server" 
                        Text='<%# Eval("ChemicalID") %>' />
                </td>
                <td>
                    <asp:Label ID="ChemicalNameLabel" runat="server" 
                        Text='<%# Eval("ChemicalName") %>' />
                </td>
                <td>
                    <asp:Label ID="ChemicalBrandLabel" runat="server" 
                        Text='<%# Eval("ChemicalBrand") %>' />
                </td>
                <td>
                    <asp:Label ID="ChemicalTypeLabel" runat="server" 
                        Text='<%# Eval("ChemicalType") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
                <td>
                    <asp:ImageButton ID="EditButton" runat="server" CommandName="Edit" ImageUrl="~/Images/edit20_20.png" usesubmitbehavior="false" TabIndex="1" />
                    <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/trash20_20.png" TabIndex="1" />
                    
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
        
            <tr style="background-color: #FFCC66;color: #000080;">
                
                <td>
                </td>
                <td>
                    <asp:TextBox ID="ChemicalNameTextBox"  MaxLength="50" runat="server" 
                        Text='<%# Bind("ChemicalName") %>' />
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorChemicalNameEdit" 
                        runat="server" ErrorMessage="<br>Required" CssClass="validation" 
                        Display="Dynamic" ValidationGroup="editChem" ControlToValidate="ChemicalNameTextBox"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:TextBox ID="ChemicalBrandTextBox"  MaxLength="50" runat="server" 
                        Text='<%# Bind("ChemicalBrand") %>' />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorChemicalBrandEdit" 
                        runat="server" ErrorMessage="<br>Required" CssClass="validation" 
                        Display="Dynamic" ValidationGroup="editChem" ControlToValidate="ChemicalBrandTextBox"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:TextBox ID="ChemicalTypeTextBox"  MaxLength="50" runat="server" 
                        Text='<%# Bind("ChemicalType") %>' />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorChemicalTypeEdit" 
                        runat="server" ErrorMessage="<br>Required" CssClass="validation" 
                        Display="Dynamic" ValidationGroup="editChem" ControlToValidate="ChemicalTypeTextBox"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Bind("Active") %>' />
                </td>
                <td>
                         <asp:ImageButton ID="UpdateButton" runat="server" ValidationGroup="editChem" CommandName="Update" ImageUrl="~/Images/update20_20.png" Height="19" Width="19" TabIndex="1" />
                    <asp:ImageButton ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/cancel20_20.png" />
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
                    <asp:TextBox ID="ChemicalNameTextBox"  MaxLength="50" runat="server" 
                        Text='<%# Bind("ChemicalName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorChemicalNameInsert" 
                        runat="server" ErrorMessage="<br>Required" CssClass="validation" 
                        Display="Dynamic" ValidationGroup="insertChem" 
                        ControlToValidate="ChemicalNameTextBox"></asp:RequiredFieldValidator>
                    
                </td>
                <td>
                    <asp:TextBox ID="ChemicalBrandTextBox"  MaxLength="50" runat="server" 
                        Text='<%# Bind("ChemicalBrand") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorChemicalBrandInsert" 
                        runat="server" ErrorMessage="<br>Required" CssClass="validation" 
                        Display="Dynamic" ValidationGroup="insertChem" 
                        ControlToValidate="ChemicalBrandTextBox"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="ChemicalTypeTextBox"  MaxLength="50" runat="server" 
                        Text='<%# Bind("ChemicalType") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorChemicalTypeInsert" 
                        runat="server" ErrorMessage="<br>Required" CssClass="validation" 
                        Display="Dynamic" ValidationGroup="insertChem" 
                        ControlToValidate="ChemicalTypeTextBox"></asp:RequiredFieldValidator>

                </td>
                <td>
                </td>
                <td>
                    <asp:ImageButton ID="InsertButton" runat="server" CommandName="Insert" 
                        ImageUrl="~/Images/insert20_20.png" ValidationGroup="insertChem" />
                    <asp:ImageButton ID="CancelButton" runat="server" CommandName="Cancel" 
                        ImageUrl="~/Images/cancel20_20.png"  CausesValidation="False" TabIndex="1" />
                </td>
            </tr>

        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #FFFBD6;color: #333333;">
                
                <td>
                    <asp:Label ID="ChemicalIDLabel" runat="server" 
                        Text='<%# Eval("ChemicalID") %>' />
                </td>
                <td>
                    <asp:Label ID="ChemicalNameLabel" runat="server" 
                        Text='<%# Eval("ChemicalName") %>' />
                </td>
                <td>
                    <asp:Label ID="ChemicalBrandLabel" runat="server" 
                        Text='<%# Eval("ChemicalBrand") %>' />
                </td>
                <td>
                    <asp:Label ID="ChemicalTypeLabel" runat="server" 
                        Text='<%# Eval("ChemicalType") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
                <td>
                    <asp:ImageButton ID="EditButton" runat="server" CommandName="Edit" 
                        ImageUrl="~/Images/edit20_20.png" AlternateText="Edit Chemical" TabIndex="1" />
                    <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" 
                        ImageUrl="~/Images/trash20_20.png" TabIndex="1" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" 
                            style="background-color: #FFFFFF;border-collapse: collapse;
                            border-color: #152737;border-style:solid;border-width:5px;
                            font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                            
                            
                            <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                
                                <th runat="server">
                                    <asp:LinkButton ID="lnkChemicalID" CommandArgument="ID" 
                                        runat="server" OnClick="linkSort">ID</asp:LinkButton>
                                    </th>
                                <th runat="server">
                                    <asp:LinkButton ID="lnkChemicalName" CommandArgument="ChemicalName" 
                                        runat="server" OnClick="linkSort">ChemicalName</asp:LinkButton>
                                    </th>
                                <th runat="server">
                                    <asp:LinkButton ID="lnkChemicalBrand" CommandArgument="ChemicalBrand" 
                                        runat="server" OnClick="linkSort">ChemicalBrand</asp:LinkButton>
                                    </th>
                                <th runat="server">
                                    <asp:LinkButton ID="lnkChemicalType" CommandArgument="ChemicalType" 
                                        runat="server" OnClick="linkSort">ChemicalType</asp:LinkButton>
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
                    <asp:Label ID="ChemicalIDLabel" runat="server" 
                        Text='<%# Eval("ChemicalID") %>' />
                </td>
                <td>
                    <asp:Label ID="ChemicalNameLabel" runat="server" 
                        Text='<%# Eval("ChemicalName") %>' />
                </td>
                <td>
                    <asp:Label ID="ChemicalBrandLabel" runat="server" 
                        Text='<%# Eval("ChemicalBrand") %>' />
                </td>
                <td>
                    <asp:Label ID="ChemicalTypeLabel" runat="server" 
                        Text='<%# Eval("ChemicalType") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>


    </asp:ListView>

    <asp:Label ID="lblSortBy" runat="server" Visible="False"></asp:Label>
    <asp:ObjectDataSource ID="ChemObjectDataSource1" runat="server" 
        ConflictDetection="CompareAllValues"
        DataObjectTypeName="Chemical" DeleteMethod="DeleteChemical" 
        InsertMethod="AddChem" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="fetchChemList" TypeName="ChemicalDB" 
        UpdateMethod="UpdateChemical">
        <SelectParameters>
            <asp:Parameter DefaultValue="SELECT * FROM Chemical" Name="Query" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="original_chemical" Type="Object" />
            <asp:Parameter Name="chemical" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
    <p class="pageDBError">
        <asp:Label ID="chemicalLblError"  runat="server" EnableViewState="False" >
        </asp:Label>
    </p>

</div>  
 
</asp:Content>

