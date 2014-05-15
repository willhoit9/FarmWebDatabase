
Partial Class DBMaintenance_ChemicalPage
    Inherits System.Web.UI.Page

    Private _query As String = "SELECT * FROM Chemical "

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lblSortBy.Text = "ChemicalID ASC"
        End If

    End Sub

    Protected Sub ChemObjectDataSource1_Deleted(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ChemObjectDataSource1.Deleted
        e.AffectedRows = CType(e.ReturnValue, Integer)
    End Sub


    Protected Sub lvChemicalAdmin_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.ListViewDeletedEventArgs) Handles lvChemicalAdmin.ItemDeleted

        If e.Exception IsNot Nothing Then
            chemicalLblError.Text = "Sorry, that row cannot be deleted at this time. " +
                "<br>Another row in the database is using it. Details are below:" +
                "<br>A database error has occured. " & e.Exception.InnerException.Message
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            chemicalLblError.Text = "Another user may have updated that category. Please try again"
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



    Protected Sub btnChem_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btnChem.Click
        chemicalLblError.Text = "Please click the control to the right"
    End Sub


End Class
