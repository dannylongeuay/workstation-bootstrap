if status is-interactive
    starship init fish | source
    source ~/.asdf/asdf.fish
    doctl completion fish | source
    export EDITOR=vim
    alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v (pwd):/aws -E AWS_PROFILE amazon/aws-cli'
    abbr --add --global gs git status
    abbr --add --global gc git commit -m
    abbr --add --global gp git push
    abbr --add --global gd "git diff --cached"
    abbr --add --global gl "git log --oneline"
    abbr --add --global ga git add -A
    abbr --add --global g git
    abbr --add --global ka kubectl get all -A
    abbr --add --global k kubectl
end

function show-path
    for item in $PATH
        echo $item
    end
end

function aws_login
    if test $argv
        docker run --rm -it -v ~/.aws:/root/.aws sportradar/aws-azure-login --profile=$argv --no-prompt
        export AWS_PROFILE=$argv
    else
        docker run --rm -it -v ~/.aws:/root/.aws sportradar/aws-azure-login
        export AWS_PROFILE=default
    end
end
