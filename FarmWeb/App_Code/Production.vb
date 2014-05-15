Public Class Production


    Private _ID As Integer         'Production Table
    Private _Year As Integer       'Production Table
    Private _PlantDate As Date     'Production Table
    Private _HarvestDate As Date   'Production Table
    Private _Yield As Double       'Production Table
    Private _FieldID As Integer    'Production Table
    Private _FieldName As String   'Field Table
    Private _SeedBrand As String   'Brand Table
    Private _SeedID As Integer     'Production Table
    Private _SeedVariety As String 'Seed Table
    Private _Active As Boolean     'Production Table

    Public Sub New()

    End Sub

    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property


    Public Property Year() As Integer
        Get
            Return _Year
        End Get
        Set(ByVal value As Integer)
            _Year = value
        End Set
    End Property


    Public Property PlantDate() As Date
        Get
            Return _PlantDate
        End Get
        Set(ByVal value As Date)
            _PlantDate = value
        End Set
    End Property


    Public Property HarvestDate() As Date
        Get
            Return _HarvestDate
        End Get
        Set(ByVal value As Date)
            _HarvestDate = value
        End Set
    End Property


    Public Property Yield() As Integer
        Get
            Return _Yield
        End Get
        Set(ByVal value As Integer)
            _Yield = value
        End Set
    End Property


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



    Public Property SeedBrand() As String
        Get
            Return _SeedBrand
        End Get
        Set(ByVal value As String)
            _SeedBrand = value
        End Set
    End Property


    Public Property SeedID() As Integer
        Get
            Return _SeedID
        End Get
        Set(ByVal value As Integer)
            _SeedID = value
        End Set
    End Property



    Public Property SeedVariety() As String
        Get
            Return _SeedVariety
        End Get
        Set(ByVal value As String)
            _SeedVariety = value
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
        Return "ID: " & Me.ID & "  Year: " & Me.Year & "  PlantDate: " & Me.PlantDate & "  HarvestDate: " & Me.HarvestDate & "  Yield: " & Me.Yield & "  FieldID: " & Me.FieldID & "  FieldName " & Me.FieldName & "  SeedID: " & Me.SeedID & "  SeedName: " & Me.SeedBrand & "  SeedVariety: " & Me.SeedVariety & "  Active: " & Me.Active
    End Function





End Class
