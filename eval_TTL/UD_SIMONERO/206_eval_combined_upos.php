<?php

require "../../lib/lib.php";

function processCorpus($fname1,$fname2){
    
    echo "Processing $fname1 <=> $fname2\n";
    
    $total=0;
    $correct=0;
    
    $conllup1=new CONLLUP();
    $conllup1->readFromFile($fname1);

    $conllup2=new CONLLUP();
    $conllup2->readFromFile($fname2);

    $it2=$conllup2->getTokenIterator();
    $it2->rewind();

    foreach($conllup1->getTokenIterator() as $tok1){
	$tok2=$it2->current();
	$total++;
	
	$l1=$tok1->get("UPOS");
	$l2=$tok2->get("UPOS");
	
	if($l1==$l2)$correct++;
	
	$it2->next();
    }
    
    $acc=floatval($correct)/floatval($total);
    $acc=round(100.0*$acc,2);
    return $acc;
    
}

$acc=processCorpus("gold.conllu","simonero.conllu.rtg");

echo "ACC\n";
echo "$acc\n";


