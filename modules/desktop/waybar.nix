{ config, ... }:

{
  home.file.".config/waybar/config".text = ''
    {
        "layer": "top",
        "margin-top": 14,
        "margin-bottom": 0,
        "margin-left": 14,
        "margin-right": 14,
        "spacing": 0,

        "include": [
            "~/.config/waybar/modules.json"
        ],

        "modules-left": [
            "custom/appmenu",
            "wlr/taskbar",
            "hyprland/window"
        ],

        "modules-center": [
            "hyprland/workspaces"
        ],

        "modules-right": [
            "tray",
            "pulseaudio",
            "custom/notification",
            "clock"
        ]
    }

  '';

home.file.".config/waybar/style.css".text = ''
* {
    font-family: "Fira Sans Semibold", "Font Awesome 6 Free", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
}

window#waybar {
    background-color: #1e1e2e; /* base */
    border: 3px solid #89b4fa; /* blue */
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
    padding: 0;
    margin: 0;
    transition: background-color 0.3s;
}

#window {
    font-size: 16px;
    font-weight: 800;
    color: #89b4fa; /* blue */
    border-radius: 0px;
    padding: 4px 8px;
    margin: 2px;
    opacity: 1;
}

#hyprland-workspaces {
    background: #313244; /* surface0 */
    margin: 1px 0;
    padding: 4px 8px;
    border-radius: 0px;
    font-weight: bold;
    font-size: 14px;
    color: #89b4fa; /* blue */
}

#workspaces button {
    padding: 4px 4px;
    margin: 3px 0px;
    border-radius: 0px;
    color: #cdd6f4; /* text */
    background-color: #313244; /* surface0 */
    transition: all 0.3s ease-in-out;
    font-size: 14px;
}

#workspaces button.active {
    color: #1e1e2e; /* base */
    background: #89b4fa; /* blue */
}

#workspaces button:hover {
    background: #89b4fa; /* blue */
    color: #1e1e2e; /* base */
}

#custom-exit {
    font-size: 16px;
    background-color: #313244; /* surface0 */
    color: #cdd6f4; /* text */
    border-radius: 0px;
    padding: 4px 4px;
    margin: 3px 0px;
}

#clock, #custom-appmenu {
    background-color: #89b4fa; /* blue */
    font-size: 16px;
    font-weight: 800;
    color: #1e1e2e; /* base */
    border-radius: 0px;
    padding: 4px 8px;
    margin: 2px;
}

tooltip {
    border-radius: 0px;
    background-color: #1e1e2e; /* base */
    color: #cdd6f4; /* text */
    padding: 4px 8px;
}

#taskbar {
    background-color: #313244; /* surface0 */
    padding: 4px 4px;
    margin: 3px 0px;
    border-radius: 0px;
    font-weight: normal;
}

#idle_inhibitor {
    font-size: 18px;
    color: #cdd6f4; /* text */
    margin-right: 10px;
}

#idle_inhibitor.activated {
    color: #89b4fa; /* blue */
}

#pulseaudio {
    background-color: #313244; /* surface0 */
    font-size: 14px;
    font-weight: 800;
    color: #cdd6f4; /* text */
    border-radius: 0px;
    padding: 4px 0px;
    margin: 4px 0px;
}

#backlight, #pulseaudio, #network, #bluetooth, #battery, #tray, #custom-updates, #custom-notification {
    background-color: #313244; /* surface0 */
    font-size: 14px;
    font-weight: 800;
    color: #cdd6f4; /* text */
    border-radius: 0px;
    padding: 4px 12px;
    margin: 4px 0px;
}

#battery.critical:not(.charging) {
    background-color: #89b4fa; /* blue (still using it to stay on-theme) */
    color: #1e1e2e;
    animation: blink 0.5s linear infinite alternate;
}

