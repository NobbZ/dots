{ config
, pkgs
, lib
, inputs
, ...
}:
let
  # my-fonts = pkgs.callPackage ./fonts/default.nix { inherit pkgs; };
  nur = inputs.nurpkgs;
  # spicetify-nix = inputs.spicetify-nix;
  # nixvim = inputs.nixvim;
  # helix = inputs.helix;
in
{
  imports = [
    (import ./bspwm.nix { inherit config lib pkgs; })
    (import ./fish.nix { inherit config lib pkgs; })
    (import ./kitty.nix { inherit config lib pkgs; })
    (import ./codium.nix { inherit config lib pkgs; })
    (import ./gtk.nix { inherit config lib pkgs; })
    (import ./polybar { inherit config lib pkgs; })
    (import ./xdg.nix { inherit config lib pkgs; })
    (import ./picom.nix { inherit config lib pkgs; })
    (import ./rofi { inherit config lib pkgs; })
    #(import ./neovim { inherit config lib pkgs nixvim; })
    (import ./neofetch { inherit config lib pkgs; })
    (import ./ncmpcpp.nix { inherit config lib pkgs; })
    (import ./firefox { inherit config lib pkgs nur; })
    (import ./zathura { inherit config lib pkgs; })
    #(import ./helix {inherit config lib pkgs helix;})
   # (import ./spicetify.nix { inherit config lib pkgs spicetify-nix; })
  ];

  home.username = "bwkam";
  home.homeDirectory = "/home/bwkam";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # term emulators
    kitty

    # shells
    fish

    # format
    nixfmt
    alejandra
    rustfmt

    # gnu
    gcc
    gdb

    # cli
    neofetch
    links2
    # helix
    pipewire
    cmatrix
    pipes
    nix-prefetch-github
    htop
    eza
    gnumeric
    ripgrep
    xorg.xkill
    xclip
    xsel
    xdotool
    git
    playerctl
    yt-dlp
    cmus
    hugo
    #wine-staging
    appimage-run
    unzip
    gradle
    cargo-watch
    gping
    openssl
    usbutils


    # languages
    python39
    rustc
    cargo
    rust-analyzer
    nodejs_20
#    jdk11
    python311Packages.pip
    zip
    clang-tools
    nil
    # flutter

    # gui
    gtk3
    gtk4
    foliate
    # hplip
    dmenu
    pavucontrol
    flameshot
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    gimp
    kdenlive
    feh
    obs-studio
    neochat
    obsidian
    grapejuice
    zoom-us
    lmms
    audacity
    gnome.simple-scan
    gnome.cheese
    rofimoji
    teams-for-linux
    #teams


    #calibre

    # fonts
    material-icons
    material-design-icons
    roboto
    work-sans
    comic-neue
    source-sans
    twemoji-color-font
    comfortaa
    inter
    lato
    lexend
    jost
    dejavu_fonts
    iosevka-bin
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    jetbrains-mono
    font-awesome_5

    (nerdfonts.override { fonts = [ "Iosevka" "JetBrainsMono" "Meslo" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # ''; 11
  };

    home.file.".config/cava/config".text = ''
      ## Configuration file for CAVA.
# Remove the ; to change parameters.


[general]

# Smoothing mode. Can be 'normal', 'scientific' or 'waves'. DEPRECATED as of 0.6.0
; mode = normal

# Accepts only non-negative values.
; framerate = 60

# 'autosens' will attempt to decrease sensitivity if the bars peak. 1 = on, 0 = off
# new as of 0.6.0 autosens of low values (dynamic range)
# 'overshoot' allows bars to overshoot (in % of terminal height) without initiating autosens. DEPRECATED as of 0.6.0
; autosens = 1
; overshoot = 20

# Manual sensitivity in %. If autosens is enabled, this will only be the initial value.
# 200 means double height. Accepts only non-negative values.
; sensitivity = 100

# The number of bars (0-512). 0 sets it to auto (fill up console).
# Bars' width and space between bars in number of characters.
; bars = 0
; bar_width = 2
; bar_spacing = 1
# bar_height is only used for output in "noritake" format
; bar_height = 32

# For SDL width and space between bars is in pixels, defaults are:
; bar_width = 20
; bar_spacing = 5

# sdl_glsl have these default values, they are only used to calulate max number of bars.
; bar_width = 1
; bar_spacing = 0


# Lower and higher cutoff frequencies for lowest and highest bars
# the bandwidth of the visualizer.
# Note: there is a minimum total bandwidth of 43Mhz x number of bars.
# Cava will automatically increase the higher cutoff if a too low band is specified.
; lower_cutoff_freq = 50
; higher_cutoff_freq = 10000


# Seconds with no input before cava goes to sleep mode. Cava will not perform FFT or drawing and
# only check for input once per second. Cava will wake up once input is detected. 0 = disable.
; sleep_timer = 0


[input]

# Audio capturing method. Possible methods are: 'pulse', 'alsa', 'fifo', 'sndio' or 'shmem'
# Defaults to 'pulse', 'pipewire', 'alsa' or 'fifo', in that order, dependent on what support cava was built with.
# On Mac it defaults to 'portaudio' or 'fifo'
# On windows this is automatic and no input settings are needed.
#
# All input methods uses the same config variable 'source'
# to define where it should get the audio.
#
# For pulseaudio and pipewire 'source' will be the source. Default: 'auto', which uses the monitor source of the default sink
# (all pulseaudio sinks(outputs) have 'monitor' sources(inputs) associated with them).
#
# For pipewire 'source' will be the object name or object.serial of the device to capture from.
# Both input and output devices are supported.
#
# For alsa 'source' will be the capture device.
# For fifo 'source' will be the path to fifo-file.
# For shmem 'source' will be /squeezelite-AA:BB:CC:DD:EE:FF where 'AA:BB:CC:DD:EE:FF' will be squeezelite's MAC address
; method = pulse
; source = auto

method = pipewire
 source = auto

; method = alsa
; source = hw:Loopback,1

; method = fifo
; source = /tmp/mpd.fifo
; sample_rate = 44100
; sample_bits = 16

; method = shmem
; source = /squeezelite-AA:BB:CC:DD:EE:FF

; method = portaudio
; source = auto


[output]

# Output method. Can be 'ncurses', 'noncurses', 'raw', 'noritake', 'sdl'
# or 'sdl_glsl'.
# 'noncurses' uses a custom framebuffer technique and prints only changes
# from frame to frame in the terminal. 'ncurses' is default if supported.
#
# 'raw' is an 8 or 16 bit (configurable via the 'bit_format' option) data
# stream of the bar heights that can be used to send to other applications.
# 'raw' defaults to 200 bars, which can be adjusted in the 'bars' option above.
#
# 'noritake' outputs a bitmap in the format expected by a Noritake VFD display
#  in graphic mode. It only support the 3000 series graphical VFDs for now.
#
# 'sdl' uses the Simple DirectMedia Layer to render in a graphical context.
# 'sdl_glsl' uses SDL to create an OpenGL context. Write your own shaders or
# use one of the predefined ones.
; method = ncurses

# Orientation of the visualization. Can be 'bottom', 'top', 'left' or 'right'.
# Default is 'bottom'. Other orientations are only supported on sdl and ncruses
# output. Note: many fonts have weird glyphs for 'top' and 'right' characters,
# which can make ncurses not look right.
; orientation = bottom

# Visual channels. Can be 'stereo' or 'mono'.
# 'stereo' mirrors both channels with low frequencies in center.
# 'mono' outputs left to right lowest to highest frequencies.
# 'mono_option' set mono to either take input from 'left', 'right' or 'average'.
# set 'reverse' to 1 to display frequencies the other way around.
; channels = stereo
; mono_option = average
; reverse = 0

# Raw output target. A fifo will be created if target does not exist.
; raw_target = /dev/stdout

# Raw data format. Can be 'binary' or 'ascii'.
; data_format = binary

# Binary bit format, can be '8bit' (0-255) or '16bit' (0-65530).
; bit_format = 16bit

# Ascii max value. In 'ascii' mode range will run from 0 to value specified here
; ascii_max_range = 1000

# Ascii delimiters. In ascii format each bar and frame is separated by a delimiters.
# Use decimal value in ascii table (i.e. 59 = ';' and 10 = '\n' (line feed)).
; bar_delimiter = 59
; frame_delimiter = 10

# sdl window size and position. -1,-1 is centered.
; sdl_width = 1000
; sdl_height = 500
; sdl_x = -1
; sdl_y= -1

# set label on bars on the x-axis. Can be 'frequency' or 'none'. Default: 'none'
# 'frequency' displays the lower cut off frequency of the bar above.
# Only supported on ncurses and noncurses output.
; xaxis = none

# enable alacritty synchronized updates. 1 = on, 0 = off
# removes flickering in alacritty terminal emulator.
# defaults to off since the behaviour in other terminal emulators is unknown
; alacritty_sync = 0

# Shaders for sdl_glsl, located in $HOME/.config/cava/shaders
; vertex_shader = pass_through.vert
; fragment_shader = bar_spectrum.frag

; for glsl output mode, keep rendering even if no audio
; continuous_rendering = 0

[color]

# Colors can be one of seven predefined: black, blue, cyan, green, magenta, red, white, yellow.
# Or defined by hex code '#xxxxxx' (hex code must be within ""). User defined colors requires
# a terminal that can change color definitions such as Gnome-terminal or rxvt.
# default is to keep current terminal color
; background = default
; foreground = default

# SDL and sdl_glsl only support hex code colors, these are the default:
; background = '#111111'
; foreground = '#33ffff'


# Gradient mode, only hex defined colors are supported,
# background must also be defined in hex or remain commented out. 1 = on, 0 = off.
# You can define as many as 8 different colors. They range from bottom to top of screen
; gradient = 0
; gradient_count = 8
; gradient_color_1 = '#59cc33'
; gradient_color_2 = '#80cc33'
; gradient_color_3 = '#a6cc33'
; gradient_color_4 = '#cccc33'
; gradient_color_5 = '#cca633'
; gradient_color_6 = '#cc8033'
; gradient_color_7 = '#cc5933'
; gradient_color_8 = '#cc3333'



[smoothing]

# Percentage value for integral smoothing. Takes values from 0 - 100.
# Higher values means smoother, but less precise. 0 to disable.
# DEPRECATED as of 0.8.0, use noise_reduction instead
; integral = 77

# Disables or enables the so-called "Monstercat smoothing" with or without "waves". Set to 0 to disable.
; monstercat = 0
; waves = 0

# Set gravity percentage for "drop off". Higher values means bars will drop faster.
# Accepts only non-negative values. 50 means half gravity, 200 means double. Set to 0 to disable "drop off".
# DEPRECATED as of 0.8.0, use noise_reduction instead
; gravity = 100


# In bar height, bars that would have been lower that this will not be drawn.
# DEPRECATED as of 0.8.0
; ignore = 0

# Noise reduction, int 0 - 100. default 77
# the raw visualization is very noisy, this factor adjusts the integral and gravity filters to keep the signal smooth
# 100 will be very slow and smooth, 0 will be fast but noisy.
; noise_reduction = 77


[eq]

# This one is tricky. You can have as much keys as you want.
# Remember to uncomment more than one key! More keys = more precision.
# Look at readme.md on github for further explanations and examples.
; 1 = 1 # bass
; 2 = 1
; 3 = 1 # midtone
; 4 = 1
; 5 = 1 # treble 

'';

  home.sessionVariables = {
    EDITOR = "nvim";
    NIX_PATH = "nixpkgs=flake:nixpkgs$\{NIX_PATH:+:$NIX_PATH}";
  };

  services = {
    playerctld.enable = true;
    betterlockscreen.enable = true;

    gnome-keyring.enable = true;

  };


  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg: true;
    };

    overlays = [ inputs.nurpkgs.overlay ];
  };

  nix.extraOptions = "experimental-features = nix-command flakes";
  # nix.package = pkgs.nix;

  # dconf
  dconf.enable = true;

  # idk why
  programs = {
    direnv = {
      enable = true;
      #enableFishIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    fish.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "bwkam";
    userEmail = "beshoykamel391@gmail.com";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
