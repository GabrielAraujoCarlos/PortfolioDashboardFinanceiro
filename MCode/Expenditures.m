let
    Source = Sql.Databases("localhost"),
    AdventureWorksTrat = Source{[Name="AdventureWorksTrat"]}[Data],
    dbo_DimAccount = AdventureWorksTrat{[Schema="dbo",Item="DimAccount"]}[Data],
    #"Filtered Rows" = Table.SelectRows(dbo_DimAccount, each ([AccountType] = "Expenditures")),
    AccountKey1 = #"Filtered Rows"[AccountKey],
    #"Converted to Table" = Table.FromList(AccountKey1, Splitter.SplitByNothing(), null, null, ExtraValues.Error)
in
    #"Converted to Table"