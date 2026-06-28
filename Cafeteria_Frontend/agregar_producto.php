<?php
header('Content-Type: application/json');
$conn = new mysqli("localhost", "root", "", "cafeteria_db");
$data = json_decode(file_get_contents("php://input"), true);

// Verificamos que los datos lleguen correctamente
$stmt = $conn->prepare("INSERT INTO productos (nombre, descripcion, categoria, precio) VALUES (?, ?, ?, ?)");
$stmt->bind_param("sssd", $data['nombre'], $data['descripcion'], $data['categoria'], $data['precio']);

if ($stmt->execute()) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error", "message" => $conn->error]);
}
?>