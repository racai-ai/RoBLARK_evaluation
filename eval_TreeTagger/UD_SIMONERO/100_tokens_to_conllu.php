<?php

$fin=fopen("test.tokens.out","r");
$fout=fopen("test.tokens.out.conllu","w");

$id=1;
while(!feof($fin)){
    $line=fgets($fin);
    if($line===false)break;
    $line=trim($line);
    if(strlen($line)==0)continue;
    
    fwrite($fout,"$id\t$line\t_\t_\t_\t_\t_\t_\t_\t_\n");
    $id++;
}

fclose($fin);
fclose($fout);
