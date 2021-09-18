<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>Login Vander</title>
        <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maxium-scale=3.0, minimum-scale=1.0">
       <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
        <link rel="stylesheet" href="css/master.css">
    </head>
    <body id="login" >
        <div class="login-box">
            <img class="avatar" src="img/logo.jpg" alt="Logo de Vander">
            <h1> Ingreso Usuario</h1>
            <form action="1-login.php" method="POST">
                <!-- USERNAME -->
                <label for="username"><?php echo "usuario"; ?></label>
                <i class="fas fa-user"></i>
                <input type="int" name="usuario" placeholder="" required >

                <!-- Password -->
                <label for="password"><?php echo "contraseña"; ?></label>
                <i class="fas fa-key icon"></i>
                <input type="password" name="micontrasenia" placeholder="" required >

                <input type="submit" value="Log in">

                <a href="#"><?php echo "olvidaste tu contraseña"; ?></a>
            </form>


        </div>

    </body>
                
</html>


<?php

if(isset($_POST["usuario"]) && isset($_POST["micontrasenia"]))
{
    $usuario = "root";
	$password = "";
    $servidor = "127.0.0.1:3308";
	$basededatos = "empresa";
	
	// creación de la conexión a la base de datos con mysql_connect()
	$conexion = mysqli_connect( $servidor, $usuario, "" ) or die ("No se ha podido conectar al servidor de Base de datos");
	
	// Selección del a base de datos a utilizar
	$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues va a ser que no se ha podido conectar a la base de datos" );

	// establecer y realizar consulta. guardamos en variable.
	$consulta = "SELECT * FROM login WHERE Usuario = '".$_POST["usuario"]."' and Password = '".$_POST["micontrasenia"]."'";
	$resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta a la base de datos");

    $esUsuarioValido = false;

    while ($columna = mysqli_fetch_array( $resultado ))
    {
        $esUsuarioValido = true;
    }

    if($esUsuarioValido == true)
    {
        header("Location: 2-Menu.php");
        exit;
    }
    else
    {
        echo "<script>alert('Usuario o password invalido.')</script>";
    }
}


?>

