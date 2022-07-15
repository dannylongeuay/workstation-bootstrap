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
  abbr --add --global el exa -lh
  abbr --add --global ela exa -lha
  abbr --add --global elt exa -lhT
  abbr --add --global et exa -T
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
  abbr --add --global nv nvim
  abbr --add --global tl "tree | less"
  abbr --add --global tmd "tmux new -s dev"
  abbr --add --global tma tmux a
  abbr --add --global xc "xclip -selection clipboard"
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
    echo "One argument expected, 'aws_sso_login <profile>'"
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
    echo "One argument expected, 'aws_sso_login <profile>'"
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
  if test (count $argv) -eq 1
    export KUBE_CLUSTER_CONTEXT=$argv
    kubectl config use-context $argv
  else
    echo "One argument expected, 'kprof <profile>'"
  end
end

function fish_title
  set -q argv[1]; or set argv fish
  echo (basename (prompt_pwd)) \| $argv;
end

