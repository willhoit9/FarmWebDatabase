<%@ Page Title="" Language="VB" MasterPageFile="~/DBWorkers/WorkerMaster.master" AutoEventWireup="false" CodeFile="wProductionPage.aspx.vb" Inherits="DBWorkers_wProductionPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="workerMainContentHolder" Runat="Server">

<div class="tableHolder">
    <h2>
        Production Worker Page
    </h2>
    

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:ListView ID="lvProductionAdmin" runat="server" 
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
                    <asp:Label ID="PlantDateLabel" runat="server" Text='<%# Bind("PlantDate", "{0:d}") %>' />
                </td>
                <td>
                    <asp:Label ID="HarvestDateLabel" runat="server" Text='<%# Bind("HarvestDate", "{0:d}") %>' />
                </td>
                <td>
                    <asp:Label ID="YieldLabel" runat="server" Text='<%# Eval("Yield") %>' />
                </td>
                <td>
                    <asp:Label ID="FieldNameLabel" runat="server" Text='<%# Eval("FieldName") %>' />
                </td>
                <td>
                    <asp:Label ID="SeedBrandLabel" runat="server" Text='<%# Eval("SeedBrand") %>' />
                </td>
                <td>
                    <asp:Label ID="SeedVarietyLabel" runat="server" 
                        Text='<%# Eval("SeedVariety") %>' />
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
                    <%-- Not Shown. This is an auto generated IDENTITY column--%>
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
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Calendar ID="calInsertPlantDate" runat="server" BorderStyle="None" 
                                 DayNameFormat="FirstLetter" 
                                 Font-Names="Verdana" Font-Size="8pt" CssClass="calendars"
                                 SelectedDate="<%# DateTime.Now %>" VisibleDate="<%# DateTime.Now %>">
                            </asp:Calendar>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>
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
                <td>
                    <asp:DropDownList ID="ddlProdFieldName" runat="server" 
                            DataSourceID="FieldSqlDataSource1" DataTextField="FieldName" 
                            DataValueField="FieldID">
                    </asp:DropDownList>
                </td>
                <td>
                </td>
                <td>
                    <asp:DropDownList ID="ddlProdSeedName" runat="server" 
                        DataSourceID="SeedSqlDataSource1" DataTextField="Variety" 
                        DataValueField="SeedID">
                    </asp:DropDownList>
                </td>
                <td>
                   <asp:ImageButton ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" ValidationGroup="insertProduction" ImageUrl="~/Images/insert20_20.png" />
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
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                </td>
                <td>
                    <asp:Label ID="PlantDateLabel" runat="server" Text='<%# Bind("PlantDate", "{0:d}") %>' />
                </td>
                <td>
                    <asp:Label ID="HarvestDateLabel" runat="server" Text='<%# Bind("HarvestDate", "{0:d}") %>' />
                </td>
                <td>
                    <asp:Label ID="YieldLabel" runat="server" Text='<%# Eval("Yield") %>' />
                </td>
                <td>
                    <asp:Label ID="FieldNameLabel" runat="server" Text='<%# Eval("FieldName") %>' />
                </td>
                <td>
                    <asp:Label ID="SeedBrandLabel" runat="server" Text='<%# Eval("SeedBrand") %>' />
                </td>
                <td>
                    <asp:Label ID="SeedVarietyLabel" runat="server" 
                        Text='<%# Eval("SeedVariety") %>' />
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
                            font-family: Verdana, Arial, Helvetica, sans-serif;" class="tableLinks">
                            <tr id="Tr2" runat="server" style="background-color: #FFFBD6;color: #333333;" class="tableLinks">
                                
                                <th id="Th1" runat="server">
                                <asp:LinkButton ID="lnkID" CommandArgument="ID" runat="server" OnClick="linkSort">ID</asp:LinkButton>
                                </th>
                                <th id="Th2" runat="server">
                                <asp:LinkButton ID="lnkYear" CommandArgument="Year" runat="server" 
                                    OnClick="linkSort">Year</asp:LinkButton>
                                    </th>
                                <th id="Th3" runat="server">
                                <asp:LinkButton ID="lnkPDate" CommandArgument="PDate" runat="server" OnClick="linkSort">PlantDate</asp:LinkButton>
                                   </th>
                                <th id="Th4" runat="server">
                                <asp:LinkButton ID="lnkHDate" CommandArgument="HDate" runat="server" OnClick="linkSort">HarvestDate</asp:LinkButton>
                                    </th>
                                <th id="Th5" runat="server">
                                 <asp:LinkButton ID="lnkYield" CommandArgument="Yield" runat="server" OnClick="linkSort">Yield</asp:LinkButton>
                                    </th>
                                
                                <th id="Th6" runat="server">
                                <asp:LinkButton ID="lnkField" CommandArgument="Field" runat="server" OnClick="linkSort">Field</asp:LinkButton>
                                    </th>
                                <th id="Th7" runat="server">
                                <asp:LinkButton ID="lnkSeedBrand" CommandArgument="SeedBrand" runat="server" OnClick="linkSort">SeedBrand</asp:LinkButton>
                                </th>
                                <th id="Th8" runat="server">
                                <asp:LinkButton ID="lnkSeedVariety" CommandArgument="SeedVariety" runat="server" OnClick="linkSort">SeedVariety</asp:LinkButton>
                                </th>
                                <th id="Th9" runat="server">
                                    Active</th>
                                <th id="Th10" runat="server">
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

