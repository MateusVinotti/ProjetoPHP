<?php
session_start();
require ('CONFIG/db.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome_usuario = $_POST['nome_usuario'];
    $senha = $_POST['senha'];

    $stmt = $conn->prepare("SELECT id, senha FROM usuarios WHERE nome_usuario = ?");
    $stmt->bind_param("s", $nome_usuario);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($id, $senha_hashed);

    if ($stmt->num_rows > 0 && $stmt->fetch() && password_verify($senha, $senha_hashed)) {
        $_SESSION['usuario_id'] = $id;
        $_SESSION['nome_usuario'] = $nome_usuario;
        header("Location: index.php");
    } else {
        echo "Credenciais inválidas.";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link rel="stylesheet" href="CSS/styles.css">
</head>

<body>
  <header>
    <div class="logo">
      <h1>TechAkademie</h1>
    </div>
  </header>
  <div class="form_login">
    <h1>Login</h1>

    <form action="login.php" method="post">
      <p>Nome de usuário</p>
      <input type="text" name="nome_usuario" required><br>
      <p>Senha</p>
      <input type="password" name="senha" required><br>
      <button type="submit">Entrar</button>
    </form>
    <p><a href="registro.php">Cadastre-se</a></p>
  </div>
</body>

</html>