<?php

$fin=fopen("test.model_only.out.lemma","r");
$fout=fopen("test.model_only.out.lemma.conllu","w");

$id=1;
while(!feof($fin)){
    $line=fgets($fin);
    if($line===false)break;
    $line=trim($line);
    if(strlen($line)==0){fwrite($fout,"\n");$id=1;continue;}
    
    $data=explode("\t",$line);
    if(count($data)!=3)continue;
    
    $f=$data[0];
    $xpos=$data[1];
    $l=$data[2];
    
    fwrite($fout,"$id\t$f\t$l\t_\t$xpos\t_\t_\t_\t_\t_\n");
    $id++;

    
}

fclose($fin);
fclose($fout);
