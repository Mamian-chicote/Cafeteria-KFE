<?php
$conn = new mysqli("localhost", "root", "", "cafeteria_db");

$data = json_decode(file_get_contents("php://input"), true);

// ... después de recibir los datos con json_decode
$nombre = $data['nombre'];
$productos = $data['productos'];
$total = $data['total'];
$metodo = $data['metodo']; // Recibimos el nuevo campo desde JS

// Actualizamos el INSERT para incluir la nueva columna
$stmt = $conn->prepare("INSERT INTO pedidos (nombre_cliente, productos, total, metodo_pago) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssds", $nombre, $productos, $total, $metodo);

if ($stmt->execute()) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error", "message" => $conn->error]);
}
$conn->close();
?>