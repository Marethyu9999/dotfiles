# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  arball = fetchTarball
    "https://github.com/NixOS/nixpkgs-channels/archive/nixos-tar.gz";
in {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # include home-manager
    #<home-manager/nixos>
    # Include Doom Emacs
    #./emacs.nix
  ];

  # Bootloader.
  boot.initrd.systemd.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-5d9c9c85-071c-45f5-8da6-8141b1620366".device =
    "/dev/disk/by-uuid/5d9c9c85-071c-45f5-8da6-8141b1620366";
  boot.initrd.luks.devices."luks-5d9c9c85-071c-45f5-8da6-8141b1620366".keyFile =
    "/crypto_keyfile.bin";

  networking.hostName = "nixoslaptop-erik"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Enable networking
  networking.networkmanager.enable = true;

  # Experimental settings
  nix.extraOptions = "experimental-features = nix-command flakes";

  # pcscd daemon
  # services.pcscd.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ALL = "de_DE.UTF-8";
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  fonts.packages = [ pkgs.font-awesome ];
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.libinput.enable = true;
  programs.xwayland.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable hyprland WM
  programs.hyprland.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
    xkbOptions = "compose:rstr";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
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
  programs.fish.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.erik = {
    isNormalUser = true;
    description = "erik";
    extraGroups = [ "networkmanager" "wheel" "uinput" "libvirtd" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      firefox
      kate
      ansible
      openttd
      cloudflared
      emacs29-nox
      weylus
      tmux
      docker
      docker-compose
      distrobox
      ntfy-sh
    ];
  };

  services.emacs = {
    enable = true;
    install = true;
  };

  environment.variables = { LIBVIRT_DEFAULT_URI = "qemu:///system"; };

  programs.weylus.enable = true;

  # docker config
  virtualisation.docker = { enable = true; };

  # tmux config
  programs.tmux = {
    enable = true;
    clock24 = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Languagetool
  services.languagetool = {
    enable = true;
    allowOrigin = "*";
    public = true;
  };

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    languagetool
    yubico-pam
    opensc
    # nixd
    libmicrodns
    protobuf
    avahi
    libvdpau
    libva
    nil
    comma
    freerdp
    busybox
    spice
    spice-gtk
    hyprland
    xdg-desktop-portal-hyprland
    pueue
    wofi
    #pcsc-cyberjack
    #pcsclite
    #texlive.combined.scheme-medium
    #(python38.withPackages(ps: with ps; [jupyter]))
    #  wget
  ];

  hardware.gpgSmartcards.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  services.udev.packages = [ pkgs.yubikey-personalization ];
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable libvirtd
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true; # as virt-manager apparently needs it
  virtualisation.libvirtd.onBoot = "start";
  virtualisation.spiceUSBRedirection.enable = true;

  # Enabling my yubikey for PAM using u2f
  #security.pam.yubico = {
  #enable = true;
  #	debug = true;
  #	mode = "challenge-response";
  #	control = "required";
  #};

  programs.kdeconnect.enable = true;
  programs.steam.enable = true;
  services.avahi.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}

