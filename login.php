<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "Movet";

// Crea connessione
$conn = new mysqli($servername, $username, $password, $dbname);

// Controlla connessione
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM Passeggero WHERE email='$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            $_SESSION['cf'] = $row['cf'];
            $_SESSION['nome'] = $row['nome'];
            header("Location: home.php");
        } else {
            echo "<div class='alert alert-danger mt-4'>Password errata.</div>";
        }
    } else {
        echo "<div class='alert alert-danger mt-4'>Email non trovata.</div>";
    }
}

$conn->close();
?>
