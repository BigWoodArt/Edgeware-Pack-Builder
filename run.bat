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
REM pyw (not py) runs windowless - no console attached to the GUI process
REM itself. "start """ detaches it from THIS window too, so the console
REM this .bat opened closes right away instead of hanging around for the
REM program's whole runtime. Startup errors (the one case a console would
REM actually have been useful for) go to startup_error.log instead of
REM vanishing silently.
start "" pyw edgeware_pack_builder_gui.pyw 2>"%~dp0startup_error.log"
