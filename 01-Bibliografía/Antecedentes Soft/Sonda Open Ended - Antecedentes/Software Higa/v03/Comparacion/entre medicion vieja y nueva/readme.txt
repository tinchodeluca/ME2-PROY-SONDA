
Comparacion de las mediciones OLD (VNA UTN FRBA) y NEW (VNA INTI)
=================================================================

- Comparacion solo con las temperaturas OLD: 25, 40, 55 y 60.

- Modificacion "." por "," de los archivos .s1p para que el excel interprete correctamente los numeros.

- Eliminacion de la linea de parametros del archivo .s1p.

- Modificacion de rangos:
	- OLD: 100MHz-3GHz (pasos de 50MHz) -> 100MHz-3GHz (pasos de 50MHz y 100MHz a partir del GHz) 
	- NEW: 300kHZ-4GHZ (pasos de 10MHz y 100MHz a partir del GHz) -> 100MHz-3GHz (pasos de 50MHz y 100MHz a partir del GHz)

- Formato de OLD:
	- Frecuencia [Hz]
	- Magnitud s11
	- Fase s11 en grados

- Formato de NEW:
# Hz S RI R 50.000000
	- Frecuencia [Hz]
	- Parametros S
	- Formato: real-imaginario.
	- Resistencia referencia: 50ohm

- Modificacion  del formato de OLD para obtener en vez de magnitud y fase, parte real e imaginaria.

- Modificacion  del formato de NEW para mostrar el formato del numero en tipo general.
