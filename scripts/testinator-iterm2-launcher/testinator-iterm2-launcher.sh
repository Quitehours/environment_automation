#!/bin/bash

# =============================================================================
# Testinator iTerm2 Launcher Script
# =============================================================================
# Description: Launches Testinator Development Environment in iTerm2
# Usage: ./testinator-iterm2-launcher.sh [OPTIONS]
# Author: QuietHours
# GitHub: https://github.com/QuietHours/environment-automation/testinator-iterm2-launcher
# =============================================================================

set -e  # Exit on any error

# ================================
# USER CONFIGURATION - CUSTOMIZE THIS SECTION
# ================================

# Base directory path - update this to match your setup
BASE_DIR="$HOME/qh/testio/testinator_dependencies"

# Service directories - update these names to match your project structure
SERVICE_MAIN="0-testinator"
SERVICE_SESSION_MANAGER="1-testinator-test-session-manager"
SERVICE_EXPLORER="2-testinator-explorer"
SERVICE_TEST_GENERATOR="3-testinator-test-case-generator"
SERVICE_USER_STORIES="5-testinator-user-stories-executor"
SERVICE_BUG_DETECTOR="6-testinator-bug-detector"
SERVICE_BUG_SUBMITTER="7-testinator-bug-submitter"
SERVICE_PYTHON_AGENTS="13-testinator-python-agents-runner"

# Timing configuration
DELAY_SHORT=0.5
DELAY_MEDIUM=1.0

# ================================
# END USER CONFIGURATION
# ================================

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Validate prerequisites
validate_environment() {
    print_status "Validating environment prerequisites..."

    # Check if iTerm2 is installed
    if ! command -v osascript &> /dev/null; then
        print_error "osascript not found. This script requires macOS with AppleScript support."
        exit 1
    fi

    # Check if base directory exists
    if [[ ! -d "$BASE_DIR" ]]; then
        print_error "Base directory not found: $BASE_DIR"
        print_error "Please ensure the base directory exists and update BASE_DIR in the script."
        exit 1
    fi

    # Check if all service directories exist
    local services=("$SERVICE_MAIN" "$SERVICE_SESSION_MANAGER" "$SERVICE_EXPLORER" "$SERVICE_TEST_GENERATOR" "$SERVICE_USER_STORIES" "$SERVICE_BUG_DETECTOR" "$SERVICE_BUG_SUBMITTER" "$SERVICE_PYTHON_AGENTS")

    for service in "${services[@]}"; do
        if [[ ! -d "$BASE_DIR/$service" ]]; then
            print_error "Service directory not found: $BASE_DIR/$service"
            print_error "Please ensure the directory exists or update the SERVICE_* variables in the script."
            exit 1
        fi
    done

    # Check if iTerm2 is available
    if ! osascript -e 'tell application "System Events" to exists (process "iTerm2")' 2>/dev/null; then
        print_warning "iTerm2 is not running. The script will attempt to launch it."
    fi

    print_status "Environment validation completed successfully."
}

