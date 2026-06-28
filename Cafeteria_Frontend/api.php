<?php
header('Content-Type: application/json');
$conn = new mysqli("localhost", "root", "", "cafeteria_db");

if ($conn->connect_error) die("Error de conexión");

$result = $conn->query("SELECT * FROM productos");
$productos = $result->fetch_all(MYSQLI_ASSOC);

echo json_encode($productos);
$conn->close();
?>