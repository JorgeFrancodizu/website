<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>Empleados</title>
        <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maxium-scale=3.0, minimum-scale=1.0">
       <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
        <link rel="stylesheet" href="css/master.css">
    </head>
    <body id="login" >

        <div class="formulario-box">
            <img class="avatar" src="img/logo.jpg" alt="Logo de Vander">
            <h1>Empleados</h1>
            <form action="3-empleados.php" method="POST">
                <!-- USERNAME -->
				<div class="my-form">
					<label for="numero_identificacion">Número Identificación</label>                
					<input type="text" placeholder="Diligencía aquí" name="numero_identificacion" id="numero_identificacion" >
				</div>
				
				<div class="my-form">
					<label for="nombre_empleado">Nombre Empleado</label>                
					<input type="text" placeholder="Diligencía aquí" name="nombre_empleado" id="nombre_empleado" >
				</div>

				<div class="my-form">
					<label for="area">Area</label>                
					<input type="text" placeholder="Diligencía aquí" name="area" id="area" >
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

    if(isset($_POST["nombre_empleado"]))
    {
           //en esta variable construyo la consulta MySQL para insertar el nuevo usuario
        $insertar = "INSERT INTO empleados (EmpNumero_Identificacion, EmpNombre, EmpArea ) VALUES ('".$_POST["numero_identificacion"]."', '".$_POST["nombre_empleado"]."', '".$_POST["area"]."')";
        $resultado_insertar = mysqli_query( $conexion, $insertar ) or die ( "Algo ha ido mal en la consulta a la base de datos");
    }

	// establecer y realizar consulta. guardamos en variable.
	$consulta = "SELECT * FROM empleados WHERE 1";
	$resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta a la base de datos");
	
	// Motrar el resultado de los registro de la base de datos
	// Encabezado de la tabla
	echo "<table border='2' width='100%'>";
	echo "<tr>";
	echo "<th>#</th>";
	echo "<th>Identificación</th>";
    echo "<th>Nombre Completo</th>";
    echo "<th>Area</th>";
	echo "</tr>";
	
	// Bucle while que recorre cada registro y muestra cada campo en la tabla.
	while ($columna = mysqli_fetch_array( $resultado ))
	{
		echo "<tr>";
		echo "<td>" . $columna['EmpID'] . "</td>";
        echo "<td>" . $columna['EmpNumero_Identificacion'] . "</td>";
        echo "<td>" . $columna['EmpNombre'] . "</td>";
        echo "<td>" . $columna['EmpArea'] . "</td>";
		echo "</tr>";
	}
	
	echo "</table>"; // Fin de la tabla

	// cerrar conexión de base de datos
	mysqli_close( $conexion );

?>

        </div>

    </body>
</html>

