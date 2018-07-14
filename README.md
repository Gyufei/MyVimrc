## vim 模块化配置

> 随着使用 **VIM** 的时间越来越长，添加的各种配置和插件越来越多，vimrc也变得越来越臃肿和混乱，
> 新增和修改配置非常不方便。所以将　vimrc 文件按类型拆分为多个模块，以便于修改配置(和瞎折腾)。

### 舍弃了主目录下的`.vimrc`文件，将配置移动到`.vim`文件夹中，更名为`vimrc`(VIM 会自动读取),目的是便于版本管理。

+ `vimrc` 配置入口文件，用于加载插件和其他模块中的配置
+ `basic.vim` 基础配置
+ `gui.vim`   GUI中的一些配置项
+ `keymap.vim` 自定义快捷键配置
+ `plugin.vim` 各插件的配置(一些配置项较多的插件可以视情况单独再分为一个模块，例如YCM)
+ `ycm.vim`    YouCompleteMe 插件的配置
+ `airline.vim` vim-airline 插件的配置
+ `forvue.vim` 用于针对 VUE 格式文件的配置（不得不吐槽一下VUE的VIM生态简直等于没有)

在vimrc文件中定义了一个函数，可以读取.vim目录下的所有vim格式的文件并载入，因此可以随意新增模块。（例如可以新增个zheteng.vim用来体验各种奇怪的配置项^()^

因为配置项中存在一些互相依赖，所以在各模块前加上数字来保证加载顺序。
