let
    Source = Sql.Databases("localhost"),
    AdventureWorksTrat = Source{[Name="AdventureWorksTrat"]}[Data],
    dbo_DimAccount = AdventureWorksTrat{[Schema="dbo",Item="DimAccount"]}[Data],
    #"Added Conditional Column" = Table.AddColumn(dbo_DimAccount, "Custom", each if [AccountDescriptionNv3] <> null then [AccountDescriptionNv3] else [AccountDescriptionNv2], type text),
    #"Added Conditional Column1" = Table.AddColumn(#"Added Conditional Column", "Custom.1", each if [AccountDescriptionNv4] <> null then [AccountDescriptionNv4] else [Custom], type text),
    #"Added Conditional Column2" = Table.AddColumn(#"Added Conditional Column1", "Custom.2", each if [AccountDescriptionNv5] <> null then [AccountDescriptionNv5] else [Custom.1], type text),
    #"Added Conditional Column3" = Table.AddColumn(#"Added Conditional Column2", "Custom.3", each if [AccountDescriptionNv6] <> null then [AccountDescriptionNv6] else [Custom.2], type text),
    #"Removed Columns" = Table.RemoveColumns(#"Added Conditional Column3",{"AccountDescriptionNv6", "AccountDescriptionNv5", "AccountDescriptionNv4", "AccountDescriptionNv3"}),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Columns",{{"Custom", "AccountDescriptionNv3"}, {"Custom.1", "AccountDescriptionNv4"}, {"Custom.2", "AccountDescriptionNv5"}, {"Custom.3", "AccountDescriptionNv6"}})
in
    #"Renamed Columns"