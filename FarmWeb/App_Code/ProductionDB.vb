Imports Microsoft.VisualBasic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.SqlClient

<DataObject(True)>
Public Class ProductionDB




    <DataObjectMethodAttribute(DataObjectMethodType.Select)>
    Public Shared Function fetchProductionList(ByVal Query As String) As List(Of Production)

        Dim myProductionList As New List(Of Production)

        Dim sqlConn As New SqlConnection(GetConnectionString)

        Try
            sqlConn.Open()

            Dim mySqlCommand As New SqlCommand(Query, sqlConn)
            Dim reader As SqlDataReader = mySqlCommand.ExecuteReader



            If reader.HasRows Then
                ' MsgBox("reader.hasrows is true")

                Dim myProduction As Production

                Do While reader.Read
                    myProduction = New Production

                    myProduction.ID = CInt(reader("ProductionID"))
                    myProduction.Year = CInt(reader("Year"))
                    myProduction.PlantDate = CDate(reader("PlantDate"))
                    myProduction.HarvestDate = CDate(reader("HarvestDate"))
                    myProduction.Yield = CInt(reader("Yield"))
                    myProduction.FieldID = CInt(reader("FieldID"))
                    myProduction.FieldName = reader("FieldName").ToString
                    myProduction.SeedBrand = reader("BrandName").ToString
                    myProduction.SeedID = CInt(reader("SeedID"))
                    myProduction.SeedVariety = reader("Variety").ToString
                    myProduction.Active = CBool(reader("Active"))

                    myProductionList.Add(myProduction)
                    myProduction = Nothing
                Loop
            End If
            reader.Close()

        Catch ex As SqlException
            Throw ex
            MsgBox("Database Server or Connection Error." & vbCr & ex.Message)
        Catch ex As DataException
            Throw ex
            MsgBox("There was an error returning data. " & vbCr & ex.Message)
        Catch ex As Exception
            Throw ex
            MsgBox("There was an unknown exception. " & vbCr & ex.Message)

        Finally
            sqlConn.Close()
        End Try

        Return myProductionList
    End Function



    <DataObjectMethod(DataObjectMethodType.Insert)>
    Public Shared Function AddProduction(ByVal production As Production) As Integer


        'MsgBox(production.ToString)


        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        Try
            Dim mySqlCommand As New SqlCommand("spProductionAdd", sqlConn)
            mySqlCommand.CommandType = CommandType.StoredProcedure

            mySqlCommand.Parameters.AddWithValue("@Year", production.Year)
            mySqlCommand.Parameters.AddWithValue("@PlantDate", production.PlantDate)
            mySqlCommand.Parameters.AddWithValue("@HarvestDate", production.HarvestDate)
            mySqlCommand.Parameters.AddWithValue("@Yield", production.Yield)
            mySqlCommand.Parameters.AddWithValue("@FieldID", production.FieldID)
            mySqlCommand.Parameters.AddWithValue("@SeedID", production.SeedID)

            sqlConn.Open()

            number = mySqlCommand.ExecuteNonQuery


        Catch ex As SqlException
            Throw ex
            If ex.Number = 2627 Then
                MsgBox("There is already a Production in the table with the year " & production.Year & " and the Field you chose, Field " & production.FieldID & "." &
                       vbCrLf & "Please choose another Year or another Field Name.", , "Primary Key Violation")
            Else
                MsgBox("An SqlException has happened" & vbCrLf & "Here's the details..." & vbCrLf & ex.Message)
            End If

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










    <DataObjectMethod(DataObjectMethodType.Update)>
    Public Shared Function UpdateSeed(ByVal original_production As Production, ByVal production As Production) As Integer


        ' MsgBox(original_production.ToString & vbCrLf & production.ToString)


        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        Try

            Dim mySqlCommand As New SqlCommand("spProductionUpdate", sqlConn)
            mySqlCommand.CommandType = CommandType.StoredProcedure

            mySqlCommand.Parameters.AddWithValue("@Year", production.Year)
            mySqlCommand.Parameters.AddWithValue("@PlantDate", production.PlantDate)
            mySqlCommand.Parameters.AddWithValue("@HarvestDate", production.HarvestDate)
            mySqlCommand.Parameters.AddWithValue("@Yield", production.Yield)
            mySqlCommand.Parameters.AddWithValue("@FieldID", production.FieldID)
            mySqlCommand.Parameters.AddWithValue("@SeedID", production.SeedID)
            mySqlCommand.Parameters.AddWithValue("@Active", production.Active)

            mySqlCommand.Parameters.AddWithValue("@original_ProductionID", original_production.ID)
            mySqlCommand.Parameters.AddWithValue("@original_Year", original_production.Year)
            mySqlCommand.Parameters.AddWithValue("@original_PlantDate", original_production.PlantDate)
            mySqlCommand.Parameters.AddWithValue("@original_HarvestDate", original_production.HarvestDate)
            mySqlCommand.Parameters.AddWithValue("@original_Yield", original_production.Yield)
            mySqlCommand.Parameters.AddWithValue("@original_FieldID", original_production.FieldID)
            mySqlCommand.Parameters.AddWithValue("@original_SeedID", original_production.SeedID)
            mySqlCommand.Parameters.AddWithValue("@original_Active", original_production.Active)

            sqlConn.Open()

            number = mySqlCommand.ExecuteNonQuery



        Catch ex As SqlException
            Throw ex
            MsgBox("Database Server or Connection Error." & vbCr & ex.Message)
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








    <DataObjectMethod(DataObjectMethodType.Delete)>
    Public Shared Function DeleteSeed(ByVal production As Production) As Integer

        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        Try

            Dim mySqlCommand As New SqlCommand("spProductionDelete", sqlConn)
            mySqlCommand.CommandType = CommandType.StoredProcedure

            mySqlCommand.Parameters.AddWithValue("@ProductionID", production.ID)
            mySqlCommand.Parameters.AddWithValue("@Year", production.Year)
            mySqlCommand.Parameters.AddWithValue("@PlantDate", production.PlantDate)
            mySqlCommand.Parameters.AddWithValue("@HarvestDate", production.HarvestDate)
            mySqlCommand.Parameters.AddWithValue("@Yield", production.Yield)
            mySqlCommand.Parameters.AddWithValue("@FieldID", production.FieldID)
            mySqlCommand.Parameters.AddWithValue("@SeedID", production.SeedID)
            mySqlCommand.Parameters.AddWithValue("@Active", production.Active)

            sqlConn.Open()

            number = mySqlCommand.ExecuteNonQuery

        Catch ex As SqlException
            Throw ex
            MsgBox("Database Server or Connection Error." & vbCr & ex.Message)
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
