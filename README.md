## vim 模块化配置

> 随着使用 **VIM** 的时间越来越长，添加的各种配置和插件越来越多，vimrc也变得越来越臃肿和混乱，
> 新增和修改配置非常不方便。所以将　vimrc 文件按类型拆分为多个模块，以便于修改配置(和瞎折腾)。


### Install
+ `clone` 项目 
  ```
  git clone git@github.com:Gyufei/MyVimrc.git
  ```
+ 安装 **vim-plug** 插件管理插件
  ```
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```
+ 进入 `vim` , 执行
  ```
  PlugInstall
  ```
+ 如果需要使用 *neovim*，可以将 *neovim* 的配置文件夹软链接到此文件夹
  ```
  ln -s ~/.vim ~/.config/nvim
  ```

### Config

+ `vimrc` 配置入口文件，用于加载插件和其他模块中的配置
+ `basic.vim` 基础配置
+ `gui.vim`   GUI中的一些配置项
+ `keymap.vim` 自定义快捷键配置
+ `plugin.vim` 各插件的配置(一些配置项较多的插件可以视情况单独再分为一个模块)
+ `ale.vim`    语法检查 ALE 插件的配置
+ `statusline.vim` 状态栏配置
+ `ft.vim` 用于针对各种格式文件的专门配置
+ `term.vim` 用于支持vim内命令行的配置
+ `completion.vim` 补全设置

### ChangeLog

+ *2018-7-20* 
  舍弃了主目录下的`.vimrc`文件，将配置移动到`.vim`文件夹中,便于版本管理。
+ *2018-11-20* 
  尝试同时兼容vim 和 nvim
+ *2019-4-15* 
  弃用 `ag.vim`, 使用 `ctrlsf`
+ *2019-5-29* 
  弃用 `YCM`,全面拥抱 `CoC.nvim`(为了`language server`)
+ *2019-6-5*  
  替换 状态栏插件 `airline.vim` 为 `lightline.vim`
+ *2019-6-6*  
  替换 `git` 相关插件 `vim-fugitive` 和 `vim-signify` 为 `coc-git`
  替换全局搜索插件 `ctrlp`  和 `ctrlsf` 为 `fzf.vim`:
  + 需要安装 `fzf` 和 
  + 需要安装 `fd` 和 `Rg(ripgrep)`, 可选安装 `highlight` 从而高亮预览结果, *MAC* 下均可使用 `homebrew` 安装
  + 需要设置命令行全局变量来设置 `fzf` 的搜索行为
    ```
    export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,dist} --type file --hidden"
    export FZF_DEFAULT_OPTS="--height 40% --layout=reverse"
    ```
+ *2019-9-18*
  更新 typescript 语法高亮插件(typescript.vim -> yats.vim)
