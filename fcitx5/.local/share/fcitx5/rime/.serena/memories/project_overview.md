# 项目概览
- 目的：雾凇拼音（Rime 输入法配置与词库），提供全拼/多种双拼方案及扩展功能，配合各前端（fcitx5/ibus/weasel/squirrel 等）使用。
- 技术栈：Rime 配置文件（YAML），词库 YAML/dict，OpenCC 词形转换，Lua 脚本插件；无后端服务或构建流程。
- 目录结构要点：
  - 根目录大量 *.schema.yaml 与 *.dict.yaml（方案与词库），`default.yaml` 为全局配置；`rime_ice.schema.yaml` 等为主要方案。
  - `cn_dicts/`、`en_dicts/`、`opencc/`、`others/` 存放词库与配方；`lua/` 为功能脚本（计算器、日期、反查、过滤等）。
  - 平台前端配置样例：`weasel.yaml`、`squirrel.yaml`、`others/iRime` 等。
- 依赖环境：已安装 Rime 前端及 librime-lua（fcitx5-rime 等）。
- 额外文件：`go.work` 仅存在但未见 Go 代码，暂可忽略。