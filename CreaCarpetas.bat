@echo off
setlocal enabledelayedexpansion
title Creador de Carpetas de Clientes - FOTOFIESTA
color 1F

rem Obtiene la fecha y hora actual
for /f "tokens=1-4 delims=/." %%a in ('date /t') do set fecha=%%a-%%b-%%c
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set hora=%%a:%%b

:inicio
cls
rem ===================================================================================
rem   F 8888888888    I IIII 8 8888888888    d888888o. 8888888 8888888888    .8.           
rem   F FFFF          I IIII 8 8888          .`8888:' `88.      8 8888          .888.         
rem   F FFFF          I IIII 8 8888          8.`8888.   Y8      8 8888         :88888.        
rem   F FFFF          I IIII 8 8888          `8.`8888.          8 8888       . `88888.        
rem   F 888888888888  I IIII 8 888888888888  `8.`8888.          8 8888       .8. `88888.        
rem   F FFFF          I IIII 8 8888            `8.`8888.        8 8888      .8`8. `88888.        
rem   F FFFF          I 8888 8 8888              `8.`8888.      8 8888     .8' `8. `88888.      
rem   F FFFF          I 8888 8 8888          8b   `8.`8888.     8 8888    .8'   `8. `88888.      
rem   F FFFF          I 8888 8 8888          `8b.  ;8.`8888     8 8888   .888888888. `88888.      
rem   F FFFF          I 8888 8 888888888888 `Y8888P ,88P'      8 8888.8'         `8. `88888.      
rem ===================================================================================
echo.
echo    Iniciando el Creador de Carpetas...
echo.
set "dots=."
<nul set /p "=Cargando"
for /L %%i in (1,1,3) do (
    ping -n 1 -w 100 127.0.0.1 > nul
    <nul set /p "=%dots%"
    set "dots=!dots!."
)
echo.
echo.
ping -n 1 -w 500 127.0.0.1 > nul
cls

rem --- Encabezado principal ---
echo ===================================================================================
echo   F 8888888888    I IIII 8 8888888888    d888888o. 8888888 8888888888    .8.           
echo   F FFFF          I IIII 8 8888          .`8888:' `88.      8 8888          .888.         
echo   F FFFF          I IIII 8 8888          8.`8888.   Y8      8 8888         :88888.        
echo   F FFFF          I IIII 8 8888          `8.`8888.          8 8888       . `88888.        
echo   F 888888888888  I IIII 8 888888888888  `8.`8888.          8 8888       .8. `88888.        
echo   F FFFF          I IIII 8 8888            `8.`8888.        8 8888      .8`8. `88888.        
echo   F FFFF          I 8888 8 8888              `8.`8888.      8 8888     .8' `8. `88888.      
echo   F FFFF          I 8888 8 8888          8b   `8.`8888.     8 8888    .8'   `8. `88888.      
echo   F FFFF          I 8888 8 8888          `8b.  ;8.`8888     8 8888   .888888888. `88888.      
echo   F FFFF          I 8888 8 888888888888 `Y8888P ,88P'      8 8888.8'         `8. `88888.      
echo ===================================================================================
echo.
echo    Bienvenido al Creador de Carpetas de Clientes
echo ---------------------------------------------------------
echo    Fecha: %fecha%          Hora: %hora%
echo ---------------------------------------------------------
echo.

:solicitar_datos
rem Solicita el número de sobre
set /p sobre=  Introduce el numero de sobre: 

rem Verifica si ya existe una carpeta con ese número de sobre
if exist "%sobre%_*" (
    echo.
    echo ---------------------------------------------------------
    echo    [ERROR] El numero de sobre "%sobre%" ya existe.
    echo    Por favor, ingresa un numero diferente.
    echo ---------------------------------------------------------
    echo.
    pause
    goto solicitar_datos
)

rem Solicita el nombre del cliente
set /p nombre=  Introduce el nombre del cliente: 

rem Solicita las anotaciones
set /p notas=  Anotaciones para el trabajo: 

rem Construye el nombre de la carpeta principal
set carpeta=%sobre%_%nombre%_%fecha%

rem Crea la carpeta principal
mkdir "%carpeta%"

:menu_opciones
cls
echo ===================================================================================
echo   F 8888888888    I IIII 8 8888888888    d888888o. 8888888 8888888888    .8.           
echo   F FFFF          I IIII 8 8888          .`8888:' `88.      8 8888          .888.         
echo   F FFFF          I IIII 8 8888          8.`8888.   Y8      8 8888         :88888.        
echo   F FFFF          I IIII 8 8888          `8.`8888.          8 8888       . `88888.        
echo   F 888888888888  I IIII 8 888888888888  `8.`8888.          8 8888       .8. `88888.        
echo   F FFFF          I IIII 8 8888            `8.`8888.        8 8888      .8`8. `88888.        
echo   F FFFF          I 8888 8 8888              `8.`8888.      8 8888     .8' `8. `88888.      
echo   F FFFF          I 8888 8 8888          8b   `8.`8888.     8 8888    .8'   `8. `88888.      
echo   F FFFF          I 8888 8 8888          `8b.  ;8.`8888     8 8888   .888888888. `88888.      
echo   F FFFF          I 8888 8 888888888888 `Y8888P ,88P'      8 8888.8'         `8. `88888.      
echo ===================================================================================
echo.
echo    Trabajo: "%sobre% - %nombre%"
echo ---------------------------------------------------------
echo    Selecciona los tamanos a crear (ejemplo: 1,3,5):
echo.
echo    [1] 3x5     [2] 4x6
echo    [3] 5x7     [4] 8x10
echo    [5] 11x14   [6] 16x20
echo    [7] 20x24   [8] 20x30
echo.
echo ---------------------------------------------------------
echo.
set /p opciones=  Tu seleccion: 

rem PROCESAMIENTO DE OPCIONES Y CREACION DE CARPETAS
set "opciones=%opciones: =%"
cd "%carpeta%"
echo.
echo Creando carpetas seleccionadas...
echo ---------------------------------
for %%a in (%opciones%) do (
    if "%%a"=="1" mkdir "3x5" && echo    - Carpeta 3x5 creada.
    if "%%a"=="2" mkdir "4x6" && echo    - Carpeta 4x6 creada.
    if "%%a"=="3" mkdir "5x7" && echo    - Carpeta 5x7 creada.
    if "%%a"=="4" mkdir "8x10" && echo    - Carpeta 8x10 creada.
    if "%%a"=="5" mkdir "11x14" && echo   - Carpeta 11x14 creada.
    if "%%a"=="6" mkdir "16x20" && echo   - Carpeta 16x20 creada.
    if "%%a"=="7" mkdir "20x24" && echo   - Carpeta 20x24 creada.
    if "%%a"=="8" mkdir "20x30" && echo   - Carpeta 20x30 creada.
)
echo.

rem Crea el archivo de texto con las notas
echo %notas% > "Notas.txt"

rem Vuelve al directorio anterior
cd ..

rem Muestra el resultado final
cls
echo ===================================================================================
echo   F 8888888888    I IIII 8 8888888888    d888888o. 8888888 8888888888    .8.           
echo   F FFFF          I IIII 8 8888          .`8888:' `88.      8 8888          .888.         
echo   F FFFF          I IIII 8 8888          8.`8888.   Y8      8 8888         :88888.        
echo   F FFFF          I IIII 8 8888          `8.`8888.          8 8888       . `88888.        
echo   F 888888888888  I IIII 8 888888888888  `8.`8888.          8 8888       .8. `88888.        
echo   F FFFF          I IIII 8 8888            `8.`8888.        8 8888      .8`8. `88888.        
echo   F FFFF          I 8888 8 8888              `8.`8888.      8 8888     .8' `8. `88888.      
echo   F FFFF          I 8888 8 8888          8b   `8.`8888.     8 8888    .8'   `8. `88888.      
echo   F FFFF          I 8888 8 8888          `8b.  ;8.`8888     8 8888   .888888888. `88888.      
echo   F FFFF          I 8888 8 888888888888 `Y8888P ,88P'      8 8888.8'         `8. `88888.      
echo ===================================================================================
echo.
echo    Se ha creado la carpeta y los archivos exitosamente.
echo.
echo ---------------------------------------------------------
echo    Carpeta principal: %carpeta%
echo    Archivo de notas: Notas.txt
echo ---------------------------------------------------------
echo.
echo Pulsa cualquier tecla para finalizar.
pause > nul
exit
