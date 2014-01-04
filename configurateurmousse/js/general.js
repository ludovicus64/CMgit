var couleur_coussin="";

function remplirChampAvecValeur(champ,valeur){
	var champElement=$('#'+champ);
	champElement.val(valeur);
}

function cocherBoutonRadioAvecId(id){
	$('#'+id).attr('checked','checked');
}

function deroulerDivAvecId(id){
	if($('#'+id).css("display")=="none"){
		$('#usage1').css( "display","none");
		$('#usage2').css( "display","none");
		$('#usage3').css( "display","none");
		$('#usage4').css( "display","none");
		$('#'+id).css( "display","block");
  	}
  	else{
  		$('#usage1').css( "display","none");
		$('#usage2').css( "display","none");
		$('#usage3').css( "display","none");
		$('#usage4').css( "display","none");
  		$('#'+id).css( "display","none");
  	}
}

function selecterCouleurFondAvecId(id,couleur){
	$('#'+id).css( "background-color",couleur);
	couleur_coussin=couleur;
	$('#couleur_form_input').val(couleur);
}