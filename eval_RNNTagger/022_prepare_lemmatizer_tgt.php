<?php

function processFile($fname1,$fname2){

    $c1=[];
    $c2=[];

    foreach(explode("\n",file_get_contents($fname1)) as $line){
	$ldata=explode("|",$line);
	if(count($ldata)!=2)continue;
	
	$c1[]=trim($ldata[0]);
	$c2[]=trim($ldata[1]);
    }
    
    file_put_contents($fname1,implode("\n",$c1));
    file_put_contents($fname2,implode("\n",$c2));

}

processFile("lemmatizer-train.src","lemmatizer-train.tgt");
processFile("lemmatizer-test.src","lemmatizer-test.tgt");
processFile("lemmatizer-dev.src","lemmatizer-dev.tgt");
