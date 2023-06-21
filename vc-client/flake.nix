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
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          pulseaudio = true;
        };
      };
      fhs = pkgs.buildFHSUserEnv {
        name = "fhs-shell";
        targetPkgs = pkgs:
          with pkgs;
          with pkgs.python310Packages; [
            python310
            gcc
            cmake
            pip
            cudatoolkit_11
            portaudio
          ];
        runScript = "zsh";
      };
    in {
      devShells.default = fhs.env;
    });
}