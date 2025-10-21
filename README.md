# 🚀 OnDork Linux Installer

<div align="center">

![Version](https://img.shields.io/badge/version-1.0-blue.svg)
![Platform](https://img.shields.io/badge/platform-Termux-green.svg)
![License](https://img.shields.io/badge/license-MIT-orange.svg)

**Transform your Android device into a full Linux Desktop in minutes!**

[Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [Screenshots](#-screenshots) • [FAQ](#-faq)

</div>

---

## 📖 About

**OnDork Linux Installer** is a powerful one-click solution to install and run a complete Linux desktop environment on your Android device using Termux. No root required, no complicated commands - just a simple, beautiful interface that does everything for you!

### 🎯 Why OnDork?

- ✅ **Zero Configuration** - Fully automated setup
- ✅ **No Root Required** - Works on any Android device
- ✅ **Full Desktop Experience** - XFCE4 desktop with all features
- ✅ **VNC Ready** - Connect instantly with VNC Viewer
- ✅ **Lightweight** - Optimized for mobile devices
- ✅ **User Friendly** - Beautiful CLI interface with colors
- ✅ **Pre-configured** - Everything works out of the box

---

## ✨ Features

### 🖥️ Complete Desktop Environment
- **XFCE4 Desktop** - Fast, lightweight, and feature-rich
- **Firefox Browser** - Full web browsing capability
- **Terminal Emulator** - Native Termux terminal integration
- **File Manager** - Easy file management with GUI

### 🎨 Beautiful Interface
- Color-coded menus and options
- Clear status indicators
- Easy-to-read ASCII art banner
- Step-by-step progress display

### 🔧 Smart Features
- **Automatic Installation** - One-click setup
- **Password Management** - Easy VNC password configuration
- **Session Control** - Start/Stop VNC with single command
- **Log Viewing** - Built-in troubleshooting tools
- **Auto Cleanup** - Handles stale processes automatically

### 🌐 Multiple Connection Methods
- localhost connection
- IP-based connection
- WiFi network connection
- Optimized for various VNC clients

---

## 📱 Requirements

- **Android Device** (Android 7.0+)
- **Termux App** (Latest version)
- **Storage Space** (~1-2 GB free)
- **Internet Connection** (for installation)
- **VNC Viewer App** (for desktop access)

### Recommended VNC Apps:
1. **RealVNC Viewer** - [Download](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)
2. **AVNC** - [Download](https://play.google.com/store/apps/details?id=com.gaurav.avnc)

---

## 🚀 Installation

### Step 1: Install Termux
Download Termux from F-Droid (recommended) or GitHub:
- F-Droid: https://f-droid.org/en/packages/com.termux/
- GitHub: https://github.com/termux/termux-app/releases

### Step 2: Setup Termux
Open Termux and run:
```bash
# Grant storage permission
termux-setup-storage

# Update packages
pkg update && pkg upgrade -y
```

### Step 3: Download OnDork
```bash
# Clone The Repository 
git clone  https://github.com/UNEMPLOYEDHACKER/Linux
# Make it executable
chmod +x ondork.sh
```

### Step 4: Run OnDork
```bash
./ondork.sh
```

---

## 🎮 Usage

### Main Menu Options:

```
╔═══════════════════════════════════════════════════╗
║                                                   ║
║  [1] Install Desktop Environment                 ║
║  [2] Start VNC Server                            ║
║  [3] Set Password                                ║
║  [4] Stop VNC Server                             ║
║  [5] View Logs                                   ║
║  [6] Exit                                        ║
║                                                   ║
╚═══════════════════════════════════════════════════╝
```

### 🔹 Option 1: Install Desktop Environment
- Automatically installs all required packages
- Sets up XFCE4 desktop environment
- Configures VNC server
- Creates startup scripts
- **First time only** - Takes 10-15 minutes

### 🔹 Option 2: Start VNC Server
- Starts the VNC server on port 5901
- Displays connection details
- Shows multiple connection methods
- Ready to connect in seconds

### 🔹 Option 3: Set Password
- Change VNC password anytime
- Minimum 6 characters required
- Secure password storage

### 🔹 Option 4: Stop VNC Server
- Safely stops all VNC sessions
- Cleans up resources
- Frees up memory

### 🔹 Option 5: View Logs
- Check VNC server logs
- Troubleshoot connection issues
- View running processes

---

## 📺 Connecting to Desktop

### Method 1: Using localhost (Recommended)

1. Open VNC Viewer app
2. Create new connection
3. **Address:** `localhost:5901`
4. **Name:** Linux Desktop (or anything)
5. Click **Connect**
6. Enter your VNC password
7. Enjoy your Linux desktop! 🎉

### Method 2: Using IP Address

1. Check your device's IP in OnDork (shown after starting VNC)
2. Use IP like: `192.168.1.100:5901`
3. Useful for connecting from other devices on same network

### VNC Viewer Settings (Recommended):
- **Picture Quality:** High
- **Color Level:** Full
- **Scaling:** Automatic

---

## 🖼️ Screenshots

### OnDork Main Menu
```
  ██████  ███    ██ ██████   ██████  ██████  ██   ██ 
 ██    ██ ████   ██ ██   ██ ██    ██ ██   ██ ██  ██  
 ██    ██ ██ ██  ██ ██   ██ ██    ██ ██████  █████   
 ██    ██ ██  ██ ██ ██   ██ ██    ██ ██   ██ ██  ██  
  ██████  ██   ████ ██████   ██████  ██   ██ ██   ██ 
Linux Installer/Found us in telegram @Ahand_Aryavart
═══════════════════════════════════════════════════
```

### Installation Progress
```
[✓] Updating Termux packages...
[✓] Installing VNC and Desktop packages...
[✓] Creating VNC startup script...
[✓] Installation Completed Successfully!
```

### VNC Connection Details
```
╔════════════════════════════════════════════════════╗
║  📱 CONNECTION DETAILS                             ║
╠════════════════════════════════════════════════════╣
║                                                    ║
║  Method 1 (Recommended):                           ║
║  Address: localhost:5901                           ║
║                                                    ║
║  Method 2:                                         ║
║  Address: 127.0.0.1:5901                           ║
║                                                    ║
╚════════════════════════════════════════════════════╝
```

---

## ❓ FAQ

### Q: Do I need root access?
**A:** No! OnDork works perfectly on non-rooted Android devices.

### Q: How much storage space is needed?
**A:** Approximately 1-2 GB for full installation.

### Q: Can I install other Linux software?
**A:** Yes! Use `pkg install <package-name>` in Termux to install additional software.

### Q: VNC shows "connection refused" error?
**A:** Try these solutions:
1. Stop and restart VNC server (Option 4, then Option 2)
2. Try different address formats (localhost:5901, 127.0.0.1:5901)
3. Check logs using Option 5
4. Reinstall VNC password using Option 3

### Q: Desktop is slow or laggy?
**A:** Try these:
1. Lower VNC picture quality in viewer settings
2. Reduce screen resolution in script settings
3. Close unnecessary apps on Android
4. Use WiFi instead of mobile data

### Q: Can I access this from another device?
**A:** Yes! Use your device's WiFi IP address (shown in OnDork) to connect from other devices on the same network.

### Q: How do I uninstall?
**A:** Simply delete the script and run:
```bash
pkg uninstall tigervnc xfce4 -y
rm -rf ~/.vnc
```

### Q: Password not working?
**A:** Reset password using Option 3 in main menu, then restart VNC server.

---

## 🛠️ Troubleshooting

### Issue: "Command not found"
**Solution:** Make sure script is executable:
```bash
chmod +x ondork.sh
```

### Issue: "Package not found"
**Solution:** Update Termux repositories:
```bash
pkg update && pkg upgrade -y
```

### Issue: Black screen after connecting
**Solution:** Wait 10-20 seconds for desktop to load, or restart VNC.

### Issue: "Port already in use"
**Solution:** Stop VNC first (Option 4), then start again.

### Need More Help?
- Check logs: Option 5 in main menu
- Restart Termux app
- Reinstall using Option 1

---

## 🎓 Advanced Usage

### Custom Resolution
Edit the script and change:
```bash
vncserver :1 -geometry 1920x1080 -depth 24 -localhost no
```

### Installing Additional Software
```bash
# Install Python
pkg install python

# Install Node.js
pkg install nodejs

# Install Git
pkg install git

# Install Text Editor
pkg install nano vim
```

### Multiple Displays
Start VNC on different displays:
```bash
vncserver :2 -geometry 1280x720 -depth 24 -localhost no
# Connect using localhost:5902
```

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Report Bugs** - Open an issue with details
2. **Suggest Features** - Share your ideas
3. **Submit Pull Requests** - Improve the code
4. **Share** - Tell others about  this Project 
5. **Star** - Show your support on GitHub

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 💖 Support

If you find OnDork useful, please:
- ⭐ Star this repository
- 🐦 Share on social media
- 💬 Spread the word
- 🐛 Report bugs
- 💡 Suggest improvements

---

## 🔗 Links

- **GitHub Repository:** https://github.com/UNEMPLOYEDHACKER/Linux
- **Report Issues:** https://github.com/yourusername/ondork/issues
- **Termux Wiki:** https://wiki.termux.com
- **XFCE Desktop:** https://xfce.org

---

## 📞 Contact

- **Developer:** UNEMPLOYEDHACKER
- **Instagram:** https://www.instagram.com/unemploid_hacker?igsh=MWRyeWd4Z2JjdnN3aQ==
- **GitHub:** [@UNEMPLOYEDHACKER](https://github.com/yourusername)
- **Telegram:** @Akhand_Aryavart

---

## 🙏 Acknowledgments

Special thanks to:
- Indian Hacker Group team
- Mr.Pbail
- Mr.Night
- All contributors and users

---

## ⚡ Quick Start Guide

**For absolute beginners:**

1. Install Termux from F-Droid
2. Open Termux and run:
   ```bash
   pkg update -y && pkg install wget -y
   wget https://link-to-ondork-script/ondork.sh
   chmod +x ondork.sh
   ./ondork.sh
   ```
3. Select Option 1 (Install)
4. Set a password when asked
5. Wait for installation to complete
6. Select Option 2 (Start VNC)
7. Download VNC Viewer from Play Store
8. Connect using `localhost:5901`
9. Enter your password
10. Enjoy Linux on Android! 🎉

---

<div align="center">

**Made with ❤️ for the Termux community**

⭐ Star this repo if you found it helpful!

[Report Bug](https://github.com/yourusername/ondork/issues) • [Request Feature](https://github.com/yourusername/ondork/issues) • [Contribute](https://github.com/yourusername/ondork/pulls)

</div>

---

## 📊 Stats

![GitHub stars](https://img.shields.io/github/stars/yourusername/ondork?style=social)
![GitHub forks](https://img.shields.io/github/forks/yourusername/ondork?style=social)
![GitHub issues](https://img.shields.io/github/issues/yourusername/ondork)
![GitHub pull requests](https://img.shields.io/github/issues-pr/yourusername/ondork)

---

**Version 1.0** - Last Updated: October 2025
