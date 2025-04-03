@echo off
chcp 65001 >nul

echo 🧪 Activating virtual environment...
call .venv\Scripts\activate

echo 🧹 Cleaning previous results...
if exist frontend\results (
    del /q frontend\results\*.*
)

echo 🚀 Running frontend tests...
robot --outputdir frontend/results frontend/tests

echo ✅ Test execution completed.
echo 📁 Reports available at: frontend/results