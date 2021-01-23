<?php

require "../../lib/lib.php";

function processCorpus($fname,$fp){
    
    echo "Processing $fname\n";
    
    $conllup=new CONLLUP();
    $conllup->readFromFile($fname);

    foreach($conllup->getSentenceIterator() as $sent){
	foreach($sent->getTokenIterator() as $tok){
	    fwrite($fp,$tok->get("FORM")."\n");
	}
	fwrite($fp,"\n");
    }
    
}

$fp=fopen("test.corpus","w");
processCorpus("../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-train.conllu",$fp);
processCorpus("../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-test.conllu",$fp);
processCorpus("../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-dev.conllu",$fp);
fclose($fp);

