from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import shutil
import subprocess
import psutil

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path != "/stats":
            self.send_response(404)
            self.end_headers()
            return

        disk = shutil.disk_usage("/")

        uptime = "Running"

        data = {
	    "memory_percent": psutil.virtual_memory().percent,
            "uptime": uptime,
            "disk_used_percent": round((disk.used / disk.total) * 100, 1),
	    "cpu_percent": psutil.cpu_percent(interval=1),
        }

        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps(data).encode())

HTTPServer(("0.0.0.0", 8000), Handler).serve_forever()
