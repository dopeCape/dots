{ pkgs, inputs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  virtualisation.docker.enable = true;
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    #videoDrivers = ["nvidia"];
  };
  # vm 
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];


  services.gnome.gnome-keyring.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;
  security.pam.services.swaylock = { };
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

  programs.thunar.enable = true;
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [ ];
  programs.xfconf.enable = true;
  programs.zsh = {
    enable = true;
    enableSyntaxHighlighting = true;
  };
  users.users.baby = {
    isNormalUser = true;
    description = "tejas";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      brillo
      himalaya
      firefox
      cloc
      tt
      browsh
      pipenv
      wine64
      ranger
      tribler
      spotify
      playwright-driver.browsers
      insomnia
      docker
      grim
      slurp
      jq
      kate
      kitty
      nodejs
      slack
      thunderbird
      google-chrome
      brave
      gh
      unzip
      ollama
      libsForQt5.qtstyleplugin-kvantum
      starship
      tmux
      tmuxifier
      sysbench
      swww
      glxinfo
      lshw
      bottom
      starship
      xclip
      libreoffice-qt6-still
      zsh-completions
      zsh-powerlevel10k
      zsh-syntax-highlighting
      zsh-history-substring-search
      wl-clipboard
      btop
      iw
      mongodb-compass
      obs-studio
      wofi
      gnumake
      cmake
      fzf
      ripgrep
      neofetch
      swaylock
      vlc
      deno
      obsidian
      ventoy
      tor
      tor-browser-bundle-bin
      warp-terminal
      ntfs3g
      zig_0_12
      bruno
      mpv-unwrapped
      luajitPackages.luarocks_bootstrap
      lua
      neomutt
      lazygit
      ueberzugpp
      termite
      peaclock
      slack-term
      pyprland
      helix
      mononoki
      gcalcli
      feh
      zathura
      khard
      w3m
      spotify-player
      bluetui
      monaspace
      yadm
      sassc
      gtk-engine-murrine
      tesseract4
      leptonica
      hyprshot
      gImageReader
      ventoy
      cascadia-code
    ];
  };

  programs.java.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remoteplay
    dedicatedServer.openFirewall = true; # Open ports in the firewall for steam server
  };
  programs.zsh.autosuggestions.enable = true;


  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    waybar
    dunst
    bun
    openssl
    libnotify
    python3
    node2nix
    clang
    gcc
    pinentry-curses
    glib
    nss
    nspr
    at-spi2-core
    cups
    libdrm
    dbus
    pulseaudio

    xorg.libX11
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXrandr
    mesa
    ffmpeg
    expat
    xorg.libxcb
    libxkbcommon
    pango
    cairo
    alsa-lib
    ksshaskpass
    wlr-randr
    p7zip
    yarn
    rustup
    glib
    cargo
    rust-analyzer
    woeusb-ng
    go
    stdenv.cc.cc.lib
    python312Packages.pip
    inputs.zen-browser.packages."${system}".default # beta
    opencv4WithoutCuda
  ];
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

}
