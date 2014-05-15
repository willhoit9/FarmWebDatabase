
Partial Class DBWorkers_wChemicalPage
    Inherits System.Web.UI.Page

    Private _query As String = "SELECT * FROM Chemical "

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lblSortBy.Text = "ChemicalID ASC"
        End If


    End Sub


    Protected Sub linkSort(sender As Object, e As EventArgs)
        Dim link As LinkButton = DirectCast(sender, LinkButton)
        Dim arg As String = link.CommandArgument.ToString()

        Dim sortBy As String = ""

        ChemObjectDataSource1.SelectParameters.Clear()

        If (arg = "ID") Then
            If (lblSortBy.Text = "ChemicalID ASC") Then
                sortBy = "ChemicalID DESC"
            Else
                sortBy = "ChemicalID ASC"
            End If
        End If

        If (arg = "ChemicalName") Then
            sortBy = If(lblSortBy.Text = "ChemicalName ASC", "ChemicalName DESC", "ChemicalName ASC")
        End If

        If (arg = "ChemicalBrand") Then
            sortBy = If(lblSortBy.Text = "ChemicalBrand ASC", "ChemicalBrand DESC", "ChemicalBrand ASC")
        End If

        If (arg = "ChemicalType") Then
            sortBy = If(lblSortBy.Text = "ChemicalType ASC", "ChemicalType DESC", "ChemicalType ASC")
        End If

        lblSortBy.Text = sortBy
        _query += "ORDER BY " + sortBy
        ChemObjectDataSource1.SelectParameters.Add("Query", _query)

    End Sub

End Class
