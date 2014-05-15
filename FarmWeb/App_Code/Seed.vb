Public Class Seed

    Private _SeedID As Integer
    Private _Variety As String
    Private _SeedName As String
    Private _Crop As String
    Private _BrandID As Integer
    Private _BrandName As String
    Private _Active As Boolean



    Public Sub New()

    End Sub

    Public Property SeedID() As Integer
        Get
            Return _SeedID
        End Get
        Set(ByVal value As Integer)
            _SeedID = value
        End Set
    End Property


    Public Property Variety() As String
        Get
            Return _Variety
        End Get
        Set(ByVal value As String)
            _Variety = value
        End Set
    End Property


    Public Property SeedName() As String
        Get
            Return _SeedName
        End Get
        Set(ByVal value As String)
            _SeedName = value
        End Set
    End Property


    Public Property Crop() As String
        Get
            Return _Crop
        End Get
        Set(ByVal value As String)
            _Crop = value
        End Set
    End Property


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

    Public Property Active() As Boolean
        Get
            Return _Active
        End Get
        Set(ByVal value As Boolean)
            _Active = value
        End Set
    End Property

    Public Overrides Function toString() As String

        Return Me.SeedID & Me.SeedName & Me.Variety & Me.BrandName & Me.BrandID & Me.Crop & Me.Active
    End Function




End Class

