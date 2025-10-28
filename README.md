# 🎥 AJ-HACKER YT Downloader v2.0
A stylish YouTube downloader for **Termux**, designed like a “Hacking Tool” interface.  
Created by **TAKLA HACKER** — simple, fast, and legal for personal use.

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

Before using this tool, make sure you have:
- Termux installed on your Android device
- Internet connection
- Storage permission enabled

---

## 🛠️ Installation (Clone from GitHub)

Open **Termux** and run these commands step-by-step 👇

```bash
# Update and upgrade Termux packages
pkg update && pkg upgrade -y

# Install dependencies
pkg install git python ffmpeg -y

# Install yt-dlp
pip install yt-dlp

# Clone this repository
git clone https://github.com/taklahacker/YT-DOWNLOADER.git

# Go into the folder
cd YT-DOWNLOADER

# Give permission (optional)
chmod +x yt-downloader.sh

# Run the tool
bash yt-downloader.sh
```
## ⚠️ Disclaimer

This tool is created **only for educational and personal use**.

- The developer of this tool **does not promote or encourage** downloading copyrighted content from YouTube or any other platform.
- Users are solely responsible for how they use this tool.
- Downloading or sharing copyrighted material **without the permission of the owner** may violate YouTube’s Terms of Service or applicable laws.
- Use this tool **at your own risk** and **only for content you own the rights to** or that is **freely available for download**.


---

## 🤠 Script on-screen menu:

[01] Information
[02] Video Download
[03] Audio Download
[04] Change Save Folders
[05] Recent Files
[06] Help / Troubleshoot
[07] Exit




---

## 🛠️ Troubleshooting

yt-dlp not found? → pip install yt-dlp

Audio convert failed? → pkg install ffmpeg -y

Permission denied? → termux-setup-storage

Video not saving? → Make sure folder path exists and writable.


---

## 👨‍💻 Author

Created by: कामान
Tool name: AJ-HACKER YT Downloader
Version: 2.0
Platform: Termux (Android)

