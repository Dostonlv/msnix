{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions =
      with pkgs.vscode-extensions;
      [
        pkief.material-icon-theme
        bbenoist.nix
        eamodio.gitlens
        rust-lang.rust-analyzer
        mkhl.direnv
        shd101wyy.markdown-preview-enhanced
        tamasfe.even-better-toml
        jnoortheen.nix-ide
        # vim mode
        vscodevim.vim
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "wit-idl";
          publisher = "BytecodeAlliance";
          version = "0.3.33";
          sha256 = "sha256-+zmf8wODLAI3zSHtzBFB4xTNPJkkvvOUPtkPxfLo7rI=";
        }
      ];

    userSettings = {

      "[rust]" = {
        "editor.defaultFormatter" = "rust-lang.rust-analyzer";
      };

      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };

      "nix.formatterPath" = "nixfmt";
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 0;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" = "Default Dark Modern";
      "editor.fontSize" = 14;
      "editor.formatOnSave" = true;
      "nix.enableLanguageServer" = true;

     # vim mode 
      "vim.easymotion" = true;
      "vim.incsearch" = true;
      "vim.useSystemClipboard" = true;
      "vim.useCtrlKeys" = true;
      "vim.hlsearch" = true;
      "vim.leader" = "<space>";
      "vim.normalModeKeyBindings" = [
        {
          "before" = [
            "leader"
            "w"
          ];
          "commands" = [
            "workbench.action.files.save"
          ];
        }

        {
          "before" = [
            "leader"
            "o"
          ];
          "commands" = [
            "workbench.view.explorer"
          ];
        }

        {
          "before" = [
            "leader"
            "t"
          ];
          "commands" = [
            "workbench.action.terminal.toggleTerminal"
          ];
        }

        {
          "before" = [
            "leader"
            "k"
          ];
          "commands" = [
            "editor.action.showHover"
          ];
        }

        {
          "before" = [
            "leader"
            "/"
          ];
          "commands" = [
            "editor.action.commentLine"
          ];
        }
      ];
      "vim.insertModeKeyBindings" = [
        {
          "before" = [
            "j"
            "j"
          ];
          "after" = [ "<Esc>" ];
        }
      ];
      "vim.handleKeys" = {
        "<C-a>" = false;
        "<C-f>" = false;
        "<C-c>" = false;
        "<C-v>" = false;
        "<C-w>" = false;
        "<C-x>" = false;
      };

    };
  };

}
