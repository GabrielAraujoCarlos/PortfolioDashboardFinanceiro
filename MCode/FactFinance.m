let
    Source = Sql.Databases("localhost"),
    AdventureWorksTrat = Source{[Name="AdventureWorksTrat"]}[Data],
    dbo_FactFinance = AdventureWorksTrat{[Schema="dbo",Item="FactFinance"]}[Data],
    #"Merged Queries" = Table.NestedJoin(dbo_FactFinance, {"AccountKey"}, Expenditures, {"Column1"}, "Expenditures", JoinKind.LeftOuter),
    #"Expanded Expenditures" = Table.ExpandTableColumn(#"Merged Queries", "Expenditures", {"Column1"}, {"Expenditures.Column1"}),
    #"Added Custom" = Table.AddColumn(#"Expanded Expenditures", "Custom", each if([AccountKey] = [Expenditures.Column1]) then -[Amount] else [Amount]),
    #"Removed Columns" = Table.RemoveColumns(#"Added Custom",{"Amount"}),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Columns",{{"Custom", "Amount"}}),
    #"Changed Type" = Table.TransformColumnTypes(#"Renamed Columns",{{"Amount", type number}})
in
    #"Changed Type"