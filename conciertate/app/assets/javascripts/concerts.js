// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var indicador=0;

$(document).on('ready',function(){
    $('.left').on('click',function(e)
    {
        e.preventDefault();
        moverSlider('izquierda');
    });
    $('.right').on('click',function(e)
    {
        e.preventDefault();
        moverSlider('derecha');
    });
    definirTamaño();
});

$(window).on('resize',definirTamaño);
function definirTamaño(){

    $('.form_container .slide').each(function(i,el){

        $(el).css({
            'background-image':"url("+$(el).data("background")+")",
            'height':($('.form_container').width()*0.34)+'px',
            'width':($('.form_container').width())+'px'            
        });
        });
    $('.form_container .slideContainer').css({
        'margin-left': -(indicador * $('.form_container').width())+'px'
    });
}

function moverSlider(direccion){
    var limite=$('.form_container .slide').length;
    
    indicador=(direccion=='derecha') ? indicador+1:indicador-1;
    indicador = (indicador >= limite) ? 0: indicador;
    indicador = (indicador < 0) ? limite-1: indicador;

    $('.form_container .slideContainer').animate({
    'margin-left': -(indicador * $('.form_container').width())+'px'
    });

}

function auto(){
intv = setInterval(function(){
$('.right').click();
}, 3000);
}
auto(); // start
$('.form_container').hover(function( e ){
return e.type=='mouseenter'?clearInterval(intv):auto();
});