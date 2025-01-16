#!/bin/bash

LOGFILE="install.log"
echo "📝 Installation started at $(date)" | tee -a $LOGFILE

# Function to check if the last command succeeded
check_success() {
    if [ $? -ne 0 ]; then
        echo "❌ Error encountered. Check $LOGFILE for details." | tee -a $LOGFILE
        exit 1
    fi
}

# Update system packages
echo "📦 Updating system packages..." | tee -a $LOGFILE
sudo apt update -y >> $LOGFILE 2>&1
check_success

# Upgrade system packages
echo "📦 Upgrading system packages..." | tee -a $LOGFILE
sudo apt upgrade -y >> $LOGFILE 2>&1
check_success

echo "🐚 Installing ZSH..." | tee -a $LOGFILE
sudo apt install zsh -y >> $LOGFILE 2>&1
check_success

# Set ZSH as default shell
echo "🔧 Setting ZSH as default shell..." | tee -a $LOGFILE
chsh -s $(which zsh)
check_success

# Install Oh My Zsh
echo "🚀 Installing Oh My Zsh..." | tee -a $LOGFILE
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >> $LOGFILE 2>&1
check_success

# Install zsh-autosuggestions and zsh-syntax-highlighting
echo "🔍 Installing zsh-autosuggestions and zsh-syntax-highlighting..." | tee -a $LOGFILE
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions >> $LOGFILE 2>&1
check_success
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting >> $LOGFILE 2>&1
check_success

# Add plugins to .zshrc
echo "⚙️ Configuring .zshrc..." | tee -a $LOGFILE
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc >> $LOGFILE 2>&1
check_success

# Install NVM
echo "📥 Installing NVM..." | tee -a $LOGFILE
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash >> $LOGFILE 2>&1
check_success

export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
check_success

# Ensure NVM is available in .zshrc
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
echo "✅ NVM installed and configured." | tee -a $LOGFILE

# Install Node LTS
echo "🔄 Installing Node.js LTS..." | tee -a $LOGFILE
nvm install --lts >> $LOGFILE 2>&1
check_success

# Install exa and bat
echo "📦 Installing eza and bat..." | tee -a $LOGFILE
sudo apt install eza bat -y >> $LOGFILE 2>&1
check_success

# Add aliases to zsh config
echo "✏️ Adding custom aliases..." | tee -a $LOGFILE
cat <<EOT >> ~/.zshrc

# Custom Aliases
alias ls='exa --icons'
alias l='exa -lbF --icons'
alias ll='exa -l --icons'
alias la='exa -a --icons'
alias lla='exa -la --icons'
alias cat='batcat'
alias bat='batcat'
alias weather='curl wttr.in'
alias wtr='curl wttr.in'
EOT

echo "✅ Aliases added." | tee -a $LOGFILE

# Install bottom (system monitoring tool)
BOTTOM_VERSION="0.9.3"
echo "📊 Installing bottom v${BOTTOM_VERSION}..." | tee -a $LOGFILE
curl -LO https://github.com/ClementTsang/bottom/releases/download/${BOTTOM_VERSION}/bottom_${BOTTOM_VERSION}_amd64.deb >> $LOGFILE 2>&1
check_success
sudo dpkg -i bottom_${BOTTOM_VERSION}_amd64.deb >> $LOGFILE 2>&1
check_success
rm bottom_${BOTTOM_VERSION}_amd64.deb >> $LOGFILE 2>&1
check_success
echo "✅ Bottom installed." | tee -a $LOGFILE

echo "✅ Installation completed at $(date)." | tee -a $LOGFILE

zsh
