<?php

require "../lib/lib.php";

function processCorpus($fname,$fp){
    
    echo "Processing $fname\n";
    
    $conllup=new CONLLUP();
    $conllup->readFromFile($fname);

    $first=true;
    foreach($conllup->getSentenceIterator() as $sent){
	if($first)$first=false;
	else{
	    fwrite($fp,"\n");
	}
    
	foreach($sent->getTokenIterator() as $tok){
	    $f=$tok->get("FORM");
	    $x=$tok->get("XPOS");
	    fwrite($fp,"$f\t$x\n");
	    
	}
    }
    
}

$fp=fopen("train.xpos","w");
processCorpus("../ud/UD_Romanian-RRT/ro_rrt-ud-train.conllu",$fp);
fclose($fp);

$fp=fopen("dev.xpos","w");
processCorpus("../ud/UD_Romanian-RRT/ro_rrt-ud-dev.conllu",$fp);
fclose($fp);

