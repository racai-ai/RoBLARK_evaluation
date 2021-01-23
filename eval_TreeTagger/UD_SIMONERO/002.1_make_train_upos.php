<?php

require "../../lib/lib.php";

function processCorpus($fname,$fp){
    
    echo "Processing $fname\n";
    
    $conllup=new CONLLUP();
    $conllup->readFromFile($fname);

    $last_f=false;
    $last_u=false;

    foreach($conllup->getSentenceIterator() as $sent){
    
	if($last_f!==false){
	    fwrite($fp,"$last_f\tSENT\n");
	    $last_f=false;
	}
    
	foreach($sent->getTokenIterator() as $tok){
	    if($last_f!==false){
		fwrite($fp,"$last_f\t$last_u\n");
	    }
	    
	    $last_f=$tok->get("FORM");
	    $last_u=$tok->get("UPOS");
	    
	}
    }
    
	if($last_f!==false){
	    fwrite($fp,"$last_f\tSENT\n");
	    $last_f=false;
	}
    
}

$fp=fopen("train.corpus","w");
processCorpus("../../ud/UD_Romanian-RRT/ro_rrt-ud-train.conllu",$fp);
processCorpus("../../ud/UD_Romanian-RRT/ro_rrt-ud-dev.conllu",$fp);
processCorpus("../../ud/UD_Romanian-RRT/ro_rrt-ud-test.conllu",$fp);
fclose($fp);

