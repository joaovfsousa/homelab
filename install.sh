sudo apt update && apt install zsh git unzip -y

echo "alias n=\"/opt/nvim-linux64/bin/nvim\"" >> ~/.bashrc
echo "eval \"\$(/home/joaovfsousa/.local/bin/mise activate bash)\"" >> ~/.bashrc

curl https://mise.run | sh

# Install coolify
sudo snap remove docker
sudo curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash

# Clone dotfiles
git clone git@github.com:joaovfsousa/dotfiles.git

cd dotfiles

chmod +x install

./install


