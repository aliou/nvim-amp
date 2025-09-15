{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    lua-language-server
  ];

  # TODO: Define settings and constant for a nvim plugin (e.g. `unpack.*`, `vim.*`, etc.)
}
