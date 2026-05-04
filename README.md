# mynix

My NixOS config. Uses [flake-parts](https://flake.parts/) to glue everything together. Everything\* in here is a flake.

\*With a few exceptions.

NOTE FOR READERS: If you are going through this code on anywhere but the repo on [Codeberg](https://codeberg.org/XDuskAshes/mynix), then you are reading a mirror of the repository that is kept a bit behind, as this is a more personal thing.

Oh yeah and specifics I guess?

Flake inputs:
- Nixpkgs unstable
- `flake-parts` (duh)
- `import-tree`
- `wrapper-modules` (I plan to use this eventually)
- `home-manager`
- `spicetify-nix`

Main machine:
- Cassandra `modules/hosts/cassandra`
- And more to come...
