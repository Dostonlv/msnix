{ pkgs, inputs, ... }: {
  # TODO: refactor the file      ISSUE: accounts-daemon.service taking too long to rebuild the system
  programs.firefox = {
    enable = true;
    # package = pkgs.floorp-bin;
    profiles.kisuke = {
      id = 0;
      name = "Default";
      settings = {
        "extensions.autoDisableScopes" = 0;
      };
      extensions = {
        force = true;
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          sidebery
          material-icons-for-github
        ];
        settings = {
          "uBlock0@raymondhill.net".settings = {
            selectedFilterLists = [
              "ublock-filters"
              "ublock-badware"
              "ublock-privacy"
              "ublock-unbreak"
              "ublock-quick-fixes"
            ];
          };
        };
      };
    };
  };
}