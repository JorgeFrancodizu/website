<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>Compras</title>
        <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maxium-scale=3.0, minimum-scale=1.0">
       <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
        <link rel="stylesheet" href="css/master.css">
    </head>
    <body id="login" >

        <div class="formulario-box">
            <img class="avatar" src="img/logo.jpg" alt="Logo de Vander">
            <h1>Compras</h1>
            <form action="5-compras.php" method="POST">
                <!-- USERNAME -->
				<div class="my-form">
					<label for="nombre_producto">Nombre Producto</label>                
					<input type="text" placeholder="Diligencía aquí" name="nombre_producto" id="nombre_producto" >
				</div>
				
				<div class="my-form">
					<label for="proveedor">Proveedor</label>                
					<input type="text" placeholder="Diligencía aquí" name="proveedor" id="proveedor" >
				</div>

				<div class="my-form">
					<label for="cantidad">Cantidad</label>                
					<input type="number" placeholder="Diligencía aquí" name="cantidad" id="cantidad" >
				</div>
				
				<div class="my-form">
					<label for="precio">Precio</label>                
					<input type="number" placeholder="Diligencía aquí" name="precio" id="precio" >
				</div>
				<div class="my-form">					
					
					<input type="submit" class="btn-3d" value="Registrar" class="btn-enviar" required >
					
				</div>
              
                
            </form>
<?php 

// Datos de la base de datos
$usuario = "root";
$password = "";
$servidor = "127.0.0.1:3308";
$basededatos = "empresa";

// creación de la conexión a la base de datos con mysql_connect()
$conexion = mysqli_connect( $servidor, $usuario, "" ) or die ("No se ha podido conectar al servidor de Base de datos");

// Selección del a base de datos a utilizar
$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues va a ser que no se ha podido conectar a la base de datos" );

if(isset($_POST["nombre_producto"]))
{
	   //en esta variable construyo la consulta MySQL para insertar el nuevo usuario
	$insertar = "INSERT INTO compras (InvNombre_Producto, ComNombre_Proveedor, ComCantidad, ComValor) VALUES ('".$_POST["nombre_producto"]."', '".$_POST["proveedor"]."', '".$_POST["cantidad"]."','".$_POST["precio"]."')";
	$resultado_insertar = mysqli_query( $conexion, $insertar ) or die ( "Algo ha ido mal en la consulta a la base de datos");
}

// establecer y realizar consulta. guardamos en variable.
$consulta = "SELECT * FROM compras WHERE 1";
$resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta a la base de datos");

// Motrar el resultado de los registro de la base de datos
// Encabezado de la tabla
echo "<table border='2' width='100%'>";
echo "<tr>";
echo "<th>#</th>";
echo "<th>Nombre Producto</th>";
echo "<th>proveedor</th>";
echo "<th>cantidad</th>";
echo "<th>precio</th>";
echo "</tr>";

// Bucle while que recorre cada registro y muestra cada campo en la tabla.
while ($columna = mysqli_fetch_array( $resultado ))
{
	echo "<tr>";
	echo "<td>" . $columna['Id'] . "</td>";
	echo "<td>" . $columna['InvNombre_Producto'] . "</td>";
	echo "<td>" . $columna['ComNombre_Proveedor'] . "</td>";
	echo "<td>" . $columna['ComCantidad'] . "</td>";
	echo "<td>" . $columna['ComValor'] . "</td>";
	echo "</tr>";
}

echo "</table>"; // Fin de la tabla

// cerrar conexión de base de datos
mysqli_close( $conexion );

?>

	     </div>

    </body>

</html>
