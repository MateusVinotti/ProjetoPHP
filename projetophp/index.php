<?php
session_start();
require ('CONFIG/db.php');

if (!isset($_SESSION['usuario_id'])) {
    header("Location: login.php");
    exit;
}

$nome_usuario = $_SESSION['nome_usuario'];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['adicionar_treino'])) {
        $nome = $_POST['nome'];
        $descricao = $_POST['descricao'];
        $criador_id = $_SESSION['usuario_id'];

        $stmt = $conn->prepare("INSERT INTO treinos (nome, descricao, criador_id) VALUES (?, ?, ?)");
        $stmt->bind_param("ssi", $nome, $descricao, $criador_id);

        if ($stmt->execute()) {
            echo "<p>Treino adicionado com sucesso!</p>";
        } else {
            echo "<p>Erro ao adicionar treino: " . $stmt->error . "</p>";
        }
    } elseif (isset($_POST['limpar_lista'])) {
        $conn->query("DELETE FROM treinos");
        echo "<p>Lista de treinos foi limpa!</p>";
        echo "<meta http-equiv='refresh' content='0'>";
    }
}

$result = $conn->query("SELECT id, nome, descricao FROM treinos");
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <title>Lista de Treinos</title>
  <link rel="stylesheet" href="CSS/styles.css">
</head>

<body>
  <header>
    <div class="logo">
      <h1>TechAkademie</h1>
    </div>
    <div class="hi_user">
      <h2 class="user">Bem-vindo, <?php echo htmlspecialchars($nome_usuario); ?></h2>
      <h2><a href="logout.php">Sair</a></h2>
    </div>
  </header>

  <div class="add_treino">
    <h2>Adicionar Novo Treino</h2>
    <form action="index.php" method="post">
      <p>Nome do Treino</p>
      <input type="text" name="nome" required><br>
      <p>Descrição</p>
      <textarea name="descricao" required></textarea><br>
      <button type="submit" name="adicionar_treino">Adicionar Treino</button>
    </form>
  </div>
  <div class="list_treino">
    <h2>Lista de Treinos</h2>
    <ul>
      <?php while ($row = $result->fetch_assoc()): ?>
      <li>
        <strong><?php echo htmlspecialchars($row['nome']); ?></strong>
        <p><?php echo htmlspecialchars($row['descricao']); ?></p>
      </li>
      <?php endwhile; ?>
    </ul>

    <form action="index.php" method="post">
      <button type="submit" name="limpar_lista">Limpar Lista de Treinos</button>
    </form>
  </div>

</body>

</html>