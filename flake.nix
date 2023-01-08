{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    rust-overlay,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          rust-overlay.overlays.default
        ];
      };

      toolchain = pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.minimal);
    in {
      devShells.default = pkgs.mkShell {
        name = "cargo-expand.nvim";
        buildInputs = [pkgs.cargo-expand toolchain];
      };
    });
}
