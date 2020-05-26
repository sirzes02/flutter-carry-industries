<?php
  require_once('./conexion.php');

  $consulta = conectarModelo::conexion()->query('SELECT * FROM carro');
  
  $arr = array();

  $usado = $_POST['usado'] == 0; // 0 TRUE - 1 FALSE
  
  while ($carro = $consulta->fetch(PDO::FETCH_ASSOC)){
    if ($usado){
      if ($carro['car_usa'] == 0)
        array_push($arr, $carro);
    } else
      if ($carro['car_usa'] == 1)
        array_push($arr, $carro);
  }

  echo json_encode($arr);
?>