<?php
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
    $nome = $_POST['nome'];
    $cognome = $_POST['cognome'];
    $email = $_POST['email'];
    $cf = $_POST['cf'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $sql = "INSERT INTO Passeggero (cf, nome, cognome, email, password) VALUES ('$cf', '$nome', '$cognome', '$email', '$password')";

    if ($conn->query($sql) === TRUE) {
        echo "<div class='alert alert-success mt-4'>Registrazione effettuata con successo! <a href='index.php'>Accedi ora</a></div>";
    } else {
        echo "<div class='alert alert-danger mt-4'>Errore: " . $sql . "<br>" . $conn->error . "</div>";
    }
}

$conn->close();
?>
