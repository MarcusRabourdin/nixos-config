{config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    
    shellAliases = {
      # ls/tree
      ls = "eza";
      ll = "eza -la";
      tree = "eza --tree";

      # grep
      grep = "grep --color=auto";

      # local IA
      granite = "./llama cli -hf NikolayKozloff/granite-4.0-h-350m-Q8_0-GGUF:Q8_0";
      nomic = "./llama-embedding -hf keisuke-miyako/nomic-embed-text-v1.5-gguf-q8_0:Q8_0";

      # nixos rebuild switch + git push
      nrs = ''cd /etc/nixos && sudo nixos-rebuild switch --flake .#main-nixos && git add -A && git commit -m "nrs: $(date +%Y-%m-%d_%H:%M:%S)" --allow-empty && git push'';

      # git shortcut
      gs = "git status";
      ga = "git add";
      gm = "git commit -m";
      gp = "git push";
      gpu = "git push -u origin";
      test = "print test";

      # other
      py = "python3";
      mkcd = ". mkdc";
    };

    initContent = ''
      
      autoload -Uz vcs_info
      precmd() { vcs_info }
      zstyle ':vcs_info:git:*' formats ' (%b)'
      setopt PROMPT_SUBST
      # PROMPT='%F{cyan}%n@%m%f:%F{blue}%~%f%F{yellow}$vcs_info_msg_0_%f %# '
      PROMPT='%F{cyan}%n:%F{blue}%2~%F{yellow}$vcs_info_msg_0_%f%# '
      
      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
      export LESS_TERMCAP_mb=$'\e[1;32m'
      export LESS_TERMCAP_md=$'\e[1;34m'
      export LESS_TERMCAP_me=$'\e[0m'
      export LESS_TERMCAP_se=$'\e[0m'
      export LESS_TERMCAP_so=$'\e[1;44;33m'
      export LESS_TERMCAP_ue=$'\e[0m'
      export LESS_TERMCAP_us=$'\e[1;36m'
     '';
  };

}
