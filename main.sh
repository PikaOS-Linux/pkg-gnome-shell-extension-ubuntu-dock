DEBIAN_FRONTEND=noninteractive

# Clone Upstream
tar -xf ./gnome-shell-extension-ubuntu-dock_79.orig.tar.xz -C ./
rm -rfv ./gnome-shell-extension-ubuntu-dock-79ubuntu2/debian
cp -rvf ./debian ./gnome-shell-extension-ubuntu-dock-79ubuntu2/
cd ./gnome-shell-extension-ubuntu-dock-79ubuntu2

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
