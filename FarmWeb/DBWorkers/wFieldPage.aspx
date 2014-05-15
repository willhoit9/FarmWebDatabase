<%@ Page Title="" Language="VB" MasterPageFile="~/DBWorkers/WorkerMaster.master" AutoEventWireup="false" CodeFile="wFieldPage.aspx.vb" Inherits="DBWorkers_wFieldPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="workerMainContentHolder" Runat="Server">


<div class="tableHolder">

    <h2>
        Field Worker Page
    </h2>

    <asp:ListView ID="lvFields" runat="server" 
        DataSourceID="FieldObjectDataSource" InsertItemPosition="LastItem" 
        DataKeyNames="FieldID,FieldName,Acres,Owner,Active">
        <AlternatingItemTemplate>
            <tr style="background-color: #C8FBF0;color: #284775;">

                <td>
                    <asp:Label ID="FieldIDLabel" runat="server" Text='<%# Eval("FieldID") %>' />
                </td>
                <td>
                    <asp:Label ID="FieldNameLabel" runat="server" Text='<%# Eval("FieldName") %>' />
                </td>
                <td >
                    <asp:Label ID="AcresLabel"  runat="server" Text='<%# Eval("Acres") %>' />
                </td>
                <td>
                    <asp:Label ID="OwnerLabel" runat="server" Text='<%# Eval("Owner") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
                <td>
                </td>
            </tr>
        </AlternatingItemTemplate>
        
        <InsertItemTemplate>
            <tr style="">
                
                <td>
                </td>
                <td>
                    <asp:TextBox ID="FieldNameTextBox" runat="server" 
                        Text='<%# Bind("FieldName") %>' MaxLength="50" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldName" 
                        runat="server" ErrorMessage="<br>Required" 
                        CssClass="validation" Display="Dynamic" 
                        ControlToValidate="FieldNameTextBox" ValidationGroup="InsertField"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:TextBox ID="AcresTextBox" runat="server"  MaxLength="5" Text='<%# Bind("Acres") %>'  Width="35" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorFeildAcres" 
                        runat="server" ErrorMessage="<br>Required" 
                        CssClass="validation" Display="Dynamic" 
                        ControlToValidate="AcresTextBox" ValidationGroup="InsertField"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidatorFieldAcres" runat="server" 
                        ControlToValidate="AcresTextBox" CssClass="validation" 
                        Display="Dynamic" ErrorMessage="<br>cannot be negative" 
                        Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0" 
                        ValidationGroup="InsertField"></asp:CompareValidator>
                </td>
                <td>
                    <asp:TextBox ID="OwnerTextBox" runat="server"  MaxLength="50" Text='<%# Bind("Owner") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldOwnerName" 
                        runat="server" ErrorMessage="<br>Required" 
                        CssClass="validation" Display="Dynamic" ControlToValidate="OwnerTextBox" 
                        ValidationGroup="InsertField"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:ImageButton ID="InsertButton" runat="server" CommandName="Insert"
                        Text="Insert" ValidationGroup="InsertField" 
                        ImageUrl="~/Images/insert20_20.png" />
                    <asp:ImageButton ID="CancelButton" runat="server" CommandName="Cancel"
                        Text="Clear" CausesValidation="False" 
                        ImageUrl="~/Images/cancel20_20.png" />
                </td>
                <td>
                    
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #FFFBD6;color: #333333;">

                <td>
                    <asp:Label ID="FieldIDLabel" runat="server" Text='<%# Eval("FieldID") %>' />
                </td>
                <td>
                    <asp:Label ID="FieldNameLabel" runat="server" Text='<%# Eval("FieldName") %>' />
                </td>
                <td >
                    <asp:Label ID="AcresLabel" runat="server" Text='<%# Eval("Acres") %>'  />
                </td>
                <td>
                    <asp:Label ID="OwnerLabel" runat="server" Text='<%# Eval("Owner") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
                <td>                    
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="1" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #152737;border-style:solid;border-width:5px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr id="Tr2" runat="server" style="background-color: #FFFBD6;color: #333333;">
                               
                                <th id="Th1" runat="server">
                                    <asp:LinkButton ID="linkFieldID" CommandArgument="ID" runat="server" 
                                       OnClick="linkSort">ID</asp:LinkButton>
                                    </th>
                                <th id="Th2" runat="server">
                                    <asp:LinkButton ID="lnkFieldName" CommandArgument="FieldName" runat="server" 
                                       OnClick="linkSort">FieldName</asp:LinkButton>
                                    </th>
                                <th id="Th3" runat="server">
                                    <asp:LinkButton ID="lnkFieldAcres" CommandArgument="Acres" runat="server" 
                                       OnClick="linkSort">Acres</asp:LinkButton>
                                    </th>
                                <th id="Th4" runat="server">
                                    <asp:LinkButton ID="lnkFieldOwner" CommandArgument="Owner" OnClick="linkSort" 
                                        runat="server">Owner</asp:LinkButton>

                                    </th>


                                <th id="Th5" runat="server">
                                    Active</th>
                                <th id="Th6" runat="server">
                                </th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" 
                        style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">

                <td>
                    <asp:Label ID="FieldIDLabel" runat="server" Text='<%# Eval("FieldID") %>' />
                </td>
                <td>
                    <asp:Label ID="FieldNameLabel" runat="server" Text='<%# Eval("FieldName") %>' />
                </td>
                <td>
                    <asp:Label ID="AcresLabel" runat="server" Text='<%# Eval("Acres") %>' />
                </td>
                <td>
                    <asp:Label ID="OwnerLabel" runat="server" Text='<%# Eval("Owner") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                  
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="FieldObjectDataSource" runat="server" 
        ConflictDetection="CompareAllValues" DataObjectTypeName="Field" 
        DeleteMethod="DeleteField" InsertMethod="AddField" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="fetchFieldList" 
        TypeName="FieldDB" UpdateMethod="UpdateField">

        <SelectParameters>
            <asp:Parameter DefaultValue="SELECT * FROM Field" Name="Query" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="original_field" Type="Object" />
            <asp:Parameter Name="field" Type="Object" />
        </UpdateParameters>

    </asp:ObjectDataSource>
    <asp:Label ID="lblFieldSortBy" runat="server" Visible="False"></asp:Label>

    
    <p class="pageDBError">

        <asp:Label ID="lblError" runat="server" EnableViewState="False" ForeColor="Green">
        </asp:Label>

    </p>
    </div>
</asp:Content>

