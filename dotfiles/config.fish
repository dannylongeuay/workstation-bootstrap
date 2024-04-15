if status is-interactive
    starship init fish | source
    source ~/.asdf/asdf.fish
    source ~/.asdf/plugins/java/set-java-home.fish
    doctl completion fish | source
    zoxide init fish | source
    export EDITOR=hx
    alias daws='docker run --rm -it -v ~/.aws:/root/.aws -v (pwd):/aws -e AWS_PROFILE amazon/aws-cli'
    alias psource="source (poetry env list --full-path | grep Activated | cut -d' ' -f1)/bin/activate.fish"
    abbr --add --global awsso aws_sso_login
    abbr --add --global cf create_file
    abbr --add --global el eza -lh
    abbr --add --global ela eza -lha
    abbr --add --global elt eza -lhT
    abbr --add --global et eza -T
    abbr --add --global ga git add -A
    abbr --add --global gap git add -p
    abbr --add --global gb git branch
    abbr --add --global gbd git branch -d
    abbr --add --global gbD git branch -D
    abbr --add --global gc git checkout
    abbr --add --global gcb git checkout -b
    abbr --add --global gd git diff
    abbr --add --global gdh git diff HEAD
    abbr --add --global gds "git diff --staged"
    abbr --add --global gl glab
    abbr --add --global glo "git log --oneline"
    abbr --add --global gm git merge
    abbr --add --global gmc "git merge --continue"
    abbr --add --global gpl git pull
    abbr --add --global gpu git push
    abbr --add --global gs git status
    abbr --add --global g git
    abbr --add --global ka kubectl get all -A
    abbr --add --global k kubectl
    abbr --add --global tl "tree | less"
    abbr --add --global tmd "tmux new -s dev"
    abbr --add --global tma tmux a
    abbr --add --global xc "xclip -selection clipboard"
    abbr --add --global zj zellij
    abbr --add --global zjc "zellij -l compact"
    abbr --add --global zjnc "zellij action new-tab -l compact"
    abbr --add --global zjnd "zellij action new-tab -l default"
    abbr --add --global zz "z -"
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.cargo/bin
end

function show_path
    for item in $PATH
        echo $item
    end
end

function create_file
    if test (count $argv) -eq 1
        mkdir -p (dirname $argv) && touch $argv
    else
        echo "One argument expected, 'create_file <path>'"
    end
end

function aprof
    if test (count $argv) -eq 1
        export AWS_PROFILE=$argv
    else
        echo "One argument expected, 'aprof <account_profile>'"
    end
end

function aws_azure_login
    if test (count $argv) -gt 1
        echo "One or zero argument(s) expected, 'aws_azure_login [<profile>]'"
    else if test (count $argv) -eq 1
        docker run --rm -it -v ~/.aws:/root/.aws sportradar/aws-azure-login --profile=$argv --no-prompt
        export AWS_PROFILE=$argv
    else
        docker run --rm -it -v ~/.aws:/root/.aws sportradar/aws-azure-login
        export AWS_PROFILE=default
    end
end

function aws_sso_login
    if test (count $argv) -eq 1
        export AWS_PROFILE=sso
        aws sso login
        export AWS_PROFILE=$argv
    else
        echo "One argument expected, 'aws_sso_login <account_profile>'"
    end
end

function klist
    if test (count $argv) -eq 1
        aws eks list-clusters --region $argv
    else
        echo "One argument expected, 'klist <region>'"
    end
end

function kconf
    if test (count $argv) -eq 2
        aws eks update-kubeconfig --name $argv[1] --region $argv[2]
        export KUBE_CLUSTER_CONTEXT=$argv[1]
    else
        echo "Two arguments expected, 'kconf <name> <region>'"
    end
end

function kprof
    if test (count $argv) -ne 1
        echo "One argument expected, 'kprof <profile>'"
        return
    end
    set match (kubectl config get-contexts -o name | grep $argv[1])
    if test (count $match) -ne 1
        if test (count $match) -eq 0
            echo "No profiles matched argument."
        else
            echo "Multiple profiles matched argument. Try again with a more specific profile name."
        end
        return
    end
    set friendly_name (string split '/' $match)
    export KUBE_CLUSTER_CONTEXT=$friendly_name[-1]
    kubectl config use-context $match
end

function fish_title
    set -l title
    set -q argv[1]; or set argv fish
    set title (basename (prompt_pwd)) \| $argv
    zellij action rename-tab "$title" >/dev/null 2>&1
    echo $title
end

function fish_greeting
    neofetch
end

function _gcm
    argparse --name=_gcm b/breaking -- $argv
    set -l breaking ""
    set -l cmd
    if set -q _flag_breaking
        set breaking '!'
    end
    switch (count $argv)
        case 4
            set cmd git commit -m "\"$argv[1]($argv[3])$breaking: $argv[2] $argv[4..-1]\""
        case 3
            set cmd git commit -m "\"$argv[1](*)$breaking: $argv[2] $argv[3..-1]\""
        case '*'
            set cmd echo "Incorrect number of arguments"
    end
    eval $cmd
end

function gfeat
    _gcm feat ":sparkles:" $argv
end
function gfix
    _gcm fix ":bug:" $argv
end
function gperf
    _gcm perf ":zap:" $argv
end
function gchore
    _gcm chore ":wrench:" $argv
end
function grefactor
    _gcm refactor ":recycle:" $argv
end
function gstyle
    _gcm style ":art:" $argv
end
function gdocs
    _gcm docs ":pencil:" $argv
end

# function fish_user_key_bindings
#     # Execute this once per mode that emacs bindings should be used in
#     fish_default_key_bindings -M insert

#     # Then execute the vi-bindings so they take precedence when there's a conflict.
#     # Without --no-erase fish_vi_key_bindings will default to
#     # resetting all bindings.
#     # The argument specifies the initial mode (insert, "default" or visual).
#     fish_vi_key_bindings --no-erase insert
# end
