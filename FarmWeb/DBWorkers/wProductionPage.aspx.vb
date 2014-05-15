
Partial Class DBWorkers_wProductionPage
    Inherits System.Web.UI.Page



    Private _query As String = "SELECT p.ProductionID, p.Year, p.PlantDate, p.HarvestDate, p.Yield, p.FieldID, f.FieldName, b.BrandName, p.SeedID, s.Variety, p.Active FROM Brand b Join Seed s on b.BrandID = s.BrandID JOIN Production p ON s.SeedID = p.SeedID JOIN Field f ON p.FieldID = f.FieldID "


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lblSortBy.Text = "ProductionID ASC"
        End If
    End Sub



    Protected Sub lvProductionAdmin_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvProductionAdmin.ItemInserting

        e.Values("PlantDate") = DirectCast(lvProductionAdmin.InsertItem.FindControl("calInsertPlantDate"), Calendar).SelectedDate
        e.Values("HarvestDate") = DirectCast(lvProductionAdmin.InsertItem.FindControl("calInsertHarvestDate"), Calendar).SelectedDate

        e.Values("FieldID") = DirectCast(lvProductionAdmin.InsertItem.FindControl("ddlProdFieldName"), DropDownList).SelectedValue
        e.Values("SeedID") = DirectCast(lvProductionAdmin.InsertItem.FindControl("ddlProdSeedName"), DropDownList).SelectedValue


    End Sub



    Protected Sub linkSort(sender As Object, e As EventArgs)
        Dim link As LinkButton = DirectCast(sender, LinkButton)
        Dim arg As String = link.CommandArgument.ToString()
        Dim sortBy As String = ""

        ProductionObjectDataSource.SelectParameters.Clear()

        If (arg = "ID") Then
            If (lblSortBy.Text = "ProductionID ASC") Then
                sortBy = "ProductionID DESC"
            Else
                sortBy = "ProductionID ASC"
            End If
        End If

        If (arg = "Year") Then
            sortBy = If(lblSortBy.Text = "Year ASC", "Year DESC", "Year ASC")
        End If

        If (arg = "HDate") Then
            sortBy = If(lblSortBy.Text = "HarvestDate ASC", "HarvestDate DESC", "HarvestDate ASC")
        End If

        If (arg = "PDate") Then
            sortBy = If(lblSortBy.Text = "PlantDate ASC", "PlantDate DESC", "PlantDate ASC")
        End If

        If (arg = "Yield") Then
            sortBy = If(lblSortBy.Text = "Yield ASC", "Yield DESC", "Yield ASC")
        End If

        If (arg = "Field") Then
            sortBy = If(lblSortBy.Text = "FieldName ASC", "FieldName DESC", "FieldName ASC")
        End If

        If (arg = "SeedBrand") Then
            sortBy = If(lblSortBy.Text = "BrandName ASC", "BrandName DESC", "BrandName ASC")
        End If

        If (arg = "SeedVariety") Then
            sortBy = If(lblSortBy.Text = "Variety ASC", "Variety DESC", "Variety ASC")
        End If

        lblSortBy.Text = sortBy
        _query += "ORDER BY " + sortBy

        ProductionObjectDataSource.SelectParameters.Add("Query", _query)

    End Sub



End Class
