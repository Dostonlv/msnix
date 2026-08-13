{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      export GOPATH=$HOME/go
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "history"
        "rust"
      ];
    };
    shellAliases = {
      reload = "sudo nixos-rebuild switch --flake ";
      garbage = "sudo nix-collect-garbage --delete-old";
      nihh = "code ~/nix";
      dev = "cd ~/Developer";
    };
  };

  home.shellAliases = {
    # add shell nix
    # k = "kubectl";
  };
}
