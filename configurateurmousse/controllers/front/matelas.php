<?php
class configurateurmousseMatelasModuleFrontController extends ModuleFrontController   {
 
	public function initContent()
    {
    	parent::initContent();
    	$this->setTemplate('matelas.tpl');
    	
    	//---- GESTION DE LA FORME CHOISIE ET ENREGISTREMENT
    	if(isset($_GET["etape"]) && $_GET["etape"]=="dimensions"){
    	
    	$this->context->cookie->__unset('forme');
    	$this->context->cookie->__unset('longueur');
    	$this->context->cookie->__unset('choix');
    	$this->context->cookie->__unset('largeur');
    	$this->context->cookie->__unset('diametre');
    	$this->context->cookie->__unset('densite');
    	$this->context->cookie->__unset('garnissage');
    	
    	$forme="";
    
    	if(isset($_POST["forme_rect"])){
    		//C'est un coussin rectangulaire	
          	$forme = "rectangle";
    	}
    	
    	if(isset($_POST["forme_rond"])){
    		//C'est un coussin carré
          	$forme = "rond";
    	}
    	
    	if(isset($_POST["forme_l"])){
    		//C'est un coussin carré
          	$forme = "l";
    	}
    	
    	if(isset($_POST["forme_rectrond"])){
    		//C'est un coussin carré
          	$forme = "rectangle+rond";
    	}
    	
    	if(isset($_POST["forme_quartrond"])){
    		//C'est un coussin carré
          	$forme = "quartderond";
    	}
    	
    	if(isset($_POST["forme_rondcoupe"])){
    		//C'est un coussin carré
          	$forme = "rondcoupe";
    	}
    	
    	if(isset($_POST["forme_rectrondrond"])){
    		//C'est un coussin carré
          	$forme = "rectangle+rond+rond";
    	}
    	
    	if(isset($_POST["forme_special"])){
    		//C'est un coussin carré
          	$forme = "special";
    	}
    	
    	if ($forme!="") $this->context->cookie->__set('forme' , $forme);
    	
    	$this->context->smarty->assign('forme',$this->context->cookie->forme);
    	
    	}
    	
    	//---- GESTION DE LA FORME CHOISIE ET ENREGISTREMENT ---- FIN
    	
    	//---- GESTION DES DIMENSIONS CHOISIES ET ENREGISTREMENT
    	
    	if(isset($_POST["validation_dimensions"])){
    		//On a validé les dimensions
    		$forme=$this->context->cookie->forme;
    		
    		if($forme=="rectangle"){//On enregistre dans le cookie la valeur de la largeur/longueur
    			$this->context->cookie->__set('largeur' , $_POST["largeur"]);
    			$this->context->cookie->__set('longueur' , $_POST["longueur"]);
    		}

    		if($forme=="rond"){//On enregistre dans le cookie la valeur du diametre
    			$this->context->cookie->__set('diametre' , $_POST["diametre"]);
    		}
    		
    		if($forme=="l"){//On enregistre dans le cookie la valeur de la largeur1/longueur1/largeur2/longueur2
    			$this->context->cookie->__set('largeur1' , $_POST["largeur1"]);
    			$this->context->cookie->__set('longueur1' , $_POST["longueur1"]);
    			$this->context->cookie->__set('largeur2' , $_POST["largeur2"]);
    			$this->context->cookie->__set('longueur2' , $_POST["longueur2"]);
    		}
    		
    		if($forme=="rectangle+rond"){//On enregistre dans le cookie la valeur de la largeur1/longueur1/largeur2/longueur2
    			$this->context->cookie->__set('largeur1' , $_POST["largeur1"]);
    			$this->context->cookie->__set('longueur1' , $_POST["longueur1"]);
    			$this->context->cookie->__set('longueur2' , $_POST["longueur2"]);
    		}
    		
    		//Dans tous les cas on sauve l'épaisseur dans les données cookies de prestashop
    		$this->context->cookie->__set('epaisseur' , $_POST["epaisseur"]);
    		
    		//On extrait les données de garnissage de la base de données
    		$sql = 'SELECT * FROM '._DB_PREFIX_.'mousse_configurateur';
			if ($results = Db::getInstance()->ExecuteS($sql)){
        		$this->context->smarty->assign('mousses',$results);
    		}
    	}
    	
    	//---- GESTION DES DIMENSIONS CHOISIES ET ENREGISTREMENT ---- FIN
    	
    	//---- GESTION DES GARNISSAGES CHOISIS ET ENREGISTREMENT
    	
    	if(isset($_POST["choix_continuer"]) || isset($_POST["choix_commander"])){
				//On stocke dans le cookie le choix de garnissage
        		if(isset($_POST["choix_garnissage"])){
        			//Le client veut continuer la personnalisation
    				$this->context->cookie->__set('garnissage' , $_POST["choix_garnissage"]);
    				
    				$liste_tissu=array();
    				
    				//On extrait les données de garnissage de la base de données
    				$sql = 'SELECT * FROM '._DB_PREFIX_.'coussins_usages';
					if ($results = Db::getInstance()->ExecuteS($sql)){
        				$this->context->smarty->assign('usages',$results);
        				foreach($results AS $usage){
        					$sql1 = 'SELECT * FROM '._DB_PREFIX_.'coussins_combi_tissus_usages AS combi, '._DB_PREFIX_.'coussins_tissus AS tissus WHERE combi.id_usage='.$usage["id_usage"].' AND tissus.id_tissu=combi.id_tissu';
        					if ($results1 = Db::getInstance()->ExecuteS($sql1)){
        						$liste_tissu[]=$results1;
        					}
        				}
    				}
    				
    				$this->context->smarty->assign('combi',$liste_tissu);
    			}
    			
    			if(isset($_POST["choix_commander"])){
    				//Le client veut commander
    				$dimensions="";
    				
    				if($this->context->cookie->forme=="carre"){
    					$this->context->smarty->assign(
    						array(
    							'choix'=>'commander',
    							'forme'=>$this->context->cookie->forme,
    							'largeur'=>$this->context->cookie->largeur,
    							'densite'=>$this->context->cookie->densite,
    							'garnissage'=>$this->context->cookie->garnissage
    						)
    					);
    					
    					$dimensions=$this->context->cookie->largeur."x".$this->context->cookie->largeur;
    					
    				}
    				else if($this->context->cookie->forme=="rectangle"){
    					$this->context->smarty->assign(
    						array(
    							'choix'=>'commander',
    							'forme'=>$this->context->cookie->forme,
    							'largeur'=>$this->context->cookie->largeur,
    							'longueur'=>$this->context->cookie->longueur,
    							'densite'=>$this->context->cookie->densite,
    							'garnissage'=>$this->context->cookie->garnissage
    						)
    					);
    					$dimensions=$this->context->cookie->longueur."x".$this->context->cookie->largeur;
    				}
    				else if($this->context->cookie->forme=="rond"){
    					$this->context->smarty->assign(
    						array(
    							'choix'=>'commander',
    							'forme'=>$this->context->cookie->forme,
    							'diametre'=>$this->context->cookie->diametre,
    							'densite'=>$this->context->cookie->densite,
    							'garnissage'=>$this->context->cookie->garnissage
    						)
    					);
    					$dimensions=$this->context->cookie->diametre;
    				}
    				
    				$densite="";
    				if($this->context->cookie->densite==1) $densite="Forte Densité";
    				else if($this->context->cookie->densite==2) $densite="Moyenne Densité";
    				else if($this->context->cookie->densite==3) $densite="Faible Densité";
    				
    				//var_dump($this->context->cookie);
    				
    				$garnissage="";
    				$sql = 'SELECT * FROM '._DB_PREFIX_.'garnissages_coussin WHERE id_garnissage='.$this->context->cookie->garnissage;
					if ($results = Db::getInstance()->ExecuteS($sql)){
        				$garnissage=$results[0]["nom_garnissage"];
    				}
    				
    				$nom_genere="Coussin - Forme : ".$this->context->cookie->forme." - ".$dimensions."cm - ".$densite." - ".$garnissage;
    				
    				
    				
    				$cart=$this->context->cart;
    				if($cart->id == NULL){
	    				//On en crée un	
	    				$this->context->cart->add();
	    				$cart=$this->context->cart;
	    				$this->context->cookie->__set("id_cart", $this->context->cart->id);
    				}
    				
    				
    				//Ajout du produit dans la base
    				$langId = (int) (Configuration::get('PS_LANG_DEFAULT'));
					$p = new Product();
					$p->name = array($langId => $nom_genere);
					$p->id_category_default = 24;
					$p->link_rewrite = array($langId => Tools::link_rewrite("coussin_surmesure"));
					$p->weight = 3;
					$p->quantity = 1;
					$p->price = 22;
					if($p->add()){
						$cart->updateQty(1, $p->id);
					}
    				//Fin ajout du produit dans la base
    				
    			}
    	}
    	
    	//---- GESTION DES GARNISSAGES CHOISIS ET ENREGISTREMENT ---- FIN
    	
    	//---- GESTION DES COULEURS CHOISIES ET ENREGISTREMENT
    	
    	if(isset($_POST["valider_tissu"])){
    		if(isset($_POST["choix_tissus"])){
    				$this->context->cookie->__set('tissu' , $_POST["choix_tissus"]);
    				$this->context->smarty->assign(
    						array(
    							'tissu'=>$this->context->cookie->tissu,
    							'forme'=>$this->context->cookie->forme
    						)
    				);
    		}
    	}
    	
    	//---- GESTION DES COULEURS CHOISIES ET ENREGISTREMENT ---- FIN
    	
    	
    	//---- RECAPITULATIF DES DONNEES ET AJOUT AU PANIER
    	  	
    	if(isset($_POST["couleur_validee"])){
    		if(isset($_POST["couleur_coussin"])){
    				$this->context->cookie->__set('couleur' , $_POST["couleur_coussin"]);
    				
    				//Le client veut commander
    				$dimensions="";
    				
    				if($this->context->cookie->forme=="carre"){
    					$this->context->smarty->assign(
    						array(
    							'choix'=>'commander',
    							'forme'=>$this->context->cookie->forme,
    							'largeur'=>$this->context->cookie->largeur,
    							'densite'=>$this->context->cookie->densite,
    							'garnissage'=>$this->context->cookie->garnissage,
    							'couleur'=>$this->context->cookie->couleur,
    							'tissu'=>$this->context->cookie->tissu
    						)
    					);
    					
    					$dimensions=$this->context->cookie->largeur."x".$this->context->cookie->largeur;
    					
    				}
    				else if($this->context->cookie->forme=="rectangle"){
    					$this->context->smarty->assign(
    						array(
    							'choix'=>'commander',
    							'forme'=>$this->context->cookie->forme,
    							'largeur'=>$this->context->cookie->largeur,
    							'longueur'=>$this->context->cookie->longueur,
    							'densite'=>$this->context->cookie->densite,
    							'garnissage'=>$this->context->cookie->garnissage,
    							'couleur'=>$this->context->cookie->couleur,
    							'tissu'=>$this->context->cookie->tissu
    						)
    					);
    					$dimensions=$this->context->cookie->longueur."x".$this->context->cookie->largeur;
    				}
    				else if($this->context->cookie->forme=="rond"){
    					$this->context->smarty->assign(
    						array(
    							'choix'=>'commander',
    							'forme'=>$this->context->cookie->forme,
    							'diametre'=>$this->context->cookie->diametre,
    							'densite'=>$this->context->cookie->densite,
    							'garnissage'=>$this->context->cookie->garnissage,
    							'couleur'=>$this->context->cookie->couleur,
    							'tissu'=>$this->context->cookie->tissu
    						)
    					);
    					$dimensions=$this->context->cookie->diametre;
    				}
    				
    				$densite="";
    				if($this->context->cookie->densite==1) $densite="Forte Densité";
    				else if($this->context->cookie->densite==2) $densite="Moyenne Densité";
    				else if($this->context->cookie->densite==3) $densite="Faible Densité";
    				
    				$garnissage="";
    				$sql = 'SELECT * FROM '._DB_PREFIX_.'garnissages_coussin WHERE id_garnissage='.$this->context->cookie->garnissage;
					if ($results = Db::getInstance()->ExecuteS($sql)){
        				$garnissage=$results[0]["nom_garnissage"];
    				}
    				
    				$nom_genere="Coussin - Forme : ".$this->context->cookie->forme." - ".$dimensions."cm - ".$densite." - ".$garnissage. " - Tissu : ".$this->context->cookie->tissu;
    				
    				$this->context->smarty->assign(
    						array(
    							'description'=>$nom_genere
    						)
    				);
    				
    				$cart=$this->context->cart;
    				if($cart->id == NULL){
	    				//On en crée un	
	    				$this->context->cart->add();
	    				$cart=$this->context->cart;
	    				$this->context->cookie->__set("id_cart", $this->context->cart->id);
    				}
    				
    				//Ajout du produit dans la base
    				$langId = (int) (Configuration::get('PS_LANG_DEFAULT'));
					$p = new Product();
					$p->name = array($langId => $nom_genere);
					$p->id_category_default = 24;
					$p->link_rewrite = array($langId => Tools::link_rewrite("coussin_surmesure"));
					$p->weight = 3;
					$p->quantity = 1;
					$p->price = 22;
					if($p->add()){
						$cart->updateQty(1, $p->id);
					}
    				//Fin ajout du produit dans la base
    				
    		}
    	}
    	
    	//---- RECAPITULATIF DES DONNEES ET AJOUT AU PANIER ---- FIN
    	
  	}
 
}
 
?>