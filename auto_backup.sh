while true; do
  cd ~/ULTIMATUM_PROJECT
  git add .
  git commit -m "🔁 Auto Backup $(date)" || echo "no changes"
  git push origin master
  sleep 600
done
