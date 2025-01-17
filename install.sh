echo "Installing basic tools"

sudo apt update && apt install zsh git unzip -y

echo "alias n=\"/opt/nvim-linux64/bin/nvim\"" >> ~/.bashrc
echo "eval \"\$(/home/joaovfsousa/.local/bin/mise activate bash)\"" >> ~/.bashrc
echo "export TERM=xterm-256color" >> ~/.bashrc

echo "Installing mise"

curl https://mise.run | sh

echo "Installing coolify"
# Install coolify
sudo snap remove docker
sudo curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash

echo "Installing dotfiles"
# Clone dotfiles
git clone git@github.com:joaovfsousa/dotfiles.git
cd dotfiles
chmod +x install
./install

echo "Installing KVM"
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
sudo systemctl restart libvirtd
sudo usermod -aG libvirt $(whoami)

echo "Installing cockpit"
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit cockpit-machines

echo "Cockpit can be accessed on port 9090"

echo "Install ssl cert using https://ted.ac/blog/custom-ssl-certificates-on-coolify"
echo "Config cloudflare tunnels using https://coolify.io/docs/knowledge-base/cloudflare/tunnels/#full-httpstls-setup-traefikcoolify-proxy"
