Public Class ProdChem

    Private _ProductionID As Integer
    Private _ChemicalID As Integer
    Private _ChemicalType As String
    Private _ChemicalBrand As String
    Private _ChemicalName As String
    Private _ApplicationDate As Date
    Private _Active As Boolean

    Public Sub New()

    End Sub

    Public Property ProductionID() As Integer
        Get
            Return _ProductionID
        End Get
        Set(ByVal value As Integer)
            _ProductionID = value
        End Set
    End Property


    Public Property ChemicalID() As Integer
        Get
            Return _ChemicalID
        End Get
        Set(ByVal value As Integer)
            _ChemicalID = value
        End Set
    End Property

    Public Property ChemicalName() As String
        Get
            Return _ChemicalName
        End Get
        Set(ByVal value As String)
            _ChemicalName = value
        End Set
    End Property

    Public Property ChemicalBrand() As String
        Get
            Return _ChemicalBrand
        End Get
        Set(ByVal value As String)
            _ChemicalBrand = value
        End Set
    End Property

    Public Property ChemicalType() As String
        Get
            Return _ChemicalType
        End Get
        Set(ByVal value As String)
            _ChemicalType = value
        End Set
    End Property




    Public Property ApplicationDate() As Date
        Get
            Return _ApplicationDate
        End Get
        Set(ByVal value As Date)
            _ApplicationDate = value
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
