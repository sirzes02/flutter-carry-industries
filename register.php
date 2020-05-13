<?php
	require_once("./conexion.php");
	
	$arr = array('status' => false, 'problem' => NULL);
	$bandera = false;

	$correo = $_GET['correo'];
	$nombre = $_GET['nombre'];
	$apellido = $_GET['apellido'];
	$telefono = $_GET['telefono'];
	$direccion = $_GET['direccion'];
	$contra = $_GET['contra'];
	$contraV = $_GET['contraV'];

	if ($correo != "") {
		$consulta = conectarModelo::conexion()->query("SELECT usu_cor FROM usuarios");

		while ($usuario = $consulta->fetch(PDO::FETCH_ASSOC))
			if ($usuario['usu_cor'] == $correo){
				$bandera = true;
				break;
			}

		if (!$bandera) {
			if (strlen($contra) >= 4 && strlen($contraV) >= 4) {
				if ($contra == $contraV) {
					conectarModelo::conexion()->query("INSERT INTO usuarios VALUES('$correo', '$nombre', '$apellido', '$telefono', '$direccion', '$contra', NULL)");
					$arr['status'] = true;
				} else $arr['problem'] = "Las contraseñas no son iguales";
			} else $arr['problem'] = "La contrasenia debe tener 4 o mas digitos";
		} else $arr['problem'] = "Este correo ya se encuentra registrado";
	} else $arr['problem'] = "Correo esta vacio";

	echo json_encode($arr);
?>