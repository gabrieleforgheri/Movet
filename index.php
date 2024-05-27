<!DOCTYPE html>
<html>
<head>
    <title>Login e Registrazione</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Piattaforma Movet</h1>
        <h1 class="text-center mb-4">Login o Registrazione</h1>
        <div class="row">
            <div class="col-md-6">
                <h2>Login</h2>
                <form action="login.php" method="post">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Login</button>
                </form>
            </div>
            <div class="col-md-6">
                <h2>Registrazione</h2>
                <form action="register.php" method="post">
                    <div class="form-group">
                        <label for="nome">Nome:</label>
                        <input type="text" class="form-control" id="nome" name="nome" required>
                    </div>
                    <div class="form-group">
                        <label for="cognome">Cognome:</label>
                        <input type="text" class="form-control" id="cognome" name="cognome" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="cf">Codice Fiscale:</label>
                        <input type="text" class="form-control" id="cf" name="cf" max="16" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-success btn-block">Registrati</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
