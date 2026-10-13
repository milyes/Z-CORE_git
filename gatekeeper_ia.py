#!/data/data/com.termux/files/usr/bin/python3
import http.server, json
class Gatekeeper(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        if self.headers.get("X-ZCORE-Token") != "89b6df2e-v24":
            self.send_response(401); self.end_headers(); self.wfile.write(b'{"error":"401"}'); return
        self.send_response(200); self.send_header("Content-type","application/json"); self.end_headers()
        self.wfile.write(json.dumps({"status":"LIVE","version":"v24","non_dependance":"VALIDEE","logics":22,"endpoint":"/api/status"}).encode())
    def log_message(self,*a): pass
for port in [8000,8001,8002,8080]:
    try: print(f"[Z-CORE LIVE sur :{port}]"); http.server.HTTPServer(("",port), Gatekeeper).serve_forever(); break
    except OSError: continue
