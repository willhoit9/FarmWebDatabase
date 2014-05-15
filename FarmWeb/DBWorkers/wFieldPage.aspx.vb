
Partial Class DBWorkers_wFieldPage
    Inherits System.Web.UI.Page

    Private _query As String = "SELECT * FROM Field "

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lblFieldSortBy.Text = "FieldID ASC"
        End If

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
End Class
