# 常用命令
- 浏览配置/词库：`rg "关键词"`，`rg --files -g '*.yaml'`，`sed -n '1,160p' file.yaml`。
- 重新部署 Rime：前端菜单中“重新部署”，或终端 `rime_deployer`（若已安装）；fcitx5 可用 `fcitx5-remote -r` 重启进程后自动部署。
- 备份/还原：复制当前目录（`cp -r ~/.local/share/fcitx5/rime rime.bak-$(date +%F)`）后再调整。
- 检查 YAML 语法：`python -c "import yaml,sys;yaml.safe_load(open('file.yaml'))"`（需要 PyYAML 环境）。