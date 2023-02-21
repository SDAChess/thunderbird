{
  description = "A very basic flake";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?rev=318fae87c0b61eb2eabe6d96b5824cc6e282c513";
      flake = false;
    };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        lib = pkgs.lib;
      in { defaultPackage = pkgs.thunderbird; });
}
