
Partial Class DBMaintenance_SeedPage
    Inherits System.Web.UI.Page

    Private _query As String = "SELECT s.SeedID, s.Variety, s.SeedName, s.Crop, s.BrandID, b.BrandName, s.Active FROM Brand b JOIN Seed s ON b.BrandID = s.BrandID "

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lblSortBy.Text = "SeedID ASC"


        End If
    End Sub



    Protected Sub SeedObjectDataSource_Deleted(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles SeedObjectDataSource.Deleted
        e.AffectedRows = CType(e.ReturnValue, Integer)
    End Sub


    Protected Sub lvSeedAdmin_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.ListViewDeletedEventArgs) Handles lvSeedAdmin.ItemDeleted
        If e.Exception IsNot Nothing Then
            seedLblError.Text = "Sorry, that row cannot be deleted at this time. " +
                "<br>Another row in the database is using it. Details are below:" +
                "<br>A database error has occured. " & e.Exception.InnerException.Message


            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            seedLblError.Text = "Another user may have updated that category. Please try again"
        End If
    End Sub


    Protected Sub lvSeedAdmin_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvSeedAdmin.ItemInserting
        e.Values("BrandID") = DirectCast(lvSeedAdmin.InsertItem.FindControl("ddlBrandPick"), DropDownList).SelectedValue
        e.Values("Crop") = DirectCast(lvSeedAdmin.InsertItem.FindControl("ddlCrop"), DropDownList).SelectedValue

    End Sub

    Protected Sub lvSeedAdmin_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.ListViewUpdateEventArgs) Handles lvSeedAdmin.ItemUpdating
        e.NewValues("BrandID") = DirectCast(lvSeedAdmin.EditItem.FindControl("ddlSeedEditBrandName"), DropDownList).SelectedValue
        e.NewValues("Crop") = DirectCast(lvSeedAdmin.EditItem.FindControl("ddlCrop"), DropDownList).SelectedValue


    End Sub


    Protected Sub OnItemDataBound(sender As Object, e As ListViewItemEventArgs)


        If lvSeedAdmin.EditIndex = DirectCast(e.Item, ListViewDataItem).DataItemIndex Then

            Dim ddlSeedEditBrandName As DropDownList = TryCast(e.Item.FindControl("ddlSeedEditBrandName"), DropDownList)
            ddlSeedEditBrandName.DataSource = BrandSqlDataSource1
            ddlSeedEditBrandName.DataTextField = "BrandName"
            ddlSeedEditBrandName.DataValueField = "BrandID"
            ddlSeedEditBrandName.DataBind()

            Dim lblBrandName As Label = TryCast(e.Item.FindControl("lblBrandName"), Label)
            Dim brandName As String = lblBrandName.Text

            ddlSeedEditBrandName.Items.FindByText(brandName).Selected = True


            Dim ddlCrop As DropDownList = TryCast(e.Item.FindControl("ddlCrop"), DropDownList)
            ddlCrop.Items.Add("Corn")
            ddlCrop.Items.Add("Soybeans")
            ddlCrop.Items.Add("Alfalfa")
            ddlCrop.Items.Add("Wheat")
            ddlCrop.Items.Add("Hay")
            ddlCrop.Items.Add("Oats")
            ddlCrop.Items.Add("Clover")

            Dim lblCrop As Label = TryCast(e.Item.FindControl("lblCrop"), Label)
            Dim cropName As String = lblCrop.Text

            ddlCrop.Items.FindByText(cropName).Selected = True

        End If

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

        '  MsgBox("NEW QUERY : " + _query)

        SeedObjectDataSource.SelectParameters.Add("Query", _query)

    End Sub




    Protected Sub btnSeed_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btnSeed.Click
        seedLblError.Text = "Please click the control to the right"
    End Sub
End Class
