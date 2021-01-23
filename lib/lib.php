<?php

$LIB_PATH=dirname(__FILE__);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

date_default_timezone_set("Europe/Bucharest");

setlocale(LC_CTYPE,"ro_RO.UTF-8");
mb_internal_encoding("UTF-8");
mb_regex_encoding("UTF-8");

//require_once "${LIB_PATH}/vendor/autoload.php";

require_once "${LIB_PATH}/mb_additionals.php";
require_once "${LIB_PATH}/string_utils.php";
require_once "${LIB_PATH}/msd2upos.php";
require_once "${LIB_PATH}/msd2feats.php";
require_once "${LIB_PATH}/conllup.php";
require_once "${LIB_PATH}/ConllupSentence.php";
require_once "${LIB_PATH}/ConllupSentenceIterator.php";
require_once "${LIB_PATH}/ConllupToken.php";
require_once "${LIB_PATH}/ConllupTokenIterator.php";


?>