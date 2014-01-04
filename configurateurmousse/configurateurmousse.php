<?php
if (!defined('_PS_VERSION_'))
  exit;
 
class ConfigurateurMousse extends Module
{
	public function __construct()
    {
    	$this->name = 'configurateurmousse';
    	$this->tab = 'front_office_features';
    	$this->version = '1.0';
    	$this->author = 'Louis AUTHIE';
   		$this->need_instance = 0;
    	$this->ps_versions_compliancy = array('min' => '1.4', 'max' => '1.7');
    	$this->dependencies = array('blockcart');
    	
    	parent::__construct();
 
    	$this->displayName = $this->l('Module Configurateur de Découpe Mousse sur mesure');
    	$this->description = $this->l('Configurateur intégré pour les produits sur-mesure');
 
    	$this->confirmUninstall = $this->l('Etes-vous sûr de vouloir désinstaller le module ?');
    	
    	$this->context->smarty->assign(
     		array(
          		'header_texte_1' => $this->l('header texte 1')
      		)
  		);
 
    	if (!Configuration::get('MYMODULE_NAME'))      
      		$this->warning = $this->l('No name provided');
      		
      	
   		
  	}
  	
  	public function install()
	{
  		if (Shop::isFeatureActive())
    	Shop::setContext(Shop::CONTEXT_ALL);
 
  		return parent::install() &&
    		$this->registerHook('header');
  	}

	public function uninstall()
	{
  		return parent::uninstall();
	}
	
	//Ici on gère l'affichage du hook principal
	public function hookDisplayHome($params)
	{
  		$this->context->smarty->assign(
      		array(
          		'titre_page' => Configuration::get('MYMODULE_NAME'),
          		'my_module_link' => $this->context->link->getModuleLink('mymodule', 'display')
      		)
  		);
  		
  		
  		//Comportements en cas de clics retours
  		if(isset($_POST["retourformes"])){
  			//On revient à l'étape 1
  			$_GET["etape"]=1;
  		}
  		
  		//Comportements en cas de clics validants
  		//Si l'étape Formes a été validée on passe à l'étape de dimensions
  		if(isset($_GET["etape"]) && $_GET["etape"]==2){
  			//On a la forme on la stocke en variable de session
  			$_SESSION["forme"]=$_POST["forme"];
  		}
  		//Si l'étape dimensions a été validée on passe à l'étape de choix de la housse
  		if(isset($_GET["etape"]) && $_GET["etape"]==2){
  			//On a les dimensions on la stocke en variable de session
  			if($_SESSION["forme"]=="Parallélépipèdique"){
  				$dimensions=array(
    				"longueur" => $_POST["longueur"],
    				"largeur" => $_POST["largeur"],
    				"epaisseur" => $_POST["epaisseur"]
				);
			}
			else{
				$dimensions=array(
    				"diametre" => $_POST["longueur"],
    				"epaisseur" => $_POST["epaisseur"]
				);
			}
  			$_SESSION["dimensions"]=$dimensions;
  		}
  		
  		return $this->display(__FILE__, 'form_matelas.tpl');
	}
	
	//Pour charger des librairies CSS
	public function hookDisplayHeader()
	{
  		$this->context->controller->addCSS($this->_path.'css/general.css', 'all');
  		$this->context->controller->addJS($this->_path.'js/general.js');
	}  
	
	
	public function displayGarnissages()
	{
		$output="<div style='padding:20px;'>
		<h1>Coussins - Liste des Garnissages</h1>";
	if (Tools::isSubmit('ajout_garnissage'))
    {
    	$sql = 'INSERT INTO '._DB_PREFIX_.'garnissages_coussin (nom_garnissage) VALUES ("'.$_POST["nom_garnissage"].'")';
    	if ($results = Db::getInstance()->execute($sql)){
    		$output.="<div class='info'>Garnissage enregistré !</div>";
    	}
    }
    
    if (Tools::isSubmit('del_garnissage'))
    {
    	$sql = 'DELETE FROM '._DB_PREFIX_.'garnissages_coussin WHERE id_garnissage='.$_POST["id"];
    	if ($results = Db::getInstance()->execute($sql)){
    		$output.="<div class='info'>Garnissage supprimé !</div>";
    	}
    }
	
		//On extrait les données de garnissage de la base de données
    	$sql = 'SELECT * FROM '._DB_PREFIX_.'garnissages_coussin';
		
		$output.="
		
		<form action='".AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
            '&token='.Tools::getAdminTokenLite('AdminModules')."' method='POST'>
			<input type='text' name='nom_garnissage' placeholder='Nom du garnissage'/>
			<input type='submit' value='Ajouter ce garnissage' name='ajout_garnissage'/>
		</form><br/>
		<table class='table'>
		<thead>
			<tr>
				<th>Garnissage</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			
		
		";
		
    	if ($results = Db::getInstance()->ExecuteS($sql)){
        	foreach($results as $garnissage){
        		$output.="<tr><td>".$garnissage["nom_garnissage"]."</td><td>
        		
        		<form action='".AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
            '&token='.Tools::getAdminTokenLite('AdminModules')."' method='POST'>
            		<input type='hidden' value='".$garnissage["id_garnissage"]."' name='id'>
        			<input type='submit' value='Supprimer' name='del_garnissage' class=''/>
        		</form>
        		
        		</td></tr>";
        	}
    	}
    	
    	$output.="</tbody></table></div>";
    	return $output;
	}
	
