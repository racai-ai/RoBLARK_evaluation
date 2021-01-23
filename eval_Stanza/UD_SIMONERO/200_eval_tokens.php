<?php

require "../../lib/lib.php";

function computeBoundaries($fname,$ignore_space){
    
    echo "Processing $fname\n";
    
    $conllup=new CONLLUP();
    $conllup->readFromFile($fname);

    $boundaries=[];
    $current=0;

    foreach($conllup->getSentenceIterator() as $sent){
	foreach($sent->getTokenIterator() as $tok){
	    $f=$tok->get("FORM");
	    
	    if($ignore_space){
		$d=explode(" ",$f);
		foreach($d as $d1){
	    
		    $current+=mb_strlen($d1);
	    
		    //if($current>36150 && $current<36200)echo $current." ".$f."\n";
	    
		}
		    $boundaries[]=$current;
	    }else{
		$current+=mb_strlen($f);
		$boundaries[]=$current;
	    }
	}
    }
    
    return $boundaries;
    
}

$gold=computeBoundaries("simonero.conllu",false);
$test=computeBoundaries("test.tokens.out.conllu",true);

//$goldk=array_flip($gold);
//foreach($test as $t)if(!isset($goldk[$t]))echo $t."\n";

$int=array_intersect($gold,$test);

$P=floatval(count($int))/floatval(count($test));
$R=floatval(count($int))/floatval(count($gold));
$F1=2.0*$P*$R/($P+$R);

$P=round(100.0 * $P,2);
$R=round(100.0 * $R,2);
$F1=round(100.0 * $F1,2);

echo "P\tR\tF1\n";
echo "$P\t$R\t$F1\n";


