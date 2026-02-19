@echo off
echo ========================================
echo   PUSH TO GITHUB HELPER
echo ========================================
echo.
echo Pastikan Anda sudah:
echo 1. Buat repository di GitHub
echo 2. Copy URL repository
echo.

REM Check if remote already exists
git remote -v | findstr "origin" >nul 2>&1
if %errorlevel% equ 0 (
    echo Remote origin sudah ada. Menghapus...
    git remote remove origin
)

set /p REPO_URL="Paste URL repository GitHub Anda: "
echo.
echo Menambahkan remote origin...
git remote add origin %REPO_URL%
echo.
echo Pushing ke GitHub...
git push -u origin main
echo.
if %errorlevel% equ 0 (
    echo ========================================
    echo   BERHASIL!
    echo ========================================
    echo.
    echo Langkah selanjutnya:
    echo 1. Buka https://app.netlify.com
    echo 2. Klik "Add new site" - "Import an existing project"
    echo 3. Pilih "GitHub" dan authorize
    echo 4. Pilih repository Anda
    echo 5. Klik "Deploy site"
    echo 6. Tunggu 2-3 menit
    echo 7. Website live!
) else (
    echo ========================================
    echo   GAGAL!
    echo ========================================
    echo.
    echo Kemungkinan masalah:
    echo 1. URL repository salah
    echo 2. Belum login ke GitHub
    echo 3. Tidak punya akses ke repository
    echo.
    echo Untuk login GitHub via command line:
    echo - Username: username GitHub Anda
    echo - Password: gunakan Personal Access Token
    echo   Buat di: https://github.com/settings/tokens
)
echo.
pause
