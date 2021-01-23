<?php

require "../../lib/lib.php";

function compare($fname1,$fname2){
    
    echo "Processing $fname1, $fname2\n";
    
    $conllup1=new CONLLUP();
    $conllup1->readFromFile($fname1);

    $conllup2=new CONLLUP();
    $conllup2->readFromFile($fname2);

    $boundaries=[];
    $current=0;

    $it2=$conllup2->getTokenIterator();
    $it2->rewind();
    foreach($conllup1->getTokenIterator() as $tok1){
    $current++;
	    $tok2=$it2->current();$it2->next();
	    $f1=$tok1->get("FORM");
	    $f2=$tok2->get("FORM");
	    if($current>=49854 && $f1!=$f2)echo "$f1\t$f2\n";
    }
    
    
}

compare("test.tokens.out.conllu","gold.conllu");
