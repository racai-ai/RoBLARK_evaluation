<?php

$exclude=array_flip(["Spsa","Crssp","SENT","PERIOD"]);

$tags=[];
foreach(explode("\n",file_get_contents("ro_rrt.xpos.lexicon")) as $line){
    if(strlen($line)==0)continue;
    
    $data=explode("\t",$line);
    for($i=1;$i<count($data);$i++){
	$tdata=explode(" ",$data[$i]);
	$t=$tdata[0];
	if(!isset($exclude[$t]))$tags[$t]=true;
    }
}


file_put_contents("ro.xpos.openclass",implode(" ",array_keys($tags)));
