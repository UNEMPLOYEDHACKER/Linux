#!/data/data/com.termux/files/usr/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Variables
VNC_PORT="5901"
DISPLAY=":1"

# Banner function
show_banner() {
    clear
    echo -e "${CYAN}"
    echo "  ██████  ███    ██ ██████   ██████  ██████  ██   ██ "
    echo " ██    ██ ████   ██ ██   ██ ██    ██ ██   ██ ██  ██  "
    echo " ██    ██ ██ ██  ██ ██   ██ ██    ██ ██████  █████   "
    echo " ██    ██ ██  ██ ██ ██   ██ ██    ██ ██   ██ ██  ██  "
    echo "  ██████  ██   ████ ██████   ██████  ██   ██ ██   ██ "
    echo -e "${NC}"
    echo -e "${YELLOW}           Linux Installer${NC}"
    echo -e "${PURPLE}═══════════════════════════════════════════════════${NC}\n"
}

# Install Linux function
install_linux() {
    show_banner
    echo -e "${GREEN}[*] Starting Desktop Environment Installation...${NC}\n"
    
    # Update packages
    echo -e "${BLUE}[+] Updating Termux packages...${NC}"
    pkg update -y && pkg upgrade -y
    
    # Install required packages
    echo -e "${BLUE}[+] Installing VNC and Desktop packages...${NC}"
    pkg install x11-repo -y
    pkg install tigervnc xfce4 xfce4-terminal firefox -y
    
    # Create VNC directory
    mkdir -p ~/.vnc
    
    # Set VNC password
    echo -e "\n${YELLOW}[!] Setup VNC Password:${NC}"
    echo -e "${CYAN}[*] Enter password (minimum 6 characters)${NC}"
    vncpasswd
    
    # Create VNC startup script
    echo -e "\n${BLUE}[+] Creating VNC startup script...${NC}"
    cat > ~/.vnc/xstartup << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
export PULSE_SERVER=127.0.0.1
export XDG_RUNTIME_DIR=${TMPDIR}
dbus-launch --exit-with-session xfce4-session &
EOF
    
    chmod +x ~/.vnc/xstartup
    
    # Create start script
    cat > $HOME/start-vnc.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
vncserver -kill :1 2>/dev/null
rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1
vncserver :1 -geometry 1280x720 -depth 24 -localhost no
EOF
    chmod +x $HOME/start-vnc.sh
    
    # Create stop script
    cat > $HOME/stop-vnc.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
vncserver -kill :1
EOF
    chmod +x $HOME/stop-vnc.sh
    
    echo -e "\n${GREEN}[✓] Installation Completed Successfully!${NC}"
    echo -e "${YELLOW}[*] Use 'Start VNC' option to run desktop${NC}"
    read -p "Press Enter to continue..."
}

