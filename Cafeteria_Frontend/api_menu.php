<?php
header('Content-Type: application/json');
$conn = new mysqli("localhost", "root", "", "cafeteria_db");

// Asegúrate de que los nombres en el SELECT coincidan con los de tu tabla
$query = $conn->query("SELECT id, nombre, descripcion, categoria, precio FROM productos");

$productos = [];
while ($row = $query->fetch_assoc()) {
    $productos[] = $row;
}
echo json_encode($productos);
?>