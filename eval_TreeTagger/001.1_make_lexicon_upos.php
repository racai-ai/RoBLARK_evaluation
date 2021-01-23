<?php

require "../lib/lib.php";

$lexicon=[];


function addLexicon($f,$t,$l){
    global $lexicon;
    
    if(!isset($lexicon[$f]))$lexicon[$f]=[];
    if(!isset($lexicon[$f][$t]))$lexicon[$f][$t]=[];
    if(!isset($lexicon[$f][$t][$l]))$lexicon[$f][$t][$l]=1;
    else $lexicon[$f][$t][$l]++;
}

function processCorpus($fname){
    echo "Processing $fname\n";
    
    $conllup=new CONLLUP();
    $conllup->readFromFile($fname);

    $last_f=false;
    $last_l=false;
    $last_t=false;

    foreach($conllup->getSentenceIterator() as $sent){
	
	if($last_f!==false){
	    addLexicon($last_f,"SENT",$last_l);
	    $last_f=false;
	}
	
	foreach($sent->getTokenIterator() as $tok){
	    if($last_f!==false){
		addLexicon($last_f,$last_t,$last_l);
	    }
	    
	    $last_f=$tok->get("FORM");
	    $last_l=$tok->get("LEMMA");
	    $last_t=$tok->get("UPOS");
	}
    }
    
    if($last_f!==false){
	addLexicon($last_f,$last_t,$last_l);
    }
    
}

processCorpus("../ud/UD_Romanian-RRT/ro_rrt-ud-train.conllu");
processCorpus("../ud/UD_Romanian-RRT/ro_rrt-ud-dev.conllu");

$lexicon_lines=[];
foreach($lexicon as $f=>$entry){
    $data=[];
    foreach($entry as $tag=>$lemmas){
	arsort($lemmas);
	$data[]=$tag." ".array_keys($lemmas)[0];
    }
    $lexicon_lines[]="$f\t".implode("\t",$data);
}

file_put_contents("ro_rrt.lexicon",implode("\n",$lexicon_lines));
