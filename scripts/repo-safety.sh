#!/bin/bash
#
# Add this to /etc/profile.d/repo-safety.sh (to make it system-wide)
#
repo() {
    if [[ "$1" == "init" ]] && [[ "$PWD" == "$HOME" ]]; then
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "🚨  STOP RIGHT THERE YOU ABSOLUTE MANIAC  🚨"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "You're about to run 'repo init' in your HOME directory: $HOME"
        echo ""
        echo "This will:"
        echo "  💀 Create a .repo directory with hundreds of git repos"
        echo "  💀 Sync gigabytes of source code into your home"
        echo "  💀 Make your home directory a complete mess"
        echo "  💀 Take HOURS to clean up"
        echo "  💀 Piss off your sysadmin"
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        read -p "Type 'Yes' to proceed anyway, or anything else to cancel: " response
        echo ""
        
        if [[ "$response" == "Yes" ]]; then
            echo "🤦 Alright, it's your funeral. Don't say I didn't warn you..."
            echo "Proceeding in 3 seconds... (Ctrl+C to cancel)"
            sleep 1
            echo "2..."
            sleep 1
            echo "1..."
            sleep 1
            command repo "$@"
        else
            echo "✅ Smart choice maniac. Create a proper directory first:"
            echo "   mkdir -p ~/projects/android-source"
            echo "   cd ~/projects/android-source"
            echo "   repo init ..."
            return 1
        fi
    else
        command repo "$@"
    fi
}

# Export the function so it's available in subshells
export -f repo
