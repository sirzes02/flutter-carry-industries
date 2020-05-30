<?php
require_once("./conexion.php");

$arr = array('status' => false, 'problem' => null, 'respuesta' => null);

$placa = $_POST['placa'];

if (strlen($placa) == 6) {
  $aux = array('placa' => null, 'marca' => null, 'modelo' => null, 'precio' => null, 'tipo' => null);
  $aux['placa'] = $_POST['placa'];
  $aux['marca'] = $_POST['marca'];
  $aux['modelo'] = $_POST['modelo'];
  $aux['precio'] = $_POST['precio'];
  $aux['tipo'] = $_POST['tipo'];
  $arr['status'] = true;
  $arr['respuesta'] = $aux;
} else $arr['problem'] = "La placa no es real.";

echo json_encode($arr);
