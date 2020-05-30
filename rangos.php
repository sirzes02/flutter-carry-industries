<?php
require_once('./conexion.php');

// 1 = modelo
// 2 = precio

$arr = array();

$opc = $_POST['opc'];

$consulta = conectarModelo::conexion()->query('SELECT car_pre, car_mod FROM carro');

while ($carro = $consulta->fetch(PDO::FETCH_ASSOC))
  if ($opc == 1)
    array_push($arr, $carro['car_mod']);
  else
    array_push($arr, $carro['car_pre']);

sort($arr);

echo '{"min":' . $arr[0] . ', "max": ' . $arr[count($arr) - 1] . '}';
