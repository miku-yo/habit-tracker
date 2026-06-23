@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo 習慣トラッカー - インターネット公開
echo ================================
echo.
echo 【URLを固定したい場合（おすすめ）】
echo   setup-github-pages.cmd を実行してください
echo   公開 URL の例: https://あなたのID.github.io/habit-tracker/
echo.
echo 【手軽に試すだけ（URLは毎回変わる場合あり）】
echo   https://app.netlify.com/drop にフォルダをドロップ
echo   %CD%
echo.
echo 【データの引き継ぎ】
echo   アプリ内の「バックアップ」→「復元」で端末間を移行
echo.
pause
