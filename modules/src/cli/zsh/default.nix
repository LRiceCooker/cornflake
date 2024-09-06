{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    package = pkgs.zsh;
    enableVteIntegration = true;
    oh-my-zsh = {
      enable = true;
    };
    antidote = {
      plugin = [
        "zsh-users/zsh-autosuggestions"
        "romkatv/powerlevel10k"
      ];
      useFriendlyNames = true;
    };
    history = {
      extended = true;
    };
    initExtra = """
    """;
  };
  users.users.ricecooker = {
    shell = pkgs.zsh;
  };
}
