{ config, pkgs, lib, ... }:

let
    rubyPkgs = pkgs.rubyPackages;
    solargraph = rubyPkgs.solargraph;
    rubyLsp = rubyPkgs.ruby-lsp;
in 
{
    options.dev.ruby.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable or disable Ruby development stuff.";
    };

    config = lib.mkIf config.dev.ruby.enable {
        environment.systemPackages = [
            pkgs.ruby
            pkgs.bundler
            solargraph
            rubyLsp
        ];

        environment.variables = {
            RUBY_EXEC = "${pkgs.ruby}/bin/ruby";
            SOLARGRAPH_BIN = "${solargraph}/bin/solargraph";
            RUBY_LSP_BIN = "${rubyLsp}/bin/ruby-lsp";
        };
    };
}
