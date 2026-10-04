#!/usr/bin/env bash
set -eo pipefail
if [[ "${PROGRAMA2_LIMPIO:-}" != 1 ]]; then
  exec env -i HOME="$HOME" USER="$USER" TERM="${TERM:-xterm}" DISPLAY="${DISPLAY:-}" WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-}" XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-}" PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin ROS_DOMAIN_ID=37 PROGRAMA2_LIMPIO=1 bash --noprofile --norc "$0" "$@"
fi
source /opt/ros/humble/setup.bash
exec ros2 launch ur_moveit_config ur_moveit.launch.py ur_type:=ur5 launch_rviz:=true

