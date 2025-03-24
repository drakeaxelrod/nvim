{
  description = "Neovim Config with devshell for Linting, Formatting, Testing, and Custom Tasks";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    devshell.url = "github:numtide/devshell";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = inputs@{ self, nixpkgs, ... }: let


    # # Eval the treefmt modules from ./treefmt.nix
    # treefmtEval = eachSystem (pkgs: treefmt-nix.lib.evalModule pkgs ./treefmt.nix);

    # Treefmt Setup
    # treefmtEval = eachSystem (pkgs: {
    #   projectRootFile = "flake.nix";
    # });

  in {
    # for `nix fmt`
    formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);
    # for `nix flake check`
    checks = eachSystem (pkgs: { formatting = treefmtEval.${pkgs.system}.config.build.check self; });

    # Devshell Setup
    devShells = eachSystem (pkgs: {

      default = pkgs.devshell.mkDevShell {
        name = "Neovim";
        packages = with pkgs; [
          neovim
          lua
          lua-language-server
          stylua
          tree-sitter
          ripgrep
          fzf
          bat
          fd
          git
          nodePackages.eslint
          nodePackages.prettier
          luajitPackages.luacheck
          treefmt
        ];
        env = [
          {
            name = "PROJECT_ROOT";
            eval = "$(pwd)"; # Get current directory as project root
          }
          {
            name = "EDITOR";
            value = "nvim"; # Set Neovim as the default editor
          }
          {
            name = "DEV_ENV";
            value = "true"; # Indicate that we're in a dev environment
          }
        ];
        commands = [
          {
            name = "lint";
            help = "Run lint checks on the project.";
            category = "Development";
            command = ''
              echo "Running lint checks..."
              luacheck . --config .luacheckrc
              eslint . --ext .js,.json,.yaml,.toml
            '';
          }
          {
            name = "format";
            help = "Format the code in the project.";
            category = "Development";
            command = ''
              echo "Running formatting..."
              stylua .
              prettier --write .
              nixfmt .
            '';
          }
          {
            name = "test";
            help = "Run tests in the project.";
            category = "Testing";
            command = ''
              echo "Running tests..."
              busted
            '';
          }
          {
            name = "clean";
            help = "Clean up temporary and backup files.";
            category = "Maintenance";
            command = ''
              echo "Cleaning up..."
              find . -name "*.swp" -exec rm -f {} \;
              find . -name "*.swo" -exec rm -f {} \;
              find . -name "*.bak" -exec rm -f {} \;
            '';
          }
          {
            name = "install";
            help = "Install project dependencies.";
            category = "Setup";
            command = ''
              echo "Installing dependencies..."
              nix-shell -p npm
              npm install --global eslint prettier
              echo "Dependencies installed!"
            '';
          }
          {
            name = "update";
            help = "Update Neovim configuration and tools.";
            category = "Maintenance";
            command = ''
              echo "Updating Neovim configuration and tools..."
              git pull origin main
              nix-shell --run "nix-update"
              echo "Update completed!"
            '';
          }
          {
            name = "check";
            help = "Run all linting, formatting, and testing checks.";
            category = "Development";
            command = ''
              echo "Running all checks..."
              nix-shell --run 'lint'
              nix-shell --run 'format'
              nix-shell --run 'test'
            '';
          }
          {
            name = "start";
            help = "Start Neovim.";
            category = "Editor";
            command = ''
              echo "Starting Neovim..."
              nvim
            '';
          }
        ];
      };
    });
  };
}

#     inputs.flake-utils.lib.eachDefaultSystem (system: {
#       packages.devshell = self.outputs.devShells.${system}.default;
#       # allow unbroken and unfree

#       devShells.default =
#         let
#           pkgs = import nixpkgs {
#             inherit system;
#             overlays = [ inputs.devshell.overlays.default ];
#             config = {
#               allowBroken = true;
#               allowUnfree = true;
#             };
#           };
#         in
#         pkgs.devshell.mkShell (
#           { config, ... }:
#           {
#             name = "Neovim";
#             motd = ''
#               {201}Neovim Development Shell{reset}
#               $(type -p menu &>/dev/null && menu)
#             '';
#             packages = with pkgs; [
#               neovim
#               lua
#               lua-language-server
#               stylua
#               tree-sitter
#               ripgrep
#               fzf
#               bat
#               fd
#               git
#               nodePackages.eslint
#               nodePackages.prettier
#               # haskellPackages.tomlcheck
#               luajitPackages.luacheck
#               # vimPlugins.vint
#               # nixfmt-rfc-style
#               treefmt
#             ];

#             env = [
#               {
#                 name = "PROJECT_ROOT";
#                 eval = "$(pwd)"; # Get current directory as project root
#               }
#               {
#                 name = "EDITOR";
#                 value = "nvim"; # Set Neovim as the default editor
#               }
#               {
#                 name = "DEV_ENV";
#                 value = "true"; # Indicate that we're in a dev environment
#               }
#             ];
#             commands = [
#               {
#                 name = "lint";
#                 help = "Run lint checks on the project.";
#                 category = "Development";
#                 command = ''
#                   echo "Running lint checks..."
#                   luacheck . --config .luacheckrc
#                   eslint . --ext .js,.json,.yaml,.toml
#                 '';
#               }
#               {
#                 name = "format";
#                 help = "Format the code in the project.";
#                 category = "Development";
#                 command = ''
#                   echo "Running formatting..."
#                   stylua .
#                   prettier --write .
#                   nixfmt .
#                 '';
#               }
#               {
#                 name = "test";
#                 help = "Run tests in the project.";
#                 category = "Testing";
#                 command = ''
#                   echo "Running tests..."
#                   busted
#                 '';
#               }
#               {
#                 name = "clean";
#                 help = "Clean up temporary and backup files.";
#                 category = "Maintenance";
#                 command = ''
#                   echo "Cleaning up..."
#                   find . -name "*.swp" -exec rm -f {} \;
#                   find . -name "*.swo" -exec rm -f {} \;
#                   find . -name "*.bak" -exec rm -f {} \;
#                 '';
#               }
#               {
#                 name = "install";
#                 help = "Install project dependencies.";
#                 category = "Setup";
#                 command = ''
#                   echo "Installing dependencies..."
#                   nix-shell -p npm
#                   npm install --global eslint prettier
#                   echo "Dependencies installed!"
#                 '';
#               }
#               {
#                 name = "update";
#                 help = "Update Neovim configuration and tools.";
#                 category = "Maintenance";
#                 command = ''
#                   echo "Updating Neovim configuration and tools..."
#                   git pull origin main
#                   nix-shell --run "nix-update"
#                   echo "Update completed!"
#                 '';
#               }
#               {
#                 name = "check";
#                 help = "Run all linting, formatting, and testing checks.";
#                 category = "Development";
#                 command = ''
#                   echo "Running all checks..."
#                   nix-shell --run 'lint'
#                   nix-shell --run 'format'
#                   nix-shell --run 'test'
#                 '';
#               }
#               {
#                 name = "start";
#                 help = "Start Neovim.";
#                 category = "Editor";
#                 command = ''
#                   echo "Starting Neovim..."
#                   nvim
#                 '';
#               }
#             ];
#           }
#         );
#     });
# }
