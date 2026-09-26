#!/bin/bash
# Z-CORE v22 RECORDE - Master Orchestrator - 10.38 KiB
# Solo Founder: Ilyes Zoubirou - DZ-CA
# ORCID: 0009-0007-7571-3178
set -e
echo "=== [NANS-V9] Z-CORE v22 RECORDE - Llama-4 FR ==="
echo "NON DEPENDANCE • ZERO TRUST NATIF • AI22 • 10.38 KiB"
RAM=$(free | awk '/Mem:/ {printf "%.0f", $3/$2*100}')
echo "[CPU:0.00 | RAM:${RAM}%] - Check..."
[ -d "bin" ] || mkdir -p bin logic mem vault logs prompts
PORT=8765
echo "🚀 Lancement http://localhost:${PORT}/LanceIA_BIN.html"
lsof -ti:${PORT} | xargs kill -9 2>/dev/null || true
python3 -m http.server ${PORT} &
PID=$!
sleep 1
echo "✅ Serveur PID ${PID} - Ouvre: http://localhost:${PORT}/LanceIA_BIN.html"
wait $PID
