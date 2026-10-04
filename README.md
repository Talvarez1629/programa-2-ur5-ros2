# Programa 2 — UR5, ROS 2 Humble y MoveIt 2

Practica realizada en **simulacion**, con Ubuntu 22.04, URSim CB3 3.15.8 y ROS 2 Humble.

## Objetivo

1. Activar DO0 en alto al iniciar el programa.
2. Mostrar un popup que anuncia el control externo.
3. Esperar cinco segundos despues de confirmar.
4. Ejecutar External Control para conectar con ROS 2.
5. Planificar y ejecutar una trayectoria mediante MoveIt 2 y registrar evidencia.

## Requisitos

Docker accesible por el usuario y paquetes ROS 2 Humble:

```bash
sudo apt update
sudo apt install ros-humble-ur ros-humble-moveit
```

## Ejecucion

Desde la raiz del repositorio, en terminales separadas:

```bash
# Terminal 1: URSim
bash scripts/iniciar_ursim.sh

# Terminal 2: driver
bash scripts/iniciar_driver.sh

# Terminal 3: MoveIt, despues de activar External Control
bash scripts/iniciar_moveit.sh
```

Abrir http://localhost:6080/vnc.html. Cargar Programa_2_UR5_Simulacion.urp.
Configurar External Control con host 192.168.56.1 y puerto 50002.
Con el driver listo, pulsar Play y Continue en el popup.
Esperar cinco segundos y comprobar que el programa permanece activo.

En RViz: grupo ur_manipulator, estado inicial current, objetivo distinto del actual,
velocidad y aceleracion 0.1. Pulsar Plan y despues Execute.

Los scripts cargan solo Humble y usan ROS_DOMAIN_ID=37.
El driver aplica lectura bloqueante y keep_alive_count=10 (200 ms)
a una copia local de ur_description. No cambia /opt/ros/humble.
Es una configuracion utilizada para esta simulacion, no una solucion garantizada para todos los entornos WSL.

## Archivos y evidencia

- scripts/: lanzadores y exportacion del programa.
- polyscope/: instrucciones para incorporar los archivos nativos del simulador.
- evidencia/: capturas de DO0, popup y External Control.
- El usuario confirmo que grabo un video de la ejecucion; el video aun no esta incluido.

La secuencia se verifico visualmente en URSim y External Control permanecio ejecutandose
durante mas de un minuto con lectura bloqueante.
Los lanzadores de este repositorio reorganizan los comandos utilizados;
todavia requieren una prueba completa en Ubuntu.
El repositorio necesita el .urp exportado y el video para completar los entregables.

## Documentacion oficial

- [Driver ROS 2](https://github.com/UniversalRobots/Universal_Robots_ROS2_Driver)
- [URSim Docker](https://docs.universal-robots.com/Universal_Robots_ROS2_Documentation/doc/ur_client_library/doc/setup/ursim_docker.html)
- [MoveIt para UR](https://docs.universal-robots.com/Universal_Robots_ROS2_Documentation/doc/ur_robot_driver/ur_moveit_config/doc/index.html)

