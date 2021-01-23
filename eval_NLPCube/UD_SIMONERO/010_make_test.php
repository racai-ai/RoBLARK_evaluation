<?php

require "../../lib/lib.php";

function processCorpus($fname,$fp){
    
    echo "Processing $fname\n";
    
    $conllup=new CONLLUP();
    $conllup->readFromFile($fname);

    $id=0;

    foreach($conllup->getSentenceIterator() as $sent){
	$id=0;
	foreach($sent->getTokenIterator() as $tok){
	    $id++;
	    fwrite($fp,$id."\t".$tok->get("FORM")."\t_\t_\t_\t_\t_\t_\t_\t_\n");
	}
	fwrite($fp,"\n");
    }
    
}

$fp=fopen("test.corpus.conllu","w");
processCorpus("../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-train.conllu",$fp);
processCorpus("../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-test.conllu",$fp);
processCorpus("../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-dev.conllu",$fp);
fclose($fp);