@keyframes blink {
    to {
        background-color: #1e1e2e; /* base */
        color: #cdd6f4; /* text */
    }
}


  '';

  home.file.".config/waybar/modules.json".text = ''
    {
    // Workspaces
    "hyprland/workspaces": {
        "on-scroll-up": "hyprctl dispatch workspace r-1",
        "on-scroll-down": "hyprctl dispatch workspace r+1",
        "on-click": "activate",
        "active-only": false,
        "all-outputs": true,
        "format":" {icon} ",
        "format-icons": {
        "1": " 󰈹 ",
        "2": " ",
        "3": "  ",
        "4": "  ",
        "5": " "
        },
        "persistent-workspaces": {
        "*": 5
        }
    },

    // Taskbar
    "wlr/taskbar": {
        "format": "{icon}",
        "icon-size": 18,
        "tooltip-format": "{title}",
        "on-click": "activate",
        "on-click-middle": "close",
        "ignore-list": ["Alacritty", "kitty", "ghostty"],
        "app_ids-mapping": {
        "firefoxdeveloperedition": "firefox-developer-edition"
        },
        "rewrite": {
        "Firefox Web Browser": "Firefox",
        "Foot Server": "Terminal"
        }
    },

    // Hyprland Window
    "hyprland/window": {
        "format": "{}",
        "rewrite": {
        "(.*) - Brave": "$1",
        "(.*) - Chromium": "$1",
        "(.*) - Brave Search": "$1",
        "(.*) - Outlook": "$1",
        "(.*) Microsoft Teams": "$1"
        },
        "separate-outputs": true
    },

    // Empty
    "custom/empty": {
        "format": ""
    },

        // Tools
    "custom/tools": {
        "format": "",
        "tooltip-format": "Tools"
    },

    // Rofi Application Launcher
    "custom/appmenu": {
        // START APPS LABEL
        "format": "   ",
        // END APPS LABEL
        "on-click": "sleep 0.2;rofi -show drun -replace",
        "tooltip-format": "Left: Open the application launcher\nRight: Show all keybindings"
    },

    // Rofi Application Launcher
    "custom/appmenuicon": {
        "format": "",
        "on-click": "sleep 0.2;rofi -show drun -replace",
        "tooltip-format": "Left: Open the application launcher\nRight: Show all keybindings"
    },

    // Power Menu
    "custom/exit": {
        "format": " 󰐥 ",
        "on-click": "~/.config/waybar/scripts/power-menu.sh",
        "tooltip-format": "Power Menu"
    },

    // Keyboard State
    "keyboard-state": {
        "numlock": true,
        "capslock": true,
        "format": "{name} {icon}",
        "format-icons": {
        "locked": "",
        "unlocked": ""
        }
    },

    // System tray
    "tray": {
        "icon-size": 21,
        "spacing": 10
    },

    // Clock
    "clock": {
        "format": "{:%H:%M %a}",
        "on-click": "ags -t calendar",
        "tooltip": false
    },

    "hyprland/language": {
        "format": "/ K {short}"
    },

    // Network
    "network": {
        "format": "{ifname}",
        "format-wifi": "   {signalStrength}%",
        "format-ethernet": "  {ifname}",
        "format-disconnected": "Disconnected",
        "tooltip-format": " {ifname} via {gwaddri}",
        "tooltip-format-wifi": "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}",
        "tooltip-format-ethernet": " {ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}",
        "tooltip-format-disconnected": "Disconnected",
        "max-length": 50,
        "on-click": "~/.config/ml4w/settings/networkmanager.sh",
        "on-click-right": "~/.config/ml4w/scripts/nm-applet.sh toggle",
    },

    // Battery
    "battery": {
        "states": {
        // "good": 95,
        "warning": 30,
        "critical": 15
        },
        "format": "{icon} {capacity}%",
        "format-charging": "  {capacity}%",
        "format-plugged": "  {capacity}%",
        "format-alt": "{icon}  {time}",
        // "format-good": "", // An empty format will hide the module
        // "format-full": "",
        "format-icons": [" ", " ", " ", " ", " "]
    },

    // Pulseaudio
    "pulseaudio": {
        // "scroll-step": 1, // %, can be a float
        "format": "  {icon}  {volume}%",
        "format-bluetooth": "{volume}% {icon} {format_source}",
        "format-bluetooth-muted": " {icon} {format_source}",
        "format-muted": " {format_source}",
        "format-source": "{volume}%",
        "format-source-muted": "",
        "format-icons": {
        },
        "on-click": "pavucontrol"
    },

    // Bluetooth
    "bluetooth": {
        "format": " {status}",
        "format-disabled": "",
        "format-off": "",
        "interval": 30,
        "on-click": "blueman-manager",
        "format-no-controller": ""
    },

    // Other
    "user": {
        "format": "{user}",
        "interval": 60,
        "icon": false
    },

    // Swaync

    "custom/notification": {
        "tooltip": false,
        "format": "{icon}",
        "format-icons": {
        "notification": "",
        "none": "",
        "dnd-notification": "",
        "dnd-none": "",
        "inhibited-notification": "",
        "inhibited-none": "",
        "dnd-inhibited-notification": "",
        "dnd-inhibited-none": ""
        },
        "return-type": "json",
        "exec-if": "which swaync-client",
        "exec": "swaync-client -swb",
        "on-click": "swaync-client -t -sw",
        "on-click-right": "swaync-client -d -sw",
        "escape": true
    },

    // backlight:
    "backlight": {
        "format": "{icon} {percent}%",
        "format-icons": [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""
        ],
        "scroll-step": 1
    }
    }
  '';
}
