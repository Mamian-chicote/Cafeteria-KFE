<?php
$conn = new mysqli("localhost", "root", "", "cafeteria_db");
$data = json_decode(file_get_contents("php://input"), true);

$stmt = $conn->prepare("DELETE FROM productos WHERE id=?");
$stmt->bind_param("i", $data['id']);

if ($stmt->execute()) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error"]);
}
?>