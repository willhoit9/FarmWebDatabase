Imports Microsoft.VisualBasic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.SqlClient

<DataObject(True)>
Public Class SeedDB


    <DataObjectMethodAttribute(DataObjectMethodType.Select)>
    Public Shared Function fetchSeedList(Optional ByVal Query As String = "SELECT s.SeedID, s.Variety, s.SeedName, s.Crop, s.BrandID, b.BrandName, s.Active FROM Brand b JOIN Seed s ON b.BrandID = s.BrandID") As List(Of Seed)

        Dim mySeedList As New List(Of Seed)

        Dim sqlConn As New SqlConnection(GetConnectionString)

        Try
            sqlConn.Open()

            Dim mySqlCommand As New SqlCommand(Query, sqlConn)
            Dim reader As SqlDataReader = mySqlCommand.ExecuteReader

            If reader.HasRows Then
                ' MsgBox("reader.hasrows is true")

                Dim mySeed As Seed

                Do While reader.Read
                    mySeed = New Seed
                    mySeed.SeedID = CInt(reader("SeedID"))
                    mySeed.Variety = reader("Variety").ToString
                    mySeed.SeedName = reader("SeedName").ToString
                    mySeed.Crop = reader("Crop").ToString
                    mySeed.BrandID = CInt(reader("BrandID"))
                    mySeed.BrandName = reader("BrandName").ToString
                    mySeed.Active = CBool(reader("Active"))

                    mySeedList.Add(mySeed)
                    mySeed = Nothing
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

        Return mySeedList
    End Function



    <DataObjectMethod(DataObjectMethodType.Insert)>
    Public Shared Function addSeed(ByVal seed As Seed) As Integer

        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        Try

            Dim mySqlCommand As New SqlCommand("spSeedAdd", sqlConn)
            mySqlCommand.CommandType = CommandType.StoredProcedure

            mySqlCommand.Parameters.AddWithValue("@Variety", seed.Variety)
            mySqlCommand.Parameters.AddWithValue("@SeedName", seed.SeedName)
            mySqlCommand.Parameters.AddWithValue("@Crop", seed.Crop)
            mySqlCommand.Parameters.AddWithValue("@BrandID", seed.BrandID)

            sqlConn.Open()

            number = mySqlCommand.ExecuteNonQuery


        Catch ex As SqlException
            If ex.Number = 2627 Then
                Throw ex
                MsgBox("A primary key Violation has happend. That should not have happend. What did you do?!", , "Primary Key Violation")
            Else
                Throw ex
                MsgBox("An SqlException has happened" & vbCrLf & "Here's the details..." & vbCrLf & ex.ToString)
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
    Public Shared Function UpdateSeed(ByVal original_seed As Seed, ByVal seed As Seed) As Integer


        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        Try

            Dim mySqlCommand As New SqlCommand("spUpdateSeed", sqlConn)
            mySqlCommand.CommandType = CommandType.StoredProcedure

            mySqlCommand.Parameters.AddWithValue("@Variety", seed.Variety)
            mySqlCommand.Parameters.AddWithValue("@SeedName", seed.SeedName)
            mySqlCommand.Parameters.AddWithValue("@Crop", seed.Crop)
            mySqlCommand.Parameters.AddWithValue("@BrandID", seed.BrandID)
            mySqlCommand.Parameters.AddWithValue("@Active", seed.Active)
            mySqlCommand.Parameters.AddWithValue("original_SeedID", original_seed.SeedID)
            mySqlCommand.Parameters.AddWithValue("original_Variety", original_seed.Variety)
            mySqlCommand.Parameters.AddWithValue("original_SeedName", original_seed.SeedName)
            mySqlCommand.Parameters.AddWithValue("original_Crop", original_seed.Crop)
            mySqlCommand.Parameters.AddWithValue("original_BrandID", original_seed.BrandID)
            mySqlCommand.Parameters.AddWithValue("@original_Active", original_seed.Active)

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
    Public Shared Function DeleteSeed(ByVal seed As Seed) As Integer

        'MsgBox(seed.SeedID & " " & seed.Variety)

        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        Try

            Dim mySqlCommand As New SqlCommand("spDeleteSeed", sqlConn)
            mySqlCommand.CommandType = CommandType.StoredProcedure

            mySqlCommand.Parameters.AddWithValue("@SeedID", seed.SeedID)
            mySqlCommand.Parameters.AddWithValue("@Variety", seed.Variety)
            mySqlCommand.Parameters.AddWithValue("@SeedName", seed.SeedName)
            mySqlCommand.Parameters.AddWithValue("@Crop", seed.Crop)
            mySqlCommand.Parameters.AddWithValue("@BrandID", seed.BrandID)
            mySqlCommand.Parameters.AddWithValue("@Active", seed.Active)

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
