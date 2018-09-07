# Remove virtual/mesa for wayland
PACKAGECONFIG_remove_rk3288 = " wayland"
PACKAGECONFIG_append_rk3288 = " wayland-rk3288"
PACKAGECONFIG[wayland-rk3288] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon wayland-native"
