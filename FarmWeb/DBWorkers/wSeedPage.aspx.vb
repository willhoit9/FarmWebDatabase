
Partial Class DBWorkers_wSeedPage
    Inherits System.Web.UI.Page

    Private _query As String = "SELECT s.SeedID, s.Variety, s.SeedName, s.Crop, s.BrandID, b.BrandName, s.Active FROM Brand b JOIN Seed s ON b.BrandID = s.BrandID "

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lblSortBy.Text = "SeedID ASC"


        End If
    End Sub


    Protected Sub lvSeedAdmin_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvSeedAdmin.ItemInserting
        e.Values("BrandID") = DirectCast(lvSeedAdmin.InsertItem.FindControl("ddlBrandPick"), DropDownList).SelectedValue
        e.Values("Crop") = DirectCast(lvSeedAdmin.InsertItem.FindControl("ddlCrop"), DropDownList).SelectedValue

    End Sub


    Protected Sub linkSort(sender As Object, e As EventArgs)
        Dim link As LinkButton = DirectCast(sender, LinkButton)
        Dim arg As String = link.CommandArgument.ToString()

        Dim sortBy As String = ""

        SeedObjectDataSource.SelectParameters.Clear()

        If (arg = "ID") Then
            If (lblSortBy.Text = "SeedID ASC") Then
                sortBy = "SeedID DESC"
            Else
                sortBy = "SeedID ASC"
            End If
        End If

        If (arg = "Variety") Then
            sortBy = If(lblSortBy.Text = "Variety ASC", "Variety DESC", "Variety ASC")
        End If

        If (arg = "SeedName") Then
            sortBy = If(lblSortBy.Text = "SeedName ASC", "SeedName DESC", "SeedName ASC")
        End If

        If (arg = "Crop") Then
            sortBy = If(lblSortBy.Text = "Crop ASC", "Crop DESC", "Crop ASC")
        End If

        If (arg = "BrandName") Then
            sortBy = If(lblSortBy.Text = "BrandName ASC", "BrandName DESC", "BrandName ASC")
        End If

        lblSortBy.Text = sortBy
        _query += "ORDER BY " + sortBy

        SeedObjectDataSource.SelectParameters.Add("Query", _query)

    End Sub


End Class
