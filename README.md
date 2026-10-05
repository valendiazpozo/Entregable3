# RetailPro

Proyecto de análisis de datos que evalúa las **ventas** y el **comportamiento de los clientes** de una cadena de tiendas de tecnología. Los datos se modelan y consultan en **SQL Server** y se visualizan en **Power BI**. El código y la documentación se versionan en **GitHub**.

## Objetivos

- Medir la evolución de las ventas (mensual, anual, acumulado del año y comparación contra el año anterior).
- Identificar los productos y categorías con mejor desempeño.
- Entender el comportamiento de los clientes: recurrencia, clientes sin compras y distribución por canal.
- Entregar un reporte interactivo para apoyar decisiones del equipo comercial.

## Herramientas utilizadas

| Herramienta | Uso |
|---|---|
| **SQL Server** | Creación de la base de datos, consultas de negocio y vistas |
| **Power BI** | Modelo de datos, medidas DAX y reporte interactivo |
| **GitHub** | Control de versiones y documentación del proyecto |

## Modelo de datos

Base de datos: `Ventas_Tech_DB` (esquema `dbo`)

| Tabla | Descripción | Columnas principales |
|---|---|---|
| `DimCategoria` | Categorías de productos | `id_categoria`, `Nombre_categoria`, `Descripcion` |
| `DimClientes` | Clientes | `id_cliente`, `Nombre`, `Email`, `Ciudad`, `Fecha_registro` |
| `DimProductos` | Catálogo de productos | `id_producto`, `Nombre_producto`, `id_categoria`, `Precio`, `Stock`, `activo` |
| `Ventas` | Tabla de hechos | `id_venta`, `id_cliente`, `id_producto`, `cantidad`, `precio_unitario`, `fecha_venta` |

## Estructura del repositorio

```
RetailPro/
├── sql/
│   ├── 01_crear_base_datos.sql      # Creación de Ventas_Tech_DB y tablas
│   ├── m4_consultas_negocio.sql     # Resumen mensual, ranking de productos, clientes recurrentes
│   └── m5_consultas_joins.sql       # JOINs, clientes/productos sin ventas, consolidado por canal
├── powerbi/
│   └── RetailPro.pbix               # Reporte de Power BI
└── README.md
```

> Ajusta los nombres y rutas a la estructura real de tu repositorio.

## Cómo ejecutar los scripts SQL

### Requisitos

- SQL Server (Express, Developer o superior)
- SQL Server Management Studio (SSMS) o Azure Data Studio

### Pasos

1. **Clona el repositorio**
   ```bash
   git clone https://github.com/<tu-usuario>/RetailPro.git
   cd RetailPro
   ```
2. **Conéctate a tu instancia** de SQL Server desde SSMS.
3. **Crea la base de datos y las tablas:** abre `sql/01_crear_base_datos.sql` y ejecútalo (`F5`). Esto crea `Ventas_Tech_DB` con el esquema `dbo`.
4. **Carga los datos** en las tablas de dimensiones y en `Ventas` (con tus scripts `INSERT` o importando desde archivos).
5. **Ejecuta las consultas de análisis**, en este orden:
   - `m4_consultas_negocio.sql`: resumen mensual, ranking de productos, clientes recurrentes y meses por encima/debajo del promedio.
   - `m5_consultas_joins.sql`: vista base con `INNER JOIN`, clientes y productos sin ventas (`LEFT JOIN`) y consolidado por canal (`UNION ALL`).

También puedes ejecutarlos desde la línea de comandos con `sqlcmd`:

```bash
sqlcmd -S localhost -d Ventas_Tech_DB -E -i sql/m4_consultas_negocio.sql
```

(`-E` usa autenticación de Windows; con usuario y contraseña de SQL Server usa `-U` y `-P`.)

## Reporte en Power BI

1. Abre `powerbi/RetailPro.pbix` en Power BI Desktop.
2. En **Transformar datos → Configuración de origen de datos**, actualiza el nombre de tu servidor SQL Server y la base `Ventas_Tech_DB`.
3. Haz clic en **Actualizar** para cargar los datos.

**Modelo y medidas:**

- Tabla de fechas `Dim_Fechas` para la inteligencia de tiempo.
- Tabla `_Medidas` con: `Total Ventas`, `Ventas YTD`, `Ventas LY` y `% Crecimiento Anual`.
- Página **Validación** con una matriz (meses × años) para verificar la coherencia de las medidas.

## Hallazgos y análisis

Agrega aquí capturas del reporte y las conclusiones principales (por ejemplo, productos más vendidos, clientes recurrentes y comparación de canales).

## Autor

Proyecto desarrollado como parte de un portafolio de análisis de datos. ¡Los comentarios y sugerencias son bienvenidos!
