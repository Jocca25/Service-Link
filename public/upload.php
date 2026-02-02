<?php
$diretorio = "uploads/";
$ficheiro = $diretorio . basename($_FILES["foto"]["name"]);

if (move_uploaded_file($_FILES["foto"]["tmp_name"], $ficheiro)) {
    echo "Upload com sucesso!<br>";
    echo "<img src='$ficheiro' width='200'>";
} else {
    echo "Erro no upload.";
}
?>