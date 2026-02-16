{ config, pkgs, ... }:

let
    rubyPkgs = pkgs.rubyPackages;
    solargraph = rubyPkgs.solargraph;
    rubyLsp = rubyPkgs.ruby-lsp;

    rubyDevEnv = pkgs.stdenv.mkDerivation {
        name = "ruby-dev-env";
        buildInputs = [
            pkgs.ruby
            pkgs.bundler
            solargraph
            rubyLsp
        ];
        installPhase = ''
            mkdir -p $out/bin
            ln -s ${solargraph}/bin/solargraph $out/bin/solargraph
            ln -s ${rubyLsp}/bin/ruby-lsp $out/bin/ruby-lsp
        '';
    };
in 
{
    options.dev.ruby.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable or disable Ruby development stuff."
    };

    config = lib.mkIf config.dev.ruby.enable {
        environment.systemPackages = [
            rubyDevEnv
        ];

        environment.variables = {
            RUBY_EXEC = "${pkgs.ruby}/bin/ruby";
            SOLARGRAPH_BIN = "${solargraph}/bin/solargraph";
            RUBY_LSP_BIN = "${rubyLsp}/bin/ruby-lsp";
        };
    };
}
