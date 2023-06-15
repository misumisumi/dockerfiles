{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      fhs = pkgs.buildFHSUserEnv {
        name = "fhs-shell";
        targetPkgs = pkgs:
          with pkgs;
          with pkgs.python39Packages; [
            zsh
            python39
            pip
            cudatookit_11
            portaudio
          ];
        extraBuildCommands = ''
          python -m venv .venv
          source .venv/bin/activate
          # pip install ./requirements.txt
        '';
        runScript = ''
          zsh
          source .venv/bin/activate
          which pip
        '';
      };
    in {
      devShells.default = fhs.env;
    });
}