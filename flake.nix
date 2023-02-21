{
  description = "A very basic flake";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?rev=e661714656aa2994b1202bae65330c54692c1ef1";
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
