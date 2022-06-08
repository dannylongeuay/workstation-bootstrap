if status is-interactive
  starship init fish | source
  source ~/.asdf/asdf.fish
  source ~/.asdf/plugins/java/set-java-home.fish
  doctl completion fish | source
  zoxide init fish | source
  export EDITOR=hx
  alias daws='docker run --rm -it -v ~/.aws:/root/.aws -v (pwd):/aws -e AWS_PROFILE amazon/aws-cli'
  alias psource="source (poetry env list --full-path | grep Activated | cut -d' ' -f1)/bin/activate.fish"
  abbr --add --global el exa -lh
  abbr --add --global ela exa -lha
  abbr --add --global elt exa -lhT
  abbr --add --global et exa -T
  abbr --add --global ga git add -A
  abbr --add --global gb git branch
  abbr --add --global gbd git branch -d
  abbr --add --global gbD git branch -D
  abbr --add --global gc git checkout
  abbr --add --global gcb git checkout -b
  abbr --add --global gd git diff HEAD
  abbr --add --global gl "git log --oneline"
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

function fish_title
  set -q argv[1]; or set argv fish
  echo (basename (prompt_pwd)) \| $argv;
end

function fish_git_fetch --on-variable PWD
  if test -d ./.git/
    echo "Fetching origin..."
    git fetch -v
  end
end
