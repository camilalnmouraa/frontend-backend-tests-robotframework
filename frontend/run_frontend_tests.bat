@echo off
echo 🧪 Executando testes frontend...
robot --outputdir frontend/results frontend/tests
echo ✅ Execução concluída. Relatórios disponíveis em frontend/results
pause