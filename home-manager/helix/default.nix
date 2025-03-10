{ config, lib, pkgs, helix }: 

{
  programs.helix = {
    enable = true;
    package = helix.packages.${pkgs.system}.default;
    settings = {
      theme = "tokyonight_storm";
      # icons = "nerdfonts"; 
      editor = {
        line-number = "relative";
        cursorline = true;
        scrolloff = 5;
        color-modes = true;
        idle-timeout = 1;
        true-color = true;
        rainbow-brackets = true;
        bufferline = "always";
        rulers = [ 100 ];
        popup-border = "all";
        soft-wrap.enable = true;
        completion-replace = true;
        cursor-word = true;

        sticky-context = {
          enable = true;
          indicator = false;
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
        
        whitespace.render = "all";
        whitespace.characters = {
          space = "·";
          nbsp = "⍽";
          tab = "→";
          newline = "⤶";
        };

        gutters = [ "diagnostics" "line-numbers" "spacer" "diff"];
        statusline = {
          separator = "of";
          left = [ "mode" "selections" "file-type" "register" "spinner" "diagnostics" ];
          center = [ "file-name" ];
          right = [ "file-encoding" "file-line-ending" "position-percentage" "spacer" "separator" "total-line-numbers" ];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
        indent-guides = {
          render = true;
          rainbow-option = "normal";
        };
      };
    };
  }; 
}
