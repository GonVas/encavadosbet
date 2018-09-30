<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>

<head>
  <title>Apostas Encavados</title>
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


{{!topbar}}

    <img src="dura.jpg" alt="Dura Praxis Sed Praxis">

    <h1>Apostas Encavados</h1>

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


 <!-- Trigger/Open The Modal -->
<button id="myBtn">Open Modal</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content" >
    <span class="close" onclick="modal_block()">&times;</span>
     <form action="/login" method="post">
            username: <input name="username" type="text" />
            &nbsp;password: <input name="password" type="password" />
            <input value="Login" type="submit" />
    </form>
  </div>

</div> 


<!-- The Modal -->
<div id="registermodal" class="modal">

  <!-- Modal content -->
  <div class="modal-content" >
    <span class="close" onclick="modal_block()">&times;</span>
     <form action="/login" method="post">
            Nome: <input name="name" type="text" />
            Username: <input name="username" type="text" />
            &nbsp;password: <input name="password" type="password" />
            &nbsp;password outra vez: <input name="pass_outravez" type="password" />
            <input type="file" name="pic" accept="image/*">
            <input value="Login" type="submit" />
    </form>
  </div>

</div> 


    <div class="spooky">
      <img src="doot.gif" class="floatl" alt="skeleton" onmouseover="PlaySound('doot')">
      <!--img src="tenor.gif" alt="tenor"-->
      <img src="tpose.gif" class="floatr" alt="tpose" width="220" height="220" onmouseover="PlaySound('nigra')">
      <!--img src="move.gif" alt="move"-->
      <h2>⭐️ &nbsp;Candidatos&nbsp; ⭐️ </h2>
    </div>



<h2> &nbsp; </h2>


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



// Get the modal
var modal = document.getElementById('myModal');

// Get the modal
var registermodal = document.getElementById('registermodal');

// Get the button that opens the modal
//var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function() {
    modal.style.display = "block";
}

function login_click(){
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
a.onclick = function() {
    modal.style.display = "none";
}

function modal_block(){
modal.style.display = "none";
}
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
} 


</script>  


<audio id='doot' src='/doot.mp3'/>
<audio id='nigra' src='/nigra.mp3'/>

</body>



</html>