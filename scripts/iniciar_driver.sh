#!/usr/bin/env bash
set -eo pipefail
if [[ "${PROGRAMA2_LIMPIO:-}" != 1 ]]; then
  exec env -i HOME="$HOME" USER="$USER" TERM="${TERM:-xterm}" PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin ROS_DOMAIN_ID=37 PROGRAMA2_LIMPIO=1 bash --noprofile --norc "$0" "$@"
fi
source /opt/ros/humble/setup.bash
REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
OVERLAY_DIR="$REPO_DIR/.local/ur_overlay"
mkdir -p "$OVERLAY_DIR/share/ur_description" "$OVERLAY_DIR/share/ament_index/resource_index/packages"
cp -a /opt/ros/humble/share/ur_description/. "$OVERLAY_DIR/share/ur_description/"
python3 "$REPO_DIR/scripts/configurar_descripcion.py" "$OVERLAY_DIR/share/ur_description/urdf"
touch "$OVERLAY_DIR/share/ament_index/resource_index/packages/ur_description"
export AMENT_PREFIX_PATH="$OVERLAY_DIR:$AMENT_PREFIX_PATH"
exec ros2 launch ur_robot_driver ur_control.launch.py ur_type:=ur5 robot_ip:=192.168.56.101 reverse_ip:=192.168.56.1 launch_rviz:=false

