{
  config,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;

    extraPackages = with pkgs; [
      typescript-language-server
      roslyn-ls
    ];
    
    settings = {
      theme = "gruvbox";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };

    languages = {
      language-server.roslyn = {
        command = "Microsoft.CodeAnalysis.LanguageServer";
        args = ["--stdio" "--logLevel" "Information" "--extensionLogDirectory" "/tmp/roslyn"];
      };

      language = [
        {
          name = "c-sharp";
          language-servers = ["rosyln"];
        }
        
      ];
    };
  };
}
