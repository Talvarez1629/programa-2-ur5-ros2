#!/usr/bin/env python3
"""Ajustar una copia local de ur_description para URSim."""
import re
import sys
from pathlib import Path

def main():
    folder = Path(sys.argv[1])
    changes = {"non_blocking_read": "false", "keep_alive_count": "10"}
    for name in ("ur_macro.xacro", "ur.ros2_control.xacro"):
        path = folder / name
        content = path.read_text(encoding="utf-8")
        for parameter, value in changes.items():
            content, count = re.subn(
                rf"({parameter}:=)[^\s\"<>]+",
                lambda match: match.group(1) + value,
                content,
            )
            if count != 1:
                raise RuntimeError(f"{path}: se esperaba una definicion de {parameter}, se encontraron {count}")
        path.write_text(content, encoding="utf-8")
    print("Configuracion local: non_blocking_read=false, keep_alive_count=10")

if __name__ == "__main__":
    main()

