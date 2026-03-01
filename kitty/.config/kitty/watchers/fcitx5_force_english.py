from __future__ import annotations

from subprocess import DEVNULL, run
from typing import Any

from kitty.boss import Boss
from kitty.window import Window

FCITX5_REMOTE = "/usr/bin/fcitx5-remote"
TARGET_INPUT_METHOD = "keyboard-us"


def on_focus_change(_boss: Boss, _window: Window, data: dict[str, Any]) -> None:
    if not data.get("focused"):
        return

    run(
        [FCITX5_REMOTE, "-s", TARGET_INPUT_METHOD],
        check=False,
        stdout=DEVNULL,
        stderr=DEVNULL,
    )
