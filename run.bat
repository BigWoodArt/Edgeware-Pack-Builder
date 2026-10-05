@echo off
cd /d "%~dp0"

echo Checking for required Python packages (pyyaml, pillow)...
py -m pip show pyyaml >nul 2>&1
if errorlevel 1 (
    echo Installing pyyaml...
    py -m pip install pyyaml
)
py -m pip show pillow >nul 2>&1
if errorlevel 1 (
    echo Installing pillow...
    py -m pip install pillow
)

echo Starting Edgeware++ Advanced Pack Builder...
REM pyw = windowless; startup errors go to startup_error.log.
start "" pyw edgeware_pack_builder_gui.pyw 2>"%~dp0startup_error.log"
