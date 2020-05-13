<?php
	require_once("./conexion.php");
	
  $arr = array();

  $correo = $_GET['correo'];
  
  $consulta = conectarModelo::conexion()->query("SELECT usu_car_rec, usu_cor FROM usuarios");

  while ($usuario = $consulta->fetch(PDO::FETCH_ASSOC))
    if ($usuario['usu_cor'] == $correo) {
      $recomendados = explode("-", $usuario['usu_car_rec']);
      $consultaCar = conectarModelo::conexion()->query("SELECT * FROM carro");

      while ($carro = $consultaCar->fetch(PDO::FETCH_ASSOC))
        for ($i=0; $i < count($recomendados) - 1; $i++) 
          if ($carro['car_pla'] == $recomendados[$i]) {
            array_push($arr, $carro);
            break;
          }
        
      break;
    }

	echo json_encode($arr);
?>