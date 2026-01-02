# 风格与约定
- YAML：两空格缩进，键使用下划线命名；大量中文注释，保持注释语言与现有一致。配置通过 `patch:` 追加或覆盖，慎改 `config_version`。
- Lua：4 空格缩进，snake_case 命名，模块以表返回；函数前常有中文或英文注释，偏向早返回判空；使用 Rime API（Candidate/yield 等）。
- 词库：`.dict.yaml` 头部定义排序/简繁设置，正文为制表符分隔的词、拼音、权重；勿破坏制表符与列顺序。
- 遵循 KISS/YAGNI：只改动需要的节点；DRY：通用配置放 `default.yaml`，方案差异用 patch/custom 覆盖；避免跨文件重复配置。