function n-exec {
   ./node_modules/.bin/$@
}

alias ng="n-exec gulp"

alias npmLogin="npm login --registry=https://npm.dashlane.com/repository/npm-private/"

function fSig {
    cat /home/dinesh/repos/maverick/static/FormAnalyzeDatabase.en.json | jq .constraints.$1 -C | less
}

function comver {
    cat node_modules/@dashlane/communication/package.json|awk -F : '/\"version\": "[0-9.^]+"/ {printf "\033[34mCommunication version\033[0m:\033[1m" $2 "\033[0m\n" }'
    if [[ -d node_modules/@dashlane/maverick ]]; then
        cat node_modules/@dashlane/maverick/package.json|awk -F : '/\"@dashlane.communication\": "[0-9.^]+"/ {printf "\033[34mMAV Communication version\033[0m:\033[1m" $2 "\033[0m\n" }' | head -n1
        cat node_modules/@dashlane/maverick/package.json|awk -F : '/\"version\": "[0-9.^]+"/ {printf "\033[34m\tMAV version\033[0m:\033[1m" $2 "\033[0m\n" }' | head -n1
    fi
    if [[ -d node_modules/@dashlane/carbon ]]; then
        cat node_modules/@dashlane/carbon/package.json|awk -F : '/\"@dashlane.communication\": "[0-9.^]+"/ {printf "\033[34mCAR Communication version\033[0m:\033[1m" $2 "\033[0m\n" }' | head -n1
        cat node_modules/@dashlane/carbon/package.json|awk -F : '/\"version\": "[0-9.^]+"/ {printf "\033[34m\tCAR version\033[0m:\033[1m" $2 "\033[0m\n" }' | head -n1
    fi
    if [[ -d node_modules/@dashlane/leeloo ]]; then
        cat node_modules/@dashlane/leeloo/package.json|awk -F : '/\"@dashlane.communication\": "[0-9.^]+"/ {printf "\033[34mLEE Communication version\033[0m:\033[1m" $2 "\033[0m\n" }' | head -n1
        cat node_modules/@dashlane/leeloo/package.json|awk -F : '/\"version\": "[0-9.^]+"/ {printf "\033[34m\tLEE version\033[0m:\033[1m" $2 "\033[0m\n" }' | head -n1
    fi
}

function ns {
    nvim . -c ":Ag $1"
}

alias w='curl http://wttr.in/Paris'

a() {
    ag --nobreak --nonumbers --noheading . | fzf
}

alias vaultwa="vault write -field=signed_key ssh-security-signer/sign/iesysadmin  public_key=@$HOME/.ssh/id_rsa.pub > ~/.ssh/bamboo-als-vault-signed-cert.pub"
alias vaultwp="vault write -field=signed_key ssh-security-signer/sign/wpsysadmin  public_key=@$HOME/.ssh/id_rsa.pub > ~/.ssh/bamboo-wp-vault-signed-cert.pub"

gbranches() {
    git reflog | grep checkout | head | awk -F 'from ' '{ print $2 }' | awk -F' ' '{print $1}' | awk '!x[$0]++'
}

alias tldr="tldr -t base16"
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias minvim='nvim -u ~/.config/nvim/init_minimal.vim'

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

alias notifyOk="osascript -e 'display notification \"That thing you just launched is done!\" with title \"Hey you!\"'"

chunkwmhelp() {
    cat ~/.skhdrc | grep -A 5 "^#.*$1*."
}

function vimr() {
    open -a VimR.app "$@"
}

ciao () {
  nvim -p $(git status --short | awk '{print $2}'
            git show --pretty="format:" --name-only)
}

yscripts() {
    cat package.json | jq -C .scripts | grep $1
}
