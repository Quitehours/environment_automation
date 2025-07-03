# Testinator Development Environment Setup Script

## Quick Start

1. **Configure the script** - Edit the USER CONFIGURATION section at the top:
   ```bash
   # Update BASE_DIR to your project path
   BASE_DIR="/path/to/your/project"

   # Update service names to match your directories
   SERVICE_MAIN="your-main-service"
   SERVICE_SESSION_MANAGER="your-session-manager"
   # ... etc
   ```

2. **Run the script**:
   ```bash
   chmod +x testinator-iterm2-launcher.sh
   ./testinator-iterm2-launcher.sh
   ```

3. **Done!** All your services will start in organized iTerm2 tabs.

## Overview

The `testinator-iterm2-launcher.sh` script automates the iTerm2 setup for all Testinator microservices, creating a complete development environment with all services running in organized tabs and panes.

## Prerequisites

### System Requirements
- **macOS** with AppleScript support
- **iTerm2** installed and accessible
- **Bash** shell environment
- **Ruby** and **Bundler** installed for Rails services

### Directory Structure
The script expects a directory structure that matches your configuration. Example with default settings:
```
$HOME/qh/testio/testinator_dependencies/  # <- BASE_DIR
├── 0-testinator/                         # <- SERVICE_MAIN
├── 1-testinator-test-session-manager/    # <- SERVICE_SESSION_MANAGER
├── 2-testinator-explorer/                # <- SERVICE_EXPLORER
├── 3-testinator-test-case-generator/     # <- SERVICE_TEST_GENERATOR
├── 5-testinator-user-stories-executor/   # <- SERVICE_USER_STORIES
├── 6-testinator-bug-detector/            # <- SERVICE_BUG_DETECTOR
├── 7-testinator-bug-submitter/           # <- SERVICE_BUG_SUBMITTER
└── 13-testinator-python-agents-runner/   # <- SERVICE_PYTHON_AGENTS
```

**Important**: Your directory names can be anything! Just update the SERVICE_* variables in the script to match your structure.

## Installation

1. **Configure your environment**: Edit the script to match your setup:
   ```bash
   # Open the script in your preferred editor
   nano testinator-iterm2-launcher.sh
   # or
   code testinator-iterm2-launcher.sh
   ```

2. **Update the USER CONFIGURATION section** at the top of the script:
   ```bash
   # ================================
   # USER CONFIGURATION - CUSTOMIZE THIS SECTION
   # ================================

   # Base directory path - update this to match your setup
   BASE_DIR="/path/to/your/testinator/directory"

   # Service directories - update these names to match your project structure
   SERVICE_MAIN="your-main-service-name"
   SERVICE_SESSION_MANAGER="your-session-manager-service"
   SERVICE_EXPLORER="your-explorer-service"
   # ... etc
   ```

3. **Make the script executable**:
   ```bash
   chmod +x testinator-iterm2-launcher.sh
   ```

4. **Ensure iTerm2 is installed** and can be launched via AppleScript

## Optional: Create an Alias for Convenience

To make the script even easier to use, you can create an alias in your shell configuration:

### For Zsh (default on macOS)
```bash
# Add to ~/.zshrc
echo 'alias testinator="/path/to/your/testinator-iterm2-launcher.sh"' >> ~/.zshrc
source ~/.zshrc
```

### For Bash
```bash
# Add to ~/.bashrc or ~/.bash_profile
echo 'alias testinator="/path/to/your/testinator-iterm2-launcher.sh"' >> ~/.bashrc
source ~/.bashrc
```

### Usage with Alias
After setting up the alias, you can run the script from anywhere:
```bash
testinator
```

**Note**: Replace `/path/to/your/testinator-iterm2-launcher.sh` with the actual path to your script.

## Usage

### Basic Usage
```bash
./testinator-iterm2-launcher.sh
```

### With Alias (if configured)
```bash
testinator
```

### What the Script Does
The script will:
1. Validate your environment and prerequisites
2. Launch iTerm2 (if not already running)
3. Create a new window with multiple tabs and panes
4. Start all Testinator services in their respective environments

## Service Layout

After running the script, you'll have one iTerm2 window with the following organization:

### Tab 1: 0-testinator (Main Service - 3 panes)
- **Pane 1**: `bin/dev` - Main Rails server
- **Pane 2**: `bundle exec rake monitor:start` - Background monitor
- **Pane 3**: `bundle exec rake subscriber:start` - Event subscriber

### Tab 2: 1-testinator-test-session-manager
- Rails service for managing test sessions

### Tab 3: 2-testinator-explorer
- Rails service for test exploration

### Tab 4: 3-testinator-test-case-generator
- Rails service for generating test cases

### Tab 5: 5-testinator-user-stories-executor
- Rails service for executing user stories

