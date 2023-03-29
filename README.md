# Portfolio - Dashboard Financeiro

O objetivo deste projeto é apresentar meus conhecimentos em análise de dados utilizando Power BI e Python para desenvolver um dashboard financeiro do AdventureWorks Data Warehouse

O projeto é composto pelo arquivo .pbix em modo Import e um jupyter notebook que concentra as transformações.

A base de dados utilizada foi a versão 2019, que se encontra no seguinte link:
https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms

Não identifiquei um dicionário de dados oficial desta base, sendo assim, as transformações e cálculos foram realizados baseados em meu entendimento do que os dados significam.

Etapas Realizadas:
  O backup da base de dados foi restaurado em uma instancia SQL Server em minha máquina
  As tabelas selecionadas foram levadas ao jupyter notebook para tratamento das tabelas, como simplificação do modelo para estrela, alteração do modelo de hierarquia e exclusão de colunas
  As tabelas transformadas foram gravadas em um novo banco
  As tabelas do novo banco foram lidas no Power BI através do conector de SQL Server
  Foram criadas medidas e gráficos
