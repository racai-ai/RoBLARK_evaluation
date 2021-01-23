<?php

require "../lib/lib.php";

function processCorpus($fname,$fp){
    
    echo "Processing $fname\n";
    
    $conllup=new CONLLUP();
    $conllup->readFromFile($fname);

    foreach($conllup->getSentenceIterator() as $sent){
	foreach($sent->getTokenIterator() as $tok){
	    fwrite($fp,$tok->get("FORM")."\n");
	}
    }
    
}

$fp=fopen("test.corpus","w");
processCorpus("../ud/UD_Romanian-RRT/ro_rrt-ud-test.conllu",$fp);
fclose($fp);

