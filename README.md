# 🎥 AJ-HACKER YT Downloader v2.0
A stylish YouTube downloader for **Termux**, designed like a “Hacking Tool” interface.  
Created by **कामान** — simple, fast, and legal for personal use.

---

## ⚡ Features

✅ Download **YouTube videos** in best quality  
✅ Extract **MP3 audio** from videos  
✅ Change **default save folders**  
✅ View **recent downloads**  
✅ In-built **help & troubleshooting**  
✅ Beautiful hacker-style **menu UI**

---

## 📁 Default Save Locations

| Type  | Default Folder |
|--------|----------------|
| Video | `/storage/emulated/0/Download` |
| Audio | `/storage/emulated/0/Music` |

You can change these from option `[04] Change Save Folders`.

---

## 🧰 Requirements

Before running this script, install these once:

```bash
pkg update -y
pkg install python ffmpeg -y
pip install yt-dlp
termux-setup-storage


---

▶️ Usage

1. Save the script as:

nano yt-downloader.sh

Paste the full code and save (Ctrl + O, Enter, Ctrl + X).


2. Make it executable:

chmod +x yt-downloader.sh


3. Run it:

bash yt-downloader.sh


4. Follow the on-screen menu:

[01] Information
[02] Video Download
[03] Audio Download
[04] Change Save Folders
[05] Recent Files
[06] Help / Troubleshoot
[07] Exit




---

🛠️ Troubleshooting

yt-dlp not found? → pip install yt-dlp

Audio convert failed? → pkg install ffmpeg -y

Permission denied? → termux-setup-storage

Video not saving? → Make sure folder path exists and writable.



---

⚠️ Legal Disclaimer

This tool is intended for personal, educational, or offline use only.
Downloading copyrighted material without permission is not allowed.
The developer and contributors take no responsibility for any misuse.


---

👨‍💻 Author

Created by: कामान
Tool name: AJ-HACKER YT Downloader
Version: 2.0
Platform: Termux (Android)

