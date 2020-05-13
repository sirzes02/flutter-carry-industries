<?php
	require_once("./conexion.php");
	
  $arr = array();
  
	$marca = $_GET['marca'];
  $modelo = $_GET['modelo'];
  $precio = $_GET['precio'];
	$tipo = $_GET['tipo'];
	$usado = $_GET['usado'];
  $correo = $_GET['correo'];
  
  $consulta = conectarModelo::conexion()->query("SELECT * FROM carro");
  $cont;
  $limit = 5;

  if ($marca == "") $limit--;
  if ($modelo == "") $limit--;
  else {
    $modeloL = explode("-", $_GET['modelo'])[0];
    $modeloH = explode("-", $_GET['modelo'])[1];
  }
  if ($precio == "") $limit--;
  else {
    $precioL = explode("-", $_GET['precio'])[0];
    $precioH = explode("-", $_GET['precio'])[1];
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

  if (count($arr) > 0) {
    $consultaUsu = conectarModelo::conexion()->query("SELECT usu_car_rec, usu_cor FROM usuarios");

    while ($usuario = $consultaUsu->fetch(PDO::FETCH_ASSOC))
      if ($usuario['usu_cor'] == $correo) {
        $recomendados = $usuario['usu_car_rec'] != NULL ? $usuario['usu_car_rec'] : "";

        for ($i=0; $i < count($arr); $i++) $recomendados .= $arr[$i]['car_pla']. "-";
        
        conectarModelo::conexion()->query("UPDATE usuarios SET usu_car_rec='$recomendados' WHERE usu_cor = '$correo'");

        break;
      }

  }

	echo json_encode($arr);
?>