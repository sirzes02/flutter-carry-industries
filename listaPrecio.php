<?php
  require_once('./conexion.php');
  
  $arr = array();

  $consulta = conectarModelo::conexion()->query('SELECT car_pre FROM carro');

  while ($carro = $consulta->fetch(PDO::FETCH_ASSOC))
    array_push($arr, $carro['car_pre']);

  echo json_encode(array_values(array_unique($arr)));
?>