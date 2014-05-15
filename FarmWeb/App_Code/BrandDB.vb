Imports Microsoft.VisualBasic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.SqlClient

<DataObject(True)>
Public Class BrandDB



    <DataObjectMethodAttribute(DataObjectMethodType.Select)>
    Public Shared Function fetchBrandList(Optional ByVal Query As String = "Select * FROM Brand ") As List(Of Brand)

        Dim myBrandList As New List(Of Brand)
        Dim myBrand As Brand
        Dim sqlConn As New SqlConnection(GetConnectionString)

        '  Dim sp As String = "spBrandGetAll"

        'If ActiveOnly = True Then
        '    sp = "spBrandGetActive"
        'End If

        Try

            Dim mySqlCommand As New SqlCommand(Query, sqlConn)
            '  mySqlCommand.CommandType = CommandType.StoredProcedure

            sqlConn.Open()

            Dim myReader = mySqlCommand.ExecuteReader
            If myReader.HasRows Then

                Do While myReader.Read
                    myBrand = New Brand

                    myBrand.BrandID = CInt(myReader("BrandID"))
                    myBrand.BrandName = myReader("BrandName").ToString
                    myBrand.BrandDealerName = myReader("BrandDealerName").ToString
                    myBrand.Active = CBool(myReader("Active"))

                    myBrandList.Add(myBrand)
                    myBrand = Nothing
                Loop

            End If
            myReader.Close()
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



        Return myBrandList
    End Function






    <DataObjectMethod(DataObjectMethodType.Insert)>
    Public Shared Function addBrand(ByVal brand As Brand) As Integer

        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        Try

            Dim mySqlCommand As New SqlCommand("spBrandAdd", sqlConn)
            mySqlCommand.CommandType = CommandType.StoredProcedure

            mySqlCommand.Parameters.AddWithValue("@BrandName", brand.BrandName)
            mySqlCommand.Parameters.AddWithValue("@BrandDealerName", brand.BrandDealerName)


            sqlConn.Open()

            number = mySqlCommand.ExecuteNonQuery


        Catch ex As SqlException
            Throw ex
            If ex.Number = 2627 Then
                MsgBox("A primary key Violation has happend. That should not have happend. What did you do?!", , "Primary Key Violation")
            Else
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
    Public Shared Function UpdateBrand(ByVal original_brand As Brand, ByVal brand As Brand) As Integer


        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        Try

            Dim mySqlCommand As New SqlCommand("spBrandUpdate", sqlConn)
            mySqlCommand.CommandType = CommandType.StoredProcedure

            mySqlCommand.Parameters.AddWithValue("@BrandName", brand.BrandName)
            mySqlCommand.Parameters.AddWithValue("@BrandDealerName", brand.BrandDealerName)
            mySqlCommand.Parameters.AddWithValue("@Active", brand.Active)

            mySqlCommand.Parameters.AddWithValue("@original_BrandID", original_brand.BrandID)
            mySqlCommand.Parameters.AddWithValue("@original_BrandName", original_brand.BrandName)
            mySqlCommand.Parameters.AddWithValue("@original_BrandDealerName", original_brand.BrandDealerName)
            mySqlCommand.Parameters.AddWithValue("@original_Active", original_brand.Active)

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
    Public Shared Function DeleteBrand(ByVal brand As Brand) As Integer

        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        Try

            Dim mySqlCommand As New SqlCommand("spDeleteBrand", sqlConn)
            mySqlCommand.CommandType = CommandType.StoredProcedure

            mySqlCommand.Parameters.AddWithValue("@BrandID", brand.BrandID)
            mySqlCommand.Parameters.AddWithValue("@BrandName", brand.BrandName)
            mySqlCommand.Parameters.AddWithValue("@BrandDealerName", brand.BrandDealerName)
            mySqlCommand.Parameters.AddWithValue("@Active", brand.Active)

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
