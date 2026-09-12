{ config, pkgs, ...}:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "gruvbox";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };

    languages = {
      language-server.typescript-language-server = {
        command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
        args = [ "--stdio" ];
      };

      language = [
        {
          name = "javascript";
          language-servers = [ "typescript-language-server" ];
        }
        {
          name = "typescript";
          language-servers = [ "typescript-language-server" ];
        }
        {
          name = "jsx";
          language-servers = [ "typescript-language-server" ];
        }
        {
          name = "tsx";
          language-servers = [ "typescript-language-server" ];
        }
      ];
    };
  };
}
