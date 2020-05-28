<?php
	require_once("./conexion.php");
	
  $arr = array();
  
	$marca = $_POST['marca'];
  $modelo = $_POST['modelo'];
  $precio = $_POST['precio'];
	$tipo = $_POST['tipo'];
	$usado = $_POST['usado'];
  $correo = $_POST['correo'];
  
  $consulta = conectarModelo::conexion()->query("SELECT * FROM carro");
  $cont;
  $limit = 5;

  if ($marca == "") $limit--;
  if ($modelo == "") $limit--;
  else {
    $modeloL = explode("-", $_POST['modelo'])[0];
    $modeloH = explode("-", $_POST['modelo'])[1];
  }
  if ($precio == "") $limit--;
  else {
    $precioL = explode("-", $_POST['precio'])[0];
    $precioH = explode("-", $_POST['precio'])[1];
  }
  if ($tipo == "") $limit--;
  if ($usado == "") $limit--;

  if ($limit > 0)
    while ($carro = $consulta->fetch(PDO::FETCH_ASSOC)){
      $cont = 0;

      if ($marca != "" && $carro['car_mar'] == $marca) $cont++;     
      if ($modelo != "" && $carro['car_mod'] >= $modeloL && $carro['car_mod'] <= $modeloH) $cont++;
      if ($precio != "" && $carro['car_pre'] >= $precioL && $carro['car_pre'] <= $precioH) $cont++;
      if ($tipo != "" && $carro['car_tip'] == $tipo) $cont++;
      if ($usado != "" && $carro['car_usa'] == $usado) $cont++;

      if ($cont == $limit) array_push($arr, $carro);
    }

	echo json_encode($arr);
?>