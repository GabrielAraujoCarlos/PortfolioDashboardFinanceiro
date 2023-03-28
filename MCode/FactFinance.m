let
    Source = Sql.Databases("localhost"),
    AdventureWorksTrat = Source{[Name="AdventureWorksTrat"]}[Data],
    dbo_FactFinance = AdventureWorksTrat{[Schema="dbo",Item="FactFinance"]}[Data]
in
    dbo_FactFinance