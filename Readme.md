### Remote-Docker-Development for CLion & VSCode

### CLion & VSCode 可用的Docker远程开发配置文件



#### CLion使用方法 || Usage with CLion

```bash
docker-compose -f .devcontainer/docker-compose.yml
```

**CLion  Preferences **- Build, Execution, Deployment - *1. Toolchains, 2. CMake, 3. Deployment*

请注意不要在*Deployment*选项中修改根目录，而要在路径映射中使用全路径，否则CMake会报错：Cannot create directory。

Please notice: don't change the ROOT directory in *Deployment* option, use the full path of project in the *Mapping* option. If not, CMake will report error: Cannot create directory.



#### VSCode使用方法 || Usage with VSCode

在容器中打开此文件夹，注意：项目根目录，而非~~*.devcontainer*~~目录。

Open this folder in container. NOTICE: ROOT directory, not the  ~~*.devcontainer*~~ directory.



#### 一些参数 || Parameters

**用户名&密码：** deploy

**路径挂载：** 当前文件夹:/home/deploy/projects/

**工作路径：** /home/deploy/projects/



**User & pwd:** deploy

**Mount:** /current_folder:/home/deploy/projects/

**Working directory:** /home/deploy/projects/







