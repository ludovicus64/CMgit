<!-- grande barre noire 
<div style="position:relative;background-color:#000;height:110px;width:100%;text-align:center;color:#fff;font-size:40px;font-family:"HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;">
	<br/><br/>
	<span style="margin:10px;">Créez <font color="#38c1cf">votre Confort !</font></span>
	
	<div style="position:absolute;bottom:7px;left:0px;width:100%;text-align:center;">
		<img src="{$modules_dir}/configurateurmousse/img/devise.png" width="780"/>
	</div>
</div>
fin de la grande barre noire -->


<!-- barre fine grise foncée 
<div style="position:relative;background-color:#a3a3a3;height:4px;width:100%;">
</div>
 fin de la barre fine grise foncée -->

<!-- barre grosse gris clair 
<div style="position:relative;background-color:#e1e1e1;height:100px;width:100%;text-align:center;">
	<center>
		<div style="color:#000;display: table-cell;vertical-align:middle;height:100px;width:800px;margin-left:auto;margin-right:auto;">
			<div style="font-size:15px;display: table-cell;height:100%;width:100%;">
				<i>{$header_texte_1}</i>
			</div>
		</div>
	</center>
</div>
 fin de la barre grosse gris clair -->

<div class="big_frame">


<br/>

{if !isset($smarty.get.etape)}

<h1>Veuillez choisir la forme de votre coussin</h1>
Veuillez cliquer sur la forme de votre coussin
<form action="?etape=dimensions" method="POST" id="forme_coussins" style="text-align:center;">
	
	<ul>
		<li><input type="submit" name="forme_carre" value="" style="background:url({$modules_dir}configurateurmousse/img/coussin/formes/carre.png)"><br/>Coussin Carré</li>
		<li><input type="submit" name="forme_rect" value="" style="background:url({$modules_dir}configurateurmousse/img/coussin/formes/rectangle.png)"><br/>Coussin Rectangulaire</li>
		<li><input type="submit" name="forme_rond" value="" style="background:url({$modules_dir}configurateurmousse/img/coussin/formes/rond.png)"><br/>Coussin Rond</li>
		<li><input type="submit" name="forme_special" value="" style="background:url({$modules_dir}configurateurmousse/img/coussin/formes/special.png)"><br/>Coussin de forme Spéciale</li>
	</ul>
</form>

