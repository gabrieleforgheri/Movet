<!DOCTYPE html>
<html>
<head>
    <title>Prenota Posto</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index.php">Piattaforma Movet</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.php">Visualizza Corse</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="prenota_posto.php">Prenota Posto</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cancella_prenotazione.php">Cancella Prenotazione</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Prenota un Posto</h1>
        <form action="prenota_posto.php" method="post" class="needs-validation" novalidate>
            <div class="form-group">
                <label for="luogoP">Luogo di Partenza:</label>
                <input type="text" class="form-control" id="luogoP" name="luogoP" required>
            </div>
            <div class="form-group">
                <label for="luogoA">Luogo di Arrivo:</label>
                <input type="text" class="form-control" id="luogoA" name="luogoA" required>
            </div>
            <div class="form-group">
                <label for="oraP">Ora di Partenza:</label>
                <input type="time" class="form-control" id="oraP" name="oraP" required>
            </div>
            <div class="form-group">
                <label for="cfPasseggero">CF Passeggero:</label>
                <input type="text" class="form-control" id="cfPasseggero" name="cfPasseggero" required>
            </div>
            <button type="submit" class="btn btn-success btn-block">Prenota</button>
        </form>
        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $luogoP = $_POST['luogoP'];
            $luogoA = $_POST['luogoA'];
            $oraP = $_POST['oraP'];
            $cfPasseggero = $_POST['cfPasseggero'];

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

            // Trova la corsa corrispondente
            $sql = "SELECT * FROM Corsa WHERE luogoP='$luogoP' AND luogoA='$luogoA' AND oraP='$oraP'";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $numCorsa = $row['num'];
                $nFermate = $row['nFermate'];
                $costo = $nFermate * 0.50; // Calcola il costo in base al numero di fermate (0.50€ per fermata)

                // Inserisce il biglietto nel database
                $sql = "INSERT INTO Biglietto (costo, validità, numCorsa, cfPasseggero) VALUES ('$costo', CURDATE(), '$numCorsa', '$cfPasseggero')";
                if ($conn->query($sql) === TRUE) {
                    echo "<div class='alert alert-success mt-4'>Prenotazione effettuata con successo! Costo: €$costo</div>";
                } else {
                    echo "<div class='alert alert-danger mt-4'>Errore: " . $sql . "<br>" . $conn->error . "</div>";
                }
            } else {
                echo "<div class='alert alert-danger mt-4'>Nessuna corsa trovata per la tratta specificata.</div>";
            }

            $conn->close();
        }
        ?>
    </div>
</body>
</html>
