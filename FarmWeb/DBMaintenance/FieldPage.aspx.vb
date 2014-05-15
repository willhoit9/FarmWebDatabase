
Partial Class DBMaintenance_FieldPage
    Inherits System.Web.UI.Page

    Private _query As String = "SELECT * FROM Field "

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lblFieldSortBy.Text = "FieldID ASC"
        End If

    End Sub

    Protected Sub FieldObjectDataSource_Deleted(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles FieldObjectDataSource.Deleted
        e.AffectedRows = CType(e.ReturnValue, Integer)
    End Sub



    Protected Sub lvFields_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.ListViewDeletedEventArgs) Handles lvFields.ItemDeleted
        If e.Exception IsNot Nothing Then
            lblError.Text = "Sorry, that row cannot be deleted at this time. " +
                "<br>Another row in the database is using it. Details are below:" +
                "<br>A database error has occured. " & e.Exception.InnerException.Message
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that category. Please try again"
        End If
    End Sub

    Protected Sub lbFieldOwnerSort_Clicked(sender As Object, e As EventArgs)
        FieldObjectDataSource.SelectMethod = "fetchFieldList(SELECT * FROM Field ORDER BY Owner)"
    End Sub


    Protected Sub linkSort(sender As Object, e As EventArgs)
        Dim link As LinkButton = DirectCast(sender, LinkButton)
        Dim arg As String = link.CommandArgument.ToString()

        Dim sortBy As String = ""

        FieldObjectDataSource.SelectParameters.Clear()

        If (arg = "ID") Then
            If (lblFieldSortBy.Text = "FieldID ASC") Then
                sortBy = "FieldID DESC"
            Else
                sortBy = "FieldID ASC"
            End If
        End If

        If (arg = "FieldName") Then
            sortBy = If(lblFieldSortBy.Text = "FieldName ASC", "FieldName DESC", "FieldName ASC")
        End If

        If (arg = "Acres") Then
            sortBy = If(lblFieldSortBy.Text = "Acres ASC", "Acres DESC", "Acres ASC")
        End If

        If (arg = "Owner") Then
            sortBy = If(lblFieldSortBy.Text = "Owner ASC", "Owner DESC", "Owner ASC")
        End If

        lblFieldSortBy.Text = sortBy
        _query += "ORDER BY " + sortBy

        FieldObjectDataSource.SelectParameters.Add("Query", _query)

    End Sub


    Protected Sub btnField_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btnField.Click
        lblError.Text = "Please click the control to the right"
    End Sub
End Class
