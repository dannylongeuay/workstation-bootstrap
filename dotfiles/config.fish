if status is-interactive
    starship init fish | source
    source ~/.asdf/asdf.fish
    doctl completion fish | source
    export EDITOR=vim
    alias daws='docker run --rm -it -v ~/.aws:/root/.aws -v (pwd):/aws -e AWS_PROFILE amazon/aws-cli'
    abbr --add --global gs git status
    abbr --add --global gc git checkout
    abbr --add --global gcb git checkout -b
    abbr --add --global gpl git pull
    abbr --add --global gpu git push
    abbr --add --global gd git diff HEAD
    abbr --add --global gl "git log --oneline"
    abbr --add --global ga git add -A
    abbr --add --global g git
    abbr --add --global ka kubectl get all -A
    abbr --add --global k kubectl
    abbr --add --global tl "tree | less"
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

function kconf
    if test $argv
        aws eks update-kubeconfig --name $argv --region us-west-2
        export KUBE_CLUSTER_CONTEXT=$argv
    else
        echo "Specifiy the cluster name! i.e. 'kconf infra-prod-usw2-a'"
    end
end