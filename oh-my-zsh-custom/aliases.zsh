function n-exec {
   ./node_modules/.bin/$@
}

maverickDir=~/repos/maverick
josephDir=~/repos/joseph
extensionDir=~/repos/extension
communicationDir=~/repos/communication
webUIDir=~/repos/webui

alias dm="cd $maverickDir"
alias de="cd $extensionDir"
alias dj="cd $josephDir"
alias dw="cd $webUIDir"

alias ng="n-exec gulp"


alias editFormsTests="nvim ~/repos/learning/CppData/applicationData/Learning/Forms/UnitTests/loadOnly/listOfTests.xml"

alias updateMav="npm install ../maverick && npm run chrome:webpack"

alias npmLogin="npm login --registry=https://npm.dashlane.com/repository/npm-private/"

function fSig {
    cat /home/dinesh/repos/maverick/static/FormAnalyzeDatabase.en.json | jq .constraints.$1 -C | less
}

alias n="nvim"

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

alias installMav="npm install ~/repos/maverick"
alias installCom="npm install ~/repos/communication"
alias w='curl http://wttr.in/Paris'

alias gd="git diff -w"
