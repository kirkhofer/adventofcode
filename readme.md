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
Day 2: Added a SQL script that is running on my local WSL

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

## Day 02
X for Rock, Y for Paper, and Z for Scissors.

The winner of the whole tournament is the player with the highest score. Your total score is the sum of your scores for each round. The score for a single round is the score for the shape you selected (1 for Rock, 2 for Paper, and 3 for Scissors) plus the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).

## My teammates during this challenge 
- Nicole Serafino
    - [GitHub](https://github.com/nicoleserafino/adventofcode2022)
    - AKA: ionlytestinprod
