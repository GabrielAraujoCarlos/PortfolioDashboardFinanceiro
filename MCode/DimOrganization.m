let
    Source = Sql.Databases("localhost"),
    AdventureWorksTrat = Source{[Name="AdventureWorksTrat"]}[Data],
    dbo_DimOrganization = AdventureWorksTrat{[Schema="dbo",Item="DimOrganization"]}[Data],
    #"Added Conditional Column" = Table.AddColumn(dbo_DimOrganization, "Custom", each if [DivisionName] <> null then [DivisionName] else [CountryName], type text),
    #"Removed Columns" = Table.RemoveColumns(#"Added Conditional Column",{"DivisionName"}),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Columns",{{"Custom", "DivisionName"}})
in
    #"Renamed Columns"