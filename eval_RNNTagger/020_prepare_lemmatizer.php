<?php

require "../lib/lib.php";

function processCorpus($fname1,$fname2,$fname3){
    
    echo "Processing $fname1 => $fname2 + $fname3\n";
    
    $conllup1=new CONLLUP();
    $conllup1->readFromFile($fname1);
    
    $f1=fopen($fname2,"w");
    //$f2=fopen($fname3,"w");

    $firstS=true;
    foreach($conllup1->getSentenceIterator() as $sent){
	if($firstS)$firstS=false;else{fwrite($f1,"\n");fwrite($f2,"\n");}
	$first=true;
	foreach($sent->getTokenIterator() as $tok1){
	
	    $form=$tok1->get("FORM");
	    $lemma=$tok1->get("LEMMA");
	    $xpos=$tok1->get("XPOS");
	    
	    if($first)$first=false;
	    else{ 
		fwrite($f1,"\n");
		//fwrite($f2,"\n");
	    }
	    
	    fwrite($f1,"$form\t$xpos|$lemma");
/*	    for($i=0;$i<mb_strlen($lemma);$i++){
		if($i>0)fwrite($f2," ");
		fwrite($f2,mb_substr($lemma,$i,1));
	    }
*/	}
    }
    
    fclose($f1);
//    fclose($f2);
}

$acc=processCorpus(
    "../ud/UD_Romanian-RRT/ro_rrt-ud-train.conllu",
    "lemmatizer-train.src.tok",
    "lemmatizer-train.tgt"
);

$acc=processCorpus(
    "../ud/UD_Romanian-RRT/ro_rrt-ud-dev.conllu",
    "lemmatizer-dev.src.tok",
    "lemmatizer-dev.tgt"
);

$acc=processCorpus(
    "../ud/UD_Romanian-RRT/ro_rrt-ud-test.conllu",
    "lemmatizer-test.src.tok",
    "lemmatizer-test.tgt"
);

