<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>

<head>
  <title>{{title}}</title>
  <link href="https://fonts.googleapis.com/css?family=Romanesco" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/start_page.css">
  <link rel="shortcut icon" type='image/x-icon' href="/favicon.ico">

        <script type="text/javascript">
        function codeAddress() {
            //aud_play_pause();
        }
        window.onload = codeAddress;
        </script>

</head>

<body>

<!-- Main content -->
    <img src="dura.jpg" alt="Dura Praxis Sed Praxis">

    <h1>{{title}}</h1>

    <p id="desc">

        Quem serao?? Quem apagara o fogo ardente de Engenharia??

        Esta pagina foi criada para testar o sistema de apostas dos novos Encavados de Engenharia.
        Aposte e ganhe premios, sancoes, colheres, praxi points e ate uma carta de uterino. Vale tudo exeto caloiras. Fica atento para quando forem abertas as votacoes para os novos cavalos do conselho.
      </p>



<audio id="myAudio">
 <source src="/eye.mp3"
         type='audio/mp3'
         autostart="true">
         
 Your user agent does not support the HTML5 Audio element.

</audio>
<button type="button" onclick="aud_play_pause()">Musica</button>

    <div class="spooky">
      <img src="doot.gif" alt="skeleton" onmouseover="PlaySound('doot')">
      <!--img src="tenor.gif" alt="tenor"-->
      <img src="tpose.gif" alt="tpose" width="220" height="220" onmouseover="PlaySound('nigra')">
      <img src="move.gif" alt="move">
    </div>



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

function PlaySound(soundobj) {
    var thissound=document.getElementById(soundobj);
    thissound.play();
}

</script>  


<audio id='doot' src='/doot.mp3'/>
<audio id='nigra' src='/nigra.mp3'/>

</body>



</html>