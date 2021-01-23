<?php

require "../../lib/lib.php";

function processCorpus($fname1,$fname3){
    
    echo "Processing $fname1 => $fname3\n";
    
    $conllup1=new CONLLUP();
    $conllup1->readFromFile($fname1);

    foreach($conllup1->getTokenIterator() as $tok1){
	$x=$tok1->get("XPOS");
	$tok1->set("UPOS",MSD2UPOS($x));
	
    }
    
    $conllup1->writeToFile($fname3);
}

$acc=processCorpus(
    "test.tagger.out.conllu",
    "test.model_only.combined.out.conllu"
);