{else}
	{if $smarty.get.etape=="dimensions"}
	
	<center><h1>Veuillez choisir les dimensions et la densité de votre coussin</h1></center>
	
		<div style="float:left;margin-right:30px;background-color:#e5e5e5;width:239px;">
		{if $forme=="carre"}
			<img src="{$modules_dir}/configurateurmousse/img/coussin/calque_up1.png">
		{/if}
		
		{if $forme=="rectangle"}
			<img src="{$modules_dir}/configurateurmousse/img/coussin/calque_up2.png">
		{/if}
		
		{if $forme=="rond"}
			<img src="{$modules_dir}/configurateurmousse/img/coussin/calque_up3.png">
		{/if}
		</div>
		
		{if $forme=="carre"}
			
			<table class="table table-hover table-condensed" style="float:right;width:280px;margin-left:30px">
				<thead>
					<tr>
						<th>Dimensions Standard</th>
					</tr>
					<tr><td><i>Cliquez sur le modèle souhaité</i></td></tr>
				</thead>
				<tbody>
				
				<tr>
					<td onclick="remplirChampAvecValeur('largeur','40')"><a>Coussin 40x40cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('largeur','60')"><a>Coussin 60x60cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('largeur','70')"><a>Coussin 70x70cm</a></td>
				</tr>
				</tbody>
			</table>

		{/if}
		
		{if $forme=="rectangle"}
			
			<table class="table table-hover table-condensed" style="float:right;width:280px;margin-left:30px">
				<thead>
					<tr>
						<th>Dimensions Standard</th>
					</tr>
					<tr><td><i>Cliquez sur le modèle souhaité</i></td></tr>
				</thead>
				<tbody>
				
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','70');remplirChampAvecValeur('largeur','40');"><a>Coussin 70x40cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','60');remplirChampAvecValeur('largeur','40');"><a>Coussin 60x40cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','70');remplirChampAvecValeur('largeur','33');"><a>Coussin 70x33cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','80');remplirChampAvecValeur('largeur','33');"><a>Coussin 80x33cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','90');remplirChampAvecValeur('largeur','33');"><a>Coussin 90x33cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','140');remplirChampAvecValeur('largeur','33');"><a>Coussin 140x33cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','180');remplirChampAvecValeur('largeur','140');"><a>Coussin Fatboy</a></td>
				</tr>
				</tbody>
			</table>
			
		{/if}
		
		{if $forme=="rond"}

			<table class="table table-hover table-condensed" style="float:right;width:280px;margin-left:30px">
				<thead>
					<tr>
						<th>Dimensions Standard</th>
					</tr>
					<tr><td><i>Cliquez sur le modèle souhaité</i></td></tr>
				</thead>
				<tbody>
				
				<tr>
					<td onclick="remplirChampAvecValeur('diametre','40')"><a>Coussin Rond de 40cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('diametre','60')"><a>Coussin Rond de 60cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('diametre','70')"><a>Coussin Rond de 70cm</a></td>
				</tr>
				</tbody>
			</table>

	
		{/if}

		

		<form action="?etape=garnissage" method="POST">
			
			{if $forme=="carre"}
				<label>Largeur du coussin</label>
				<input type="text" name="largeur" id="largeur" placeholder="Largeur en Centimètres"> cm<br/>
			{/if}
			
			{if $forme=="rectangle"}
				<label>Longueur du coussin</label>
				<input type="text" name="longueur" id="longueur" placeholder="Longueur en Centimètres"> cm<br/>
				<label>Largeur du coussin</label>
				<input type="text" name="largeur" id="largeur" placeholder="Largeur en Centimètres"> cm<br/>
			{/if}
			
			{if $forme=="rond"}
				<label>Diamètre du coussin</label>
				<input type="text" name="diametre" id="diametre" placeholder="Diamètre en Centimètres"> cm<br/>
			{/if}
			
			{if !isset($smarty.post.forme_special)}
				<table class="table table-hover" style="width:38%;">
				<thead>
					<tr>
						<th>Densité du rembourrage</th>
						<th>Choix</th>
					</tr>
				</thead>
				<tbody>
			
					<tr class="warning" onclick="cocherBoutonRadioAvecId(1);" style="border:0px;">
						<td>Trés Dense - Votre coussin sera ferme</td>
						<td><input type="radio" name="choix_densite" id="1" value="1"></td>
					</tr>
				
					<tr class="info" onclick="cocherBoutonRadioAvecId(2);">
						<td>Moyennement Dense - Votre coussin sera semi ferme</td>
						<td><input type="radio" name="choix_densite" id="2" value="2" checked></td>
					</tr>
					
					<tr class="success" onclick="cocherBoutonRadioAvecId(3);" style="border:0px;">
						<td>Légèrement Dense - Votre coussin sera légèrement ferme</td>
						<td><input type="radio" name="choix_densite" id="3" value="3"></td>
					</tr>
				
				</tbody>
				</table>
				
				
			<div style="text-align:center;">
				<a href="coussins" class="btn btn-medium btn-danger"><font color="#fff">Changer de forme</font></a>
				<input type="submit" class="btn btn-medium btn-success" name="validation_dimensions" value="Valider ma forme">
			</div>
			{else}
				Veuillez faire votre demande de forme spéciale par email à surmesure@dormezbien.fr ou par téléphone au 03.21.50.73.52
				N'oubliez pas de joindre au mail une photo ou un scan de la forme souhaitée avec la forme correspondante !
				<br/><br/>
				<div style="text-align:center;">
					<a href="mailto:surmesure@dormezbien.fr" class="btn btn-medium btn-warning">Envoyer ma demande par email</a>
				</div>
			{/if}
		
		</form>
	
	{else if $smarty.get.etape=="garnissage"}
	<h1>Veuillez choisir le garnissage de votre coussin</h1>
	<form action="?etape=personnalisation" method="POST">
		<table class="table table-hover table-condensed">
				<thead>
					<tr>
						<th>Type de garnissage</th>
						<th>Choix</th>
					</tr>
				</thead>
				<tbody>
				

				{foreach from=$garnissages item=garnissage}
					
					<tr onclick="cocherBoutonRadioAvecId({$garnissage['id_garnissage']});">
						<td>{$garnissage['nom_garnissage']}</td>
						<td><input type="radio" name="choix_garnissage" id="{$garnissage['id_garnissage']}" value="{$garnissage['id_garnissage']}" {if $garnissage['id_garnissage']==1}checked{/if}></td>
					</tr>
					
				{/foreach}
				
				</tbody>
		</table>
		<div style="text-align:center;">
			<a href="coussins?etape=dimensions" class="btn btn-medium btn-danger"><font color="#fff">Modifier les dimensions</font></a>
			<input type="submit" value="Valider et continuer ma personnalisation" name="choix_continuer" class="btn btn-medium btn-success">
			<input type="submit" value="Valider et commander mon coussin directement" name="choix_commander" class="btn btn-medium btn-info">
		</div>
	</form>
	{else if $smarty.get.etape=="personnalisation"}
		{if isset($choix) && $choix=='commander'}
			Votre Coussin vient d'être ajouté dans votre panier. Merci pour votre commande.
		{else}
		<h1>A quel usage est destiné votre coussin ?</h1>
		
		{assign var=j value=0}
		{foreach from=$usages item=usage}
		
			<div class="alert alert-info usage" onClick="deroulerDivAvecId('usage{$usage['id_usage']}');">{$usage['nom_usage']}</div>
			<div class="div_cache" id="usage{$usage['id_usage']}">
			<form action="?etape=couleur" method="POST">
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>Choisissez votre tissu</th>
						<th>Choix</th>
					</tr>
				</thead>
				<tbody>
				{assign var=comb value=$combi[$j] }
				{assign var=k value=1}
				{foreach from=$comb item=tissu}
					<tr onclick="cocherBoutonRadioAvecId('literie{$k}');" style="border:0px;">
						<td>{$tissu["nom_tissu"]}</td>
						<td><input type="radio" name="choix_tissus" id="literie{$k}" value="{$tissu['nom_tissu']}"></td>
					</tr>
				{$k=$k+1}
				{/foreach}
				<tr style="border:0px;">
						<td></td>
						<td><input type="submit" name="valider_tissu" class="btn btn-medium btn-success" value="Valider mon choix de tissu"/></td>
				</tr>
				
				</tbody>
			</table>
			
			</form>
			</div>
		{$j=$j+1}
		{/foreach}
		
			
		{/if}
	
	{else if $smarty.get.etape=="couleur"}
		<center><h1>Veuillez choisir la couleur de votre coussin</h1></center>
		
		<div style="float:left;margin-right:30px;width:239px;" id="apercu_coussin">
		{if $forme=="carre"}
			<img src="{$modules_dir}/configurateurmousse/img/coussin/calque_up1.png">
		{/if}
		
		{if $forme=="rectangle"}
			<img src="{$modules_dir}/configurateurmousse/img/coussin/calque_up2.png">
		{/if}
		
		{if $forme=="rond"}
			<img src="{$modules_dir}/configurateurmousse/img/coussin/calque_up3.png">
		{/if}
		</div>
		<div style="width:650px;"><br/><br/>
		<form action="?etape=commande" method="POST">
		<h3>Cliquez sur la couleur que vous souhaitez choisir</h3>
			<ul style="" id="configurateur_coussins_couleurs">
				<li style="width:40px;height:40px;background-color:#FF0000;border:1px solid #000;" onclick="selecterCouleurFondAvecId('apercu_coussin','#FF0000');"></li>
				<li style="width:40px;height:40px;background-color:#FFCC00;border:1px solid #000;" onclick="selecterCouleurFondAvecId('apercu_coussin','#FFCC00');"></li>
				<li style="width:40px;height:40px;background-color:#0099FF;border:1px solid #000;" onclick="selecterCouleurFondAvecId('apercu_coussin','#0099FF');"></li>
				<li style="width:40px;height:40px;background-color:#009900;border:1px solid #000;" onclick="selecterCouleurFondAvecId('apercu_coussin','#009900');"></li>
				<li style="width:40px;height:40px;background-color:#CC6699;border:1px solid #000;" onclick="selecterCouleurFondAvecId('apercu_coussin','#CC6699');"></li>
			</ul>
			<input type="hidden" name="couleur_coussin" value="" id="couleur_form_input"><br/><br/>
			<input type="submit" name="couleur_validee" value="Valider mon choix de couleur et commander le coussin" class="btn btn-medium btn-success" style="margin-top:20px;">
			
		<div style="clear:both;"></div>	
		</form>
		
		</div>
	
	{else if $smarty.get.etape=="commande"}
	
		<h1>Votre coussin personnalisé est maintenant présent dans votre panier !</h1>
		<br/>
		Merci d'avoir créé le {$description} ! 
		<br/>
		Maintenant pourquoi ne pas choisir un matelas qui va avec ?
	{/if}
{/if}
</div>
<script>ajaxCart.refresh();</script>