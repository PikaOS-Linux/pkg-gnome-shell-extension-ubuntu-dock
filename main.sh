DEBIAN_FRONTEND=noninteractive

# Add dependent repositories
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
add-apt-repository https://ppa.pika-os.com
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports
# Clone Upstream
tar -xf ./gnome-shell-extension-ubuntu-dock_79ubuntu2.tar.xz -C ./
rm -rfv ./gnome-shell-extension-ubuntu-dock-79ubuntu2/debian
cp -rvf ./debian ./gnome-shell-extension-ubuntu-dock-79ubuntu2/
cd ./gnome-shell-extension-ubuntu-dock-79ubuntu2

# Get build deps
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
