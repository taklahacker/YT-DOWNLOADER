#!/bin/bash
# 🎥 KAMAN YT-DOWNLOADER — Cyber Edition
# By कामान 💻

# Default save paths
VIDEO_DIR="/storage/emulated/0/Download"
AUDIO_DIR="/storage/emulated/0/Music"

# Request storage permission once (silence errors)
termux-setup-storage 2>/dev/null

# Function to print cyber header with custom title
show_header() {
  clear
  echo -e "\033[1;31m"
  echo "██╗   ██╗████████╗    ██████╗ ██████╗ ███╗   ██╗"
  echo "██║   ██║╚══██╔══╝   ██╔═══██╗██╔══██╗████╗  ██║"
  echo "██║   ██║   ██║█████╗██║   ██║██████╔╝██╔██╗ ██║"
  echo "██║   ██║   ██║╚════╝██║   ██║██╔══██╗██║╚██╗██║"
  echo "╚██████╔╝   ██║      ╚██████╔╝██║  ██║██║ ╚████║"
  echo " ╚═════╝    ╚═╝       ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝"
  echo -e "\033[1;34m             KAMAN YT-DOWNLOADER v2.0"
  echo -e "\033[1;32m               By कामान | Safe & Fast"
  echo -e "\033[0m"
  echo "===================================================="
  echo "   Select an option below ↓"
  echo "===================================================="
  echo ""
}

# Loop menu
while true; do
  show_header
  echo -e "\033[1;33m[1]\033[0m Download Video (Best quality)"
  echo -e "\033[1;33m[2]\033[0m Download Audio (MP3)"
  echo -e "\033[1;33m[3]\033[0m Change save folders"
  echo -e "\033[1;33m[4]\033[0m Show last downloaded files"
  echo -e "\033[1;33m[5]\033[0m Exit"
  echo ""
  read -p "👉 Choose an option (1-5): " choice
  echo ""

  case "$choice" in
    1)
      read -p "🔗 Enter YouTube video URL: " link
      [ -z "$link" ] && { read -p "⚠️  No URL entered. Press Enter..."; continue; }
      show_header
      echo "📥 Downloading video... (Press Ctrl+C to cancel)"
      yt-dlp -f "bestvideo+bestaudio/best" -o "$VIDEO_DIR/%(title)s.%(ext)s" --no-playlist "$link"
      if [ $? -eq 0 ]; then
        echo "✅ Video saved in: $VIDEO_DIR"
      else
        echo "❌ Download failed or cancelled."
      fi
      read -p "Press Enter to return to menu..."
      ;;

    2)
      read -p "🔗 Enter YouTube video URL: " link
      [ -z "$link" ] && { read -p "⚠️  No URL entered. Press Enter..."; continue; }
      show_header
      echo "🎵 Downloading audio (MP3)... (Press Ctrl+C to cancel)"
      yt-dlp -x --audio-format mp3 -o "$AUDIO_DIR/%(title)s.%(ext)s" --no-playlist "$link"
      if [ $? -eq 0 ]; then
        echo "✅ Audio saved in: $AUDIO_DIR"
      else
        echo "❌ Download failed or cancelled."
      fi
      read -p "Press Enter to return to menu..."
      ;;

    3)
      echo ""
      echo "Current video dir: $VIDEO_DIR"
      echo "Current audio dir: $AUDIO_DIR"
      read -p "Enter new video folder path (or Enter to keep): " ndv
      [ -n "$ndv" ] && VIDEO_DIR="$ndv"
      read -p "Enter new audio folder path (or Enter to keep): " nda
      [ -n "$nda" ] && AUDIO_DIR="$nda"
      echo "✅ Paths updated!"
      read -p "Press Enter to return..."
      ;;

    4)
      echo ""
      echo "Recent files in Video folder ($VIDEO_DIR):"
      ls -1t "$VIDEO_DIR" 2>/dev/null | head -n 5 || echo "(none or inaccessible)"
      echo ""
      echo "Recent files in Audio folder ($AUDIO_DIR):"
      ls -1t "$AUDIO_DIR" 2>/dev/null | head -n 5 || echo "(none or inaccessible)"
      read -p "Press Enter to return..."
      ;;

    5)
      clear
      echo -e "\033[1;32mExiting... Have a great day!\033[0m"
      exit 0
      ;;

    *)
      echo "⚠️  Invalid option! Try again."
      sleep 1
      ;;
  esac
done
