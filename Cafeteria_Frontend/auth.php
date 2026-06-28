<?php
$conn = new mysqli("localhost", "root", "", "cafeteria_db");
$data = json_decode(file_get_contents("php://input"), true);
$correo = $data['correo'];
$pass = $data['password'];

// 1. Intentar buscar en administradores
$stmt = $conn->prepare("SELECT password FROM administradores WHERE correo = ?");
$stmt->bind_param("s", $correo);
$stmt->execute();
$admin = $stmt->get_result()->fetch_assoc();

if ($admin && password_verify($pass, $admin['password'])) {
    echo json_encode(["status" => "success", "rol" => "admin"]);
    exit;
}

// 2. BUSCAR EN ESTUDIANTES (Esto es lo que permite que el alumno entre)
$stmt = $conn->prepare("SELECT password FROM estudiantes WHERE correo = ?");
$stmt->bind_param("s", $correo);
$stmt->execute();
$estudiante = $stmt->get_result()->fetch_assoc();

if ($estudiante && password_verify($pass, $estudiante['password'])) {
    echo json_encode(["status" => "success", "rol" => "estudiante"]);
    exit;
}

// 3. Si no está en ninguna de las dos
echo json_encode(["status" => "error", "message" => "Correo o contraseña incorrectos"]);
?>