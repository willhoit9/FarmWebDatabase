Imports Microsoft.VisualBasic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.SqlClient


<DataObject(True)>
Public Class FieldDB



    <DataObjectMethodAttribute(DataObjectMethodType.Select)>
    Public Shared Function fetchFieldList(Optional ByVal Query As String = "SELECT * FROM Field") As List(Of Field)

        Dim myFieldList As New List(Of Field)
        Dim sqlConn As New SqlConnection(GetConnectionString)

        Try
            sqlConn.Open()
            'Query = "Select * from field"
            Dim mySqlCommand As New SqlCommand(Query, sqlConn)
            Dim reader As SqlDataReader = mySqlCommand.ExecuteReader

            If reader.HasRows Then
                ' MsgBox("reader.hasrows is true")

                Dim myField As Field

                Do While reader.Read
                    myField = New Field
                    myField.FieldID = CInt(reader("FieldID"))
                    myField.FieldName = reader("FieldName").ToString
                    myField.Acres = CInt(reader("Acres"))
                    myField.Owner = reader("Owner").ToString
                    myField.Active = CBool(reader("Active"))

                    myFieldList.Add(myField)
                    myField = Nothing
                Loop
            End If
            reader.Close()

        Catch ex As SqlException
            MsgBox("Database Server or Connection Error." & vbCr & ex.Message)
        Catch ex As DataException
            MsgBox("There was an error returning data. " & vbCr & ex.Message)
        Catch ex As Exception
            MsgBox("There was an unknown exception. " & vbCr & ex.Message)
        Finally
            sqlConn.Close()
        End Try

        Return myFieldList
    End Function


    <DataObjectMethod(DataObjectMethodType.Insert)>
    Public Shared Function AddField(ByVal field As Field) As Integer

        '  Dim Success As Boolean = False
        Dim sqlConn As New SqlConnection(GetConnectionString)

        Dim number As Integer

        Try
            'myConn()
            Dim fieldCmd As New SqlCommand("spInsertField", sqlConn)
            fieldCmd.CommandType = CommandType.StoredProcedure

            fieldCmd.Parameters.AddWithValue("@FieldName", field.FieldName)
            fieldCmd.Parameters.AddWithValue("@Acres", field.Acres)
            fieldCmd.Parameters.AddWithValue("@Owner", field.Owner)
            sqlConn.Open()

            number = fieldCmd.ExecuteNonQuery

            'If number = 1 Then
            '    Success = True
            'End If

        Catch ex As SqlException
            MsgBox("Database Server or Connection Error." & vbCr & ex.Message)
        Catch ex As DataException
            MsgBox("There was an error returning data. " & vbCr & ex.Message)
        Catch ex As Exception
            MsgBox("There was an unknown exception. " & vbCr & ex.Message)
        Finally
            sqlConn.Close()

        End Try

        Return number
    End Function




    <DataObjectMethod(DataObjectMethodType.Update)>
    Public Shared Function UpdateField(ByVal original_field As Field, ByVal field As Field) As Integer

        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        ' MsgBox("HI " & field.ToString)

        Try

            Dim fieldCmd As New SqlCommand("spUpdateField", sqlConn)
            fieldCmd.CommandType = CommandType.StoredProcedure

            fieldCmd.Parameters.AddWithValue("@FieldName", field.FieldName)
            fieldCmd.Parameters.AddWithValue("@Acres", field.Acres)
            fieldCmd.Parameters.AddWithValue("@Owner", field.Owner)
            fieldCmd.Parameters.AddWithValue("@Active", field.Active)
            fieldCmd.Parameters.AddWithValue("@original_FieldID", original_field.FieldID)
            fieldCmd.Parameters.AddWithValue("@original_FieldName", original_field.FieldName)
            fieldCmd.Parameters.AddWithValue("@original_Acres", original_field.Acres)
            fieldCmd.Parameters.AddWithValue("@original_Owner", original_field.Owner)
            fieldCmd.Parameters.AddWithValue("@original_Active", original_field.Active)

            sqlConn.Open()

            number = fieldCmd.ExecuteNonQuery

        Catch ex As SqlException
            MsgBox("Database Server or Connection Error." & vbCr & ex.Message)
        Catch ex As DataException
            MsgBox("There was an error returning data. " & vbCr & ex.Message)
        Catch ex As Exception
            MsgBox("There was an unknown exception. " & vbCr & ex.Message)
        Finally
            sqlConn.Close()
        End Try

        Return number
    End Function



    <DataObjectMethod(DataObjectMethodType.Delete)>
    Public Shared Function DeleteField(ByVal field As Field) As Integer

        Dim sqlConn As New SqlConnection(GetConnectionString)
        Dim number As Integer

        ' MsgBox("FIELD ID:" & field.FieldID & " FIELD NAME: " & field.FieldName)

        Try

            Dim fieldCmd As New SqlCommand("spDeleteField", sqlConn)
            fieldCmd.CommandType = CommandType.StoredProcedure


            fieldCmd.Parameters.AddWithValue("@FieldID", field.FieldID)
            fieldCmd.Parameters.AddWithValue("@FieldName", field.FieldName)
            fieldCmd.Parameters.AddWithValue("@Acres", field.Acres)
            fieldCmd.Parameters.AddWithValue("@Owner", field.Owner)
            fieldCmd.Parameters.AddWithValue("@Active", field.Active)

            sqlConn.Open()

            number = fieldCmd.ExecuteNonQuery

        Catch ex As SqlException
            Throw ex
            '  MsgBox("Database Server or Connection Error." & vbCr & ex.Message)
        Catch ex As DataException
            Throw ex
            '  MsgBox("There was an error returning data. " & vbCr & ex.Message)
        Catch ex As Exception
            Throw ex
            ' Dim ax As New Exception("There was an unknown exception. ", ex)
            '  MsgBox("There was an unknown exception. " & vbCr & ex.Message)
        Finally
            sqlConn.Close()
        End Try

        Return number
    End Function


    <DataObjectMethodAttribute(DataObjectMethodType.Select)>
    Public Shared Function fetchFieldNameList() As DropDownList
        'ByVal ddl As DropDownList

        Dim ddl As New DropDownList

        Dim sqlConn As New SqlConnection(GetConnectionString)

        Dim Query As String = "SELECT FieldID, FieldName FROM Field"


        Try
            sqlConn.Open()

            Dim mySqlCommand As New SqlCommand(Query, sqlConn)
            '   Dim reader As SqlDataReader = mySqlCommand.ExecuteReader


            Dim da As SqlDataAdapter = New SqlDataAdapter(mySqlCommand)
            Dim ds As New DataSet
            da.Fill(ds)

            ddl.DataSource = ds.Tables(0)
            ddl.DataTextField = "FieldName"
            ddl.DataValueField = "FieldID"
            ddl.DataBind()

            ddl.Items.Insert(0, New ListItem(" Select ", "-1"))



            '   reader.Close()

        Catch ex As SqlException
            MsgBox("Database Server or Connection Error." & vbCr & ex.Message)
        Catch ex As DataException
            MsgBox("There was an error returning data. " & vbCr & ex.Message)
        Catch ex As Exception
            MsgBox("There was an unknown exception. " & vbCr & ex.Message)
        Finally
            sqlConn.Close()
        End Try

        Return ddl



    End Function






    Private Shared Function GetConnectionString() As String
        Return ConfigurationManager.ConnectionStrings(
            "FarmDBConnectionString").ConnectionString
    End Function

End Class
