<?php
class conectarModelo
{

  function __construct()
  {
    header('Access-Control-Allow-Origin: *');
    header(
      "Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method"
    );
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
    header("Allow: GET, POST, OPTIONS, PUT, DELETE");
  }

  public static function conexion()
  {
    try {
      $conexion = new PDO('mysql:host=localhost; dbname=proyecto', "root", "");
      $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $conexion->exec("SET CHARACTER SET UTF8");
    } catch (exception $e) {
      die("ERROR: " . $e->getMessage());
      echo "Linea de error: " . $e->getLine();
    }
    return $conexion;
  }
}
