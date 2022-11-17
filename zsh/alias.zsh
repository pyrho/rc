alias w='curl http://wttr.in/Paris'

gbranches() {
    git reflog | grep checkout | head | awk -F 'from ' '{ print $2 }' | awk -F' ' '{print $1}' | awk '!x[$0]++'
}

alias tldr="tldr -p linux"

alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'

alias notifyOk="osascript -e 'display notification \"That thing you just launched is done!\" with title \"Hey you!\"'"

function vimr() {
    open -a VimR.app "$@"
}

function git_current_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p'
}

function dnpm(){
    tmux rename-window $1 && npm run ${@:2}
}

# Git {{{
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcs='git checkout staging'
alias gco='git checkout'
alias gcf='git config --list'
alias gd='git diff'
alias gdca='git diff --cached'
alias gf='git fetch'
alias gl='git pull'
alias gfa='git fetch --all --prune'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glp="_git_log_prettily"
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gss='git status -s'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
# }}}
#
alias l='exa --group-directories-first -lgm'
#alias lt='l --sort=time'
alias la='l -a'
alias ls='exa -F'
alias k='kubectl'
alias kdo='kubectl --context do'
alias kmi='kubectl --context minikube'

alias ffcontstartw='docker run -d --name=firefox -p 5800:5800 --shm-size 4g -e "DISPLAY_WIDTH=3008" -e "DISPLAY_HEIGHT=1692" jlesage/firefox && open http://localhost:5800'
alias ffcontstartn='docker run -d --name=firefox -p 5800:5800 --shm-size 4g -e "DISPLAY_WIDTH=1920" -e "DISPLAY_HEIGHT=1080" jlesage/firefox && open http://localhost:5800'
alias ffcontstop='docker stop firefox && docker rm firefox'
alias sl='exa --icons -l'
alias t='todo.sh'
alias icat="kitty +kitten icat"
alias coffee="curl https://coffee.25.wf -T"
function obsess() {
    #kitty @ set-tab-title $@
    cd $(zoxide query "$@") && nvim -S Session.vim
}
function createfwd() {
    gandi forward create -d ${MAIL_EMAIL} $@@${MAIL_FWD_DOMAIN}
    echo $@@${MAIL_FWD_DOMAIN} | pbcopy
}

function klogs() {
    if [[ $1 == "staging" ]]; then
        kubectl --context do-fra1-fra1-staging -n staging logs -l app=$2 -f | fblog
    elif [[ $1 == "production" ]]; then
        kubectl --context do-fra1-production -n production logs -l app=$2 -f | fblog
    else
        echo "Unknown stage $1"
    fi;
}
# ﬦ k -n staging logs -l app=monitoring -f |fblog

function bwu(){
    export BW_SESSION=$(bw unlock --raw $1)
}

# $1: BookingID (mandatory)
# $2: Bucket (default: am-emails)
function amGetMail() {
    ___bookingId=$1
    ___bucket=${2:-am-emails}
    ___path=`PGPASSWORD=$DO_DB_PASSWORD psql -U $DO_DB_USER -h $DO_DB_HOST -p $DO_DB_PORT -d production --set=sslmode=require --csv -A -t -c "select s3_path from bookings.bookings where id = $___bookingId;"`

    cat /home/pyrho/buckets/$___bucket/$___path/mail.json | jq --raw-output '.["body-html"]' > /tmp/`echo $___path | tr '/' '_'`.html && firefox /tmp/`echo $___path | tr '/' '_'`.html
}
alias xcd='cd "$(xplr --print-pwd-as-result)"'
