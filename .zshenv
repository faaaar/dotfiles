export BROWSER="google-chrome-stable"
export GOPATH="$HOME/go"
export GO111MODULE="on"
export GOPROXY="https://goproxy.io,direct"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
export ORGPATH="$HOME/.org"
if [ -f "$HOME/.wakatime.cfg" ]; then
    export WAKATIME_API_KEY=` cat $HOME/.wakatime.cfg | grep api_key | awk -F'= ' '{ print $2 }'`
fi
. "$HOME/.cargo/env"