### Tab 6: 6-testinator-bug-detector
- Rails service for detecting bugs

### Tab 7: 7-testinator-bug-submitter
- Rails service for submitting bugs

### Tab 8: 13-testinator-python-agents-runner
- Python service for running test agents

## Configuration

### User Configuration Section
The script includes a dedicated configuration section at the top for easy customization:

```bash
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
```

### Configuration Steps
1. **Set BASE_DIR**: Update this to point to your main project directory
2. **Set Service Names**: Update each SERVICE_* variable to match your directory names
3. **Adjust Timing**: Modify delays if needed for your system performance

### Example Custom Configuration
If your project structure is different:
```bash
BASE_DIR="/Users/yourname/projects/my-testinator"
SERVICE_MAIN="main-app"
SERVICE_SESSION_MANAGER="session-service"
SERVICE_EXPLORER="explorer-app"
# ... etc
```

## Troubleshooting

### Common Issues

#### 1. "osascript not found"
- **Cause**: Running on non-macOS system
- **Solution**: This script only works on macOS with AppleScript support

#### 2. "Base directory not found"
- **Cause**: The BASE_DIR path doesn't exist
- **Solution**:
  - Check if the path in BASE_DIR exists
  - Create the directory if needed
  - Update BASE_DIR in the script to match your actual path

#### 3. "Service directory not found"
- **Cause**: One or more service directories don't exist
- **Solution**:
  - Check if all directories listed in SERVICE_* variables exist
  - Create missing directories or update variable names to match existing ones
  - Verify your project structure matches the configured service names

#### 4. "iTerm2 is not running"
- **Cause**: iTerm2 not installed or not accessible
- **Solution**: Install iTerm2 and ensure it can be launched

#### 5. Two windows opening
- **Cause**: iTerm2 auto-creating window when activated
- **Solution**: Script now checks for existing windows and reuses them

#### 6. Services not starting
- **Cause**: Missing dependencies or incorrect directory structure
- **Solution**:
  - Verify all service directories exist
  - Ensure `bin/dev` files are present and executable
  - Check that all dependencies are installed

### Debugging

To debug issues:
1. Run the script with bash debugging:
   ```bash
   bash -x testinator-iterm2-launcher.sh
   ```

2. Check individual service directories manually:
   ```bash
   cd $HOME/qh/testio/testinator_dependencies/0-testinator
   ls -la bin/dev
   ```

3. Test iTerm2 AppleScript access:
   ```bash
   osascript -e 'tell application "iTerm" to activate'
   ```

## Customization

### Adding New Services
To add a new service:
1. **Add variable in USER CONFIGURATION section**:
   ```bash
   SERVICE_NEW_SERVICE="your-new-service-directory"
   ```

2. **Add the service directory** to your main project folder

3. **Add a new tab creation block** in the AppleScript section:
   ```applescript
   -- === NEW SERVICE: $SERVICE_NEW_SERVICE ===
   tell newWindow
       create tab with default profile
   end tell
   delay $DELAY_SHORT

   tell current session of newWindow
       write text "cd $BASE_DIR/$SERVICE_NEW_SERVICE"
       write text "bin/dev"
   end tell
   ```

4. **Update the service summary** in `display_service_summary()`:
   ```bash
   echo "  Tab 9: $SERVICE_NEW_SERVICE"
   ```

### Modifying Service Commands
To change what commands run in each service:
1. Locate the service's section in the AppleScript
2. Modify the `write text` commands as needed
3. For example, to run a different command instead of `bin/dev`:
   ```applescript
   write text "npm start"
   # or
   write text "python manage.py runserver"
   ```

### Complete Example: Adding a New Service
```bash
# 1. Add to USER CONFIGURATION section:
SERVICE_API_GATEWAY="9-testinator-api-gateway"

# 2. Add to AppleScript section:
-- === SERVICE 9: $SERVICE_API_GATEWAY ===
tell newWindow
    create tab with default profile
end tell
delay $DELAY_SHORT

tell current session of newWindow
    write text "cd $BASE_DIR/$SERVICE_API_GATEWAY"
    write text "npm start"
end tell

# 3. Add to display_service_summary():
echo "  Tab 9: $SERVICE_API_GATEWAY"
```

## Performance Notes

- The script uses delays to prevent race conditions during service startup
- Services start in dependency order (main service first)
- Monitor each tab to ensure services start successfully
- Some services may take longer to fully initialize

## Security Considerations

- The script uses AppleScript which requires appropriate permissions
- Ensure your system allows Terminal/iTerm2 to control other applications
- The script validates the base directory before proceeding

## Support

For issues or questions:
1. Check the troubleshooting section above
2. Verify all prerequisites are met
3. Test individual services manually
4. Check iTerm2 and AppleScript permissions

## License

This script is part of the Testinator development environment and follows the project's licensing terms.
