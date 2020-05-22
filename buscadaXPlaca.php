<?php
  require_once('./conexion.php');

  $placa = $_POST['placa'];

  $consulta = conectarModelo::conexion()->query('SELECT * FROM carro');

  while ($carro = $consulta->fetch(PDO::FETCH_ASSOC))
    if ($carro["car_pla"] == $placa){
      echo json_encode($carro);
      return;
    }
  
    echo '{"error": "No existe"}';
?>