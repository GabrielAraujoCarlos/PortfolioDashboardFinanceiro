let
    Source = Sql.Databases(localhost),
    AdventureWorksTrat = Source{[Name=AdventureWorksTrat]}[Data],
    dbo_DimAccount = AdventureWorksTrat{[Schema=dbo,Item=DimAccount]}[Data]
in
    dbo_DimAccount