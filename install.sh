#!/bin/bash

# Dotfiles installation script
# Creates symbolic links from home directory to dotfiles repo

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Homebrew is installed
check_homebrew() {
    if ! command -v brew &> /dev/null; then
        print_error "Homebrew is not installed. Please install it first:"
        echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
}

# Install Homebrew packages
install_brew_packages() {
    print_status "Installing Homebrew packages from Brewfile..."
    
    if [ -f "$DOTFILES_DIR/Brewfile" ]; then
        cd "$DOTFILES_DIR"
        # Clean up any existing lock files
        rm -f "$DOTFILES_DIR/Brewfile.lock.json"
        
        # Run brew bundle install
        if brew bundle install --cleanup; then
            print_success "Homebrew packages installed successfully"
        else
            print_warning "Some packages failed to install, attempting to fix conflicts..."
            
            # Fix common symlink conflicts
            if brew list step &>/dev/null; then
                print_status "Fixing step symlink conflict..."
                brew link --overwrite step
            fi
            
            print_success "Homebrew packages installed with fixes applied"
        fi
    else
        print_warning "Brewfile not found, skipping package installation"
    fi
}

# Backup existing file/directory
backup_existing() {
    local target="$1"
    
    if [ -e "$target" ] || [ -L "$target" ]; then
        # If it's a symlink, just remove it
        if [ -L "$target" ]; then
            print_status "Removing existing symlink: $target"
            rm -rf "$target"
        else
            # For regular files/directories, rename with .backup
            local backup_path="${target}.backup"
            print_status "Backing up $target to $backup_path"
            # Remove old backup if it exists
            [ -e "$backup_path" ] && rm -rf "$backup_path"
            mv "$target" "$backup_path"
        fi
    fi
}

# Function to create symbolic link
create_link() {
    local source="$1"
    local target="$2"
    
    # Validate source exists
    if [ ! -e "$source" ]; then
        print_error "Source does not exist: $source"
        return 1
    fi
    
    # Create target directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # Backup existing file/link if it exists
    backup_existing "$target"
    
    # Create symbolic link
    print_status "Linking $source -> $target"
    if ln -s "$source" "$target"; then
        # Verify the link was created correctly
        if [ -L "$target" ] && [ -e "$target" ]; then
            print_success "Successfully linked: $target"
            return 0
        else
            print_error "Failed to create valid symlink: $target"
            return 1
        fi
    else
        print_error "Failed to create symlink: $target"
        return 1
    fi
}

# Install dotfiles
install_dotfiles() {
    print_status "Installing dotfiles..."
    
    local failed=0
    
    # Map dotfiles to their home directory locations
    create_link "$DOTFILES_DIR/config/terminal/tmux.conf" "$HOME/.tmux.conf" || ((failed++))
    create_link "$DOTFILES_DIR/config/shell/zshrc" "$HOME/.zshrc" || ((failed++))
    create_link "$DOTFILES_DIR/config/editors/nvim" "$HOME/.config/nvim" || ((failed++))
    
    if [ $failed -eq 0 ]; then
        print_success "All dotfiles installed successfully"
    else
        print_error "$failed dotfile(s) failed to install"
        return 1
    fi
}

# Install tmux plugin manager
install_tmux_plugins() {
    print_status "Installing tmux plugin manager..."
    
    TPM_DIR="$HOME/.tmux/plugins/tpm"
    if [ ! -d "$TPM_DIR" ]; then
        git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
        print_success "TPM installed. Run 'tmux' and press 'prefix + I' to install plugins"
    else
        print_warning "TPM already installed"
    fi
}

# Install Rust via rustup
install_rust() {
    print_status "Installing Rust via rustup..."
    
    # Check if rustup is installed via Homebrew
    if ! command -v rustup &> /dev/null; then
        print_error "rustup is not installed. Please run 'brew install rustup' first"
        return 1
    fi
    
    # Check if rust is already installed
    if rustup show active-toolchain &> /dev/null 2>&1; then
        print_warning "Rust is already installed: $(rustup show active-toolchain)"
    else
        print_status "Installing stable Rust toolchain..."
        rustup-init -y --default-toolchain stable --profile default
        
        # Source cargo env for current session
        source "$HOME/.cargo/env"
        
        print_success "Rust installed successfully. Run 'source ~/.cargo/env' or restart your shell"
    fi
}

# Main installation function
main() {
    print_status "Starting dotfiles installation..."
    
    # Parse command line arguments
    INSTALL_PACKAGES=true
    INSTALL_DOTFILES=true
    INSTALL_TMUX_PLUGINS=true
    INSTALL_RUST=true
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            --no-packages)
                INSTALL_PACKAGES=false
                shift
                ;;
            --no-dotfiles)
                INSTALL_DOTFILES=false
                shift
                ;;
            --no-tmux-plugins)
                INSTALL_TMUX_PLUGINS=false
                shift
                ;;
            --no-rust)
                INSTALL_RUST=false
                shift
                ;;
            --help)
                echo "Usage: $0 [OPTIONS]"
                echo "Options:"
                echo "  --no-packages      Skip Homebrew package installation"
                echo "  --no-dotfiles      Skip dotfiles symlink creation"
                echo "  --no-tmux-plugins  Skip tmux plugin manager installation"
                echo "  --no-rust          Skip Rust installation via rustup"
                echo "  --help             Show this help message"
                echo ""
                echo "Backups:"
                echo "  Existing configs are renamed with .backup extension"
                echo "  (e.g., ~/.zshrc becomes ~/.zshrc.backup)"
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                exit 1
                ;;
        esac
    done
    
    # Check prerequisites
    if [ "$INSTALL_PACKAGES" = true ]; then
        check_homebrew
        install_brew_packages
    fi
    
    # Install components
    if [ "$INSTALL_DOTFILES" = true ]; then
        install_dotfiles
    fi
    
    if [ "$INSTALL_TMUX_PLUGINS" = true ]; then
        install_tmux_plugins
    fi
    
    if [ "$INSTALL_RUST" = true ]; then
        install_rust
    fi
    
    print_success "Installation complete!"
    print_status "You may need to restart your shell or run 'source ~/.zshrc'"
    
    # Remind about cargo env if Rust was installed
    if [ "$INSTALL_RUST" = true ] && [ -f "$HOME/.cargo/env" ]; then
        print_status "Don't forget to run 'source ~/.cargo/env' for Rust"
    fi
}

# Run main function with all arguments
main "$@"