# AJ-HACKER YT-Downloader

**AJ-HACKER YT-Downloader** एक छोटा और सरल Termux script है जो YouTube से वीडियो और MP3 (audio) सुरक्षित तरीके से डाउनलोड करने में मदद करता है. यह script मोबाइल (Android Termux) के लिए बनाया गया है और user-friendly menu + big ASCII banner देता है.

---

## 🔥 Features
- Video download (best quality)  
- Audio download (MP3)  
- Change save folders (Video / Audio)  
- Show recent downloaded files  
- Clean ASCII *AJ-HACKER* header and looping menu  
- Works with `yt-dlp` (open-source) and optionally `ffmpeg` for audio conversion

---

## ⚙️ Requirements (Termux)
Run once:
```bash
pkg update -y && pkg upgrade -y
pkg install python wget git ffmpeg -y
pip install yt-dlp
termux-setup-storage
