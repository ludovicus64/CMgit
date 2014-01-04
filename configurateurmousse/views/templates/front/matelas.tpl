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

<h1>Veuillez choisir la forme de votre matelas</h1>
Veuillez cliquer sur la forme de votre matelas
<form action="?etape=dimensions" method="POST" id="forme_coussins" style="text-align:center;">
	
	<ul style="text-align:center;">
		<li><input type="submit" name="forme_rect" value="" style="background:url({$modules_dir}configurateurmousse/img/matelas/formes/rectangle.png)"><br/>Matelas Rectangulaire</li>
		<li><input type="submit" name="forme_rond" value="" style="background:url({$modules_dir}configurateurmousse/img/matelas/formes/rond.png)"><br/>Matelas Rond</li>
		<li><input type="submit" name="forme_l" value="" style="background:url({$modules_dir}configurateurmousse/img/matelas/formes/l.png)"><br/>Matelas en L</li>
		<li><input type="submit" name="forme_rectrond" value="" style="background:url({$modules_dir}configurateurmousse/img/matelas/formes/rectrond.png)"><br/>Matelas en corbeille</li>
		<li><input type="submit" name="forme_quartrond" value="" style="background:url({$modules_dir}configurateurmousse/img/matelas/formes/quartrond.png)"><br/>Matelas 1/4 de Rond</li>
		<li><input type="submit" name="forme_rondcoupe" value="" style="background:url({$modules_dir}configurateurmousse/img/matelas/formes/rondcoupe.png)"><br/>Matelas Rond Coupé</li>
		<li><input type="submit" name="forme_rectrondrond" value="" style="background:url({$modules_dir}configurateurmousse/img/matelas/formes/rectrondrond.png)"><br/>Matelas en double corbeille</li>
		<li><input type="submit" name="forme_special" value="" style="background:url({$modules_dir}configurateurmousse/img/matelas/formes/special.png)"><br/>Matelas de forme Spéciale</li>
	</ul>
</form>

{else}
	{if $smarty.get.etape=="dimensions"}
	
	<center><h1>Veuillez définir les dimensions de votre matelas</h1></center>
	
		<div style="float:left;margin-right:30px;background-color:#e5e5e5;width:300px;">
		{if $forme=="rectangle"}
			<img src="{$modules_dir}/configurateurmousse/img/matelas/calque_up_rect.png">
		{/if}
		
		{if $forme=="rond"}
			<img src="{$modules_dir}/configurateurmousse/img/matelas/calque_up_rond.png">
		{/if}
		
		
		{if $forme=="l"}
			<img src="{$modules_dir}/configurateurmousse/img/matelas/calque_up_l.png">
			<img src="{$modules_dir}/configurateurmousse/img/matelas/calque_blanc.png">
		{/if}
		
		{if $forme=="rectangle+rond"}
			<img src="{$modules_dir}/configurateurmousse/img/matelas/calque_up_rectrond.png">
		{/if}
		
		{if $forme=="quartderond"}
			<img src="{$modules_dir}/configurateurmousse/img/matelas/calque_up_quartrond.png">
		{/if}
		
		{if $forme=="rondcoupe"}
			<img src="{$modules_dir}/configurateurmousse/img/matelas/calque_up_rondcoupe.png">
		{/if}
		
		{if $forme=="rectangle+rond+rond"}
			<img src="{$modules_dir}/configurateurmousse/img/matelas/calque_up_rectrondrond.png">
		{/if}
		
		</div>
		
		
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
					<td onclick="remplirChampAvecValeur('longueur','190');remplirChampAvecValeur('largeur','70');remplirChampAvecValeur('epaisseur','20');"><a>Matelas 70x190cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','200');remplirChampAvecValeur('largeur','70');remplirChampAvecValeur('epaisseur','20');"><a>Matelas 70x200cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','190');remplirChampAvecValeur('largeur','80');remplirChampAvecValeur('epaisseur','20');"><a>Matelas 80x190cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','200');remplirChampAvecValeur('largeur','80');remplirChampAvecValeur('epaisseur','20');"><a>Matelas 80x200cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','190');remplirChampAvecValeur('largeur','90');remplirChampAvecValeur('epaisseur','20');"><a>Matelas 90x190cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','200');remplirChampAvecValeur('largeur','90');remplirChampAvecValeur('epaisseur','20');"><a>Matelas 90x200cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','190');remplirChampAvecValeur('largeur','100');remplirChampAvecValeur('epaisseur','20');"><a>Matelas 100x190cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','190');remplirChampAvecValeur('largeur','140');remplirChampAvecValeur('epaisseur','20');"><a>Matelas 140x190cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('longueur','200');remplirChampAvecValeur('largeur','180');remplirChampAvecValeur('epaisseur','20');"><a>Matelas 180x200cm</a></td>
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
					<td onclick="remplirChampAvecValeur('diametre','160');remplirChampAvecValeur('epaisseur','20');"><a>Matelas Rond de 160cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('diametre','200');remplirChampAvecValeur('epaisseur','20');"><a>Matelas Rond de 200cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('diametre','215');remplirChampAvecValeur('epaisseur','20');"><a>Matelas Rond de 215cm</a></td>
				</tr>
				<tr>
					<td onclick="remplirChampAvecValeur('diametre','240');remplirChampAvecValeur('epaisseur','20');"><a>Matelas Rond de 240cm</a></td>
				</tr>
				</tbody>
			</table>

	
		{/if}

		
