<?php
  require_once('./conexion.php');

  $id = $_POST['id'];

  $consulta = conectarModelo::conexion()->query('SELECT * FROM carro');

  while ($carro = $consulta->fetch(PDO::FETCH_ASSOC))
    if ($carro["id_car"] == $id){
      echo json_encode($carro);
      return;
    }
  
    echo '{"error": "No existe"}';
?>