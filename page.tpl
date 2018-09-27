<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>

<head>
  <title>{{title}}</title>
  <link href="https://fonts.googleapis.com/css?family=Romanesco" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/start_page.css">
  <!--link rel='shortcut icon' type='image/x-icon' href='./favicon.ico' /-->
  <link rel="shortcut icon" type='image/x-icon' href="/favicon.ico">

        <script type="text/javascript">
        function codeAddress() {
            aud_play_pause();
        }
        window.onload = codeAddress;
        </script>

</head>

<body>

<!-- Main content -->
    <img src="dura.jpg" alt="Dura Praxis Sed Praxis">

    <h1>{{title}}</h1>

    <p id="desc">

        Quem sera?? Quem apagara o fogo ardente de Engenharia??

        Esta pagina foi criada para testar o sistema de apostas do novo Dux de Engenharia.
        Aposte e ganhe premios, sancoes, colheres, praxi points e ate uma carta de uterino. Vale tudo exeto caloiras. Fica atento para quando forem abertas as votacoes para os novos cavalos do conselho.
      </p>

<audio id="myAudio">
 <source src="/eye.mp3"
         type='audio/mp3'
         autostart="true">
 Your user agent does not support the HTML5 Audio element.

</audio>
<button type="button" onclick="aud_play_pause()">Musica</button>

<h2>⭐️ &nbsp;Candidatos&nbsp; ⭐️ </h2>


<div class="cards">
  {{!cards}}

</div>

<script>
function aud_play_pause() {
  var myAudio = document.getElementById("myAudio");
  if (myAudio.paused) {
    myAudio.play();
  } else {
    myAudio.pause();
  }
}
</script>  

</body>



</html>