<br/></br>
		<form action="?etape=mousse" method="POST">
			
			{if $forme=="rectangle"}
				<label>Longueur du Matelas</label>
				<input type="text" name="longueur" id="longueur" placeholder="Longueur en Centimètres"> cm<br/>
				<label>Largeur du Matelas</label>
				<input type="text" name="largeur" id="largeur" placeholder="Largeur en Centimètres"> cm<br/>
				
			{/if}
			
			{if $forme=="rond"}
				<label>Diamètre du Matelas</label>
				<input type="text" name="diametre" id="diametre" placeholder="Diamètre en Centimètres"> cm<br/>
			{/if}
			
			{if $forme=="l"}
				<label>Longueur 1 (La longueur à l'intérieur du L) </label>
				<input type="text" name="longueur1" id="longueur1" placeholder="Longueur 1 en Centimètres"> cm<br/>
				<label>Longueur 2 (La longueur à l'extérieur du L) </label>
				<input type="text" name="longueur2" id="longueur2" placeholder="Longueur 2 en Centimètres"> cm<br/>
				<label>Largeur 1 </label>
				<input type="text" name="largeur1" id="largeur1" placeholder="Largeur 1 en Centimètres"> cm<br/>
				<label>Largeur 2 </label>
				<input type="text" name="largeur2" id="largeur2" placeholder="Largeur 2 en Centimètres"> cm<br/>
			{/if}
			
			{if $forme=="rectangle+rond"}
				<label>Longueur 1 (Petite Longueur) </label>
				<input type="text" name="longueur1" id="longueur1" placeholder="Longueur 1 en Centimètres"> cm<br/>
				<label>Longueur 2 (Envergure totale) </label>
				<input type="text" name="longueur2" id="longueur2" placeholder="Longueur 2 en Centimètres"> cm<br/>
				<label>Largeur 1 </label>
				<input type="text" name="largeur1" id="largeur1" placeholder="Largeur 1 en Centimètres"> cm<br/>
			{/if}
			
			{if $forme=="quartderond"}
				<label>Rayon du Quart de Rond</label>
				<input type="text" name="rayon" id="rayon" placeholder="Rayon en Centimètres"> cm<br/>
			{/if}
			
			{if $forme=="rondcoupe"}
				<label>Diamètre du disque de base</label>
				<input type="text" name="diametre" id="diametre" placeholder="Diamètre en Centimètres"> cm<br/>
				<label>Hauteur du morceau découpé</label>
				<input type="text" name="hauteur" id="hauteur" placeholder="Hauteur en Centimètres"> cm<br/>
			{/if}
			
			{if $forme=="rectangle+rond+rond"}
				<label>Longueur 1 (Petite Longueur) </label>
				<input type="text" name="longueur1" id="longueur1" placeholder="Longueur 1 en Centimètres"> cm<br/>
				<label>Longueur 2 (Envergure totale) </label>
				<input type="text" name="longueur2" id="longueur2" placeholder="Longueur 2 en Centimètres"> cm<br/>
				<label>Largeur 1 </label>
				<input type="text" name="largeur1" id="largeur1" placeholder="Largeur 1 en Centimètres"> cm<br/>
			{/if}
			
			{if !isset($smarty.post.forme_special)}				
				
			<label>Epaisseur du Matelas</label>
			<input type="text" name="epaisseur" id="epaisseur" placeholder="Epaisseur en Centimètres"> cm<br/>
			
			<div style="text-align:center;"><br/><br/>
				<a href="matelas" class="btn btn-medium btn-danger"><font color="#fff">Changer de forme</font></a>
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
	
	{else if $smarty.get.etape=="mousse"}
	<h1>Veuillez choisir la mousse de garnissage de votre matelas</h1>
	<form action="?etape=personnalisation" method="POST">
		<table class="table table-hover table-condensed">
				<thead>
					<tr>
						<th>Type de mousse</th>
						<th>Conseils</th>
						<th>Choix</th>
					</tr>
				</thead>
				<tbody>
				

				{foreach from=$mousses item=mousse}
					
					<tr onclick="cocherBoutonRadioAvecId({$mousse['id_mousse']});">
						<td>{$mousse['nom_mousse']}</td>
						<td>{$mousse['description_mousse']}</td>
						<td><input type="radio" name="choix_garnissage" id="{$mousse['id_mousse']}" value="{$mousse['id_mousse']}" {if $mousse['id_mousse']==1}checked{/if}></td>
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