# Main iTerm2 automation function
setup_testinator_environment() {
    print_status "Starting iTerm2 testinator environment setup..."

        osascript <<EOF
tell application "iTerm"
    activate
    delay 1.0

    -- Get the frontmost window (iTerm creates one automatically on activation)
    set newWindow to front window

    -- === SERVICE 1: $SERVICE_MAIN (3 panes) ===
    tell current session of newWindow
        write text "cd $BASE_DIR/$SERVICE_MAIN"
        write text "bin/dev"
    end tell

    -- Split horizontally for monitor:start
    tell current session of newWindow
        split horizontally with default profile
    end tell
    delay $DELAY_SHORT

    tell session 2 of current tab of newWindow
        write text "cd $BASE_DIR/$SERVICE_MAIN"
        write text "bundle exec rake monitor:start"
    end tell

    -- Split vertically for subscriber:start
    tell session 2 of current tab of newWindow
        split vertically with default profile
    end tell
    delay $DELAY_SHORT

    tell session 3 of current tab of newWindow
        write text "cd $BASE_DIR/$SERVICE_MAIN"
        write text "bundle exec rake subscriber:start"
    end tell

    -- === SERVICE 2: $SERVICE_SESSION_MANAGER ===
    tell newWindow
        create tab with default profile
    end tell
    delay $DELAY_SHORT

    tell current session of newWindow
        write text "cd $BASE_DIR/$SERVICE_SESSION_MANAGER"
        write text "bin/dev"
    end tell

    -- === SERVICE 3: $SERVICE_EXPLORER ===
    tell newWindow
        create tab with default profile
    end tell
    delay $DELAY_SHORT

    tell current session of newWindow
        write text "cd $BASE_DIR/$SERVICE_EXPLORER"
        write text "bin/dev"
    end tell

    -- === SERVICE 4: $SERVICE_TEST_GENERATOR ===
    tell newWindow
        create tab with default profile
    end tell
    delay $DELAY_SHORT

    tell current session of newWindow
        write text "cd $BASE_DIR/$SERVICE_TEST_GENERATOR"
        write text "bin/dev"
    end tell

    -- === SERVICE 5: $SERVICE_USER_STORIES ===
    tell newWindow
        create tab with default profile
    end tell
    delay $DELAY_SHORT

    tell current session of newWindow
        write text "cd $BASE_DIR/$SERVICE_USER_STORIES"
        write text "bin/dev"
    end tell

    -- === SERVICE 6: $SERVICE_BUG_DETECTOR ===
    tell newWindow
        create tab with default profile
    end tell
    delay $DELAY_SHORT

    tell current session of newWindow
        write text "cd $BASE_DIR/$SERVICE_BUG_DETECTOR"
        write text "bin/dev"
    end tell

    -- === SERVICE 7: $SERVICE_BUG_SUBMITTER ===
    tell newWindow
        create tab with default profile
    end tell
    delay $DELAY_SHORT

    tell current session of newWindow
        write text "cd $BASE_DIR/$SERVICE_BUG_SUBMITTER"
        write text "bin/dev"
    end tell

    -- === SERVICE 8: $SERVICE_PYTHON_AGENTS ===
    tell newWindow
        create tab with default profile
    end tell
    delay $DELAY_SHORT

    tell current session of newWindow
        write text "cd $BASE_DIR/$SERVICE_PYTHON_AGENTS"
        write text "bin/dev"
    end tell

    -- Return to the first tab to show the main service
    tell newWindow
        select tab 1
    end tell

    -- Set window title for identification
    set name of newWindow to "Testinator Development Environment"

end tell
EOF
}

# Function to display service status
display_service_summary() {
    print_status "Testinator Development Environment Setup Complete!"
    echo ""
    echo "Services started in the following order:"
    echo "  Tab 1: $SERVICE_MAIN (3 panes)"
    echo "    - Pane 1: bin/dev"
    echo "    - Pane 2: bundle exec rake monitor:start"
    echo "    - Pane 3: bundle exec rake subscriber:start"
    echo "  Tab 2: $SERVICE_SESSION_MANAGER"
    echo "  Tab 3: $SERVICE_EXPLORER"
    echo "  Tab 4: $SERVICE_TEST_GENERATOR"
    echo "  Tab 5: $SERVICE_USER_STORIES"
    echo "  Tab 6: $SERVICE_BUG_DETECTOR"
    echo "  Tab 7: $SERVICE_BUG_SUBMITTER"
    echo "  Tab 8: $SERVICE_PYTHON_AGENTS"
    echo ""
    print_status "All services are starting up. Please monitor each tab for startup completion."
}

# Function to handle cleanup on script interruption
cleanup() {
    print_warning "Script interrupted. iTerm2 setup may be incomplete."
    exit 1
}

# Main execution flow
main() {
    # Set up interrupt handler
    trap cleanup INT TERM

    print_status "Initializing Testinator Development Environment..."

    # Validate environment
    validate_environment

    # Setup iTerm2 environment
    setup_testinator_environment

    # Display summary
    display_service_summary

    print_status "Setup completed successfully!"
}

# Execute main function
main "$@"
