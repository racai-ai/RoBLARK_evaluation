<?php

$fin=fopen("test.model_only.xpos.out","r");
$fout=fopen("test.model_only.xpos.out.conllu","w");

$id=1;
while(!feof($fin)){
    $line=fgets($fin);
    if($line===false)break;
    $line=trim($line);
    if(strlen($line)==0)continue;
    
    $data=explode("\t",$line);
    if(count($data)!=3)continue;
    
    $f=$data[0];
    $xpos=$data[1];
    $l=$data[2];
    
    $sent=false;
    if($xpos=="SENT"){$sent=true;$xpos="PERIOD";}
    
    fwrite($fout,"$id\t$f\t$l\t_\t$xpos\t_\t_\t_\t_\t_\n");
    $id++;

    if($sent){$id=1;fwrite($fout,"\n");}
    
}

fclose($fin);
fclose($fout);
