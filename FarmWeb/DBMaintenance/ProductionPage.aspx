<%@ Page Title="" Language="VB" MasterPageFile="~/DBMaintenance/AdminMaster.master" AutoEventWireup="false" CodeFile="ProductionPage.aspx.vb" Inherits="DBMaintenance_ProductionPage" %>

<asp:Content ID="ProductionMaintContent" ContentPlaceHolderID="adminMainContentHolder" Runat="Server">
<div class="tableHolder">
    <h2>
        Production Maintenance Page
        <asp:ImageButton ID="btnProd" runat="server" ImageUrl="~/Images/spacer.gif" 
            CausesValidation="False" TabIndex="1" Height="2px" Width="2px" />
    </h2>
    

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <%-- maybe have to take out OnItemDataBound="OnItemDataBound"--%>
    <asp:ListView ID="lvProductionAdmin" runat="server" OnItemDataBound="OnItemDataBound"
        DataSourceID="ProductionObjectDataSource" InsertItemPosition="LastItem"
        DataKeyNames="ID,Year,PlantDate,HarvestDate,Yield,FieldID,SeedID,Active">
        <AlternatingItemTemplate>
            <tr style="background-color: #C8FBF0; color: #284775;">
           
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                </td>
                <td>
                    <%--<asp:Label ID="PlantDateLabel" runat="server" Text='<%# Eval("PlantDate") %>' />--%>
                    <asp:Label ID="PlantDateLabel" runat="server" Text='<%# Bind("PlantDate", "{0:d}") %>' />
                </td>
                <td>
                    <%--<asp:Label ID="HarvestDateLabel" runat="server" Text='<%# Eval("HarvestDate") %>' />--%>
                    <asp:Label ID="HarvestDateLabel" runat="server" Text='<%# Bind("HarvestDate", "{0:d}") %>' />
                </td>
                <td>
                    <asp:Label ID="YieldLabel" runat="server" Text='<%# Eval("Yield") %>' />
                </td>
<%--                <td>
                    <asp:Label ID="FieldIDLabel" runat="server" Text='<%# Eval("FieldID") %>' />
                </td>--%>
                <td>
                    <asp:Label ID="FieldNameLabel" runat="server" Text='<%# Eval("FieldName") %>' />
                </td>
                <td>
                    <asp:Label ID="SeedBrandLabel" runat="server" Text='<%# Eval("SeedBrand") %>' />
                </td>
                <%--<td>
                    <asp:Label ID="SeedIDLabel" runat="server" Text='<%# Eval("SeedID") %>' />
                </td>--%>
                <td>
                    <asp:Label ID="SeedVarietyLabel" runat="server" 
                        Text='<%# Eval("SeedVariety") %>' />
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
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                   <%-- <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />--%>
                </td>
                <td>
                    <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>'  Width="55" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductionYearEdit" 
                        runat="server" ErrorMessage="<br>Required" 
                        CssClass="validation" Display="Dynamic" 
                        ControlToValidate="YearTextBox" ValidationGroup="editProduction"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidatorProductionYearEdit" runat="server" 
                        ControlToValidate="YearTextBox" CssClass="validation" 
                        Display="Dynamic" ErrorMessage="<br>After<br>1900" 
                        Operator="GreaterThanEqual" Type="Integer" ValueToCompare="1900" 
                        ValidationGroup="editProduction"></asp:CompareValidator>
                </td>
                <td>
                   <%-- <asp:TextBox ID="PlantDateTextBox" runat="server" Text='<%# Bind("PlantDate") %>' />--%>

                     <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:Calendar ID="calEditPlantDate" runat="server" BorderStyle="None" 
                                 DayNameFormat="FirstLetter" 
                                 Font-Names="Verdana" Font-Size="8pt" CssClass="calendars"
                                 SelectedDate='<%# Bind("PlantDate") %>' VisibleDate='<%# Bind("PlantDate") %>'>
                            </asp:Calendar>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </td>
                <td>
                    <%--<asp:TextBox ID="HarvestDateTextBox" runat="server" Text='<%# Bind("HarvestDate") %>' />--%>

                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:Calendar ID="calEditHarvestDate" runat="server" BorderStyle="None" 
                                 DayNameFormat="FirstLetter" 
                                 Font-Names="Verdana" Font-Size="8pt" CssClass="calendars"
                                 SelectedDate='<%# Bind("HarvestDate") %>' VisibleDate='<%# Bind("HarvestDate") %>'>
                            </asp:Calendar>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </td>
                <td>
                    <asp:TextBox ID="YieldTextBox" runat="server" Text='<%# Bind("Yield") %>' Width="45" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductionYieldEdit" 
                        runat="server" ErrorMessage="<br>Required" 
                        CssClass="validation" Display="Dynamic" 
                        ControlToValidate="YieldTextBox" ValidationGroup="editProduction"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidatorProductionYieldEdit" runat="server" 
                        ControlToValidate="YieldTextBox" CssClass="validation" 
                        Display="Dynamic" ErrorMessage="<br>Above<br>0" 
                        Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0" 
                        ValidationGroup="editProduction"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidatorProductionYearEdit2" runat="server" 
                        ControlToValidate="YearTextBox" CssClass="validation" 
                        Display="Dynamic" ErrorMessage="<br>Before<br>2100" 
                        Operator="LessThan" Type="Integer" ValueToCompare="2100" 
                        ValidationGroup="editProduction"></asp:CompareValidator>
                </td>
