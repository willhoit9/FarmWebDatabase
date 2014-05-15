Imports Microsoft.VisualBasic

Public Class Brand
    Private _BrandID As Integer
    Private _BrandName As String
    Private _BrandDealerName As String
    Private _Active As Boolean

    Public Sub New()

    End Sub

    Public Property BrandID() As Integer
        Get
            Return _BrandID
        End Get
        Set(ByVal value As Integer)
            _BrandID = value
        End Set
    End Property


    Public Property BrandName() As String
        Get
            Return _BrandName
        End Get
        Set(ByVal value As String)
            _BrandName = value
        End Set
    End Property


    Public Property BrandDealerName() As String
        Get
            Return _BrandDealerName
        End Get
        Set(ByVal value As String)
            _BrandDealerName = value
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

End Class
