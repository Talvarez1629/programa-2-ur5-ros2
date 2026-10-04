#!/usr/bin/env bash
set -eo pipefail
REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
mkdir -p "$REPO_DIR/polyscope"
docker cp ursim:/ursim/programs/Programa_2_UR5_Simulacion.urp "$REPO_DIR/polyscope/"
if docker exec ursim test -f /ursim/programs/Programa_2_UR5_Simulacion.script; then
  docker cp ursim:/ursim/programs/Programa_2_UR5_Simulacion.script "$REPO_DIR/polyscope/"
fi
echo "Archivos exportados a $REPO_DIR/polyscope"
echo "Adjuntar tambien la instalacion asociada (.installation), si esta disponible."

