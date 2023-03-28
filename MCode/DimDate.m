let
    Source = Sql.Databases("localhost"),
    AdventureWorksTrat = Source{[Name="AdventureWorksTrat"]}[Data],
    dbo_DimDate = AdventureWorksTrat{[Schema="dbo",Item="DimDate"]}[Data]
in
    dbo_DimDate