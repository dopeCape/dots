# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{lib, config, pkgs,inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
     inputs.spicetify-nix.nixosModules.default
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnsupportedSystem = true;


  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };
  programs.spicetify =
   let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
   in
   {
     enable = true;
     enabledExtensions = with spicePkgs.extensions; [
       adblock
       hidePodcasts
       shuffle # shuffle+ (special characters are sanitized out of extension names)
     ];
     theme = spicePkgs.themes.catppuccin;
     colorScheme = "mocha";
   };

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
    videoDrivers = ["nvidia"];
  };
    # vm 
    virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];


services.gnome.gnome-keyring.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;
security.pam.services.swaylock = {};
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
programs.nix-ld.libraries = [];
programs.xfconf.enable = true;
programs.zsh={
enable = true;
enableSyntaxHighlighting = true;
};
  users.users.baby = {
    isNormalUser = true;
    description = "tejes";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell  = pkgs.zsh;
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
        ];
  };

programs.java.enable = true; 
programs.steam = {
enable = true;
remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remoteplay
dedicatedServer.openFirewall = true; # Open ports in the firewall for steam server
};
programs.zsh.autosuggestions.enable =  true;


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


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file lulocations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of tlehe first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?  


hardware.bluetooth.enable = true;
hardware.bluetooth.powerOnBoot = false;
services.blueman.enable = true;
nixpkgs.config.allowUnfree = true;

nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

#hyprland

programs.hyprland = {
  enable = true;
  xwayland.enable = true;
};

environment.sessionVariables = {
  WLR_NO_HARDWARE_CURSORS = "1";
  NIXOS_OZONE_WL = "1";
};


#starship
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Optionally, set the environment variable


boot.kernelParams = [ "acpi_rev_override" ];

  # This will save you money and possibly your life!

hardware = {
    opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME=iHD
    ];


    };
   nvidia = {
prime = {
offload.enable = true;
intelBusId = "PCI:0:2:0";

    # Bus ID of the NVIDIA GPU.
    nvidiaBusId = "PCI:1:0:0";

                # amdgpuBusId = "PCI:54:0:0"; For AMD GPU
	};


    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = true;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

};

#fonts
fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
];


}