<%--                <td>
                    <asp:TextBox ID="FieldIDTextBox" runat="server" Text='<%# Bind("FieldID") %>' />
                </td>--%>
               
                <td>
                  <%--  <asp:TextBox ID="FieldNameTextBox" runat="server" 
                        Text='<%# Bind("FieldName") %>' />--%>

                    <asp:DropDownList ID="ddlProdEditFieldName" runat="server" >
                    </asp:DropDownList>
                    <asp:Label ID="lblFieldName" runat="server" Text='<%# Bind("FieldName") %>' Visible="false"></asp:Label>

                </td>
                <td>
                    <%--<asp:TextBox ID="SeedBrandTextBox" runat="server" 
                        Text='<%# Bind("SeedBrand") %>' />--%>
                </td>
                <%--<td>
                    <asp:TextBox ID="SeedIDTextBox" runat="server" Text='<%# Bind("SeedID") %>' />
                </td>--%>
                <td>
                    <%--<asp:TextBox ID="SeedVarietyTextBox" runat="server" 
                        Text='<%# Bind("SeedVariety") %>' />--%>

                        <asp:DropDownList ID="ddlProdEditVarietyName" runat="server" >
                        </asp:DropDownList>
                        <asp:Label ID="lblVarietyName" runat="server" Text='<%# Bind("SeedVariety") %>' Visible="false"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Bind("Active") %>' />
                </td>
                <td>
                    <asp:ImageButton ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" ValidationGroup="editProduction" ImageUrl="~/Images/update20_20.png" Height="19" Width="19" />
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
               <asp:Panel ID="pnlProductionAdmin" runat="server" DefaultButton="InsertButton">
               
                <td>
                    <%-- Not Shown. This is an auto generated IDENTITY column--%>
                    <%--<asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />--%>
                </td>
                <td>
                    <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>'  Width="55" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductionYearInsert" 
                        runat="server" ErrorMessage="<br>Required" 
                        CssClass="validation" Display="Dynamic" 
                        ControlToValidate="YearTextBox" ValidationGroup="insertProduction"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidatorProductionYearInsert" runat="server" 
                        ControlToValidate="YearTextBox" CssClass="validation" 
                        Display="Dynamic" ErrorMessage="<br>After<br>1900" 
                        Operator="GreaterThanEqual" Type="Integer" ValueToCompare="1900" 
                        ValidationGroup="insertProduction"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidatorProductionYearInsert2" runat="server" 
                        ControlToValidate="YearTextBox" CssClass="validation" 
                        Display="Dynamic" ErrorMessage="<br>Before<br>2100" 
                        Operator="LessThan" Type="Integer" ValueToCompare="2100" 
                        ValidationGroup="insertProduction"></asp:CompareValidator>
                </td>
                <td>
                    <%--<asp:TextBox ID="PlantDateTextBox" runat="server" 
                        Text='<%# Bind("PlantDate") %>' />--%>



                    
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Calendar ID="calInsertPlantDate" runat="server" BorderStyle="None" 
                                 DayNameFormat="FirstLetter" 
                                 Font-Names="Verdana" Font-Size="8pt" CssClass="calendars"
                                 SelectedDate="<%# DateTime.Now %>" VisibleDate="<%# DateTime.Now %>">
                            </asp:Calendar>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <%--<asp:Calendar ID="calInsertPlantDate" runat="server" BorderStyle="None" 
                     DayNameFormat="FirstLetter" Font-Size="Small"></asp:Calendar>--%>

                </td>
                <td>
                    <%--<asp:TextBox ID="HarvestDateTextBox" runat="server" 
                        Text='<%# Bind("HarvestDate") %>' />--%>

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Calendar ID="calInsertHarvestDate" runat="server" BorderStyle="None" 
                                 DayNameFormat="FirstLetter" 
                                 Font-Names="Verdana" Font-Size="8pt" CssClass="calendars"
                                 SelectedDate="<%# DateTime.Now %>" VisibleDate="<%# DateTime.Now %>">
                            </asp:Calendar>
                            
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </td>
                <td>
                    <asp:TextBox ID="YieldTextBox" runat="server" Text='<%# Bind("Yield") %>' Width="55"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductionYieldInsert" 
                        runat="server" ErrorMessage="<br>Required" 
                        CssClass="validation" Display="Dynamic" 
                        ControlToValidate="YieldTextBox" ValidationGroup="insertProduction"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidatorProductionYieldInsert" runat="server" 
                        ControlToValidate="YieldTextBox" CssClass="validation" 
                        Display="Dynamic" ErrorMessage="<br>Above<br>0" 
                        Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0" 
                        ValidationGroup="insertProduction"></asp:CompareValidator>
                </td>
