# ruby-machine

## 环境搭建命令(Mac)

```bash
brew install gpg2
gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install ruby-2.7.2
gem install require_all
gem install solargraph
gem install rubocop
gem install treetop
```

然后vscode中安装插件: 
`Ruby`, `Ruby Solargraph`, `ruby-rubocop`

## Debug
参考：
[How to debug Ruby code on Visual Studio Code?](https://stackoverflow.com/questions/51539711/how-to-debug-ruby-code-on-visual-studio-code)

具体的debug参数再参考:
[Launching from VS Code](https://github.com/rubyide/vscode-ruby/wiki/2.-Launching-from-VS-Code)