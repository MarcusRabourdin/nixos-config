{config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    
    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -lh --color=auto";
      la = "ls -lAh --color=auto";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "gfrep --color=auto";
      
      granite = "./llama cli -hf NikolayKozloff/granite-4.0-h-350m-Q8_0-GGUF:Q8_0";
      nomic = "./llama-embedding -hf keisuke-miyako/nomic-embed-text-v1.5-gguf-q8_0:Q8_0";
    };

    initContent = ''
      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

      export LESS_TERMCAP_mb=$'\e[1;32m'
      export LESS_TERMCAP_md=$'\e[1;34m'
      export LESS_TERMCAP_me=$'\e[0m'
      export LESS_TERMCAP_se=$'\e[0m'
      export LESS_TERMCAP_so=$'\e[1;44;33m'
      export LESS_TERMCAP_ue=$'\e[0m'
      export LESS_TERMCAP_us=$'\e[1;36m'

      nrs() {
        cd /etc/nixos &&
        sudo git add -A &&
        sudo git commit -m "auto: $(date +%Y-%m-%d_%H:%M:%S)" --allow-empty;
        sudo nixos-rebuild switch --flake .
        }
      '';
  };

}