<%--                <td>
                    <asp:TextBox ID="FieldIDTextBox" runat="server" Text='<%# Bind("FieldID") %>' />
                    <asp:DropDownList ID="ddlProdFieldName" runat="server" 
                        DataSourceID="FieldSqlDataSource1" DataTextField="FieldName" 
                            DataValueField="FieldID">
                    </asp:DropDownList>
                </td>--%>
                
                <td>
                   <%-- <asp:TextBox ID="FieldNameTextBox" runat="server" Text='<%# Bind("FieldName") %>' />--%>
                    <asp:DropDownList ID="ddlProdFieldName" runat="server" 
                            DataSourceID="FieldSqlDataSource1" DataTextField="FieldName" 
                            DataValueField="FieldID">
                    </asp:DropDownList>
                </td>
                <td>
                    <%--<asp:TextBox ID="SeedBrandTextBox" runat="server" 
                        Text='<%# Bind("SeedBrand") %>' />--%>
                </td>
                <%--<td>
                    <asp:TextBox ID="SeedIDTextBox" runat="server" Text='<%# Bind("SeedID") %>' />
                </td>--%>
                <td>
                        <%--    <asp:TextBox ID="SeedVarietyTextBox" runat="server" 
                        Text='<%# Bind("SeedVariety") %>' />--%>

                    <asp:DropDownList ID="ddlProdSeedName" runat="server" 
                        DataSourceID="SeedSqlDataSource1" DataTextField="Variety" 
                        DataValueField="SeedID">
                    </asp:DropDownList>

                </td>
                <td>
                    <%--<asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='True' />--%>
                </td>
                <td>
                    
                    <asp:ImageButton ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" ValidationGroup="insertProduction" ImageUrl="~/Images/insert20_20.png" />
                    <asp:ImageButton ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" CausesValidation="False" ImageUrl="~/Images/cancel20_20.png" />
                </td>
                 </asp:Panel>
            </tr>
        </InsertItemTemplate>
        
        <ItemTemplate>
            <tr style="background-color: #FFFBD6;color: #333333;">
                
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                </td>
                <td>
                    <%--<asp:Label ID="PlantDateLabel" runat="server" Text='<%# Eval("PlantDate") %>' />--%>
                    <asp:Label ID="PlantDateLabel" runat="server" Text='<%# Bind("PlantDate", "{0:d}") %>' />
                </td>
                <td>
                    <%--<asp:Label ID="HarvestDateLabel" runat="server"  Text='<%# Eval("HarvestDate") %>' />--%>
                    <asp:Label ID="HarvestDateLabel" runat="server" Text='<%# Bind("HarvestDate", "{0:d}") %>' />
                </td>
                <td>
                    <asp:Label ID="YieldLabel" runat="server" Text='<%# Eval("Yield") %>' />
                </td>
