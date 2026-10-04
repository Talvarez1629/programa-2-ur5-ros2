# Programa nativo de PolyScope

El programa real se llama Programa_2_UR5_Simulacion.urp y fue guardado en URSim.
Para incorporarlo al repositorio ejecutar desde Ubuntu:

```bash
bash scripts/exportar_polyscope.sh
```

Secuencia: DO0 alto → popup bloqueante → espera de 5 s → External Control.
External Control: host 192.168.56.1, puerto 50002.
Program Loops Forever: desactivado.

El .urp y el .script aun no estan incluidos: deben exportarse desde el contenedor.
No se proporciona un sustituto incompleto del codigo generado por la URCap.

