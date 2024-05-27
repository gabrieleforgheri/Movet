<?php
session_start();

if (!isset($_SESSION['cf'])) {
    header("Location: index.php");
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Cancella Prenotazione</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="home.php">Piattaforma Movet</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="home.php">Visualizza Corse</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="prenota_posto.php">Prenota Posto</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="cancella_prenotazione.php">Cancella Prenotazione</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.php">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Cancella una Prenotazione</h1>
        <form action="cancella_prenotazione.php" method="post" class="needs-validation" novalidate>
            <div class="form-group">
                <label for="cod">Codice Biglietto:</label>
                <input type="text" class="form-control" id="cod" name="cod" required>
            </div>
            <button type="submit" class="btn btn-danger btn-block">Cancella</button>
        </form>
        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $cod = $_POST['cod'];

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

            $sql = "DELETE FROM Biglietto WHERE cod='$cod'";

            if ($conn->query($sql) === TRUE) {
                echo "<div class='alert alert-success mt-4'>Prenotazione cancellata con successo!</div>";
            } else {
                echo "<div class='alert alert-danger mt-4'>Errore: " . $sql . "<br>" . $conn->error . "</div>";
            }

            $conn->close();
        }
        ?>
    </div>
</body>
</html>
