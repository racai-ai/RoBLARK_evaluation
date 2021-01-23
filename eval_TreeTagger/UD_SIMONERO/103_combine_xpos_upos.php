<?php

require "../../lib/lib.php";

function processCorpus($fname1,$fname2,$fname3){
    
    echo "Processing $fname1 + $fname2 => $fname3\n";
    
    $conllup1=new CONLLUP();
    $conllup1->readFromFile($fname1);

    $conllup2=new CONLLUP();
    $conllup2->readFromFile($fname2);

    $it2=$conllup2->getTokenIterator();
    $it2->rewind();

    foreach($conllup1->getTokenIterator() as $tok1){
	$tok2=$it2->current();
	
	$x=$tok2->get("XPOS");
	$tok1->set("XPOS",$x);
	$tok1->set("UPOS",MSD2UPOS($x));
	
	$it2->next();
    }
    
    $conllup1->writeToFile($fname3);
}

$acc=processCorpus(
    "test.model_only.out.conllu",
    "test.model_only.xpos.out.conllu",
    "test.model_only.combined.out.conllu"
);

