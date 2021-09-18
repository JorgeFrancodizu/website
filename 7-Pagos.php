<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>Pagos</title>
        <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maxium-scale=3.0, minimum-scale=1.0">
       <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
        <link rel="stylesheet" href="css/master.css">
    </head>
    <body id="login" >

        <div class="formulario-box">
            <img class="avatar" src="img/logo.jpg" alt="Logo de Vander">
            <h1>Pagos</h1>
            <form>
                <!-- USERNAME -->
				<div class="my-form">
					<label for="nombre_cliente">Nombre Cliente</label>                
					<input type="text" placeholder="Diligencía aquí" name="nombre_cliente" id="nombre_cliente" >
				</div>
				
				<div class="my-form">
					<label for="forma_pago">Forma Pago</label>                
					<select name="forma_pago" id="forma_pago">
						<option value="">--</option>
						<option value="1">Efectivo</option>
						<option value="2">Tarjeta Crédito</option>
						<option value="3">Transferencía</option>
					</select>
				</div>
				
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
$usuario ="root";
$password ="";
$servidor = "127.0.0.1:3308";
$basededatos ="empresa";

$conexion = mysqli_connect( $servidor, $usuario, "" ) or die ("No se ha podido conectar al servidor de Base de datos");

$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues va a ser que no se ha podido conectar a la base de datos" );

if(isset(_POST["nombre_cliente"]))
{
	$insertar = "INSERT TO pagos (Pagid, Pagnombre_cliente, Pagvalor, Pagfecha) values ('".$_POST[""]
}


		?>
        </div>

    </body>
</html>