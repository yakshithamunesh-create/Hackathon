@echo off
REM ========================================
REM FilmFoundry AI - Easy Start Script
REM For Complete Beginners
REM ========================================

color 0A
echo.
echo ========================================
echo    FILMFOUNDRY AI - EASY SETUP
echo ========================================
echo.
echo This will take 30-60 seconds...
echo Please wait and DO NOT close this window!
echo.

REM Check Python installation
echo [Step 1/5] Checking Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ ERROR: Python is not installed or not in PATH
    echo.
    echo Please install Python from: https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation
    echo.
    pause
    exit /b 1
)
echo ✅ Python found!
echo.

REM Upgrade pip
echo [Step 2/5] Updating pip...
python -m pip install --upgrade pip --quiet
echo ✅ Pip updated!
echo.

REM Install dependencies
echo [Step 3/5] Installing required packages...
echo This may take 1-2 minutes on first run...
python -m pip install fastapi uvicorn[standard] sqlalchemy pydantic python-multipart --quiet
if errorlevel 1 (
    echo ❌ ERROR: Failed to install packages
    echo.
    echo Please check your internet connection and try again.
    echo.
    pause
    exit /b 1
)
echo ✅ All packages installed!
echo.

REM Create uploads directory
echo [Step 4/5] Setting up directories...
if not exist "uploads" mkdir uploads
echo ✅ Directories ready!
echo.

REM Start the server
echo [Step 5/5] Starting FilmFoundry AI...
echo.
echo ========================================
echo    🚀 APPLICATION IS STARTING...
echo ========================================
echo.
echo ⏳ Waiting for server to start (10 seconds)...
echo.

REM Start server in background and wait
start /B python -m uvicorn main:app --host 127.0.0.1 --port 8000 > server.log 2>&1

REM Wait for server to start
timeout /t 10 /nobreak >nul

REM Open browser
echo ========================================
echo    ✅ OPENING YOUR BROWSER...
echo ========================================
echo.
start http://127.0.0.1:8000
echo.

echo ========================================
echo    🎉 FILMFOUNDRY AI IS RUNNING!
echo ========================================
echo.
echo 🌐 Your app is open in your browser at:
echo    http://127.0.0.1:8000
echo.
echo 📚 API Documentation available at:
echo    http://127.0.0.1:8000/docs
echo.
echo 💡 IMPORTANT NOTES:
echo    • Keep this window OPEN while using the app
echo    • To STOP the app: Close this window
echo    • To RESTART: Just run this script again
echo.
echo ========================================
echo Press any key to view server logs...
echo (The app is already running in background)
echo ========================================
pause >nul

REM Show logs
cls
echo ========================================
echo    SERVER LOGS
echo ========================================
echo.
echo The server is running in the background.
echo You can close this window safely.
echo The app will continue running in your browser.
echo.
echo To stop the server completely:
echo 1. Open Task Manager (Ctrl+Shift+Esc)
echo 2. Find "Python" processes
echo 3. End them
echo.
echo Or just restart your computer.
echo.
pause

