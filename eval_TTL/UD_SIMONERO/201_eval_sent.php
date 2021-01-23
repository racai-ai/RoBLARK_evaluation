<?php

require "../../lib/lib.php";

function computeBoundaries($fname){
    
    echo "Processing $fname\n";
    
    $conllup=new CONLLUP();
    $conllup->readFromFile($fname);

    $boundaries=[];
    $current=0;

    foreach($conllup->getSentenceIterator() as $sent){
	foreach($sent->getTokenIterator() as $tok){
	    $f=$tok->get("FORM");
	    $f=str_replace("_","",$f);
	    $current+=mb_strlen($f);
	}
	$boundaries[]=$current;
    }
    
    return $boundaries;
    
}

$gold=computeBoundaries("simonero.conllu");
$test=computeBoundaries("simonero.conllu.ttl");

$int=array_intersect($gold,$test);

$P=floatval(count($int))/floatval(count($test));
$R=floatval(count($int))/floatval(count($gold));
$F1=2.0*$P*$R/($P+$R);

$P=round(100.0 * $P,2);
$R=round(100.0 * $R,2);
$F1=round(100.0 * $F1,2);

echo "P\tR\tF1\n";
echo "$P\t$R\t$F1\n";


