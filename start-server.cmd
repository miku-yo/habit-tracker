@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo 習慣トラッカー - スマホ用サーバー
echo ================================
echo.

for /f "usebackq tokens=*" %%i in (`powershell -NoProfile -Command "$ip = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -notlike '127.*' -and $_.PrefixOrigin -eq 'Dhcp' } | Select-Object -First 1).IPAddress; if ($ip) { $ip } else { '（IPを取得できませんでした）' }"`) do set IP=%%i

echo PC・スマホどちらも次の URL で開けます:
echo   http://localhost:8080
echo.
echo スマホから（同じ Wi-Fi 接続時）:
echo   http://%IP%:8080
echo.
echo スマホでは「ホーム画面に追加」でアプリのように使えます。
echo 終了するには Ctrl+C
echo.

python -m http.server 8080 --bind 0.0.0.0 2>nul
if errorlevel 1 (
  echo Python が見つからないため npx serve を使います...
  npx --yes serve -l tcp://0.0.0.0:8080
)
