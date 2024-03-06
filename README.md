# Cálculo de Permitividad de Materiales mediante una Sonda

Este proceso permite calcular la permitividad relativa (εᵣ) de materiales a partir de la medición de parámetros S11 con un VNA y una sonda. Se adquieren los parámetros de circuito abierto, circuito cerrado y agua destilada como referencia, y luego se miden los parámetros del material a calcular.

## Catedra Medidas Electrónicas II - UTN FRBA - 2023 - **Revisión 01**  Fecha: 05/03/2024
- **Docente:** Henze Alejandro Martín
- **JTP    :** Geria Juan Manuel
### Alumnos 
- Almude Tupac
- De Luca Martín Alexandro

Se partió de trabajos de años anteriores para la misma cátedra que se encuentran [en la siguiente ruta](./01-Bibliografía/Antecedentes%20Soft/Sonda%20Open%20Ended%20-%20Antecedentes).

## Contenido

1. [Modelo de Sonda](#modelo-de-la-sonda-utilizada)
2. [Funciones Implementadas](#funciones-implementadas)
    - [Procesamiento de archivos S1P obtenidos del VNA](#procesamiento-de-archivos-s1p-obtenidos-del-vna)
    - [Conversión a Coordenadas Rectangulares](#conversión-a-coordenadas-rectangulares)
    - [Conversión de parámetros S11 a Y11](#conversión-de-parámetros-s11-a-y11)
    - [Submuestreo de S11 (SUBsample_S11)](#submuestreo-de-s11-subsamples11)
    - [Remuestreo de S11 (Resample_S11)](#remuestreo-de-s11-resamples11)
    - [Obtención de Constante Dieléctrica Relativa (εᵣ) del DUT en Medio Agua](#obtención-de-constante-dieléctrica-relativa-εᵣ-del-dut-en-medio-agua)
    - [Obtención de Conductancia en Función de la Frecuencia con el Setup Calibrado](#obtención-de-conductancia-en-función-de-la-frecuencia-con-el-setup-calibrado)
3. [Modelos Teóricos](#modelos-teóricos)
    - [Obtención de Modelo de Debye para Agua Destilada](#obtención-de-modelo-de-debye-para-agua-destilada)
    - [Obtención de Modelo de Constante Dieléctrica para Alcohol Etílico](#obtención-de-modelo-de-constante-dieléctrica-para-alcohol-etílico)
    - [Obtención de Modelo de Constante Dieléctrica para Alcohol Isopropílico](#obtención-de-modelo-de-constante-dieléctrica-para-alcohol-isopropílico)
4. [Ejemplos de Uso](#ejemplos-de-uso)
    - [Procesamiento de Archivos S1P para Medios Específicos](#procesamiento-de-archivos-s1p-para-medios-específicos)
    - [Obtención de Constante Dieléctrica Relativa para Diferentes Medios](#obtención-de-constante-dieléctrica-relativa-para-diferentes-medios)
    - [Procesamiento y Estimación de Constante Dieléctrica Relativa para Resina](#procesamiento-y-estimación-de-constante-dieléctrica-relativa-para-resina)
5. [Proceso de Clonación y Procesamiento en Python](#proceso-de-clonación-y-procesamiento-en-python)
6. [Pasos a Seguir](#pasos-a-seguir)
7. [Resultados](#resultados)
    - [Imágenes de Permitividad Relativa (εᵣ)](#imágenes-de-permitividad-relativa-εᵣ)
        - [Er_Acetona_Medido](#er_acetona_medido)
        - [Er_agua_Teorico](#er_agua_teorico)
        - [Er_AlchEtilico_Teorico](#er_alchetilico_teorico)
        - [Er_AlchIsoprop_Medido](#er_alchisoprop_medido)
        - [Er_AlchIsoprop_Teorico](#er_alchisoprop_teorico)
        - [Er_AlchIsoprop_VS](#er_alchisoprop_vs)
        - [Er_Resina](#er_resina)
          
## Modelo de la Sonda utilizada

![Imagen de la Sonda](./03-Dise%C3%B1os/Imagenes/SONDA_SMA_2.JPG)

Se pueden encontrar los [modelos 3D](./03-Diseños/Sonda/) de la sonda utilizada y las simulaciones en CST con dicha sonda en la [la siguiente carpeta](./04-CST/)

# Funciones implementadas
## Procesamiento de archivos S1P obtenidos del VNA
La función `def vna_proc_file(file_path, file_name)` se encarga de procesar los archivos seleccionados y devuelve un diccionario con la información extraída. Los archivos S1P pueden estar en formato de Modulo y Fase o Parte Real e Imaginaria, dependiendo del modo de adquisición del VNA.

- #### Parámetros
    - `file_path:` Ruta del archivo.
    - `file_name:` Nombre del archivo.
- #### Retorno
    Un diccionario con las siguientes claves:
    - `'Date':` Fecha del archivo.
    - `'Data':` Información de las primeras 11 líneas del archivo.
    - `'Index':` Encabezados de las columnas de datos.
    - `'Frec':` Lista de frecuencias extraídas del archivo.
    - `'Complex':` Lista de números complejos correspondientes a los datos procesados.

Si el archivo tiene extensión `.csv`, la función imprimirá un mensaje indicando que el formato CSV no está soportado y retornará sin procesar el archivo.

## Conversión a Coordenadas Rectangulares

La función `def convertir_a_rectangular(modulo_db, fase_grados)` convierte las coordenadas polares (módulo en decibelios y fase en grados) a coordenadas rectangulares.

- #### Parámetros
    - `modulo_db`: Módulo en decibelios.
    - `fase_grados`: Fase en grados.

- #### Retorno
    - Un número complejo en coordenadas rectangulares.

## Conversión de parámetros S11 a Y11

La función `def S11_to_Y11(frec, S11)` convierte los parámetros S11 (coeficiente de reflexión) a parámetros Y11 (parámetros admitancia).

- #### Parámetros
    - `frec`: Frecuencia.
    - `S11`: Coeficiente de reflexión S11.

- #### Retorno
    Un diccionario con las siguientes claves:
    - `'Frec'`: Frecuencia.
    - `'Complex'`: Valor complejo correspondiente a Y11.

Estas funciones proporcionan herramientas esenciales para el procesamiento y análisis de archivos S1P obtenidos del VNA.
## Submuestreo de S11 (SUBsample_S11)

La función `def SUBsample_S11(small_dict, big_dict)` realiza un submuestreo de los datos en `big_dict` para que coincidan con las frecuencias presentes en `small_dict`. La función elimina las frecuencias no presentes en `small_dict` y retorna un nuevo diccionario con el conjunto de datos ajustado.

- #### Parámetros
  - `small_dict`: Diccionario con un conjunto de datos más pequeño.
  - `big_dict`: Diccionario con un conjunto de datos más grande.

- #### Retorno
  Un nuevo diccionario con las siguientes claves:
  - `'Frec'`: Lista de frecuencias ajustadas.
  - `'Complex'`: Lista de números complejos ajustados.

La función imprimirá un mensaje si el diccionario más pequeño no tiene menos elementos que el diccionario más grande.

- #### Ejemplo de uso
  ```python
  result_dict = SUBsample_S11(small_dict, big_dict)
  ```

## Remuestreo de S11 (Resample_S11)

La función `def Resample_S11(smaller_set, data)` realiza un remuestreo de los datos en `data` para que coincidan con las frecuencias presentes en `smaller_set`. La función realiza una interpolación lineal entre los puntos de datos existentes y devuelve un nuevo conjunto de datos con las frecuencias ajustadas.

- #### Parámetros
  - `smaller_set`: Diccionario con un conjunto de datos más pequeño.
  - `data`: Diccionario con un conjunto de datos más grande.

- #### Retorno
  Un nuevo diccionario con las siguientes claves:
  - `'Frec'`: Lista de frecuencias ajustadas.
  - `'Complex'`: Lista de números complejos ajustados.

- #### Ejemplo de uso
  ```python
  resampled_data = Resample_S11(smaller_set, data)
  ```

## Obtener Constante Dieléctrica Relativa (εᵣ) del Dispositivo bajo Prueba (DUT) en Medio Agua

La función `def get_er_DUTm(frecs, S11_medido, S11_agua, S11_aire, S11_corto)` calcula la constante dieléctrica relativa (εᵣ) del Dispositivo bajo Prueba (DUT) en medio acuoso. Se utiliza un modelo de Debye para el agua en la estimación.

- #### Parámetros
    - `frecs`: Lista de frecuencias.
    - `S11_medido`: Parámetro de dispersión medido del DUT.
    - `S11_agua`: Parámetro de dispersión medido en agua.
    - `S11_aire`: Parámetro de dispersión medido en aire.
    - `S11_corto`: Parámetro de dispersión medido en un cortocircuito.

- #### Retorno
    - Valor numérico de la constante dieléctrica relativa (εᵣ) del DUT en medio acuoso.

## Obtener Conductancia en Función de la Frecuencia con el Setup Calibrado

La función `def get_er_setup(frecs, S11_medido, s11_agua, s11_abierto, s11_isopropilico, s11_corto)` calcula la conductancia en función de la frecuencia con el setup calibrado. Se realiza una estimación de la constante dieléctrica relativa del agua y del isopropanol.

- #### Parámetros
    - `frecs`: Lista de frecuencias.
    - `S11_medido`: Parámetro de dispersión medido del DUT.
    - `s11_agua`: Parámetro de dispersión medido en agua.
    - `s11_abierto`: Parámetro de dispersión medido en un circuito abierto.
    - `s11_isopropilico`: Parámetro de dispersión medido en isopropanol.
    - `s11_corto`: Parámetro de dispersión medido en un cortocircuito.

- #### Retorno
    - Lista de valores numéricos que representan la conductancia en función de la frecuencia con el setup calibrado.

Ambas funciones proporcionan herramientas para el análisis de parámetros de dispersión y la estimación de constantes dieléctricas relativas en diferentes entornos.
# Modelos Teóricos
## Obtener Modelo de Debye para Agua Destilada

La función `def get_debye_model(frecs): #Patron agua destilada` devuelve el modelo de Debye para la constante dieléctrica relativa del agua destilada.

- #### Parámetros
    - `frecs`: Lista de frecuencias.

- #### Retorno
    - Lista de valores numéricos que representan la constante dieléctrica relativa del agua destilada en función de la frecuencia.

## Obtener Modelo de Constante Dieléctrica para Alcohol Etílico

La función `def get_er_pat_alc_etilico(frecs)` proporciona el modelo de la constante dieléctrica relativa para el alcohol etílico.

- #### Parámetros
    - `frecs`: Lista de frecuencias.

- #### Retorno
    - Lista de valores numéricos que representan la constante dieléctrica relativa del alcohol etílico en función de la frecuencia.

## Obtener Modelo de Constante Dieléctrica para Alcohol Isopropílico

La función `def get_er_pat_alc_isopropilico(frecs)` devuelve el modelo de la constante dieléctrica relativa para el alcohol isopropílico al 99% según la curva de Debye.

- #### Parámetros
    - `frecs`: Lista de frecuencias.

- #### Retorno
    - Lista de valores numéricos que representan la constante dieléctrica relativa del alcohol isopropílico en función de la frecuencia.

Estas funciones proporcionan modelos para estimar la constante dieléctrica relativa en diferentes medios, lo que puede ser útil en el análisis de parámetros de dispersión en entornos específicos.
## Ejemplos de Uso

#### Procesamiento de Archivos S1P para Medios Específicos

```python
mea_date = '22-02-24'
file_path = './ME2-PROY-SONDA/rsc/' + mea_date + '/'

# files[mea_date][0] #Aire
# files[mea_date][1] #Isopropil
# files[mea_date][2] #Agua destilada
# files[mea_date][3] #Corto circuito
# files[mea_date][4] #Acetona

s11_agua_dest = vna_proc_file(file_path, files[mea_date][2])
s11_short     = vna_proc_file(file_path, files[mea_date][3])
s11_aire      = vna_proc_file(file_path, files[mea_date][0])
s11_isop      = vna_proc_file(file_path, files[mea_date][1])
s11_acetona   = vna_proc_file(file_path, files[mea_date][4])
```

#### Obtener Constante Dieléctrica Relativa para Diferentes Medios

```python
frecs      = s11_agua_dest['Frec']
er_iso     = get_er_DUTm(frecs, s11_isop['Complex'], s11_agua_dest['Complex'], s11_aire['Complex'], s11_short['Complex'])
er_agua    = get_er_DUTm(frecs, s11_agua_dest['Complex'], s11_agua_dest['Complex'], s11_aire['Complex'], s11_short['Complex'])
er_acetona = get_er_DUTm(frecs, s11_acetona['Complex'], s11_agua_dest['Complex'], s11_aire['Complex'], s11_short['Complex'])
```

#### Procesamiento y Estimación de Constante Dieléctrica Relativa para Resina
*(utilizando un set de datos mayor con una calibración de menor tamaño, interpolando y muestreando nuevamente)*

```python
file_path = './ME2-PROY-SONDA/rsc/' + '21-12-23/'
file_name = 'ResinaN.s1p'
s11_resina_temp = vna_proc_file(file_path, file_name)
s11_resina = Resample_S11(s11_acetona, s11_resina_temp)
er_resina  = get_er_DUTm(frecs, s11_resina['Complex'], s11_agua_dest['Complex'], s11_aire['Complex'], s11_short['Complex'])
```

Estos ejemplos ilustran cómo procesar archivos S1P para diferentes medios y calcular la constante dieléctrica relativa en función de la frecuencia para cada medio. Además, se muestra cómo aplicar el proceso a un nuevo conjunto de datos (Resina) utilizando una función de resample para ajustar las frecuencias.
## Proceso de Clonación y Procesamiento en Python

El script Python ubicado en la carpeta **`05-Software`** de este repositorio utiliza Google Colab o Jupyter para realizar un `git clone` del repositorio y procesar los archivos, almacenándolos en una lista. El script se puede encontrar en [este archivo](./05-Software/ME2_PROYECTO_2023.ipynb).

### Descripción del Proceso

1. **Clonación del Repositorio:**
   - El script comienza realizando un `git clone` del repositorio para obtener la última versión de los archivos.

     ```python
     !git clone https://github.com/tinchodeluca/ME2-PROY-SONDA.git
     ```

2. **Procesamiento de Archivos:**
   - Luego, el script explora la carpeta `./ME2-PROY-SONDA/rsc/` y almacena en un diccionario la lista de archivos para cada carpeta.

     *_([la carpeta recursos `rsc`](./rsc/) almacena carpetas con la fecha de medición y dentro de cada una las señales adquiridas oportunamente)_*

     ```python
     file_path = './ME2-PROY-SONDA/rsc/'
     files = {}

     for folder in os.listdir(file_path):
       if os.path.isdir(file_path + '/' + folder ):
         file_names = os.listdir( file_path + '/' + folder + '/' )
         files[folder] = file_names
     ```
## Pasos a Seguir:

1. **Medición de Parámetros de Referencia:**
   - Medir y almacenar los parámetros S11 del **circuito abierto**.
   - Medir y almacenar los parámetros S11 del **circuito cerrado**.
   - Medir y almacenar los parámetros S11 del **agua destilada**.

2. **Procesamiento de Datos de Referencia:**
   - Procesar los archivos S1P de los parámetros medidos para obtener información estructurada.
   - Calcular la constante dieléctrica relativa (εᵣ) para el **circuito abierto**, el **circuito cerrado** y el **agua destilada** utilizando las funciones implementadas.

3. **Medición de Parámetros del Material a Calcular:**
   - Medir y almacenar los parámetros S11 del material cuya permitividad se desea calcular.
   - Almacenar los documentos en la [carpeta de recursos](./rsc/) junto con el resto de señales.

4. **Procesamiento de Datos del Material a Calcular:**
   - Procesar el archivo S1P del material para obtener información estructurada.
   - Calcular la constante dieléctrica relativa (εᵣ) del material utilizando las funciones implementadas.

5. **Resultados y Análisis:**
   - Analizar los resultados obtenidos para determinar la permitividad relativa del material en función de la frecuencia.
   - Documentar y presentar los resultados de manera clara y comprensible.

Este proceso brinda una metodología ordenada y eficiente para calcular la permitividad relativa de materiales mediante una sonda, permitiendo un análisis detallado y una presentación organizada de los resultados.


## Resultados

## Imágenes de Permitividad Relativa (εᵣ)

### Er_Acetona_Medido
![Er_Acetona_Medido](https://github.com/tinchodeluca/ME2-PROY-SONDA/raw/main/02-Multimedia/Er_Acetona_Medido.png)

### Er_agua_Teorico
![Er_agua_Teorico](https://github.com/tinchodeluca/ME2-PROY-SONDA/raw/main/02-Multimedia/Er_agua_Teorico.png)

### Er_AlchEtilico_Teorico
![Er_AlchEtilico_Teorico](https://github.com/tinchodeluca/ME2-PROY-SONDA/raw/main/02-Multimedia/Er_AlchEtilico_Teorico.png)

### Er_AlchIsoprop_Medido
![Er_AlchIsoprop_Medido](https://github.com/tinchodeluca/ME2-PROY-SONDA/raw/main/02-Multimedia/Er_AlchIsoprop_Medido.png)

### Er_AlchIsoprop_Teorico
![Er_AlchIsoprop_Teorico](https://github.com/tinchodeluca/ME2-PROY-SONDA/raw/main/02-Multimedia/Er_AlchIsoprop_Teorico.png)

### Er_AlchIsoprop_VS
![Er_AlchIsoprop_VS](https://github.com/tinchodeluca/ME2-PROY-SONDA/raw/main/02-Multimedia/Er_AlchIsoprop_VS.png)

### Er_Resina
![Er_Resina](https://github.com/tinchodeluca/ME2-PROY-SONDA/raw/main/02-Multimedia/Er_Resina.png)
