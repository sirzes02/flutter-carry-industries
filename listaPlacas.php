<?php
  require_once('./conexion.php');
  
  $arr = array();

  $consulta = conectarModelo::conexion()->query('SELECT car_pla FROM carro');

  while ($carro = $consulta->fetch(PDO::FETCH_ASSOC))
    array_push($arr, $carro['car_pla']);

  echo json_encode($arr);
?>