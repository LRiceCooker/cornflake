{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extentions = with pkgs.vscode-extensions; [
        guilhermerodz.omni-owl
        yzhang.markdown-all-in-one
        codeium.codeium
        tabnine.tabnine-vscode
        yoavbls.pretty-ts-errors
        ms-vscode.vscode-typescript-next
        jakebecker.elixir-ls
        orta.vscode-jest
        rust-lang.rust-analyzer
        shd101wyy.markdown-preview-enhanced
        yandeu.five-server
        esbenp.prettier-vscode
        eamodio.gitlens
        streetsidesoftware.code-spell-checker
        vscode-icons-team.vscode-icons
        luke-zhang-04.processing-vscode
        eww-yuck.yuck
        foxundermoon.shell-format
        dcasella.i3
    ];
    userSettings = builtins.readFile ./user.json;
  };
}
