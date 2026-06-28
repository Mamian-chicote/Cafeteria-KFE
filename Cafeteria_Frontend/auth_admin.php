<?php
$conn = new mysqli("localhost", "root", "", "cafeteria_db");
$data = json_decode(file_get_contents("php://input"), true);
$correo = $data['correo'];
$pass = $data['password'];

// Buscamos al admin
$stmt = $conn->prepare("SELECT password FROM administradores WHERE correo = ?");
$stmt->bind_param("s", $correo);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $admin = $result->fetch_assoc();
    // DIAGNÓSTICO: ¿Coincide la contraseña plana? (OJO: Solo para prueba)
    if ($pass === 'admin123') { 
        echo json_encode(["status" => "success", "rol" => "admin"]);
    } else {
        echo json_encode(["status" => "error", "message" => "La contraseña que tienes en la BD no coincide con admin123. Hash en BD: " . $admin['password']]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "No se encontró el correo en administradores"]);
}
?>