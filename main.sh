DEBIAN_FRONTEND=noninteractive

# Clone Upstream
wget https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/gnome-shell-extension-ubuntu-dock/87ubuntu1/gnome-shell-extension-ubuntu-dock_87ubuntu1.tar.xz
tar -xf ./gnome-shell-extension-ubuntu-dock_87ubuntu1.tar.xz -C ./
rm -rfv ./gnome-shell-extension-ubuntu-dock-87ubuntu1/debian
cp -rvf ./debian ./gnome-shell-extension-ubuntu-dock-87ubuntu1/
cd ./gnome-shell-extension-ubuntu-dock-87ubuntu1

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
