let
    Source = Sql.Databases("localhost"),
    AdventureWorksTrat = Source{[Name="AdventureWorksTrat"]}[Data],
    dbo_DimDate = AdventureWorksTrat{[Schema="dbo",Item="DimDate"]}[Data],
    #"Changed Type" = Table.TransformColumnTypes(dbo_DimDate,{{"FullDateAlternateKey", type date}})
in
    #"Changed Type"