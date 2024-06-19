<?php
session_start();
require ('CONFIG/db.php');

$mensagem = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome_usuario = $_POST['nome_usuario'];
    $senha = password_hash($_POST['senha'], PASSWORD_BCRYPT);

    $stmt = $conn->prepare("INSERT INTO usuarios (nome_usuario, senha) VALUES (?, ?)");
    $stmt->bind_param("ss", $nome_usuario, $senha);

    if ($stmt->execute()) {
        $mensagem = "Usuário registrado com sucesso!";
    } else {
        $mensagem = "Erro: " . $stmt->error;
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <title>Registrar</title>
  <link rel="stylesheet" href="CSS/styles.css">
</head>

<body>
  <header>
    <div class="logo">
      <h1>TechAkademie</h1>
    </div>
  </header>
  <div class="form_login">
    <h1>Registrar</h1>
    <form action="registro.php" method="post">
      <p>Nome de usuário</p><input type="text" name="nome_usuario" required><br>
      <p>Senha</p><input type="password" name="senha" required><br>
      <button type="submit">Registrar</button>
    </form>
    <?php echo $mensagem; ?>
    <p><a href="login.php">Voltar para Login</a></p>
  </div>
</body>

</html>