	public function displayUsages(){
		$output="";
		$output="<br/><br/>
		
		<table>
		<tr>
		<td  valign='top' style='padding:20px;'>
		
		<h1>Coussins - Liste des Usages</h1>";
		
		if (Tools::isSubmit('ajout_usage'))
    {
    	$sql = 'INSERT INTO '._DB_PREFIX_.'coussins_usages (nom_usage) VALUES ("'.$_POST["nom_usage"].'")';
    	if ($results = Db::getInstance()->execute($sql)){
    		$output.="<div class='info'>Usage enregistré !</div>";
    	}
    }
    
    if (Tools::isSubmit('del_usage'))
    {
    	$sql = 'DELETE FROM '._DB_PREFIX_.'coussins_usages WHERE id_usage='.$_POST["id"];
    	if ($results = Db::getInstance()->execute($sql)){
    		$output.="<div class='info'>Usage supprimé !</div>";
    	}
    }
	
		//On extrait les données de garnissage de la base de données
    	$sql3 = 'SELECT * FROM '._DB_PREFIX_.'coussins_usages';
		
		$output.="
		
		<form action='".AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
            '&token='.Tools::getAdminTokenLite('AdminModules')."' method='POST'>
			<input type='text' name='nom_usage' placeholder='Usage'/>
			<input type='submit' value='Ajouter cet usage' name='ajout_usage'/>
		</form><br/>
		<table class='table'>
		<thead>
			<tr>
				<th>Usage</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			
		
		";
		
    	if ($result3 = Db::getInstance()->ExecuteS($sql3)){
        	foreach($result3 as $usage){
        		$output.="<tr><td>".$usage["nom_usage"]."</td><td>
        		
        		<form action='".AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
            '&token='.Tools::getAdminTokenLite('AdminModules')."' method='POST'>
            		<input type='hidden' value='".$usage["id_usage"]."' name='id'>
        			<input type='submit' value='Supprimer' name='del_usage' class=''/>
        		</form>
        		
        		</td></tr>";
        	}
    	}
    	
    	$output.="</tbody></table>
    	</td>
    	
    	<td valign='top' style='padding:20px;'>
    	
    	<h1>Coussins - Liste des Tissus</h1>";
		
		if (Tools::isSubmit('ajout_tissu'))
    {
    	$sql = 'INSERT INTO '._DB_PREFIX_.'coussins_tissus (nom_tissu) VALUES ("'.$_POST["nom_tissu"].'")';
    	if ($results = Db::getInstance()->execute($sql)){
    		$output.="<div class='info'>Tissu enregistré !</div>";
    	}
    }
    
    if (Tools::isSubmit('del_tissu'))
    {
    	$sql = 'DELETE FROM '._DB_PREFIX_.'coussins_tissus WHERE id_tissu='.$_POST["id"];
    	if ($results = Db::getInstance()->execute($sql)){
    		$output.="<div class='info'>Tissu supprimé !</div>";
    	}
    }
	
		//On extrait les données de tissus de la base de données
    	$sql2 = 'SELECT * FROM '._DB_PREFIX_.'coussins_tissus';
		
		$sql1 = 'SELECT * FROM '._DB_PREFIX_.'coussins_combi_tissus_usages AS comb, '._DB_PREFIX_.'coussins_tissus AS tissus, '._DB_PREFIX_.'coussins_usages AS usages WHERE comb.id_usage=usages.id_usage AND comb.id_tissu=tissus.id_tissu';
		
		$output.="
		
		<form action='".AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
            '&token='.Tools::getAdminTokenLite('AdminModules')."' method='POST'>
			<input type='text' name='nom_tissu' placeholder='Nom du Tissu'/>
			<input type='submit' value='Ajouter ce Tissu' name='ajout_tissu'/>
		</form><br/>
		<table class='table'>
		<thead>
			<tr>
				<th>Nom du Tissu</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			
		
		";
		
    	if ($results = Db::getInstance()->ExecuteS($sql2)){
        	foreach($results as $usage){
        		$output.="<tr><td>".$usage["nom_tissu"]."</td><td>
        		
        		<form action='".AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
            '&token='.Tools::getAdminTokenLite('AdminModules')."' method='POST'>
            		<input type='hidden' value='".$usage["id_tissu"]."' name='id'>
        			<input type='submit' value='Supprimer' name='del_tissu' class=''/>
        		</form>
        		
        		</td></tr>";
        	}
    	}
    	
    	$output.="</tbody></table>
    	
    	</td>
    	<td valign='top' style='padding:20px;'>
    	<h1>Coussins - Combinaisons usages/tissus</h1>
    	";
    	
    	if (Tools::isSubmit('del_combi'))
    	{
    		$sql = 'DELETE FROM '._DB_PREFIX_.'coussins_combi_tissus_usages WHERE id_combi='.$_POST["id"];
    		if ($results = Db::getInstance()->execute($sql)){
    			$output.="<div class='info'>Combinaison supprimée !</div>";
    		}
    	}
    	
    	if (Tools::isSubmit('ajout_combi'))
    	{
    		$sql = 'INSERT INTO '._DB_PREFIX_.'coussins_combi_tissus_usages (id_usage,id_tissu) VALUES ("'.$_POST["usage"].'","'.$_POST["tissu"].'")';
    		if ($results = Db::getInstance()->execute($sql)){
    			$output.="<div class='info'>Couple enregistré !</div>";
    		}
   	 	}
    	
    	$output.="
    	<form action='".AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
            '&token='.Tools::getAdminTokenLite('AdminModules')."' method='POST'>
        <select name='usage'>
        ";    
        
        if ($result3 = Db::getInstance()->ExecuteS($sql3)){
        	foreach($result3 as $usage){    
  				$output.="<option value='".$usage["id_usage"]."'>".$usage["nom_usage"]."</option>";
			}
		}
		$output.="
		</select>
		
		<select name='tissu'>
        ";    
        
        if ($result2 = Db::getInstance()->ExecuteS($sql2)){
        	foreach($result2 as $tissu){    
  				$output.="<option value='".$tissu["id_tissu"]."'>".$tissu["nom_tissu"]."</option>";
			}
		}
		$output.="
		</select>	
			
			<input type='submit' value='Ajouter ce couple' name='ajout_combi'/>
		</form><br/>
		<table class='table'>
		<thead>
			<tr>
				<th>Usage</th>
				<th>Tissu</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
    	";
    		
    	if ($result1 = Db::getInstance()->ExecuteS($sql1)){
        	foreach($result1 as $combi){    
  				$output.="<tr><td>".$combi["nom_usage"]."</td><td>".$combi["nom_tissu"]."</td><td>
  				
  				
  				<form action='".AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
            '&token='.Tools::getAdminTokenLite('AdminModules')."' method='POST'>
            		<input type='hidden' value='".$combi["id_combi"]."' name='id'>
        			<input type='submit' value='Supprimer' name='del_combi' class=''/>
        		</form>
  				
  				</td></tr>";
			}
		}
    		
    	$output.="
    	</tbody>
    	</table>
    	";
    	
    	$output.="
    	</td></tr></table>";
    	
		return $output;
	}
	
	public function getContent()
	{
		$output="";
		
		$output.=$this->displayGarnissages();
    	$output.=$this->displayUsages();
    	
    	return $output;
	}
}
?>