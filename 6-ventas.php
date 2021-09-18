<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>Ventas</title>
        <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maxium-scale=3.0, minimum-scale=1.0">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
        <link rel="stylesheet" href="css/master.css">
    </head>
    <body id="login" >

        <div class="formulario-box">
            <img class="avatar" src="img/logo.jpg" alt="Logo de Vander">
            <h1>Ventas</h1>
            <form action="6-ventas.php" method="POST">
                <!-- USERNAME -->
				<div class="my-form">
					<label for="fecha">Fecha</label>                
					<input type="date" placeholder="Diligencía aquí" name="fecha" id="fecha" >
				</div>
				
				<div class="my-form">
					<label for="hora">Hora</label>
					<input type="time" placeholder="Diligencía aquí" name="hora" id="hora" >
				</div>

				<div class="my-form">
					<label for="valor">Valor</label>                
					<input type="number" placeholder="Diligencía aquí" name="valor" id="valor" >
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

    $conexion = mysqli_connect($servidor, $usuario, "") or die ("No se ha podido conectar al servidor de base de datos");

    $db = mysqli_select_db($conexion, $basededatos) or die ("Upps! Pues va a ser que no se ha podido conectar a la base de datos");

    if(isset($_POST["valor"]))
    {
        $insertar = "INSERT INTO ventas ( VenFecha, VenHora, VenValor) VALUES ('".$_POST["Fecha"]."', '".$_POST["Hora"]."','".$_POST["Valor"]."'),";
        $resultado_insertar = mysqli_query($conexion, $insertar) or die ("Algo ha ido mal en la consulta a la base de datos");
    }

    $consulta = "SELECT *FROM ventas where 1";
    $resultado = mysqli_query($conexion, $consulta) or die ("Algo ha ido mal en la consulta a la base de datos ");

    echo "<table border='2' width='100%'>";
    echo "<tr>";
    echo "<th>fecha</th>";
    echo "<th>Hora</th>";
    echo "<th>valor</th>";
	echo "</tr>";

    while ($columna = mysqli_fetch_array( $resultado))
    {
        echo "<tr>";
        echo "<td>" . $columna['VenFecha']. "</td>";
        echo "<td>" . $columna['VenHora']. "</td>";
        echo "<td>" . $columna['VenValor']. "</td>";
        echo "</tr>";
    }

    echo "</table>";

    mysqli_close($conexion);

?>
        </div>

    </body>
</html>