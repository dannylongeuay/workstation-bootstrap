if status is-interactive
    starship init fish | source
    source ~/.asdf/asdf.fish
    doctl completion fish | source
    export EDITOR=vim
    alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v (pwd):/aws -E AWS_PROFILE amazon/aws-cli'
    abbr --add --global gs git status
    abbr --add --global gc git commit -m
    abbr --add --global gp git push
    abbr --add --global gd "git difftool --cached"
    abbr --add --global gl "git log --oneline"
    abbr --add --global ga git add -A
    abbr --add --global g git
    abbr --add --global ka kubectl get all -A
    abbr --add --global k kubectl
end
