import React, { useEffect, useState } from "react";

type SpecPayload = {
  ok: boolean;
  root: string;
  loaded_at: string;
  constitution: any;
  profiles: { id: string; schema: any }[];
  inventory: string[];
  error?: string;
};

export default function SpecLoaderPanel({ rootPath }: { rootPath: string }) {
  const [data, setData] = useState<SpecPayload | null>(null);
  const [err, setErr] = useState<string>("");

  useEffect(() => {
    const url = `http://localhost:4545/api/ralph/spec?root=${encodeURIComponent(rootPath)}`;
    fetch(url)
      .then((r) => r.json())
      .then((j) => {
        if (!j.ok) setErr(j.error || "Unknown error");
        setData(j);
      })
      .catch((e) => setErr(String(e)));
  }, [rootPath]);

  if (err) return <div style={{ padding: 16 }}>FAILED: {err}</div>;
  if (!data) return <div style={{ padding: 16 }}>Loading RALPH Spec…</div>;

  return (
    <div style={{ padding: 16, fontFamily: "ui-sans-serif, system-ui" }}>
      <h2 style={{ margin: 0 }}>RALPH Spec Loader</h2>
      <p style={{ marginTop: 8, opacity: 0.8 }}>
        Root: <code>{data.root}</code><br/>
        Loaded: <code>{data.loaded_at}</code>
      </p>

      <h3>Constitution</h3>
      <pre style={{ whiteSpace: "pre-wrap", background: "#f6f6f6", padding: 12, borderRadius: 8 }}>
        {JSON.stringify(data.constitution, null, 2)}
      </pre>

      <h3>Profiles</h3>
      {data.profiles.map((p) => (
        <div key={p.id} style={{ marginBottom: 12 }}>
          <strong>{p.id}</strong>
          <pre style={{ whiteSpace: "pre-wrap", background: "#f6f6f6", padding: 12, borderRadius: 8 }}>
            {JSON.stringify(p.schema, null, 2)}
          </pre>
        </div>
      ))}

      <h3>spec/ Inventory</h3>
      <ul>
        {data.inventory.slice(0, 200).map((f) => (
          <li key={f}><code>{f}</code></li>
        ))}
      </ul>
    </div>
  );
}
