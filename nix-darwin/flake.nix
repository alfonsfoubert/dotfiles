{
    description = "Zendful Darwin system flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nix-darwin.url = "github:LnL7/nix-darwin";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
        nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
        let
            configuration = { pkgs, config, ... }: {

                nixpkgs.config.allowUnfree = true;

                # List packages installed in system profile. To search by name, run:
                # $ nix-env -qaP | grep wget
                environment.systemPackages =
                    [   pkgs.abook
                        pkgs.bat
                        pkgs.btop
                        pkgs.fd
                        pkgs.ffmpeg_7-headless
                        pkgs.fzf
                        pkgs.gettext
                        pkgs.git
                        pkgs.go
                        pkgs.glow
                        pkgs.html-xml-utils
                        pkgs.isync
                        pkgs.iterm2
                        pkgs.jq
                        pkgs.khal
                        pkgs.lf
                        pkgs.mkalias
                        pkgs.mpop
                        pkgs.msmtp
                        pkgs.neomutt
                        pkgs.neovim
                        pkgs.notmuch
                        pkgs.obsidian
                        pkgs.oh-my-posh
                        pkgs.openai-whisper
                        pkgs.pandoc
                        pkgs.pass
                        pkgs.slack
                        pkgs.taskwarrior3
                        pkgs.timewarrior
                        pkgs.tldr
                        pkgs.tmux
                        pkgs.extract_url
                        pkgs.watch
                        pkgs.wget
                        pkgs.wezterm
                        pkgs.zsh
                        pkgs.yq
                        pkgs.zoom-us
                        pkgs.zoxide
                        pkgs.zsh-autosuggestions
                        pkgs.zsh-syntax-highlighting
                    ];

                homebrew = {
                    enable = true;
                    brews = [
                        "mas"
                    ];
                    casks = [
                        "hammerspoon"
                    ];
                    masApps = {
                        "Spark" = 1176895641;
                    };
                    onActivation.cleanup = "zap";
                };

                fonts.packages = [
                    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
                ];

                system.activationScripts.applications.text = let
                    env = pkgs.buildEnv {
                        name = "system-applications";
                        paths = config.environment.systemPackages;
                        pathsToLink = "/Applications";
                    };
                in
                    pkgs.lib.mkForce ''
                    # Set up applications.
                    echo "setting up /Applications..." >&2
                    rm -rf /Applications/Nix\ Apps
                    mkdir -p /Applications/Nix\ Apps
                    find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
                    while read src; do
                        app_name=$(basename "$src")
                        echo "copying $src" >&2
                        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
                    done
                    '';

                # Auto upgrade nix package and the daemon service.
                services.nix-daemon.enable = true;
                # nix.package = pkgs.nix;

                # Necessary for using flakes on this system.
                nix.settings.experimental-features = "nix-command flakes";

                # Create /etc/zshrc that loads the nix-darwin environment.
                programs.zsh.enable = true;  # default shell on catalina
                # programs.fish.enable = true;

                # Set Git commit hash for darwin-version.
                system.configurationRevision = self.rev or self.dirtyRev or null;

                # Used for backwards compatibility, please read the changelog before changing.
                # $ darwin-rebuild changelog
                system.stateVersion = 5;

                # The platform the configuration will be used on.
                nixpkgs.hostPlatform = "aarch64-darwin";
            };
        in
            {
            # Build darwin flake using:
            # $ darwin-rebuild build --flake .#seat
            darwinConfigurations."seat" = nix-darwin.lib.darwinSystem {
                modules = [
                    configuration
                    nix-homebrew.darwinModules.nix-homebrew
                    {
                        nix-homebrew = {
                            enable = true;
                            # Apple Silicon Only
                            enableRosetta = true;
                            # User owning the Homebrew prefix
                            user = "alfonsfoubert";

                            autoMigrate = true;
                        };
                    }
                ];
            };

            # Expose the package set, including overlays, for convenience.
            darwinPackages = self.darwinConfigurations."seat".pkgs;
        };
}
