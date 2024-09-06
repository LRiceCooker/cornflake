{pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkg-config
    libxcb
    libxcb-util
    libpam-dev
    libcairo-dev
    libxcb-xinerama
    libxcb-randr
    libev
    libx11-dev
    libx11-xcb-dev
    libxkbcommon
    libxkbcommon-x11
    libxcb-image
    libxcb-xrm
    webkitgtk
    gtk3
    cairo
    gdk-pixbuf
    glib
    dbus
    openssl_3
    curl
    wget
    libsoup
    librsvg
  ];
}
