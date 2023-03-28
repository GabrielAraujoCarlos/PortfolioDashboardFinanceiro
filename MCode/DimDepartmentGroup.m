let
    Source = Sql.Databases("localhost"),
    AdventureWorksTrat = Source{[Name="AdventureWorksTrat"]}[Data],
    dbo_DimDepartmentGroup = AdventureWorksTrat{[Schema="dbo",Item="DimDepartmentGroup"]}[Data]
in
    dbo_DimDepartmentGroup