@echo off
REM Caminho para o arquivo cml.exe no diretório do perfil do usuário
set EXE_PATH=%USERPROFILE%\\cml.exe

REM Caminho para a pasta de inicialização
set STARTUP_FOLDER=%AppData%\Microsoft\Windows\Start Menu\Programs\Startup

REM Verifica se a pasta de inicialização existe
if not exist "%STARTUP_FOLDER%" (
    echo A pasta de inicializacao %STARTUP_FOLDER% nao foi encontrada.
    exit /b 1
)

REM Cria um atalho para o cml.exe na pasta de inicialização
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%TEMP%\CreateShortcut.vbs"
echo sLinkFile = "%STARTUP_FOLDER%\cml.lnk" >> "%TEMP%\CreateShortcut.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%TEMP%\CreateShortcut.vbs"
echo oLink.TargetPath = "%EXE_PATH%" >> "%TEMP%\CreateShortcut.vbs"
echo oLink.Save >> "%TEMP%\CreateShortcut.vbs"

REM Executa o script VBS para criar o atalho
cscript //nologo "%TEMP%\CreateShortcut.vbs"

REM Verifica se o atalho foi criado
if exist "%STARTUP_FOLDER%\cml.lnk" (
    echo Atalho criado na pasta de inicializacao com sucesso.
) else (
    echo Falha ao criar o atalho.
    exit /b 1
)

REM Remove o script VBS temporário
del "%TEMP%\CreateShortcut.vbs"
