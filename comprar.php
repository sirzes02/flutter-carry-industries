<?php
require_once('./conexion.php');

$id = $_POST['id'];
$placa = $_POST['placa'];
$correo = $_POST['correo'];

$consulta = conectarModelo::conexion()->query('SELECT * FROM carro');

while ($carro = $consulta->fetch(PDO::FETCH_ASSOC))
  if ($carro["id_car"] == $id) {
    conectarModelo::conexion()->query("UPDATE carro SET car_pla='$placa' WHERE id_car = '$id'");


    $consultaUsu = conectarModelo::conexion()->query("SELECT usu_car_rec, usu_cor FROM usuarios");

    while ($usuario = $consultaUsu->fetch(PDO::FETCH_ASSOC))
      if ($usuario['usu_cor'] == $correo) {
        $recomendados = $usuario['usu_car_rec'] != NULL ? $usuario['usu_car_rec'] : "";

        $recomendados .= $id . "-";

        conectarModelo::conexion()->query("UPDATE usuarios SET usu_car_rec='$recomendados' WHERE usu_cor = '$correo'");

        break;
      }

    echo '{"proceso": "correcto"}';
    return;
  }

echo '{"error": "No existe"}';
