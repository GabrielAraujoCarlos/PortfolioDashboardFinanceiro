let
    Source = Sql.Databases("localhost"),
    AdventureWorksTrat = Source{[Name="AdventureWorksTrat"]}[Data],
    dbo_DimOrganization = AdventureWorksTrat{[Schema="dbo",Item="DimOrganization"]}[Data]
in
    dbo_DimOrganization