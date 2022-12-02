# Advent of Code
Play area for answering these questions from https://adventofcode.com/

## Setup
- Windows 11
    - Installed WSL
    - Installed VS Code
- Windows Subsystem for Linux (WSL) running Ubuntu 20.04
    - Installed node 16.18.0
    - Installed PowerShell Core 7.3.0
    - Installed Dotnet Core 6.0.402
    - Installed SQL Server

## History
Day 2: Added a SQL script that is running on my local WSL also did 2021/day01

## Running the code
- CD to the folder and soluion you want to test
    - csharp
        - `dotnet restore`
        - `dotnet build`
        - `dotnet run`
    - PowerShell
        - `./dayXX.ps1`
    - Node/JavaScript
        - `node dayXX.js`
    - SQL
        - Open and run and connect to `Server=127.0.0.1;Database=<dbname>;User=sa;Password=<password>`
        - Change path to the local file for BULK INSERT

## My teammates during this challenge 
- Nicole Serafino
    - [GitHub](https://github.com/nicoleserafino/adventofcode2022)
    - AKA: ionlytestinprod
