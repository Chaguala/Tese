$(document).ready(function () {
  //Primeiro Nivel
  $('#navegation > li > a').click(function(){
    if ($(this).attr('class') != 'active'){
      $('#navegation li ul').slideUp();
      $(this).next().slideToggle();
      $('#navegation li a').removeClass('active');
      $(this).addClass('active');
    }
  });
  //Segundo Nivel
  $('#navegation > li > ul > li > a').click(function(){
    if ($(this).attr('class') != 'active'){
      $('#navegation > li > ul > li > ul').slideUp();
      $(this).next().slideToggle();
      $('#navegation > li > ul > li > a').removeClass('active');
      $(this).addClass('active');
    }
  });
  
});