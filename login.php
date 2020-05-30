<?php
require_once("./conexion.php");

$arr = array('status' => NULL, 'usuario' => NULL);

$correo = strtolower($_POST['correo']);
$contra = $_POST['contra'];

$consulta = conectarModelo::conexion()->query("SELECT * FROM usuarios");

while ($usuario = $consulta->fetch(PDO::FETCH_ASSOC))
  if (strtolower($usuario['usu_cor']) == $correo && $usuario['usu_pas'] == $contra) {
    $arr['status'] = true;
    $arr['usuario'] = $usuario;
    echo json_encode($arr);
    return;
  }

$arr['status'] = false;
echo json_encode($arr);
