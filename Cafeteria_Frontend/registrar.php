<?php
$conn = new mysqli("localhost", "root", "", "cafeteria_db");
$data = json_decode(file_get_contents("php://input"), true);

$nombre = $data['nombre'];
$correo = $data['correo'];
// Hasheamos la contraseña para que sea segura
$pass = password_hash($data['password'], PASSWORD_DEFAULT); 

$stmt = $conn->prepare("INSERT INTO estudiantes (nombre, correo, password) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $nombre, $correo, $pass);

if ($stmt->execute()) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error", "message" => "El correo ya está registrado."]);
}
?>