#run
```shell
sudo nix run nix-darwin -- switch --flake .#kisuke --option access-tokens "github.com=$(nix run nixpkgs#github-cli auth token)"
```