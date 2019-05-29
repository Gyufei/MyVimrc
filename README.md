## vim 模块化配置

> 随着使用 **VIM** 的时间越来越长，添加的各种配置和插件越来越多，vimrc也变得越来越臃肿和混乱，
> 新增和修改配置非常不方便。所以将　vimrc 文件按类型拆分为多个模块，以便于修改配置(和瞎折腾)。

### 舍弃了主目录下的`.vimrc`文件，将配置移动到`.vim`文件夹中，更名为`vimrc`(VIM 会自动读取),目的是便于版本管理。

+ `vimrc` 配置入口文件，用于加载插件和其他模块中的配置
+ `basic.vim` 基础配置
+ `gui.vim`   GUI中的一些配置项
+ `keymap.vim` 自定义快捷键配置
+ `plugin.vim` 各插件的配置(一些配置项较多的插件可以视情况单独再分为一个模块)
+ `ale.vim`    语法检查 ALE 插件的配置
+ `airline.vim` 状态条vim-airline 插件的配置
+ `ft.vim` 用于针对各种格式文件的专门配置
+ `term.vim` 用于支持vim内命令行的配置
+ `completion.vim` 补全设置

### ChangeLog

+ *2019-4-15* 弃用 `ag.vim`, 使用 `ctrlsf`
+ *2019-5-29* 弃用 `YCM`,全面拥抱 `CoC.nvim`(为了`language server`)
