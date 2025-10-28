#!/bin/bash
# AJ-HACKER Theme — YT Downloader (menu theme like "hacking-tool")
# By कामान
# Functional: Video + Audio download (uses yt-dlp). UI styled to look like a "hacking tool" menu.

VIDEO_DIR="/storage/emulated/0/Download"
AUDIO_DIR="/storage/emulated/0/Music"

# ensure storage permission (silence harmless messages)
termux-setup-storage 2>/dev/null

# color codes (easy names)
RED='\033[1;31m'
GRN='\033[1;32m'
YEL='\033[1;33m'
BLU='\033[1;34m'
MAG='\033[1;35m'
CYN='\033[1;36m'
WHT='\033[1;37m'
RST='\033[0m'

draw_header() {
  clear
  # top bar
  echo -e "${CYN}┌───────────────────────────────────────────────────────────────────────────┐${RST}"
  echo -e "${CYN}│${RST} ${MAG}██╗   ██╗ ██████╗ █████╗ ██████╗ ██████╗ ██╗  ██╗${RST}                              ${CYN}│${RST}"
  echo -e "${CYN}│${RST} ${MAG}██║   ██║██╔═══██╗██╔══██╗██╔══██╗██╔══██╗██║  ██║${RST}   ${YEL}AJ-HACKER YT DOWNLOADER v2.0${RST} ${CYN}│${RST}"
  echo -e "${CYN}│${RST} ${MAG}██║   ██║██║   ██║███████║██████╔╝██████╔╝███████║${RST}  ${GRN}By कामान | Safe & Fast${RST} ${CYN}│${RST}"
  echo -e "${CYN}│${RST} ${MAG}╚██╗ ██╔╝██║   ██║██╔══██║██╔═══╝ ██╔══██╗██╔══██║${RST}                              ${CYN}│${RST}"
  echo -e "${CYN}│${RST} ${MAG} ╚████╔╝ ╚██████╔╝██║  ██║██║     ██║  ██║██║  ██║${RST}                              ${CYN}│${RST}"
  echo -e "${CYN}└───────────────────────────────────────────────────────────────────────────┘${RST}"
  echo
  # subtitle / description
  echo -e " ${WHT}A simple Termux tool to download YouTube video or MP3. Use for personal/offline only.${RST}"
  echo
}

draw_menu_box() {
  echo -e "${CYN}┌──────────────────────────────────────────────────────────────────────────┐${RST}"
  echo -e "${CYN}│${RST} ${YEL}[01]${RST} Information        : ${WHT}Download video / audio${RST}"
  echo -e "${CYN}│${RST} ${YEL}[02]${RST} Video Download     : ${WHT}Best quality (video+audio)${RST}"
  echo -e "${CYN}│${RST} ${YEL}[03]${RST} Audio Download     : ${WHT}Extract MP3${RST}"
  echo -e "${CYN}│${RST} ${YEL}[04]${RST} Change Save Folders: ${WHT}Set custom paths${RST}"
  echo -e "${CYN}│${RST} ${YEL}[05]${RST} Recent Files       : ${WHT}Show last downloaded${RST}"
  echo -e "${CYN}│${RST} ${YEL}[06]${RST} Help / Troubleshoot: ${WHT}Quick fixes${RST}"
  echo -e "${CYN}│${RST} ${YEL}[07]${RST} Exit               : ${WHT}Quit${RST}"
  echo -e "${CYN}└──────────────────────────────────────────────────────────────────────────┘${RST}"
  echo
}

show_info() {
  draw_header
  echo -e "${GRN}Info:${RST}"
  echo -e " - Video files saved to: ${YEL}$VIDEO_DIR${RST}"
  echo -e " - Audio files saved to: ${YEL}$AUDIO_DIR${RST}"
  echo -e " - Tool uses yt-dlp (pip install yt-dlp)."
  echo -e ""
  read -p "Press Enter to return to menu..."
}

prompt_url_and_download_video() {
  read -p "Enter YouTube URL: " link
  if [[ -z "$link" ]]; then
    echo -e "${RED}No URL entered.${RST}"
    sleep 1
    return
  fi
  echo -e "${BLU}Downloading best video+audio (may take time)...${RST}"
  yt-dlp -f "bestvideo+bestaudio/best" -o "$VIDEO_DIR/%(title)s.%(ext)s" --no-playlist "$link"
  if [ $? -eq 0 ]; then
    echo -e "${GRN}Downloaded → $VIDEO_DIR${RST}"
  else
    echo -e "${RED}Download failed. Check link or internet.${RST}"
  fi
  read -p "Press Enter to return to menu..."
}

prompt_url_and_download_audio() {
  read -p "Enter YouTube URL: " link
  if [[ -z "$link" ]]; then
    echo -e "${RED}No URL entered.${RST}"
    sleep 1
    return
  fi
  echo -e "${BLU}Extracting MP3 (may take time)...${RST}"
  yt-dlp -x --audio-format mp3 -o "$AUDIO_DIR/%(title)s.%(ext)s" --no-playlist "$link"
  if [ $? -eq 0 ]; then
    echo -e "${GRN}MP3 saved → $AUDIO_DIR${RST}"
  else
    echo -e "${RED}Audio download/convert failed. Install ffmpeg if needed.${RST}"
  fi
  read -p "Press Enter to return to menu..."
}

change_folders() {
  echo -e "${WHT}Current video dir: ${YEL}$VIDEO_DIR${RST}"
  echo -e "${WHT}Current audio dir: ${YEL}$AUDIO_DIR${RST}"
  read -p "Enter new video folder path (or Enter to keep): " ndv
  if [ -n "$ndv" ]; then
    VIDEO_DIR="$ndv"
    mkdir -p "$VIDEO_DIR" 2>/dev/null || true
  fi
  read -p "Enter new audio folder path (or Enter to keep): " nda
  if [ -n "$nda" ]; then
    AUDIO_DIR="$nda"
    mkdir -p "$AUDIO_DIR" 2>/dev/null || true
  fi
  echo -e "${GRN}Paths updated!${RST}"
  sleep 1
}

show_recent_files() {
  echo -e "${WHT}Recent files in video folder:${RST}"
  ls -1t "$VIDEO_DIR" 2>/dev/null | head -n 5 || echo "(none)"
  echo
  echo -e "${WHT}Recent files in audio folder:${RST}"
  ls -1t "$AUDIO_DIR" 2>/dev/null | head -n 5 || echo "(none)"
  echo
  read -p "Press Enter to return to menu..."
}

show_help() {
  echo -e "${GRN}Quick fixes:${RST}"
  echo -e " - yt-dlp missing? Run: ${YEL}pip install yt-dlp${RST}"
  echo -e " - MP3 convert fail? Run: ${YEL}pkg install ffmpeg -y${RST}"
  echo -e " - Storage permission? Run: ${YEL}termux-setup-storage${RST}"
  echo
  read -p "Press Enter to return to menu..."
}

# main loop
while true; do
  draw_header
  draw_menu_box
  read -p $'Enter choice (e.g. 02 or 2): ' choice
  case "${choice##0}" in    # allow leading zero like 01/02
    1) show_info ;;
    2) prompt_url_and_download_video ;;
    3) prompt_url_and_download_audio ;;
    4) change_folders ;;
    5) show_recent_files ;;
    6) show_help ;;
    7) clear; echo -e "${GRN}Goodbye — Stay legal!${RST}"; exit 0 ;;
    *) echo -e "${YEL}Invalid option. Try again.${RST}"; sleep 1 ;;
  esac
done