# Start VNC function
start_vnc() {
    show_banner
    echo -e "${GREEN}[*] Starting VNC Server...${NC}\n"
    
    # Check if vncserver exists
    if ! command -v vncserver &> /dev/null; then
        echo -e "${RED}[!] Error: VNC not installed!${NC}"
        echo -e "${YELLOW}[!] Please install Linux first (Option 1)${NC}"
        read -p "Press Enter to continue..."
        return
    fi
    
    # Kill existing sessions
    echo -e "${BLUE}[+] Cleaning up existing sessions...${NC}"
    vncserver -kill :1 2>/dev/null
    vncserver -kill :2 2>/dev/null
    rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1 2>/dev/null
    rm -rf $HOME/.vnc/*.pid 2>/dev/null
    
    # Start VNC server
    echo -e "${BLUE}[+] Starting VNC Server on port $VNC_PORT...${NC}\n"
    vncserver :1 -geometry 1280x720 -depth 24 -localhost no
    
    sleep 2
    
    # Check if started successfully
    if [ -f "$HOME/.vnc/*:1.pid" ] || pgrep -f "Xvnc.*:1" > /dev/null; then
        # Get device IP
        IP_ADDR=$(ip addr show wlan0 2>/dev/null | grep "inet " | awk '{print $2}' | cut -d/ -f1)
        
        echo -e "\n${GREEN}[✓] VNC Server Started Successfully!${NC}\n"
        echo -e "${CYAN}╔════════════════════════════════════════════════════╗${NC}"
        echo -e "${CYAN}║${NC}  ${YELLOW}📱 CONNECTION DETAILS${NC}                             ${CYAN}║${NC}"
        echo -e "${CYAN}╠════════════════════════════════════════════════════╣${NC}"
        echo -e "${CYAN}║${NC}                                                    ${CYAN}║${NC}"
        echo -e "${CYAN}║${NC}  ${GREEN}Method 1 (Recommended):${NC}                        ${CYAN}║${NC}"
        echo -e "${CYAN}║${NC}  Address: ${GREEN}localhost:5901${NC}                         ${CYAN}║${NC}"
        echo -e "${CYAN}║${NC}                                                    ${CYAN}║${NC}"
        echo -e "${CYAN}║${NC}  ${GREEN}Method 2:${NC}                                      ${CYAN}║${NC}"
        echo -e "${CYAN}║${NC}  Address: ${GREEN}127.0.0.1:5901${NC}                         ${CYAN}║${NC}"
        
        if [ ! -z "$IP_ADDR" ]; then
        echo -e "${CYAN}║${NC}                                                    ${CYAN}║${NC}"
        echo -e "${CYAN}║${NC}  ${GREEN}Method 3 (WiFi):${NC}                               ${CYAN}║${NC}"
        echo -e "${CYAN}║${NC}  Address: ${GREEN}${IP_ADDR}:5901${NC}                    ${CYAN}║${NC}"
        fi
        
        echo -e "${CYAN}║${NC}                                                    ${CYAN}║${NC}"
        echo -e "${CYAN}╚════════════════════════════════════════════════════╝${NC}"
        
        echo -e "\n${YELLOW}╔════════════════════════════════════════════════════╗${NC}"
        echo -e "${YELLOW}║${NC}  ${PURPLE}🔧 VNC APP SETTINGS:${NC}                              ${YELLOW}║${NC}"
        echo -e "${YELLOW}╠════════════════════════════════════════════════════╣${NC}"
        echo -e "${YELLOW}║${NC}  1. Open VNC Viewer (RealVNC or AVNC)             ${YELLOW}║${NC}"
        echo -e "${YELLOW}║${NC}  2. Create new connection                          ${YELLOW}║${NC}"
        echo -e "${YELLOW}║${NC}  3. Address: ${GREEN}localhost:5901${NC}                      ${YELLOW}║${NC}"
        echo -e "${YELLOW}║${NC}  4. Name: Linux Desktop (anything)                 ${YELLOW}║${NC}"
        echo -e "${YELLOW}║${NC}  5. Picture Quality: ${GREEN}High${NC}                          ${YELLOW}║${NC}"
        echo -e "${YELLOW}║${NC}  6. Connect and enter your password                ${YELLOW}║${NC}"
        echo -e "${YELLOW}╚════════════════════════════════════════════════════╝${NC}"
        
        echo -e "\n${PURPLE}📲 Download VNC Apps:${NC}"
        echo -e "${CYAN}   RealVNC: ${NC}play.google.com/store/apps/details?id=com.realvnc.viewer.android"
        echo -e "${CYAN}   AVNC: ${NC}play.google.com/store/apps/details?id=com.gaurav.avnc\n"
        
    else
        echo -e "${RED}[!] Failed to start VNC server${NC}"
        echo -e "${YELLOW}[!] Check logs:${NC}"
        cat ~/.vnc/*.log 2>/dev/null | tail -10
    fi
    
    read -p "Press Enter to continue..."
}

# Set VNC password function
set_password() {
    show_banner
    echo -e "${GREEN}[*] Change VNC Password${NC}\n"
    
    if ! command -v vncpasswd &> /dev/null; then
        echo -e "${RED}[!] Error: VNC not installed!${NC}"
        echo -e "${YELLOW}[!] Please install first (Option 1)${NC}"
        read -p "Press Enter to continue..."
        return
    fi
    
    echo -e "${YELLOW}[!] Enter new VNC password:${NC}"
    echo -e "${CYAN}[*] Password must be at least 6 characters${NC}\n"
    vncpasswd
    
    echo -e "\n${GREEN}[✓] Password updated successfully!${NC}"
    echo -e "${YELLOW}[*] Restart VNC server to apply changes${NC}"
    read -p "Press Enter to continue..."
}

# Stop VNC function
stop_vnc() {
    show_banner
    echo -e "${YELLOW}[*] Stopping VNC Server...${NC}"
    vncserver -kill :1 2>/dev/null
    vncserver -kill :2 2>/dev/null
    pkill -f Xvnc 2>/dev/null
    rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1 2>/dev/null
    echo -e "${GREEN}[✓] VNC Server stopped${NC}"
    sleep 2
}

# View logs function
view_logs() {
    show_banner
    echo -e "${GREEN}[*] VNC Server Logs${NC}\n"
    
    if [ -f ~/.vnc/*.log ]; then
        echo -e "${CYAN}[+] Latest logs:${NC}\n"
        cat ~/.vnc/*.log 2>/dev/null | tail -30
    else
        echo -e "${YELLOW}[!] No logs found${NC}"
    fi
    
    echo -e "\n${BLUE}[+] Running VNC processes:${NC}"
    pgrep -fa Xvnc
    
    read -p "\nPress Enter to continue..."
}

# Main menu
main_menu() {
    while true; do
        show_banner
        echo -e "${GREEN}[1]${NC} Install Desktop Environment"
        echo -e "${GREEN}[2]${NC} Start VNC Server"
        echo -e "${GREEN}[3]${NC} Set Password"
        echo -e "${GREEN}[4]${NC} Stop VNC Server"
        echo -e "${GREEN}[5]${NC} View Logs"
        echo -e "${GREEN}[6]${NC} Exit"
        echo -e "${PURPLE}═══════════════════════════════════════════════════${NC}"
        read -p "$(echo -e ${CYAN}Choose an option: ${NC})" choice
        
        case $choice in
            1)
                install_linux
                ;;
            2)
                start_vnc
                ;;
            3)
                set_password
                ;;
            4)
                stop_vnc
                read -p "Press Enter to continue..."
                ;;
            5)
                view_logs
                ;;
            6)
                show_banner
                echo -e "${YELLOW}[*] Stopping all VNC sessions...${NC}"
                stop_vnc
                echo -e "${GREEN}[✓] Thanks for using OnDork!${NC}\n"
                exit 0
                ;;
            *)
                echo -e "${RED}[!] Invalid option!${NC}"
                sleep 2
                ;;
        esac
    done
}

# Start the script
main_menu
