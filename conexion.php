<?php
  class conectarModelo{
    public static function conexion(){
      try {
        $conexion = new PDO('mysql:host=localhost; dbname=proyecto', "root", "");
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $conexion->exec("SET CHARACTER SET UTF8");
      } catch (exception $e) {
        die("ERROR: ". $e->getMessage());
        echo "Linea de error: ". $e->getLine();
      }
      return $conexion;
    }
  }
?>