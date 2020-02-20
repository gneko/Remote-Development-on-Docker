## Remote-Development-on-Docker for CLion(and Jetbrains family) & VSCode

## CLion(以及Jetbrains家族) & VSCode 可用的Docker远程开发配置文件

本示例以C++开发环境为例，请根据自己的需求修改配置。

This template is based on C++ development, please modify files on your demand.

### 完整文档请参阅[使用Docker作为C++开发环境：适用于CLion与VSCode的配置](https://graueneko.xyz/archives/64/)

#### 1. CLion(以及Jetbrains家族)使用方法 || Usage with CLion(and Jetbrains family)

```bash
docker-compose -f .devcontainer/docker-compose.yml up -d
```

**CLion  Preferences** - Build, Execution, Deployment - *1. Toolchains, 2. CMake, 3. Deployment*

请注意不要在*Deployment*选项中修改根目录，而要在路径映射中使用全路径，否则CMake会报错：Cannot create directory（见参考文献[2]）。

Please notice: don't change the ROOT directory in *Deployment* option, use the full path of project in the *Mapping* option. If not, CMake will report error: Cannot create directory(See Ref.[2]).



#### 2. VSCode使用方法 || Usage with VSCode

在容器中打开此文件夹，注意：项目根目录，而非~~*.devcontainer*~~目录。

Open this folder in container. NOTICE: ROOT directory, not the  ~~*.devcontainer*~~ directory.



#### 3. 一些参数 || Parameters

**用户名&密码：** deploy

**路径挂载：** 当前文件夹:/home/deploy/projects/

**工作路径：** /home/deploy/projects/

-

**User & pwd:** deploy

**Mount:** /current_folder:/home/deploy/projects/

**Working directory:** /home/deploy/projects/



#### 4. 参考文献 || References

1. [Clion 如何使用 Docker 作为开发环境](https://imhuwq.com/2018/12/02/Clion%20%E4%BD%BF%E7%94%A8%20Docker%20%E4%BD%9C%E4%B8%BA%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83/)
2. [Cannot save file](https://youtrack.jetbrains.com/issue/CPP-14601?_ga=2.83103062.1327578204.1582092725-641298214.1579166547&_gac=1.48538196.1580011675.CjwKCAiA66_xBRBhEiwAhrMuLXsy9S50WCc3ZX50CVsuD_mUCL7Ol9blwosi0UJaDGrnxo6nSkGAexoC_YwQAvD_BwE)





