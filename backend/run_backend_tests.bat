@echo off
chcp 65001 >nul

echo 🧪 Activating virtual environment...
call .venv\Scripts\activate

echo 🧹 Cleaning previous results...
if exist backend\results (
    del /q backend\results\*.*
)

echo 🚀 Running backend tests...
robot --outputdir backend/results backend/tests

echo ✅ Test execution completed.
echo 📁 Reports available at: backend/results