<%--                <td>
                    <asp:Label ID="FieldIDLabel" runat="server" Text='<%# Eval("FieldID") %>' />
                </td>--%>
                <td>
                    <asp:Label ID="FieldNameLabel" runat="server" Text='<%# Eval("FieldName") %>' />
                </td>
                <td>
                    <asp:Label ID="SeedBrandLabel" runat="server" Text='<%# Eval("SeedBrand") %>' />
                </td>
                <%--<td>
                    <asp:Label ID="SeedIDLabel" runat="server" Text='<%# Eval("SeedID") %>' />
                </td>--%>
                <td>
                    <asp:Label ID="SeedVarietyLabel" runat="server" 
                        Text='<%# Eval("SeedVariety") %>' />




                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
                <td>
                    <asp:imageButton ID="EditButton" runat="server" CommandName="Edit" 
                        Text="Edit" ImageUrl="~/Images/edit20_20.png" />
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
                            font-family: Verdana, Arial, Helvetica, sans-serif;" class="tableLinks">
                            <tr runat="server" style="background-color: #FFFBD6;color: #333333;" class="tableLinks">
                                
                                <th runat="server">
                                <asp:LinkButton ID="lnkID" CommandArgument="ID" runat="server" OnClick="linkSort">ID</asp:LinkButton>
                                    <%--ID--%></th>
                                <th runat="server">
                                <asp:LinkButton ID="lnkYear" CommandArgument="Year" runat="server" 
                                    OnClick="linkSort">Year</asp:LinkButton>
                                    <%--Year--%></th>
                                <th runat="server">
                                <asp:LinkButton ID="lnkPDate" CommandArgument="PDate" runat="server" OnClick="linkSort">PlantDate</asp:LinkButton>
                                    <%--PlantDate--%></th>
                                <th runat="server">
                                <asp:LinkButton ID="lnkHDate" CommandArgument="HDate" runat="server" OnClick="linkSort">HarvestDate</asp:LinkButton>
                                    <%--HarvestDate--%></th>
                                <th runat="server">
                                 <asp:LinkButton ID="lnkYield" CommandArgument="Yield" runat="server" OnClick="linkSort">Yield</asp:LinkButton>
                                    <%--Yield--%></th>
                                <%--<th runat="server">
                                    FieldID</th>--%>
                                <th runat="server">
                                <asp:LinkButton ID="lnkField" CommandArgument="Field" runat="server" OnClick="linkSort">Field</asp:LinkButton>
                                    <%--FieldName--%></th>
                                <th runat="server">
                                <asp:LinkButton ID="lnkSeedBrand" CommandArgument="SeedBrand" runat="server" OnClick="linkSort">SeedBrand</asp:LinkButton>
                                    <%--SeedBrand--%></th>
                                <%--<th runat="server">
                                    SeedID</th>--%>
                                <th runat="server">
                                <asp:LinkButton ID="lnkSeedVariety" CommandArgument="SeedVariety" runat="server" OnClick="linkSort">SeedVariety</asp:LinkButton>
                                    <%--SeedVariety--%></th>
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
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                </td>
                <td>
                    <asp:Label ID="PlantDateLabel" runat="server" Text='<%# Eval("PlantDate") %>' />
                </td>
                <td>
                    <asp:Label ID="HarvestDateLabel" runat="server" 
                        Text='<%# Eval("HarvestDate") %>' />
                </td>
                <td>
                    <asp:Label ID="YieldLabel" runat="server" Text='<%# Eval("Yield") %>' />
                </td>
                <td>
                    <asp:Label ID="FieldIDLabel" runat="server" Text='<%# Eval("FieldID") %>' />
                </td>
                <td>
                    <asp:Label ID="FieldNameLabel" runat="server" Text='<%# Eval("FieldName") %>' />
                </td>
                <td>
                    <asp:Label ID="SeedBrandLabel" runat="server" Text='<%# Eval("SeedBrand") %>' />
                </td>
                <td>
                    <asp:Label ID="SeedIDLabel" runat="server" Text='<%# Eval("SeedID") %>' />
                </td>
                <td>
                    <asp:Label ID="SeedVarietyLabel" runat="server" 
                        Text='<%# Eval("SeedVariety") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                        Checked='<%# Eval("Active") %>' Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>


   <%-- <asp:LinkButton ID="lnkYield" CommandArgument="p.Yield" runat="server" OnClick="linkSort">Yield Sort</asp:LinkButton>--%>


    <asp:Label ID="lblSortBy" runat="server" Visible="False"></asp:Label>
    <asp:ObjectDataSource ID="ProductionObjectDataSource" runat="server" 
        ConflictDetection="CompareAllValues"
        DataObjectTypeName="Production" DeleteMethod="DeleteSeed" 
        InsertMethod="AddProduction" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="fetchProductionList" TypeName="ProductionDB" 
        UpdateMethod="UpdateSeed">
        <SelectParameters>
            <asp:Parameter DefaultValue="SELECT p.ProductionID, p.Year, p.PlantDate, p.HarvestDate, p.Yield, p.FieldID, f.FieldName, b.BrandName, p.SeedID, s.Variety, p.Active FROM Brand b Join Seed s on b.BrandID = s.BrandID JOIN Production p ON s.SeedID = p.SeedID JOIN Field f ON p.FieldID = f.FieldID" 
                Name="Query" Type="String" />
           <%-- <asp:Parameter DefaultValue="Order By p.Yield" Name="OrderBy" Type="String" />--%>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="original_production" Type="Object" />
            <asp:Parameter Name="production" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:SqlDataSource ID="SeedSqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FarmDBConnectionString %>" SelectCommand="SELECT b.BrandName, s.Variety, s.SeedID
FROM Brand b JOIN Seed s
ON b.BrandID = s.BrandID"></asp:SqlDataSource>

    <asp:SqlDataSource ID="FieldSqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FarmDBConnectionString %>" 
        SelectCommand="SELECT [FieldID], [FieldName] FROM [Field]">
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="FieldSqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FarmDBConnectionString %>" 
        SelectCommand="SELECT [FieldID], [FieldName] 
FROM [Field]
ORDER BY CASE WHEN FieldName = @FieldName THEN 1 ELSE 2 END, FieldName">
        <SelectParameters>
            <asp:FormParameter FormField="FieldName" Name="FieldName" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <p class="pageDBError">
        <asp:Label ID="productionLblError" runat="server" EnableViewState="False" ForeColor="Green">
        </asp:Label>
    </p>

    </div>
</asp:Content>

