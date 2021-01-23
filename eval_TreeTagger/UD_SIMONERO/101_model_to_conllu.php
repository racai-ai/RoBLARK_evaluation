<?php

$fin=fopen("test.model_only.out","r");
$fout=fopen("test.model_only.out.conllu","w");

$id=1;
while(!feof($fin)){
    $line=fgets($fin);
    if($line===false)break;
    $line=trim($line);
    if(strlen($line)==0)continue;
    
    $data=explode("\t",$line);
    if(count($data)!=3)continue;
    
    $f=$data[0];
    $upos=$data[1];
    $l=$data[2];
    
    $sent=false;
    if($upos=="SENT"){$sent=true;$upos="PUNCT";}
    
    fwrite($fout,"$id\t$f\t$l\t$upos\t_\t_\t_\t_\t_\t_\n");
    $id++;

    if($sent){$id=1;fwrite($fout,"\n");}
    
}

fclose($fin);
fclose($fout);
