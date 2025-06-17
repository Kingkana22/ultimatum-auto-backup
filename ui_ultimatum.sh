#!/data/data/com.termux/files/usr/bin/bash

while true; do
clear
echo "==============================="
echo " ⚔️  ULTIMATUM SYSTEM DASHBOARD"
echo "==============================="
echo "📍 Status: AKTIF - Auto Backup Berjalan"
echo "📦 Repo: https://github.com/Kingkana22/ultimatum-auto-backup"
echo ""
echo "1. 🔍 Scan Jaringan Aktif"
echo "2. 🧠 Buat File Uji & Backup"
echo "3. 📤 Push Manual Ke Repo Sekarang"
echo "4. 🛠️  Buka Editor nano"
echo "5. 🔁 Lihat Log Auto-Backup"
echo "0. ❌ Keluar UI"
echo "==============================="
read -p "Pilih Menu: " pilih

case $pilih in
  1)
    echo "📡 Memindai jaringan..."
    ip a && sleep 5
    ;;
  2)
    echo "🧠 Menulis file uji ke repo..."
    echo "File Uji: $(date)" > "UJI_$(date +%s).txt"
    echo "✅ File dibuat dan akan dibackup otomatis."
    sleep 2
    ;;
  3)
    echo "📤 Push manual..."
    git add .
    git commit -m "🚀 Push Manual via UI $(date)" || echo "⚠️ Tidak ada perubahan"
    git push origin master
    sleep 2
    ;;
  4)
    echo "🛠️ Buka editor..."
    nano README.md
    ;;
  5)
    echo "📑 Log backup:"
    tail -n 20 nohup.out
    read -p "Tekan enter untuk kembali..."
    ;;
  0)
    echo "❌ Keluar..."
    break
    ;;
  *)
    echo "❗ Pilihan tidak valid."
    sleep 1
    ;;
esac
done
