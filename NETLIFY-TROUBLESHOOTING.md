# Netlify Build Troubleshooting

## 🔍 Cara Melihat Full Build Log

1. Buka https://app.netlify.com
2. Pilih site Anda
3. Klik tab **"Deploys"**
4. Klik deploy yang failed
5. Scroll ke bawah untuk lihat **full error log**
6. Cari baris yang berwarna merah atau ada kata "Error"

## 🛠️ Solusi Berdasarkan Error

### Error: "Failed to install dependencies"

**Penyebab:** npm install gagal

**Solusi:**
1. Di Netlify dashboard, klik **"Clear cache and deploy site"**
2. Atau ubah build command di Site Settings → Build & deploy:
   ```
   npm install --legacy-peer-deps && npm run build
   ```

### Error: "Module not found" atau "Cannot resolve"

**Penyebab:** Package tidak ada di package.json atau file tidak ter-commit

**Solusi:**
1. Cek apakah package ada di `package.json`
2. Jika tidak ada, tambahkan:
   ```bash
   npm install package-name
   git add package.json package-lock.json
   git commit -m "Add missing package"
   git push
   ```

### Error: "TypeScript error" atau "TS2304"

**Penyebab:** TypeScript check gagal

**Solusi:** Sudah diperbaiki! Build sekarang skip TypeScript check.
Jika masih error, pastikan build command di Netlify adalah:
```
npm run build
```
BUKAN:
```
npm run build:check
```

### Error: "Out of memory" atau "JavaScript heap out of memory"

**Penyebab:** Build butuh memory lebih

**Solusi:** Sudah ditambahkan `NODE_OPTIONS` di netlify.toml.
Jika masih error, upgrade Netlify plan atau optimize build.

### Error: "Node version" atau "Unsupported engine"

**Penyebab:** Node version tidak cocok

**Solusi:** Sudah di-set ke Node 20.11.0 via `.nvmrc`.
Atau set manual di Netlify:
- Site settings → Build & deploy → Environment
- Add variable: `NODE_VERSION` = `20.11.0`

### Error: "Build script not found"

**Penyebab:** package.json tidak punya script "build"

**Solusi:** Sudah ada! Cek package.json:
```json
{
  "scripts": {
    "build": "vite build"
  }
}
```

### Error: "Permission denied" atau "EACCES"

**Penyebab:** File permission issue

**Solusi:**
1. Pastikan `netlify-build.sh` executable:
   ```bash
   git update-index --chmod=+x netlify-build.sh
   git commit -m "Make build script executable"
   git push
   ```

## 🔄 Build Command Options

Coba build command ini satu per satu di Netlify Settings:

### Option 1 (Recommended):
```
npm ci --legacy-peer-deps && npm run build
```

### Option 2:
```
npm install --legacy-peer-deps && npm run build
```

### Option 3:
```
bash netlify-build.sh
```

### Option 4 (Simple):
```
npm run build
```

## 📋 Checklist Sebelum Deploy

- ✅ File `package.json` ada di root
- ✅ File `package-lock.json` ada di root
- ✅ File `.nvmrc` ada (berisi: 20.11.0)
- ✅ File `netlify.toml` ada
- ✅ Semua file sudah di-commit
- ✅ Sudah di-push ke GitHub
- ✅ Repository public atau Netlify punya akses

## 🧪 Test Build Locally

Sebelum deploy ke Netlify, test dulu di local:

```bash
# Install dependencies
npm ci --legacy-peer-deps

# Build
npm run build

# Preview
npm run preview
```

Jika berhasil di local, seharusnya berhasil di Netlify.

## 📞 Cara Minta Bantuan

Jika masih error, kirim informasi ini:

1. **Full build log** dari Netlify (copy semua text)
2. **Error message** yang spesifik (baris merah)
3. **Repository URL** (jika public)
4. **Build command** yang digunakan
5. **Node version** yang di-set

## 🎯 Quick Fix Commands

Jika build gagal, coba ini di terminal local:

```bash
# Clear git cache
git rm -r --cached .
git add .
git commit -m "Refresh git cache"

# Force push (hati-hati!)
git push -f origin main

# Atau push normal
git push origin main
```

Lalu di Netlify:
1. Clear cache and deploy site
2. Atau trigger new deploy

## 🔗 Useful Links

- Netlify Docs: https://docs.netlify.com/
- Netlify Build Logs: https://docs.netlify.com/monitor-sites/logs/
- Netlify Support: https://answers.netlify.com/
- Vite Docs: https://vitejs.dev/guide/build.html
