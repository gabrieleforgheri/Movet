<!DOCTYPE html>
<html>
<head>
    <title>Prenota Posto</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index.php">Prenotazioni Pullman</a>
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
                <label for="cod">Codice Biglietto:</label>
                <input type="text" class="form-control" id="cod" name="cod" required>
            </div>
            <div class="form-group">
                <label for="costo">Costo:</label>
                <input type="text" class="form-control" id="costo" name="costo" required>
            </div>
            <div class="form-group">
                <label for="validita">Validità:</label>
                <input type="date" class="form-control" id="validita" name="validita" required>
            </div>
            <div class="form-group">
                <label for="numCorsa">Numero Corsa:</label>
                <input type="text" class="form-control" id="numCorsa" name="numCorsa" required>
            </div>
            <div class="form-group">
                <label for="cfPasseggero">CF Passeggero:</label>
                <input type="text" class="form-control" id="cfPasseggero" name="cfPasseggero" required>
            </div>
            <button type="submit" class="btn btn-success btn-block">Prenota</button>
        </form>
        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $cod = $_POST['cod'];
            $costo = $_POST['costo'];
            $validita = $_POST['validita'];
            $numCorsa = $_POST['numCorsa'];
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

            $sql = "INSERT INTO Biglietto (cod, costo, validità, numCorsa, cfPasseggero) VALUES ('$cod', '$costo', '$validita', '$numCorsa', '$cfPasseggero')";

            if ($conn->query($sql) === TRUE) {
                echo "<div class='alert alert-success mt-4'>Prenotazione effettuata con successo!</div>";
            } else {
                echo "<div class='alert alert-danger mt-4'>Errore: " . $sql . "<br>" . $conn->error . "</div>";
            }

            $conn->close();
        }
        ?>
    </div>
</body>
</html>
