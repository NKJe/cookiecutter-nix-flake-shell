{
  description = "{{ cookiecutter.project_short_description }}";
  
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/{{ cookiecutter.nixpkgs }}";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, ... }: 
      flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
{% for pkg in cookiecutter.pkgs.strip().split(' ') %}
              {{ pkg }}
{% endfor %}
            ];
          };
        }
    );
}
