# 🚀 Quick Start - Deploy ke Netlify

## ⚡ 3 Langkah Cepat

### 1️⃣ Push ke GitHub
```bash
# Jalankan script ini:
push-to-github.bat

# Atau manual:
git remote add origin https://github.com/USERNAME/REPO-NAME.git
git push -u origin main
```

### 2️⃣ Deploy di Netlify
1. Buka https://app.netlify.com
2. **Add new site** → **Import from GitHub**
3. Pilih repository `nawista-lab-2026`
4. **Deploy site** (settings otomatis dari netlify.toml)

### 3️⃣ Tunggu & Cek
- Tunggu 2-3 menit
- Jika **SUCCESS** ✅ → Website live!
- Jika **FAILED** ❌ → Lihat troubleshooting di bawah

---

## ❌ Jika Build Failed

### Langkah 1: Lihat Error Log
1. Di Netlify, klik deploy yang failed
2. Scroll ke bawah, cari baris merah
3. Copy error message

### Langkah 2: Coba Quick Fix
Di Netlify dashboard:
1. Klik **"Deploys"** tab
2. Klik **"Trigger deploy"** → **"Clear cache and deploy site"**
3. Tunggu build ulang

### Langkah 3: Ubah Build Command (Jika Masih Gagal)
Di Netlify:
1. **Site settings** → **Build & deploy** → **Build settings**
2. Edit **Build command** menjadi:
   ```
   npm install --legacy-peer-deps && npm run build
   ```
3. **Publish directory**: `dist`
4. **Save** dan **Trigger deploy**

---

## 📋 Build Command Options

Coba satu per satu jika gagal:

**Option 1** (Default):
```
npm ci --legacy-peer-deps && npm run build
```

**Option 2**:
```
npm install --legacy-peer-deps && npm run build
```

**Option 3**:
```
npm run build
```

---

## 🔍 Common Errors & Solutions

### "Failed to install dependencies"
→ Gunakan build command dengan `--legacy-peer-deps`

### "Module not found"
→ Clear cache and deploy site

### "Out of memory"
→ Sudah di-handle di netlify.toml (NODE_OPTIONS)

### "Node version mismatch"
→ Sudah di-set ke Node 20.11.0 via .nvmrc

---

## 📚 Dokumentasi Lengkap

- **DEPLOY-INSTRUCTIONS.md** - Panduan lengkap step-by-step
- **NETLIFY-TROUBLESHOOTING.md** - Troubleshooting detail
- **push-to-github.bat** - Script otomatis push

---

## ✅ Checklist

Sebelum deploy, pastikan:
- [ ] Repository sudah dibuat di GitHub
- [ ] Code sudah di-push ke GitHub
- [ ] File package.json ada di root
- [ ] File netlify.toml ada di root
- [ ] Repository public atau Netlify punya akses

---

## 🆘 Butuh Bantuan?

1. Baca **NETLIFY-TROUBLESHOOTING.md**
2. Cek full build log di Netlify
3. Copy error message dan cari di Google
4. Atau tanya dengan info:
   - Full build log
   - Error message spesifik
   - Build command yang digunakan

---

## 🎉 Setelah Deploy Berhasil

Website Anda akan live di:
```
https://random-name-123.netlify.app
```

Untuk custom domain:
1. **Site settings** → **Domain management**
2. **Change site name** atau **Add custom domain**

Setiap push ke GitHub = auto redeploy! 🚀
