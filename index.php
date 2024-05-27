<!DOCTYPE html>
<html>
<head>
    <title>Visualizza Corse</title>
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
                <li class="nav-item active">
                    <a class="nav-link" href="index.php">Visualizza Corse</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="prenota_posto.php">Prenota Posto</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cancella_prenotazione.php">Cancella Prenotazione</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Corse Disponibili</h1>
        
        <!-- Form di Ricerca -->
        <form method="GET" action="index.php" class="mb-4">
            <div class="form-row">
                <div class="col-md-4 mb-3">
                    <input type="text" class="form-control" name="luogoP" placeholder="Luogo di Partenza">
                </div>
                <div class="col-md-4 mb-3">
                    <input type="text" class="form-control" name="luogoA" placeholder="Luogo di Arrivo">
                </div>
                <div class="col-md-4 mb-3">
                    <input type="time" class="form-control" name="oraP" placeholder="Ora di Partenza">
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Cerca</button>
        </form>

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

        // Costruzione della query di ricerca
        $sql = "SELECT * FROM Corsa WHERE 1=1";
        if (!empty($_GET['luogoP'])) {
            $luogoP = $_GET['luogoP'];
            $sql .= " AND luogoP LIKE '%$luogoP%'";
        }
        if (!empty($_GET['luogoA'])) {
            $luogoA = $_GET['luogoA'];
            $sql .= " AND luogoA LIKE '%$luogoA%'";
        }
        if (!empty($_GET['oraP'])) {
            $oraP = $_GET['oraP'];
            $sql .= " AND oraP = '$oraP'";
        }

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo "<table class='table table-striped'><tr><th>Numero</th><th>Ora Partenza</th><th>Ora Arrivo</th><th>Luogo Partenza</th><th>Luogo Arrivo</th><th>Numero Fermate</th></tr>";
            while($row = $result->fetch_assoc()) {
                echo "<tr><td>" . $row["num"]. "</td><td>" . $row["oraP"]. "</td><td>" . $row["oraA"]. "</td><td>" . $row["luogoP"]. "</td><td>" . $row["luogoA"]. "</td><td>" . $row["nFermate"]. "</td></tr>";
            }
            echo "</table>";
        } else {
            echo "<p class='text-center'>Nessuna corsa trovata.</p>";
        }
        $conn->close();
        ?>
    </div>
</body>
</html>
