<?php

require "../../lib/lib.php";

function computeBoundaries($fname){//,&$where){
    
    echo "Processing $fname\n";
    
    $conllup=new CONLLUP();
    $conllup->readFromFile($fname);

    $boundaries=[];
    $current=0;

    //$n=0;
    foreach($conllup->getSentenceIterator() as $sent){
	foreach($sent->getTokenIterator() as $tok){
	    $f=$tok->get("FORM");
	    $current+=strlen($f);
	    $boundaries[]=$current;
	    //$n++;
	    //if($n>49700 && $n<49900)echo "$fname\t$f\t".strlen($f)."\t$current\n";
	    //$where[$current]=$n;
	}
    }
    
    return $boundaries;
    
}

//$whereGold=[];$whereTest=[];
$gold=computeBoundaries("gold.conllu");//,$whereGold);
$test=computeBoundaries("test.tokens.out.conllu");//,$whereTest);


$int=array_intersect($gold,$test);

//$d1=array_diff($test,$int);
//foreach($d1 as $d)echo $whereTest[$d]."\n";


$P=floatval(count($int))/floatval(count($test));
$R=floatval(count($int))/floatval(count($gold));
$F1=2.0*$P*$R/($P+$R);

$P=round(100.0 * $P,2);
$R=round(100.0 * $R,2);
$F1=round(100.0 * $F1,2);

echo "P\tR\tF1\n";
echo "$P\t$R\t$F1\n";


