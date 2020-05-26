<?php
  require_once('./conexion.php');
  
  $arr = array();

  $consulta = conectarModelo::conexion()->query('SELECT car_mod FROM carro');

  while ($carro = $consulta->fetch(PDO::FETCH_ASSOC))
    array_push($arr, $carro['car_mod']);

  echo json_encode(array_unique($arr));
?>