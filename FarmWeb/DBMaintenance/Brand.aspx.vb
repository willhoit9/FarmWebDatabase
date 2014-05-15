
Partial Class DBMaintenance_Brand
    Inherits System.Web.UI.Page

    Private _query As String = "SELECT * FROM Brand "

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lblSortBy.Text = "BrandID ASC"
        End If
    End Sub




    Protected Sub linkSort(sender As Object, e As EventArgs)
        Dim link As LinkButton = DirectCast(sender, LinkButton)
        Dim arg As String = link.CommandArgument.ToString()

        Dim sortBy As String = ""


        BrandObjectDataSource1.SelectParameters.Clear()

        If (arg = "ID") Then
            If (lblSortBy.Text = "BrandID ASC") Then
                sortBy = "BrandID DESC"
            Else
                sortBy = "BrandID ASC"
            End If
        End If

        If (arg = "BrandName") Then
            sortBy = If(lblSortBy.Text = "BrandName ASC", "BrandName DESC", "BrandName ASC")
        End If

        If (arg = "BrandDealerName") Then
            sortBy = If(lblSortBy.Text = "BrandDealerName ASC", "BrandDealerName DESC", "BrandDealerName ASC")
        End If

        lblSortBy.Text = sortBy
        _query += "ORDER BY " + sortBy

        BrandObjectDataSource1.SelectParameters.Add("Query", _query)

    End Sub





    Protected Sub BrandObjectDataSource1_Deleted(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles BrandObjectDataSource1.Deleted
        e.AffectedRows = CType(e.ReturnValue, Integer)
    End Sub


    Protected Sub lvBrandAdmin_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.ListViewDeletedEventArgs) Handles lvBrandAdmin.ItemDeleted
        If e.Exception IsNot Nothing Then
            brandLblError.Text = "Sorry, that row cannot be deleted at this time. " +
                "<br>Another row in the database is using it. Details are below:" +
                "<br>A database error has occured. " & e.Exception.InnerException.Message

            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            brandLblError.Text = "Another user may have updated that category. Please try again"
        End If
    End Sub


    Protected Sub btnBrand_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btnBrand.Click
        brandLblError.Text = "Please click the control to the right"
    End Sub
End Class
