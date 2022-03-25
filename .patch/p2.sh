#!/bin/bash
#
# SSRP
mkdir package/helloworld
pushd package/helloworld
git clone --depth=1 https://github.com/fw876/helloworld.git
sed -i 's/\"services\"/\"vpn\"/g' helloworld/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/\/services\//\/vpn\//g' helloworld/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/\[services\]/\[vpn\]/g' helloworld/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/\"services\"/\"vpn\"/g' helloworld/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/\/services\//\/vpn\//g' helloworld/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/\[services\]/\[vpn\]/g' helloworld/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/\"services\"/\"vpn\"/g' helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm
sed -i 's/\/services\//\/vpn\//g' helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm
sed -i 's/\[services\]/\[vpn\]/g' helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm
popd

# Passwall
mkdir package/passwall
pushd package/passwall
#git clone --depth=1 https://github.com/kenzok8/small.git
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall.git
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall openwrt-passwall/luci-app-passwall
sed -i 's/\"services\"/\"vpn\"/g' openwrt-passwall/luci-app-passwall/luasrc/controller/*.lua
sed -i 's/\/services\//\/vpn\//g' openwrt-passwall/luci-app-passwall/luasrc/controller/*.lua
sed -i 's/\[services\]/\[vpn\]/g' openwrt-passwall/luci-app-passwall/luasrc/controller/*.lua
sed -i 's/\"services\"/\"vpn\"/g' openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/*/*/*.lua
sed -i 's/\/services\//\/vpn\//g' openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/*/*/*.lua
sed -i 's/\[services\]/\[vpn\]/g' openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/*/*/*.lua
sed -i 's/\"services\"/\"vpn\"/g' openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/*/*.lua
sed -i 's/\/services\//\/vpn\//g' openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/*/*.lua
sed -i 's/\[services\]/\[vpn\]/g' openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/*/*.lua
sed -i 's/\"services\"/\"vpn\"/g' openwrt-passwall/luci-app-passwall/luasrc/view/passwall/*/*.htm
sed -i 's/\/services\//\/vpn\//g' openwrt-passwall/luci-app-passwall/luasrc/view/passwall/*/*.htm
sed -i 's/\[services\]/\[vpn\]/g' openwrt-passwall/luci-app-passwall/luasrc/view/passwall/*/*.htm
popd

# OpenClash
mkdir package/openclash
pushd package/openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
sed -i 's/\"services\"/\"vpn\"/g' luci-app-openclash/luasrc/controller/*.lua
sed -i 's/\/services\//\/vpn\//g' luci-app-openclash/luasrc/controller/*.lua
sed -i 's/\[services\]/\[vpn\]/g' luci-app-openclash/luasrc/controller/*.lua
sed -i 's/\"services\"/\"vpn\"/g' luci-app-openclash/luasrc/model/cbi/openclash/*.lua
sed -i 's/\/services\//\/vpn\//g' luci-app-openclash/luasrc/model/cbi/openclash/*.lua
sed -i 's/\[services\]/\[vpn\]/g' luci-app-openclash/luasrc/model/cbi/openclash/*.lua
sed -i 's/\"services\"/\"vpn\"/g' luci-app-openclash/luasrc/view/openclash/*.htm
sed -i 's/\/services\//\/vpn\//g' luci-app-openclash/luasrc/view/openclash/*.htm
sed -i 's/\[services\]/\[vpn\]/g' luci-app-openclash/luasrc/view/openclash/*.htm
sed -i 's/\"services\"/\"vpn\"/g' luci-app-openclash/luasrc/*.lua
sed -i 's/\/services\//\/vpn\//g' luci-app-openclash/luasrc/*.lua
sed -i 's/\[services\]/\[vpn\]/g' luci-app-openclash/luasrc/*.lua
popd
pushd package/openclash/luci-app-openclash/tools/po2lmo
make && sudo make install
popd

# Extra package
rm -rf feeds/packages/utils/syncthing
rm -rf feeds/luci/applications/luci-app-diskman
mkdir package/lc-sub
pushd package/lc-sub
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/gowebdav
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/utils/filebrowser
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/utils/syncthing
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-diskman
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-filebrowser
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-gowebdav
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-syncthing
popd

# Theme
rm -rf feeds/luci/themes/luci-theme-material
rm -rf feeds/luci/themes/luci-theme-argon
pushd package/lc-sub
git clone https://github.com/jerrykuku/luci-app-argon-config.git
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
git clone -b 18.06 https://github.com/kiddin9/luci-theme-edge.git
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/themes/luci-theme-darkmatter
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/themes/luci-theme-material
popd

# Modify Menu
sed -i 's/\"services\"/\"nas\"/g' feeds/luci/applications/luci-app-aria2/luasrc/controller/*.lua
sed -i 's/\/services\//\/nas\//g' feeds/luci/applications/luci-app-aria2/luasrc/controller/*.lua
sed -i 's/\[services\]/\[nas\]/g' feeds/luci/applications/luci-app-aria2/luasrc/controller/*.lua
sed -i 's/\"services\"/\"nas\"/g' feeds/luci/applications/luci-app-aria2/luasrc/model/cbi/*.lua
sed -i 's/\/services\//\/nas\//g' feeds/luci/applications/luci-app-aria2/luasrc/model/cbi/*.lua
sed -i 's/\[services\]/\[nas\]/g' feeds/luci/applications/luci-app-aria2/luasrc/model/cbi/*.lua
sed -i 's/\"services\"/\"nas\"/g' feeds/luci/applications/luci-app-aria2/luasrc/view/aria2/*.htm
sed -i 's/\/services\//\/nas\//g' feeds/luci/applications/luci-app-aria2/luasrc/view/aria2/*.htm
sed -i 's/\[services\]/\[nas\]/g' feeds/luci/applications/luci-app-aria2/luasrc/view/aria2/*.htm
sed -i 's/\"services\"/\"nas\"/g' feeds/luci/applications/luci-app-samba4/luasrc/controller/*.lua
sed -i 's/\/services\//\/nas\//g' feeds/luci/applications/luci-app-samba4/luasrc/controller/*.lua
sed -i 's/\[services\]/\[nas\]/g' feeds/luci/applications/luci-app-samba4/luasrc/controller/*.lua
sed -i 's/\"services\"/\"nas\"/g' feeds/luci/applications/luci-app-samba4/luasrc/model/cbi/*.lua
sed -i 's/\/services\//\/nas\//g' feeds/luci/applications/luci-app-samba4/luasrc/model/cbi/*.lua
sed -i 's/\[services\]/\[nas\]/g' feeds/luci/applications/luci-app-samba4/luasrc/model/cbi/*.lua
sed -i 's/\"services\"/\"vpn\"/g' feeds/luci/applications/luci-app-frpc/luasrc/controller/*.lua
sed -i 's/\/services\//\/vpn\//g' feeds/luci/applications/luci-app-frpc/luasrc/controller/*.lua
sed -i 's/\[services\]/\[vpn\]/g' feeds/luci/applications/luci-app-frpc/luasrc/controller/*.lua
sed -i 's/\"services\"/\"vpn\"/g' feeds/luci/applications/luci-app-frpc/luasrc/model/cbi/frp/*.lua
sed -i 's/\/services\//\/vpn\//g' feeds/luci/applications/luci-app-frpc/luasrc/model/cbi/frp/*.lua
sed -i 's/\[services\]/\[vpn\]/g' feeds/luci/applications/luci-app-frpc/luasrc/model/cbi/frp/*.lua
sed -i 's/\"services\"/\"vpn\"/g' feeds/luci/applications/luci-app-frpc/luasrc/view/frp/*.htm
sed -i 's/\/services\//\/vpn\//g' feeds/luci/applications/luci-app-frpc/luasrc/view/frp/*.htm
sed -i 's/\[services\]/\[vpn\]/g' feeds/luci/applications/luci-app-frpc/luasrc/view/frp/*.htm
sed -i 's/\"services\"/\"vpn\"/g' feeds/luci/applications/luci-app-frps/luasrc/controller/*.lua
sed -i 's/\/services\//\/vpn\//g' feeds/luci/applications/luci-app-frps/luasrc/controller/*.lua
sed -i 's/\[services\]/\[vpn\]/g' feeds/luci/applications/luci-app-frps/luasrc/controller/*.lua
sed -i 's/\"services\"/\"vpn\"/g' feeds/luci/applications/luci-app-frps/luasrc/model/cbi/frps/*.lua
sed -i 's/\/services\//\/vpn\//g' feeds/luci/applications/luci-app-frps/luasrc/model/cbi/frps/*.lua
sed -i 's/\[services\]/\[vpn\]/g' feeds/luci/applications/luci-app-frps/luasrc/model/cbi/frps/*.lua
sed -i 's/\"services\"/\"vpn\"/g' feeds/luci/applications/luci-app-frps/luasrc/view/frps/*.htm
sed -i 's/\/services\//\/vpn\//g' feeds/luci/applications/luci-app-frps/luasrc/view/frps/*.htm
sed -i 's/\[services\]/\[vpn\]/g' feeds/luci/applications/luci-app-frps/luasrc/view/frps/*.htm
sed -i 's/\"services\"/\"vpn\"/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/controller/*.lua
sed -i 's/\/services\//\/vpn\//g' feeds/luci/applications/luci-app-v2ray-server/luasrc/controller/*.lua
sed -i 's/\[services\]/\[vpn\]/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/controller/*.lua
sed -i 's/\"services\"/\"vpn\"/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*/*.lua
sed -i 's/\/services\//\/vpn\//g' feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*/*.lua
sed -i 's/\[services\]/\[vpn\]/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*/*.lua
sed -i 's/\"services\"/\"vpn\"/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*.lua
sed -i 's/\/services\//\/vpn\//g' feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*.lua
sed -i 's/\[services\]/\[vpn\]/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*.lua
sed -i 's/\"services\"/\"vpn\"/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/view/v2ray_server/*.htm
sed -i 's/\/services\//\/vpn\//g' feeds/luci/applications/luci-app-v2ray-server/luasrc/view/v2ray_server/*.htm
sed -i 's/\[services\]/\[vpn\]/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/view/v2ray_server/*.htm

# Modify Makefile
find package/lc-sub -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/lc-sub -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}

# HotFix
