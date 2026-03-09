{ config, pkgs, inputs, lib, ...}: 
let
mkNiriService = { desc, exec, package }: {
  Unit = {
    Description = desc;
    After = [ "graphical-session.target" ];
    # PartOf = [ "niri.service" ];
  };
  Service = {
    ExecStart = "${package}${exec}";
    Restart = "on-failure";
    Slice = "session.slice";
  };
  Install.WantedBy = [ "niri.service" ];
};
in
{
  imports = [
  ];

  home.username = "gaugusto";
  home.homeDirectory = "/home/gaugusto";
  home.stateVersion = "25.11";


# programs.bash = {
#   enable = true;
#
#   shellAliases = {
#     btw = "echo I use Niri btw";
#     rebuild-s = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#niri-btw";
#     rebuild-b = "sudo nixos-rebuild boot --flake ~/nixos-dotfiles#niri-btw";
#   };
# };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      btw = "echo I use Niri btw";
      nrs = "sudo nixos-rebuild switch --impure --flake ~/niri-waybar/nix#niri-btw";
      nrb = "sudo nixos-rebuild boot --impure --flake ~/niri-waybar/nix#niri-btw";
    };

  #   oh-my-zsh = {
  #     enable = true;
  #     plugins = [ 
  #       "git" 
  #       "sudo" 
  #       "command-not-found" 
  #     ];
  #     theme = "robbyrussell"; 
  #   };
  };

  services.polkit-gnome.enable = true;
  services.cliphist = {
    enable = true;
    allowImages = true; # Opcional: permite salvar imagens no histórico
  };
  systemd.user.services = {

    swww = mkNiriService {
      desc = "Swww wallpaper daemon";
      package = pkgs.swww;
      exec = "/bin/swww-daemon";
    };

    wlsunset = mkNiriService {
      desc = "Day/night gamma adjuster";
      package = pkgs.wlsunset;
      exec = "/bin/wlsunset -l -23.5 -L -46.6"; # Exemplo: São Paulo
    };

    swayosd = mkNiriService {
      desc = "SwayOSD display daemon";
      package = pkgs.swayosd;
      exec = "/bin/swayosd-server";
    };

    swayidle = mkNiriService {
      desc = "Idle management daemon";
      package = pkgs.swayidle;
      # exec = "/bin/swayidle -w timeout 300 '${pkgs.swaylock}/bin/swaylock -f' timeout 600 'niri msg action power-off-monitors' resume 'niri msg action power-on-monitors'";
      exec = "/bin/swayidle -w timeout 300 '%h/.local/bin/swaylock.sh -f' timeout 600 'niri msg action power-off-monitors' resume 'niri msg action power-on-monitors'";
    };
  };

  home.file.".config/niri".source = ../niri/.config/niri;
  home.file.".config/alacritty".source = ../alacritty/.config/alacritty;
  home.file.".config/color-themes".source = ../color-themes/.config/color-themes;
  home.file.".config/waybar".source = ../waybar/.config/waybar;
  home.file.".config/swaync".source = ../swaync/.config/swaync;
  home.file.".config/rofi".source = ../rofi/.config/rofi;
  home.file.".local/share/rofi/themes".source = ../rofi/.local/share/rofi/themes;
  home.file.".config/nvim".source = ../nvim/.config/nvim;
  home.file.".local/bin".source = ../scripts/.local/bin;
  # home.file.".config/gtk-3.0/colors.css".source = ../gtk/.config/gtk-3.0/colors.css;
  # home.file.".config/gtk-3.0/gtk.css".source = ../gtk/.config/gtk-3.0/gtk.css;
  # home.file.".config/gtk-3.0/settings.ini".source = ../gtk/.config/gtk-3.0/settings.ini;
  home.file.".config/gtk-4.0/colors.css".source = ../gtk/.config/gtk-4.0/colors.css;
  home.file.".config/gtk-4.0/gtk.css".source = ../gtk/.config/gtk-4.0/gtk.css;
  home.file.".config/fontconfig/conf.d/99-default-font.conf".source = ../fontconfig/.config/fontconfig/conf.d/99-default-fonts.conf;
  # home.file.".zshrc".source = ./configs/zshrc;
  home.file.".gitconfig".source = ../git/.gitconfig;


  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
      size = 24;
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "catppuccin-mocha-dark-cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
  };


  home.packages = with pkgs; [
    lazygit
  ];
}


