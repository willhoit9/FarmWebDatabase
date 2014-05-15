Imports Microsoft.VisualBasic

Public Class Field
    Private _FieldID As Integer
    Private _FieldName As String
    Private _Acres As Integer
    Private _Owner As String
    Private _Active As Boolean

    'Empty Constructor
    Public Sub New()

    End Sub

    Public Property FieldID() As Integer
        Get
            Return _FieldID
        End Get
        Set(ByVal value As Integer)
            _FieldID = value
        End Set
    End Property


    Public Property FieldName() As String
        Get
            Return _FieldName
        End Get
        Set(ByVal value As String)
            _FieldName = value
        End Set
    End Property


    Public Property Acres() As Integer
        Get
            Return _Acres
        End Get
        Set(ByVal value As Integer)
            _Acres = value
        End Set
    End Property


    Public Property Owner() As String
        Get
            Return _Owner
        End Get
        Set(ByVal value As String)
            _Owner = value
        End Set
    End Property


    Public Property Active() As Boolean
        Get
            Return _Active
        End Get
        Set(ByVal value As Boolean)
            _Active = value
        End Set
    End Property

    Public Overrides Function ToString() As String
        Return Me.FieldID & " " & Me.FieldName & " " & Me.Acres & " " & Me.Owner & " " & Me.Active
    End Function


End Class
