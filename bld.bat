@echo off
call "%SYNERGYDE32%dbl\dblvars32.bat">nul

:: Add directory containing dblnet.exe to path so this example 
:: may be run from the command line.
path=%path%;C:\Program Files (x86)\MSBuild\Synergex\dbl

:: Set import and export directory for prototype files to current directory
set synimpdir=%cd%
set synexpdir=%cd%

:cleanup
del /q *.dbp>nul 2>&1
del /q *.dll>nul 2>&1
del /q *.exe>nul 2>&1
del /q *.pdb>nul 2>&1

@echo on
dblproto sealedclass.dbc main

dblnet -d -target=dll sealedclass.dbc
dblnet -d -ref=sealedclass.dll main.dbl

main.exe
