#!/bin/bash

# =============================================================================
# Vim Guide Script
# =============================================================================
# Description: Interactive Vim cheat sheet and reference guide
# Usage: ./vim_guide.sh
# Author: QuietHours
# GitHub: https://github.com/QuietHours/environment-automation/vim-guide
# =============================================================================

# Subdued colors for better readability
RED='\033[0;91m'
GREEN='\033[0;92m'
YELLOW='\033[0;93m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'
CYAN='\033[0;96m'
WHITE='\033[0;97m'
GRAY='\033[0;37m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m' # No Color

clear

echo -e "${BOLD}${BLUE}================================"
echo -e "        VIM CHEAT SHEET"
echo -e "       (macOS / Unix)"
echo -e "================================${NC}\n"

echo -e "${BOLD}${GREEN}MAIN MODES:${NC}"
echo -e "${DIM}${GRAY}---------------${NC}"
echo -e "${YELLOW}ESC${NC}      - normal mode (exit any mode)"
echo -e "${YELLOW}i${NC}        - insert before cursor"
echo -e "${YELLOW}a${NC}        - insert after cursor"
echo -e "${MAGENTA}v${NC}        - visual mode (select characters)"
echo -e "${MAGENTA}V${NC}        - visual mode (select lines)"
echo -e "${MAGENTA}Ctrl+v${NC}   - block selection (columns)"
echo -e "${CYAN}:${NC}        - command mode\n"

echo -e "${BOLD}${GREEN}FILE NAVIGATION:${NC}"
echo -e "${DIM}${GRAY}------------------------------${NC}"
echo -e "${YELLOW}h / l${NC}    - left / right"
echo -e "${YELLOW}j / k${NC}    - down / up"
echo -e "${YELLOW}0${NC}        - beginning of line"
echo -e "${YELLOW}^${NC}        - first non-blank character"
echo -e "${YELLOW}$${NC}        - end of line"
echo -e "${YELLOW}w / b${NC}    - forward / backward by words"
echo -e "${YELLOW}gg / G${NC}   - beginning / end of file"
echo -e "${CYAN}:n${NC}       - go to line n"
echo -e "${BLUE}Ctrl+d${NC}   - down half screen"
echo -e "${BLUE}Ctrl+u${NC}   - up half screen\n"

echo -e "${BOLD}${GREEN}FILE OPERATIONS:${NC}"
echo -e "${DIM}${GRAY}------------------------------${NC}"
echo -e "${CYAN}:e filename.txt${NC}  - open file"
echo -e "${CYAN}:Ex${NC}              - open file browser (netrw)"
echo -e "${CYAN}:w${NC}               - save file"
echo -e "${CYAN}:q${NC}               - quit"
echo -e "${CYAN}:wq${NC}              - save and quit"
echo -e "${RED}:q!${NC}              - quit without saving\n"

echo -e "${BOLD}${GREEN}FILE BROWSER (vim .):${NC}"
echo -e "${DIM}${GRAY}------------------------------${NC}"
echo -e "${YELLOW}-${NC}         - go up one level"
echo -e "${YELLOW}Enter${NC}     - open file / folder"
echo -e "${YELLOW}R${NC}         - rename file"
echo -e "${RED}D${NC}         - delete file"
echo -e "${CYAN}:!mkdir name${NC} - create folder (via terminal)"
echo -e "${CYAN}:e name${NC}   - create and open new file"
echo -e "${YELLOW}q${NC}         - exit browser\n"

echo -e "${BOLD}${GREEN}DELETE / COPY / PASTE:${NC}"
echo -e "${DIM}${GRAY}------------------------------${NC}"
echo -e "${MAGENTA}v${NC}         - enter selection mode"
echo -e "${RED}d${NC}         - delete selected"
echo -e "${BLUE}y${NC}         - copy selected"
echo -e "${BLUE}p${NC}         - paste after cursor"
echo -e "${RED}x${NC}         - delete character under cursor"
echo -e "${RED}dd${NC}        - delete line"
echo -e "${BLUE}yy${NC}        - copy line"
echo -e "${YELLOW}u${NC}         - undo"
echo -e "${YELLOW}Ctrl+r${NC}    - redo\n"

echo -e "${BOLD}${GREEN}USEFUL COMMANDS:${NC}"
echo -e "${DIM}${GRAY}------------------------------${NC}"
echo -e "${CYAN}:split filename${NC}   - open file in horizontal split"
echo -e "${CYAN}:vsplit filename${NC}  - vertical split"
echo -e "${CYAN}:ls${NC}               - list open buffers"
echo -e "${CYAN}:bN${NC}               - switch to buffer N"
echo -e "${CYAN}:bn / :bp${NC}         - next / previous buffer\n"

echo -e "${BOLD}${GREEN}SESSION TERMINATION:${NC}"
echo -e "${DIM}${GRAY}------------------------------${NC}"
echo -e "${CYAN}:w${NC}                - save"
echo -e "${CYAN}:q${NC}                - quit"
echo -e "${CYAN}:wq${NC}               - save and quit"
echo -e "${RED}:q!${NC}               - quit without saving\n"

echo -e "${DIM}${BLUE}================================${NC}\n"
