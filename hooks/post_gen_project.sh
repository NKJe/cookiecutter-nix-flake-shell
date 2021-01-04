#!/bin/sh

nix flake update
nix run nixpkgs#lorri -- init
