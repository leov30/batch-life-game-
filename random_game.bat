
@echo off
REM setlocal enabledelayedexpansion
REM set _str="You've met with a terrible fate, haven't you?"
REM for /l %%g in (1,1,50) do echo [1A!_str:~0,%%g!&timeout 1 >nul
REM set "str=—Happy Mask Salesman"
REM setlocal disabledelayedexpansion

set /a _money=0
set /a _milk=0
set /a _life=25
set /a _disease=1


:menu
title life simulator 1.0 ^(Milk: %_milk%^)
set /a _rand=%random%
set /a _event1=%_rand%%%2
set /a _event2=%_rand%%%3
set /a _event3=%_rand%%%7

cls
if %_life% leq 0 (
	echo. life its over for you..
	goto :gameover
)
if %_rand% equ 0 (
	echo. You have beens struck by a car&timeout 2 >nul
	echo. you feel your life slowly going away from you&timeout 2 >nul
	echo. as you lay on the floor in a pool of your blood&timeout 2 >nul
	goto :gameover
)	
if %_life% lss 5 (
	echo. You are too weak and tired&timeout 2 >nul
	echo. You feel your life its close to the end&timeout 2 >nul
	cls
)

if %_disease% geq 2 (
	echo. You have a life threatening disease, you need medicine...
)
	
echo. ====== Street ======
echo. 1. go work for moneys
echo. 2. go to market
echo. 3. go home
echo.
set /p _option="Command?: " || goto :menu
if %_option% equ 1 goto :work
if %_option% equ 2 goto :market
if %_option% equ 3 goto :home
goto :menu

:home
echo you went back to your lonley home&timeout 2 >nul
:home2
cls
echo. ====== Home =======
echo. 1. check refrigeator
echo. 2. check wallet
echo. 3. goto sleep
echo.
set /p _option="Command?: " || goto :home2
if %_option% equ 1 (
	echo. you open the door of the refrigerator&timeout 2 >nul
	if %_milk% geq 1 ( 
		echo. You got %_milk% milks in your fridge
	)else (
		echo. Your fridge its emtpy
	)
)
if %_option% equ 2 (
	echo. You check your old wallet&timeout 2 >nul
	echo. You got %_money% moneys in your wallet
)
if %_option% equ 3 (
	echo. You go to bed, and see that you only have %_life% much life&timeout 2 >nul
	echo. resting recovers some of your life back....&timeout 3 >nul
	if %_life% lss 25 set /a _life+=1
	goto :menu
)
timeout 2 >nul
goto :home2

:work
echo. You worked a 12hour shift, with minimal pay&timeout 2 >nul
echo. You earned 2 moneys, and your its life shorted..&timeout 2 >nul
if %_event3% equ 0 (
	echo. bad luck you got disease, you life will drain faster...&timeout 3 >nul
	set /a _disease+=2
)
set /a _money+=2
set /a _life-=1*%_disease%
goto :menu

:market
echo. You went the store to get food&timeout 2 >nul
echo. too hungry and tired from work&timeout 2 >nul
if %_event2% equ 0 (
	echo. you got lucky and found money on the street..&timeout 2 >nul
	set /a _money+=1
)

:market2
cls
echo. === market =====
echo. 1. buy milk ......200 moneys
echo. 2. buy medicine...50 moneys 
echo. 3. check your wallet 
echo. 4. exit market
echo. 
set /p _option="Command?: " || goto :market2
if %_option% equ 1 (
	if %_money% leq 200 (
		echo. Sorry, you can't afford milk
	)else (
		echo. you got milk!
		set /a _money-=200
		set /a _milk+=1
	)
)
if %_option% equ 2 (
	if %_money% leq 50 (
		echo. Sorry, you can't afford medicine
	)else (
		echo .You bought medicine to cure your disease...
		set /a _money-=50
		set /a _disease=1
	)
)
if %_option% equ 3 (
	echo. You check your old wallet&timeout 2 >nul
	echo. You got %_money% moneys in your wallet
)
if %_option% equ 4 goto :menu
timeout 2 >nul
goto :market2

:gameover

pause&exit


REM for /d %%g in ("C:\SynergyII\cdvideocache\*") do (
	REM for /d %%h in ("%%g\*") do xcopy "%%h\" "C:\temp" /i/e/s
REM )
REM pause



REM xcopy /e/s/i "C:\VideoPlayer\*.*" "%~dp0\temp"



REM cd /d "C:\VideoPlayer\"

REM for /d %%g in (*) do xcopy /e /i "%%g\%%g\" "%~dp0\"


REM pause
REM @echo off
REM setlocal enabledelayedexpansion
REM set _flag=0
REM set "_var="
REM for /f "delims=" %%g in ('net user /domain usernam') do (
	REM echo %%g|findstr /b /c:"Global Group memberships" >nul
	REM if !errorlevel! equ 0 set _flag=1
	REM if !_flag! equ 1 (
		REM for /f "tokens=1,2* delims=*" %%h in ("%%g") do (
			REM if not "%%i"=="" call :cleanVar "%%i"
			REM if not "%%j"=="" call :cleanVar "%%j"
		REM )
	REM )
REM )

REM echo %_var:~1%

REM pause&exit

REM :cleanVar
REM set "_str=%~1"
REM :cleanVarLoop
REM if "%_str:~-1%"==" " (
	REM set "_str=%_str:~0,-1%"
	REM goto :cleanVarLoop
REM )
REM set "_var=%_var%,%_str%"
REM exit /b