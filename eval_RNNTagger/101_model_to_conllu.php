<?php

$fin=fopen("test.model_only.out","r");
$fout=fopen("test.model_only.out.conllu","w");

$id=1;
while(!feof($fin)){
    $line=fgets($fin);
    if($line===false)break;
    $line=trim($line);
    if(strlen($line)==0){fwrite($fout,"\n");$id=1;continue;}
    
    $data=explode("\t",$line);
    if(count($data)!=2)continue;
    
    $f=$data[0];
    $upos=$data[1];
    
    
    fwrite($fout,"$id\t$f\t_\t$upos\t_\t_\t_\t_\t_\t_\n");
    $id++;

    
}

fclose($fin);
fclose($fout);
