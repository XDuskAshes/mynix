# mynix

My NixOS config. Uses [flake-parts](https://flake.parts/) to glue everything together. Everything\* in here is a flake.

\*With a few exceptions.

NOTE FOR GITHUB READERS: If you are reading this on [Github](https://github.com/XDuskAshes/mynix), this mrepository is a delayed mirror that can be anywhere from a few days to a whole week behind, and is scheduled to update every Monday at 12:30. If you want the latest, go to the [Codeberg repo](https://codeberg.org/XDuskAshes/mynix).

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
