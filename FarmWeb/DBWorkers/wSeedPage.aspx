﻿<%@ Page Title="" Language="VB" MasterPageFile="~/DBWorkers/WorkerMaster.master" AutoEventWireup="false" CodeFile="wSeedPage.aspx.vb" Inherits="DBWorkers_wSeedPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="workerMainContentHolder" Runat="Server">
   <div class="tableHolder">


    <h2>
        Seed Worker Page
    </h2>


    <asp:ListView ID="lvSeedAdmin" runat="server"
        DataSourceID="SeedObjectDataSource" InsertItemPosition="LastItem"
        DataKeyNames="SeedID,Variety,SeedName,Crop,BrandID,Active">
        <AlternatingItemTemplate>
            <tr style="background-color: #C8FBF0; color: #284775;">
                
                <td>
                    <asp:Label ID="SeedIDLabel" runat="server" Text='<%# Eval("SeedID") %>' />
                </td>
                <td>
                    <asp:Label ID="VarietyLabel" runat="server" Text='<%# Eval("Variety") %>' />
                </td>
                <td>
                    <asp:Label ID="SeedNameLabel" runat="server" Text='<%# Eval("SeedName") %>' />
                </td>
                <td>
                    <asp:Label ID="CropLabel" runat="server" Text='<%# Eval("Crop") %>' />
                </td>
                <td>
                    <asp:Label ID="BrandNameLabel" runat="server" Text='<%# Eval("BrandName") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
                <td>
                </td>
            </tr>
        </AlternatingItemTemplate>
       
        <EmptyDataTemplate>
            <table id="Table1" runat="server" 
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
                    <asp:TextBox ID="VarietyTextBox"  MaxLength="30" runat="server" 
                        Text='<%# Bind("Variety") %>' Width="80" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorVariety" 
                        runat="server" ErrorMessage="<br>Required" CssClass="validation" 
                        Display="Dynamic" ValidationGroup="insertSeed"
                        ControlToValidate="VarietyTextBox"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="SeedNameTextBox"  MaxLength="50" runat="server" 
                        Text='<%# Bind("SeedName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSeedName" 
                        runat="server" ErrorMessage="<br>Required" 
                        CssClass="validation" 
                        Display="Dynamic" ValidationGroup="insertSeed" 
                        ControlToValidate="SeedNameTextBox"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCrop" runat="server">
                        <asp:ListItem Enabled="False"></asp:ListItem>
                        <asp:ListItem>Corn</asp:ListItem>
                        <asp:ListItem>Soybeans</asp:ListItem>
                        <asp:ListItem>Alfalfa</asp:ListItem>
                        <asp:ListItem>Wheat</asp:ListItem>
                        <asp:ListItem>Hay</asp:ListItem>
                        <asp:ListItem>Oats</asp:ListItem>
                        <asp:ListItem>Clover</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="ddlBrandPick" runat="server" 
                        DataSourceID="BrandSqlDataSource1" DataTextField="BrandName" 
                        DataValueField="BrandID">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" ValidationGroup="insertSeed" ImageUrl="~/Images/insert20_20.png" />
                    <asp:ImageButton ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" CausesValidation="False" ImageUrl="~/Images/cancel20_20.png" />
                </td>
                <td>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #FFFBD6;color: #333333;">
                
                <td>
                    <asp:Label ID="SeedIDLabel" runat="server" Text='<%# Eval("SeedID") %>' />
                </td>
                <td>
                    <asp:Label ID="VarietyLabel" runat="server" Text='<%# Eval("Variety") %>' />
                </td>
                <td>
                    <asp:Label ID="SeedNameLabel" runat="server" Text='<%# Eval("SeedName") %>' />
                </td>
                <td>
                    <asp:Label ID="CropLabel" runat="server" Text='<%# Eval("Crop") %>' />
                </td>
                <td>
                    <asp:Label ID="BrandNameLabel" runat="server" Text='<%# Eval("BrandName") %>' />
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
                            style="background-color: #FFFFFF;border-collapse: collapse;
                            border-color: #152737;border-style:solid;border-width:5px;
                            font-family: Verdana, Arial, Helvetica, sans-serif;">
                            
                            
                            <tr id="Tr2" runat="server" style="background-color: #FFFBD6;color: #333333;">
                                
                                <th id="Th1" runat="server">
                                   <asp:LinkButton ID="lnkSeedID" CommandArgument="ID" runat="server"
                                        OnClick="linkSort">ID</asp:LinkButton>
                                    </th>
                                <th id="Th2" runat="server">
                                    <asp:LinkButton ID="lnkSeedVariety" CommandArgument="Variety" runat="server"
                                        OnClick="linkSort">Variety</asp:LinkButton>
                                    </th>
                                <th id="Th3" runat="server">
                                    <asp:LinkButton ID="linkSeedName" CommandArgument="SeedName" runat="server"
                                        OnClick="linkSort">SeedName</asp:LinkButton>
                                    </th>
                                <th id="Th4" runat="server">
                                    <asp:LinkButton ID="linkSeedCrop" CommandArgument="Crop" runat="server"
                                        OnClick="linkSort">Crop</asp:LinkButton>
                                    </th>

                                <th id="Th5" runat="server">
                                    <asp:LinkButton ID="lnkBrandName" CommandArgument="BrandName" runat="server"
                                        OnClick="linkSort">BrandName</asp:LinkButton>
                                    </th>
                                <th id="Th6" runat="server">
                                    Active</th>
                                <th id="Th7" runat="server">
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="SeedIDLabel" runat="server" Text='<%# Eval("SeedID") %>' />

                </td>
                <td>
                    <asp:Label ID="VarietyLabel" runat="server" Text='<%# Eval("Variety") %>' />
                </td>
                <td>
                    <asp:Label ID="SeedNameLabel" runat="server" Text='<%# Eval("SeedName") %>' />
                </td>
                <td>
                    <asp:Label ID="CropLabel" runat="server" Text='<%# Eval("Crop") %>' />
                </td>
                <td>
                    <asp:Label ID="BrandNameLabel" runat="server" Text='<%# Eval("BrandName") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:Label ID="lblSortBy" runat="server" Visible="False"></asp:Label>

    <asp:ObjectDataSource ID="SeedObjectDataSource" runat="server"
        ConflictDetection="CompareAllValues" 
        DataObjectTypeName="Seed" DeleteMethod="DeleteSeed" InsertMethod="addSeed" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="fetchSeedList" 
        TypeName="SeedDB" UpdateMethod="UpdateSeed">
        <SelectParameters>
            <asp:Parameter DefaultValue="SELECT s.SeedID, s.Variety, s.SeedName, s.Crop, s.BrandID, b.BrandName, s.Active FROM Brand b JOIN Seed s ON b.BrandID = s.BrandID" 
                Name="Query" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="original_seed" Type="Object" />
            <asp:Parameter Name="seed" Type="Object" />
        </UpdateParameters>



    </asp:ObjectDataSource>

    <asp:SqlDataSource ID="BrandSqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FarmDBConnectionString %>" 
        SelectCommand="SELECT [BrandID], [BrandName] FROM [Brand]">
    </asp:SqlDataSource>
    
    <p class="pageDBError">
        
        <asp:Label ID="seedLblError" runat="server" EnableViewState="False" ForeColor="Green">
        </asp:Label>



    </p>

   </div>










</asp:Content>

