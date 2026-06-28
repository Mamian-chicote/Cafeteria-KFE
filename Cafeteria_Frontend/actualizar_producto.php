<?php
$conn = new mysqli("localhost", "root", "", "cafeteria_db");
$data = json_decode(file_get_contents("php://input"), true);

// Preparamos el UPDATE basándonos en tu tabla productos
$stmt = $conn->prepare("UPDATE productos SET nombre=?, descripcion=?, categoria=?, precio=? WHERE id=?");
$stmt->bind_param("sssdi", $data['nombre'], $data['descripcion'], $data['categoria'], $data['precio'], $data['id']);

if ($stmt->execute()) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error", "message" => $conn->error]);
}
?>