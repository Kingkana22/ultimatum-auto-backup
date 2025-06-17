#!/data/data/com.termux/files/usr/bin/bash

function menu() {
  clear
  echo "╔══════════════════════════════════════╗"
  echo "║        🧠 ULTIMATUM SYSTEM UI        ║"
  echo "╠══════════════════════════════════════╣"
  echo "║  1. Backup Manual ke GitHub          ║"
  echo "║  2. Edit README.md                   ║"
  echo "║  3. Jalankan Auto Backup Loop        ║"
  echo "║  4. Lihat Log Git                    ║"
  echo "║  5. Reset Semua                      ║"
  echo "║  6. Info Repositori                  ║"
  echo "║  0. Keluar                           ║"
  echo "╚══════════════════════════════════════╝"
  echo -n "⟩ Pilih menu: "
}

function backup_manual() {
  cd ~/ULTIMATUM_PROJECT
  git add .
  git commit -m "📝 Manual Backup $(date)" || echo "❗ Tidak ada perubahan"
  git push origin master
  echo "✅ Backup manual selesai!"
  sleep 2
}

function edit_readme() {
  nano README.md
}

function auto_loop() {
  nohup bash ~/ULTIMATUM_PROJECT/auto_backup.sh > /dev/null 2>&1 &
  echo "🔁 Auto backup loop dijalankan di background."
  sleep 2
}

function lihat_log() {
  cd ~/ULTIMATUM_PROJECT
  git log --oneline --graph --decorate --all | head -20
  read -p "⏎ Tekan Enter untuk kembali..."
}

function reset_semua() {
  echo "⚠️ PERINGATAN: Semua file akan DIHAPUS. Yakin? (y/n)"
  read confirm
  if [ "$confirm" == "y" ]; then
    rm -rf ~/ULTIMATUM_PROJECT/*
    echo "🔥 Semua data dihapus."
  else
    echo "❎ Reset dibatalkan."
  fi
  sleep 2
}

function repo_info() {
  echo "🔗 Repositori GitHub:"
  echo "➡️ https://github.com/$GH_USER/$REPO_NAME"
  read -p "⏎ Tekan Enter untuk kembali..."
}

# 🔁 Menu Loop
while true; do
  menu
  read pilihan
  case $pilihan in
    1) backup_manual ;;
    2) edit_readme ;;
    3) auto_loop ;;
    4) lihat_log ;;
    5) reset_semua ;;
    6) repo_info ;;
    0) echo "👋 Keluar..."; exit ;;
    *) echo "❌ Pilihan tidak valid"; sleep 1 ;;
  esac
done
