/**
 * Minimal local server (no deps) to load RALPH spec from disk.
 * Start: node index.js
 * Call:  http://localhost:4545/api/ralph/spec?root=D:/Projects/MCP/ralph-open-spec
 */
import http from "http";
import url from "url";
import fs from "fs";
import path from "path";

const PORT = 4545;

function safeJoin(root, rel) {
  const p = path.resolve(root, rel);
  if (!p.startsWith(path.resolve(root))) throw new Error("Path traversal blocked");
  return p;
}
function readJson(p) { return JSON.parse(fs.readFileSync(p, "utf-8")); }
function exists(p) { try { fs.accessSync(p); return true; } catch { return false; } }
function listFilesRecursive(dir, out = [], prefix = "") {
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  for (const e of entries) {
    const rel = prefix ? `${prefix}/${e.name}` : e.name;
    const full = path.join(dir, e.name);
    if (e.isDirectory()) listFilesRecursive(full, out, rel);
    else out.push(rel);
  }
  return out;
}

const server = http.createServer((req, res) => {
  const u = url.parse(req.url, true);

  if (u.pathname === "/api/ralph/spec") {
    const root = u.query.root;
    if (!root) {
      res.writeHead(400, { "Content-Type": "application/json" });
      return res.end(JSON.stringify({ ok:false, error:"Missing root query param" }, null, 2));
    }
    try {
      const constitutionJsonPath = safeJoin(root, "spec/constitution/RALPH_CORE_CONSTITUTION_SPEC_v1.0.json");
      const profileSchemaPath = safeJoin(root, "spec/profiles/RALPH-PAPER-AUTO-v1.0.schema.json");

      if (!exists(constitutionJsonPath) || !exists(profileSchemaPath)) {
        throw new Error("Required spec files not found under root");
      }

      const payload = {
        ok: true,
        root,
        loaded_at: new Date().toISOString(),
        constitution: readJson(constitutionJsonPath),
        profiles: [{ id: "RALPH-PAPER-AUTO-v1.0", schema: readJson(profileSchemaPath) }],
        inventory: listFilesRecursive(root).filter(x => x.startsWith("spec/"))
      };

      res.writeHead(200, { "Content-Type": "application/json" });
      return res.end(JSON.stringify(payload, null, 2));
    } catch (e) {
      res.writeHead(500, { "Content-Type": "application/json" });
      return res.end(JSON.stringify({ ok:false, error:String(e.message || e) }, null, 2));
    }
  }

  if (u.pathname === "/health") {
    res.writeHead(200, { "Content-Type": "text/plain" });
    return res.end("OK");
  }

  res.writeHead(404, { "Content-Type": "text/plain" });
  res.end("Not found");
});

server.listen(PORT, () => console.log(`RALPH Spec Loader server running on http://localhost:${PORT}`));
