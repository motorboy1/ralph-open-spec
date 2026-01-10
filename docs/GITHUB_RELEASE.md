# Publish to GitHub (Public Repo) — Exact Steps (Windows)

> This repo is already structured. You will create a public GitHub repo and push this folder.

## Option A: GitHub Web + Git CLI
1) Create a new repo on GitHub:
   - Name: `ralph-open-spec`
   - Visibility: **Public**
   - Initialize: **Do NOT** add README/license (already in this folder)

2) In PowerShell (from this folder):
```powershell
cd D:\Projects\MCP\ralph-open-spec   # <- change to your actual folder
git init
git add .
git commit -m "RALPH Open Spec v1.0"
git branch -M main
git remote add origin https://github.com/<YOUR_ID>/ralph-open-spec.git
git push -u origin main
```

## Option B: GitHub CLI (gh)
```powershell
cd D:\Projects\MCP\ralph-open-spec
git init
git add .
git commit -m "RALPH Open Spec v1.0"
gh repo create ralph-open-spec --public --source . --remote origin --push
```

## Tag a release
```powershell
git tag v1.0.0
git push origin v1.0.0
```
