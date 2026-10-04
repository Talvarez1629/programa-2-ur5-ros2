#!/usr/bin/env bash
set -eo pipefail
if [[ "${PROGRAMA2_LIMPIO:-}" != 1 ]]; then
  exec env -i HOME="$HOME" USER="$USER" TERM="${TERM:-xterm}" PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin PROGRAMA2_LIMPIO=1 bash --noprofile --norc "$0" "$@"
fi
source /opt/ros/humble/setup.bash
docker info > /dev/null
exec ros2 run ur_client_library start_ursim.sh -m ur5 -d -f "-p 127.0.0.1:6080:6080 -p 127.0.0.1:5900:5900"

