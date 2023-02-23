let
  nixpkgs_21_11 = (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/eabc38219184cc3e04a974fe31857d8e0eac098d.tar.gz";
    sha256 = "sha256:04ffwp2gzq0hhz7siskw6qh9ys8ragp7285vi1zh8xjksxn1msc5";
  });
  nixpkgs_22_11 = (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/750db5f5a8de9cff17c3907f7e4d78e0b9157976.tar.gz";
    sha256 = "sha256:1y9g61df2f6gvwqiy1qjkvcd439flm74sb6lp4vw8a5acwdblhl9";
  });

  pkgs_21_11 = import (nixpkgs_21_11) {};
  pkgs_22_11 = import (nixpkgs_22_11) {};
in pkgs_21_11.mkShell {
  buildInputs = with pkgs_22_11; [ openssl ];
  nativeBuildInputs = with pkgs_22_11; [ cargo pkg-config ];
}
