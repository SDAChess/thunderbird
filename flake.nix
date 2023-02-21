{
  description = "A very basic flake";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?rev=3cdefadeaf6bfbb6b52ee7798152b492c263d311";
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
