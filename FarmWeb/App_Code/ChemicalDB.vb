Imports Microsoft.VisualBasic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.SqlClient

<DataObject(True)>
Public Class ChemicalDB


    <DataObjectMethodAttribute(DataObjectMethodType.Select)>
    Public Shared Function fetchChemList(Optional ByVal Query As String = "SELECT *	FROM Chemical") As List(Of Chemical)

        Dim myChemList As New List(Of Chemical)
        Dim sqlConn As New SqlConnection(GetConnectionString)

        'Dim sp As String = "spChemicalGetAll"

        'If ActiveOnly = True Then
        '    sp = "spChemicalGetAllActive"
        'End If


        Try
            sqlConn.Open()

            Dim mySqlCommand As New SqlCommand(Query, sqlConn)
            'mySqlCommand.CommandType = CommandType.StoredProcedure

            Dim reader As SqlDataReader = mySqlCommand.ExecuteReader

            If reader.HasRows Then

                Dim myChemical As Chemical

                Do While reader.Read
                    myChemical = New Chemical

                    myChemical.ChemicalID = CInt(reader("ChemicalID"))
                    myChemical.ChemicalName = reader("ChemicalName").ToString
                    myChemical.ChemicalBrand = reader("ChemicalBrand").ToString
                    myChemical.ChemicalType = reader("ChemicalType").ToString
                    myChemical.Active = CBool(reader("Active"))

                    myChemList.Add(myChemical)

                    myChemical = Nothing
                Loop
            End If
            reader.Close()

        Catch ex As SqlException
            MsgBox("Database Server or Connection Error." & vbCr & ex.Message)
            Throw ex
        Catch ex As DataException
            MsgBox("There was an error returning data. " & vbCr & ex.Message)
            Throw ex
        Catch ex As Exception
            MsgBox("There was an unknown exception. " & vbCr & ex.Message)
            Throw ex
        Finally
            sqlConn.Close()
        End Try

        Return myChemList
    End Function




    <DataObjectMethod(DataObjectMethodType.Insert)>
    Public Shared Function AddChem(ByVal chemical As Chemical) As Integer

        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        Try

            Dim mySqlCommand As New SqlCommand("spChemicalAdd", sqlConn)
            mySqlCommand.CommandType = CommandType.StoredProcedure

            mySqlCommand.Parameters.AddWithValue("@ChemicalName", chemical.ChemicalName)
            mySqlCommand.Parameters.AddWithValue("@ChemicalBrand", chemical.ChemicalBrand)
            mySqlCommand.Parameters.AddWithValue("@ChemicalType", chemical.ChemicalType)
            sqlConn.Open()

            number = mySqlCommand.ExecuteNonQuery

        Catch ex As SqlException
            MsgBox("Database Server or Connection Error." & vbCr & ex.Message)
            Throw ex
        Catch ex As DataException
            MsgBox("There was an error returning data. " & vbCr & ex.Message)
            Throw ex
        Catch ex As Exception
            MsgBox("There was an unknown exception. " & vbCr & ex.Message)
            Throw ex
        Finally
            sqlConn.Close()

        End Try

        Return number
    End Function





    <DataObjectMethod(DataObjectMethodType.Update)>
    Public Shared Function UpdateChemical(ByVal original_chemical As Chemical, ByVal chemical As Chemical) As Integer


        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        Try

            Dim mySqlCommand As New SqlCommand("spUpdateChemical", sqlConn)
            mySqlCommand.CommandType = CommandType.StoredProcedure

            mySqlCommand.Parameters.AddWithValue("@ChemicalName", chemical.ChemicalName)
            mySqlCommand.Parameters.AddWithValue("@ChemicalBrand", chemical.ChemicalBrand)
            mySqlCommand.Parameters.AddWithValue("@ChemicalType", chemical.ChemicalType)
            mySqlCommand.Parameters.AddWithValue("@Active", chemical.Active)

            mySqlCommand.Parameters.AddWithValue("@original_ChemicalID", original_chemical.ChemicalID)
            mySqlCommand.Parameters.AddWithValue("@original_ChemicalName", original_chemical.ChemicalName)
            mySqlCommand.Parameters.AddWithValue("@original_ChemicalBrand", original_chemical.ChemicalBrand)
            mySqlCommand.Parameters.AddWithValue("@original_ChemicalType", original_chemical.ChemicalType)
            mySqlCommand.Parameters.AddWithValue("@original_Active", original_chemical.Active)

            sqlConn.Open()

            number = mySqlCommand.ExecuteNonQuery



        Catch ex As SqlException
            MsgBox("Database Server or Connection Error." & vbCr & ex.Message)
            Throw ex
        Catch ex As DataException
            MsgBox("There was an error returning data. " & vbCr & ex.Message)
            Throw ex
        Catch ex As Exception
            MsgBox("There was an unknown exception. " & vbCr & ex.Message)
            Throw ex
        Finally
            sqlConn.Close()
        End Try

        Return number
    End Function



    <DataObjectMethod(DataObjectMethodType.Delete)>
    Public Shared Function DeleteChemical(ByVal chemical As Chemical) As Integer


        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        Try

            Dim mySqlCommand As New SqlCommand("spChemicalDelete", sqlConn)
            mySqlCommand.CommandType = CommandType.StoredProcedure


            mySqlCommand.Parameters.AddWithValue("@ChemicalID", chemical.ChemicalID)
            mySqlCommand.Parameters.AddWithValue("@ChemicalName", chemical.ChemicalName)
            mySqlCommand.Parameters.AddWithValue("@ChemicalBrand", chemical.ChemicalBrand)
            mySqlCommand.Parameters.AddWithValue("@ChemicalType", chemical.ChemicalType)
            mySqlCommand.Parameters.AddWithValue("@Active", chemical.Active)

            sqlConn.Open()

            number = mySqlCommand.ExecuteNonQuery



        Catch ex As SqlException
            Throw ex
            'MsgBox("Database Server or Connection Error." & vbCr & ex.Message)
        Catch ex As DataException
            Throw ex
            MsgBox("There was an error returning data. " & vbCr & ex.Message)
        Catch ex As Exception
            Throw ex
            MsgBox("There was an unknown exception. " & vbCr & ex.Message)
        Finally
            sqlConn.Close()
        End Try

        Return number
    End Function


    Private Shared Function GetConnectionString() As String
        Return ConfigurationManager.ConnectionStrings(
            "FarmDBConnectionString").ConnectionString
    End Function

End Class
