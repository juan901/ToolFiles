@echo off
title Crear Carpeta de Cliente
color 0B
:: ------------------------------------------------------
:: Script: crear_carpetasV2bat
:: Copyright (c) 2024 JCRH . Todos los derechos reservados.
:: Autor: Juan Carlos Raygoza Hernandez 
:: Descripción: Crea una carpeta con el numero de orden y verifica que no exista una orden con el mismo numero 
:: ------------------------------------------------------


rem Obtiene la fecha y hora actual
for /f "tokens=1-4 delims=/." %%a in ('date /t') do set fecha=%%a/%%b/%%c
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set hora=%%a:%%b

:inicio
cls
echo ===================================================================================
echo  F 8888888888    I IIII 8 8888888888     d888888o. 8888888 8888888888   .8.                    
echo  F FFFF          I IIII 8 8888         .`8888:' `88.     8 8888        .888.                   
echo  F FFFF          I IIII 8 8888         8.`8888.   Y8     8 8888       :88888.                  
echo  F FFFF          I IIII 8 8888         `8.`8888.         8 8888      . `88888.                 
echo  F 888888888888  I IIII 8 888888888888  `8.`8888.        8 8888     .8. `88888.                
echo  F FFFF          I IIII 8 8888           `8.`8888.       8 8888    .8`8. `88888.               
echo  F FFFF          I 8888 8 8888            `8.`8888.      8 8888   .8' `8. `88888.              
echo  F FFFF          I 8888 8 8888        8b   `8.`8888.     8 8888  .8'   `8. `88888.             
echo  F FFFF          I 8888 8 8888        `8b.  ;8.`8888     8 8888 .888888888. `88888.            
echo  F FFFF          I 8888 8 888888888888 `Y8888P ,88P'     8 8888.8'       `8. `88888.            
echo ===================================================================================
echo. 
echo. 
echo. 
echo=====================================================
echo               Bienvenido a Fotofiesta/MainPhoto      
echo =====================================================
echo         Fecha: %fecha%          Hora: %hora%         
echo =====================================================
echo.
echo ============= Crear Carpetas para Trabajos ===========
echo ============      Server-Trabajos       =============
echo =====================================================
echo.

:solicitar_sobre
rem Solicita el número de sobre
set /p sobre=Introduce el numero de sobre: 

rem Verifica si ya existe una carpeta con ese número de sobre
for /d %%D in (*_*) do (
    for /f "tokens=1 delims=_" %%a in ("%%~nxD") do (
        if "%%a"=="%sobre%" (
            echo.
            echo =====================================================
            echo ============== ERROR: El numero de sobre "%sobre%" ya existe. ==============
            echo ============== Por favor, ingresa un numero diferente. ==============
            echo =====================================================
            echo.
            goto solicitar_sobre
        )
    )
)

rem Solicita el nombre del cliente
set /p nombre=Introduce el nombre del cliente: 

rem Obtiene la fecha actual en formato mm-dd-aaaa
for /f "tokens=2 delims=/" %%a in ('date /t') do set mes=%%a
for /f "tokens=1 delims=/" %%a in ('date /t') do set dia=%%a
for /f "tokens=3 delims=/" %%a in ('date /t') do set anio=%%a
set fecha=%mes%-%dia%-%anio%

rem Construye el nombre de la carpeta
set carpeta=%sobre%_%nombre%_%fecha%

rem Crea la carpeta
mkdir "%carpeta%"

rem Muestra el resultado
echo.
echo =====================================================
echo ============== Carpeta Creada Exitosamente ===========
echo             Carpeta: "%carpeta%"            
echo =====================================================
echo.

pause
pause
exit
