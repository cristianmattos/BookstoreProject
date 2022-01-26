<! DOCTYPE HTML>
<html lang="pt-br"> <!-- indicando a linguagem que iremos usar no codigo html -->
<head>
<title>teste</title>
<meta charset="utf-8"> <!-- indicando o sistema de caractere utf-8 -->


</head>
<body>
    <?php 
    include 'conexao.php';
    // Variavel consulta vai receber vareiavel $cn que receberá o resultado de query
    $consulta = $cn->query('select * from vw_livro');

    // Variavel $exibe receberá o resultado da consulta em forma de uma matriz tabela
    while($exibe = $consulta->fetch(PDO::FETCH_ASSOC))
    {

        echo $exibe['nm_livro'].'<br>';
        echo $exibe['vl_preco'].'<br>';
        echo $exibe['ds_categoria'].'<br>';
        echo '<hr>';
    }
    ?>

</body>
</html>