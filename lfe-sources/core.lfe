(defmodule core)

(kl-defun shen.shen->kl (V1383 V1384) (compile (lambda X (shen.<define> X)) (cons V1383 V1384) (lambda X (shen.shen-syntax-error V1383 X))))

(kl-defun shen.shen-syntax-error (V1391 V1392) (cond ((cons? V1392) (simple-error (cn "syntax error in " (shen.app V1391 (cn " here:

 " (shen.app (shen.next-50 50 (hd V1392)) "
" shen.a)) shen.a)))) (true (simple-error (cn "syntax error in " (shen.app V1391 "
" shen.a))))))

(kl-defun shen.<define> (V1394) (let YaccParse (let Parse_shen.<name> (shen.<name> V1394) (if (not (= (fail) Parse_shen.<name>)) (let Parse_shen.<signature> (shen.<signature> Parse_shen.<name>) (if (not (= (fail) Parse_shen.<signature>)) (let Parse_shen.<rules> (shen.<rules> Parse_shen.<signature>) (if (not (= (fail) Parse_shen.<rules>)) (shen.pair (hd Parse_shen.<rules>) (shen.compile_to_machine_code (shen.hdtl Parse_shen.<name>) (shen.hdtl Parse_shen.<rules>))) (fail))) (fail))) (fail))) (if (= YaccParse (fail)) (let Parse_shen.<name> (shen.<name> V1394) (if (not (= (fail) Parse_shen.<name>)) (let Parse_shen.<rules> (shen.<rules> Parse_shen.<name>) (if (not (= (fail) Parse_shen.<rules>)) (shen.pair (hd Parse_shen.<rules>) (shen.compile_to_machine_code (shen.hdtl Parse_shen.<name>) (shen.hdtl Parse_shen.<rules>))) (fail))) (fail))) YaccParse)))

(kl-defun shen.<name> (V1396) (if (cons? (hd V1396)) (let Parse_X (hd (hd V1396)) (shen.pair (hd (shen.pair (tl (hd V1396)) (shen.hdtl V1396))) (if (and (symbol? Parse_X) (not (shen.sysfunc? Parse_X))) Parse_X (simple-error (shen.app Parse_X " is not a legitimate function name.
" shen.a))))) (fail)))

(kl-defun shen.sysfunc? (V1398) (element? V1398 (get (intern "shen") shen.external-symbols (value *property-vector*))))

(kl-defun shen.<signature> (V1400) (if (and (cons? (hd V1400)) (= { (hd (hd V1400)))) (let Parse_shen.<signature-help> (shen.<signature-help> (shen.pair (tl (hd V1400)) (shen.hdtl V1400))) (if (not (= (fail) Parse_shen.<signature-help>)) (if (and (cons? (hd Parse_shen.<signature-help>)) (= } (hd (hd Parse_shen.<signature-help>)))) (shen.pair (hd (shen.pair (tl (hd Parse_shen.<signature-help>)) (shen.hdtl Parse_shen.<signature-help>))) (shen.demodulate (shen.curry-type (shen.hdtl Parse_shen.<signature-help>)))) (fail)) (fail))) (fail)))

(kl-defun shen.curry-type (V1402) (cond ((and (cons? V1402) (and (cons? (tl V1402)) (and (= --> (hd (tl V1402))) (and (cons? (tl (tl V1402))) (and (cons? (tl (tl (tl V1402)))) (= --> (hd (tl (tl (tl V1402)))))))))) (shen.curry-type (cons (hd V1402) (cons --> (cons (tl (tl V1402)) ()))))) ((and (cons? V1402) (and (cons? (tl V1402)) (and (= * (hd (tl V1402))) (and (cons? (tl (tl V1402))) (and (cons? (tl (tl (tl V1402)))) (= * (hd (tl (tl (tl V1402)))))))))) (shen.curry-type (cons (hd V1402) (cons * (cons (tl (tl V1402)) ()))))) ((cons? V1402) (map (lambda Z (shen.curry-type Z)) V1402)) (true V1402)))

(kl-defun shen.<signature-help> (V1404) (let YaccParse (if (cons? (hd V1404)) (let Parse_X (hd (hd V1404)) (let Parse_shen.<signature-help> (shen.<signature-help> (shen.pair (tl (hd V1404)) (shen.hdtl V1404))) (if (not (= (fail) Parse_shen.<signature-help>)) (if (not (element? Parse_X (cons { (cons } ())))) (shen.pair (hd Parse_shen.<signature-help>) (cons Parse_X (shen.hdtl Parse_shen.<signature-help>))) (fail)) (fail)))) (fail)) (if (= YaccParse (fail)) (let Parse_<e> (<e> V1404) (if (not (= (fail) Parse_<e>)) (shen.pair (hd Parse_<e>) ()) (fail))) YaccParse)))

(kl-defun shen.<rules> (V1406) (let YaccParse (let Parse_shen.<rule> (shen.<rule> V1406) (if (not (= (fail) Parse_shen.<rule>)) (let Parse_shen.<rules> (shen.<rules> Parse_shen.<rule>) (if (not (= (fail) Parse_shen.<rules>)) (shen.pair (hd Parse_shen.<rules>) (cons (shen.linearise (shen.hdtl Parse_shen.<rule>)) (shen.hdtl Parse_shen.<rules>))) (fail))) (fail))) (if (= YaccParse (fail)) (let Parse_shen.<rule> (shen.<rule> V1406) (if (not (= (fail) Parse_shen.<rule>)) (shen.pair (hd Parse_shen.<rule>) (cons (shen.linearise (shen.hdtl Parse_shen.<rule>)) ())) (fail))) YaccParse)))

(kl-defun shen.<rule> (V1408) (let YaccParse (let Parse_shen.<patterns> (shen.<patterns> V1408) (if (not (= (fail) Parse_shen.<patterns>)) (if (and (cons? (hd Parse_shen.<patterns>)) (= -> (hd (hd Parse_shen.<patterns>)))) (let Parse_shen.<action> (shen.<action> (shen.pair (tl (hd Parse_shen.<patterns>)) (shen.hdtl Parse_shen.<patterns>))) (if (not (= (fail) Parse_shen.<action>)) (if (and (cons? (hd Parse_shen.<action>)) (= where (hd (hd Parse_shen.<action>)))) (let Parse_shen.<guard> (shen.<guard> (shen.pair (tl (hd Parse_shen.<action>)) (shen.hdtl Parse_shen.<action>))) (if (not (= (fail) Parse_shen.<guard>)) (shen.pair (hd Parse_shen.<guard>) (cons (shen.hdtl Parse_shen.<patterns>) (cons (cons where (cons (shen.hdtl Parse_shen.<guard>) (cons (shen.hdtl Parse_shen.<action>) ()))) ()))) (fail))) (fail)) (fail))) (fail)) (fail))) (if (= YaccParse (fail)) (let YaccParse (let Parse_shen.<patterns> (shen.<patterns> V1408) (if (not (= (fail) Parse_shen.<patterns>)) (if (and (cons? (hd Parse_shen.<patterns>)) (= -> (hd (hd Parse_shen.<patterns>)))) (let Parse_shen.<action> (shen.<action> (shen.pair (tl (hd Parse_shen.<patterns>)) (shen.hdtl Parse_shen.<patterns>))) (if (not (= (fail) Parse_shen.<action>)) (shen.pair (hd Parse_shen.<action>) (cons (shen.hdtl Parse_shen.<patterns>) (cons (shen.hdtl Parse_shen.<action>) ()))) (fail))) (fail)) (fail))) (if (= YaccParse (fail)) (let YaccParse (let Parse_shen.<patterns> (shen.<patterns> V1408) (if (not (= (fail) Parse_shen.<patterns>)) (if (and (cons? (hd Parse_shen.<patterns>)) (= <- (hd (hd Parse_shen.<patterns>)))) (let Parse_shen.<action> (shen.<action> (shen.pair (tl (hd Parse_shen.<patterns>)) (shen.hdtl Parse_shen.<patterns>))) (if (not (= (fail) Parse_shen.<action>)) (if (and (cons? (hd Parse_shen.<action>)) (= where (hd (hd Parse_shen.<action>)))) (let Parse_shen.<guard> (shen.<guard> (shen.pair (tl (hd Parse_shen.<action>)) (shen.hdtl Parse_shen.<action>))) (if (not (= (fail) Parse_shen.<guard>)) (shen.pair (hd Parse_shen.<guard>) (cons (shen.hdtl Parse_shen.<patterns>) (cons (cons where (cons (shen.hdtl Parse_shen.<guard>) (cons (cons shen.choicepoint! (cons (shen.hdtl Parse_shen.<action>) ())) ()))) ()))) (fail))) (fail)) (fail))) (fail)) (fail))) (if (= YaccParse (fail)) (let Parse_shen.<patterns> (shen.<patterns> V1408) (if (not (= (fail) Parse_shen.<patterns>)) (if (and (cons? (hd Parse_shen.<patterns>)) (= <- (hd (hd Parse_shen.<patterns>)))) (let Parse_shen.<action> (shen.<action> (shen.pair (tl (hd Parse_shen.<patterns>)) (shen.hdtl Parse_shen.<patterns>))) (if (not (= (fail) Parse_shen.<action>)) (shen.pair (hd Parse_shen.<action>) (cons (shen.hdtl Parse_shen.<patterns>) (cons (cons shen.choicepoint! (cons (shen.hdtl Parse_shen.<action>) ())) ()))) (fail))) (fail)) (fail))) YaccParse)) YaccParse)) YaccParse)))

(kl-defun shen.fail_if (V1411 V1412) (if (V1411 V1412) (fail) V1412))

(kl-defun shen.succeeds? (V1418) (cond ((= V1418 (fail)) false) (true true)))

(kl-defun shen.<patterns> (V1420) (let YaccParse (let Parse_shen.<pattern> (shen.<pattern> V1420) (if (not (= (fail) Parse_shen.<pattern>)) (let Parse_shen.<patterns> (shen.<patterns> Parse_shen.<pattern>) (if (not (= (fail) Parse_shen.<patterns>)) (shen.pair (hd Parse_shen.<patterns>) (cons (shen.hdtl Parse_shen.<pattern>) (shen.hdtl Parse_shen.<patterns>))) (fail))) (fail))) (if (= YaccParse (fail)) (let Parse_<e> (<e> V1420) (if (not (= (fail) Parse_<e>)) (shen.pair (hd Parse_<e>) ()) (fail))) YaccParse)))

(kl-defun shen.<pattern> (V1427) (let YaccParse (if (and (cons? (hd V1427)) (cons? (hd (hd V1427)))) (if (and (cons? (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))) (= @p (hd (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))))) (let Parse_shen.<pattern1> (shen.<pattern1> (shen.pair (tl (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))) (shen.hdtl (shen.pair (hd (hd V1427)) (hd (tl V1427)))))) (if (not (= (fail) Parse_shen.<pattern1>)) (let Parse_shen.<pattern2> (shen.<pattern2> Parse_shen.<pattern1>) (if (not (= (fail) Parse_shen.<pattern2>)) (shen.pair (hd (shen.pair (tl (hd V1427)) (hd (tl V1427)))) (cons @p (cons (shen.hdtl Parse_shen.<pattern1>) (cons (shen.hdtl Parse_shen.<pattern2>) ())))) (fail))) (fail))) (fail)) (fail)) (if (= YaccParse (fail)) (let YaccParse (if (and (cons? (hd V1427)) (cons? (hd (hd V1427)))) (if (and (cons? (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))) (= cons (hd (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))))) (let Parse_shen.<pattern1> (shen.<pattern1> (shen.pair (tl (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))) (shen.hdtl (shen.pair (hd (hd V1427)) (hd (tl V1427)))))) (if (not (= (fail) Parse_shen.<pattern1>)) (let Parse_shen.<pattern2> (shen.<pattern2> Parse_shen.<pattern1>) (if (not (= (fail) Parse_shen.<pattern2>)) (shen.pair (hd (shen.pair (tl (hd V1427)) (hd (tl V1427)))) (cons cons (cons (shen.hdtl Parse_shen.<pattern1>) (cons (shen.hdtl Parse_shen.<pattern2>) ())))) (fail))) (fail))) (fail)) (fail)) (if (= YaccParse (fail)) (let YaccParse (if (and (cons? (hd V1427)) (cons? (hd (hd V1427)))) (if (and (cons? (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))) (= @v (hd (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))))) (let Parse_shen.<pattern1> (shen.<pattern1> (shen.pair (tl (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))) (shen.hdtl (shen.pair (hd (hd V1427)) (hd (tl V1427)))))) (if (not (= (fail) Parse_shen.<pattern1>)) (let Parse_shen.<pattern2> (shen.<pattern2> Parse_shen.<pattern1>) (if (not (= (fail) Parse_shen.<pattern2>)) (shen.pair (hd (shen.pair (tl (hd V1427)) (hd (tl V1427)))) (cons @v (cons (shen.hdtl Parse_shen.<pattern1>) (cons (shen.hdtl Parse_shen.<pattern2>) ())))) (fail))) (fail))) (fail)) (fail)) (if (= YaccParse (fail)) (let YaccParse (if (and (cons? (hd V1427)) (cons? (hd (hd V1427)))) (if (and (cons? (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))) (= @s (hd (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))))) (let Parse_shen.<pattern1> (shen.<pattern1> (shen.pair (tl (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))) (shen.hdtl (shen.pair (hd (hd V1427)) (hd (tl V1427)))))) (if (not (= (fail) Parse_shen.<pattern1>)) (let Parse_shen.<pattern2> (shen.<pattern2> Parse_shen.<pattern1>) (if (not (= (fail) Parse_shen.<pattern2>)) (shen.pair (hd (shen.pair (tl (hd V1427)) (hd (tl V1427)))) (cons @s (cons (shen.hdtl Parse_shen.<pattern1>) (cons (shen.hdtl Parse_shen.<pattern2>) ())))) (fail))) (fail))) (fail)) (fail)) (if (= YaccParse (fail)) (let YaccParse (if (and (cons? (hd V1427)) (cons? (hd (hd V1427)))) (if (and (cons? (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))) (= vector (hd (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))))) (if (and (cons? (hd (shen.pair (tl (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))) (shen.hdtl (shen.pair (hd (hd V1427)) (hd (tl V1427))))))) (= 0 (hd (hd (shen.pair (tl (hd (shen.pair (hd (hd V1427)) (hd (tl V1427))))) (shen.hdtl (shen.pair (hd (hd V1427)) (hd (tl V1427))))))))) (shen.pair (hd (shen.pair (tl (hd V1427)) (hd (tl V1427)))) (cons vector (cons 0 ()))) (fail)) (fail)) (fail)) (if (= YaccParse (fail)) (let YaccParse (if (cons? (hd V1427)) (let Parse_X (hd (hd V1427)) (if (cons? Parse_X) (shen.pair (hd (shen.pair (tl (hd V1427)) (shen.hdtl V1427))) (shen.constructor-error Parse_X)) (fail))) (fail)) (if (= YaccParse (fail)) (let Parse_shen.<simple_pattern> (shen.<simple_pattern> V1427) (if (not (= (fail) Parse_shen.<simple_pattern>)) (shen.pair (hd Parse_shen.<simple_pattern>) (shen.hdtl Parse_shen.<simple_pattern>)) (fail))) YaccParse)) YaccParse)) YaccParse)) YaccParse)) YaccParse)) YaccParse)))

(kl-defun shen.constructor-error (V1429) (simple-error (shen.app V1429 " is not a legitimate constructor
" shen.a)))

(kl-defun shen.<simple_pattern> (V1431) (let YaccParse (if (cons? (hd V1431)) (let Parse_X (hd (hd V1431)) (if (= Parse_X _) (shen.pair (hd (shen.pair (tl (hd V1431)) (shen.hdtl V1431))) (gensym Parse_Y)) (fail))) (fail)) (if (= YaccParse (fail)) (if (cons? (hd V1431)) (let Parse_X (hd (hd V1431)) (if (not (element? Parse_X (cons -> (cons <- ())))) (shen.pair (hd (shen.pair (tl (hd V1431)) (shen.hdtl V1431))) Parse_X) (fail))) (fail)) YaccParse)))

(kl-defun shen.<pattern1> (V1433) (let Parse_shen.<pattern> (shen.<pattern> V1433) (if (not (= (fail) Parse_shen.<pattern>)) (shen.pair (hd Parse_shen.<pattern>) (shen.hdtl Parse_shen.<pattern>)) (fail))))

(kl-defun shen.<pattern2> (V1435) (let Parse_shen.<pattern> (shen.<pattern> V1435) (if (not (= (fail) Parse_shen.<pattern>)) (shen.pair (hd Parse_shen.<pattern>) (shen.hdtl Parse_shen.<pattern>)) (fail))))

(kl-defun shen.<action> (V1437) (if (cons? (hd V1437)) (let Parse_X (hd (hd V1437)) (shen.pair (hd (shen.pair (tl (hd V1437)) (shen.hdtl V1437))) Parse_X)) (fail)))

(kl-defun shen.<guard> (V1439) (if (cons? (hd V1439)) (let Parse_X (hd (hd V1439)) (shen.pair (hd (shen.pair (tl (hd V1439)) (shen.hdtl V1439))) Parse_X)) (fail)))

(kl-defun shen.compile_to_machine_code (V1442 V1443) (let Lambda+ (shen.compile_to_lambda+ V1442 V1443) (let KL (shen.compile_to_kl V1442 Lambda+) (let Record (shen.record-source V1442 KL) KL))))

(kl-defun shen.record-source (V1448 V1449) (cond ((value shen.*installing-kl*) shen.skip) (true (put V1448 shen.source V1449 (value *property-vector*)))))

(kl-defun shen.compile_to_lambda+ (V1452 V1453) (let Arity (shen.aritycheck V1452 V1453) (let UpDateSymbolTable (shen.update-symbol-table V1452 Arity) (let Free (shen.for-each (lambda Rule (shen.free_variable_check V1452 Rule)) V1453) (let Variables (shen.parameters Arity) (let Strip (map (lambda X (shen.strip-protect X)) V1453) (let Abstractions (map (lambda X (shen.abstract_rule X)) Strip) (let Applications (map (lambda X (shen.application_build Variables X)) Abstractions) (cons Variables (cons Applications ()))))))))))

(kl-defun shen.update-symbol-table (V1456 V1457) (cond ((= 0 V1457) shen.skip) (true (put V1456 shen.lambda-form (eval-kl (shen.lambda-form V1456 V1457)) (value *property-vector*)))))

(kl-defun shen.free_variable_check (V1460 V1461) (cond ((and (cons? V1461) (and (cons? (tl V1461)) (= () (tl (tl V1461))))) (let Bound (shen.extract_vars (hd V1461)) (let Free (shen.extract_free_vars Bound (hd (tl V1461))) (shen.free_variable_warnings V1460 Free)))) (true (shen.f_error shen.free_variable_check))))

(kl-defun shen.extract_vars (V1463) (cond ((variable? V1463) (cons V1463 ())) ((cons? V1463) (union (shen.extract_vars (hd V1463)) (shen.extract_vars (tl V1463)))) (true ())))

(kl-defun shen.extract_free_vars (V1475 V1476) (cond ((and (cons? V1476) (and (cons? (tl V1476)) (and (= () (tl (tl V1476))) (= (hd V1476) protect)))) ()) ((and (variable? V1476) (not (element? V1476 V1475))) (cons V1476 ())) ((and (cons? V1476) (and (= lambda (hd V1476)) (and (cons? (tl V1476)) (and (cons? (tl (tl V1476))) (= () (tl (tl (tl V1476)))))))) (shen.extract_free_vars (cons (hd (tl V1476)) V1475) (hd (tl (tl V1476))))) ((and (cons? V1476) (and (= let (hd V1476)) (and (cons? (tl V1476)) (and (cons? (tl (tl V1476))) (and (cons? (tl (tl (tl V1476)))) (= () (tl (tl (tl (tl V1476)))))))))) (union (shen.extract_free_vars V1475 (hd (tl (tl V1476)))) (shen.extract_free_vars (cons (hd (tl V1476)) V1475) (hd (tl (tl (tl V1476))))))) ((cons? V1476) (union (shen.extract_free_vars V1475 (hd V1476)) (shen.extract_free_vars V1475 (tl V1476)))) (true ())))

(kl-defun shen.free_variable_warnings (V1481 V1482) (cond ((= () V1482) _) (true (simple-error (cn "error: the following variables are free in " (shen.app V1481 (cn ": " (shen.app (shen.list_variables V1482) "" shen.a)) shen.a))))))

(kl-defun shen.list_variables (V1484) (cond ((and (cons? V1484) (= () (tl V1484))) (cn (str (hd V1484)) ".")) ((cons? V1484) (cn (str (hd V1484)) (cn ", " (shen.list_variables (tl V1484))))) (true (shen.f_error shen.list_variables))))

(kl-defun shen.strip-protect (V1486) (cond ((and (cons? V1486) (and (cons? (tl V1486)) (and (= () (tl (tl V1486))) (= (hd V1486) protect)))) (shen.strip-protect (hd (tl V1486)))) ((cons? V1486) (map (lambda Z (shen.strip-protect Z)) V1486)) (true V1486)))

(kl-defun shen.linearise (V1488) (cond ((and (cons? V1488) (and (cons? (tl V1488)) (= () (tl (tl V1488))))) (shen.linearise_help (shen.flatten (hd V1488)) (hd V1488) (hd (tl V1488)))) (true (shen.f_error shen.linearise))))

(kl-defun shen.flatten (V1490) (cond ((= () V1490) ()) ((cons? V1490) (append (shen.flatten (hd V1490)) (shen.flatten (tl V1490)))) (true (cons V1490 ()))))

(kl-defun shen.linearise_help (V1494 V1495 V1496) (cond ((= () V1494) (cons V1495 (cons V1496 ()))) ((cons? V1494) (if (and (variable? (hd V1494)) (element? (hd V1494) (tl V1494))) (let Var (gensym (hd V1494)) (let NewAction (cons where (cons (cons = (cons (hd V1494) (cons Var ()))) (cons V1496 ()))) (let NewPatts (shen.linearise_X (hd V1494) Var V1495) (shen.linearise_help (tl V1494) NewPatts NewAction)))) (shen.linearise_help (tl V1494) V1495 V1496))) (true (shen.f_error shen.linearise_help))))

(kl-defun shen.linearise_X (V1509 V1510 V1511) (cond ((= V1511 V1509) V1510) ((cons? V1511) (let L (shen.linearise_X V1509 V1510 (hd V1511)) (if (= L (hd V1511)) (cons (hd V1511) (shen.linearise_X V1509 V1510 (tl V1511))) (cons L (tl V1511))))) (true V1511)))

(kl-defun shen.aritycheck (V1514 V1515) (cond ((and (cons? V1515) (and (cons? (hd V1515)) (and (cons? (tl (hd V1515))) (and (= () (tl (tl (hd V1515)))) (= () (tl V1515)))))) (do (shen.aritycheck-action (hd (tl (hd V1515)))) (shen.aritycheck-name V1514 (arity V1514) (length (hd (hd V1515)))))) ((and (cons? V1515) (and (cons? (hd V1515)) (and (cons? (tl (hd V1515))) (and (= () (tl (tl (hd V1515)))) (and (cons? (tl V1515)) (and (cons? (hd (tl V1515))) (and (cons? (tl (hd (tl V1515)))) (= () (tl (tl (hd (tl V1515)))))))))))) (if (= (length (hd (hd V1515))) (length (hd (hd (tl V1515))))) (do (shen.aritycheck-action (hd (tl (hd V1515)))) (shen.aritycheck V1514 (tl V1515))) (simple-error (cn "arity error in " (shen.app V1514 "
" shen.a))))) (true (shen.f_error shen.aritycheck))))

(kl-defun shen.aritycheck-name (V1528 V1529 V1530) (cond ((= -1 V1529) V1530) ((= V1530 V1529) V1530) (true (do (shen.prhush (cn "
warning: changing the arity of " (shen.app V1528 " can cause errors.
" shen.a)) (stoutput)) V1530))))

(kl-defun shen.aritycheck-action (V1536) (cond ((cons? V1536) (do (shen.aah (hd V1536) (tl V1536)) (shen.for-each (lambda Y (shen.aritycheck-action Y)) V1536))) (true shen.skip)))

(kl-defun shen.aah (V1539 V1540) (let Arity (arity V1539) (let Len (length V1540) (if (and (> Arity -1) (> Len Arity)) (shen.prhush (cn "warning: " (shen.app V1539 (cn " might not like " (shen.app Len (cn " argument" (shen.app (if (> Len 1) "s" "") ".
" shen.a)) shen.a)) shen.a)) (stoutput)) shen.skip))))

(kl-defun shen.abstract_rule (V1542) (cond ((and (cons? V1542) (and (cons? (tl V1542)) (= () (tl (tl V1542))))) (shen.abstraction_build (hd V1542) (hd (tl V1542)))) (true (shen.f_error shen.abstract_rule))))

(kl-defun shen.abstraction_build (V1545 V1546) (cond ((= () V1545) V1546) ((cons? V1545) (cons /. (cons (hd V1545) (cons (shen.abstraction_build (tl V1545) V1546) ())))) (true (shen.f_error shen.abstraction_build))))

(kl-defun shen.parameters (V1548) (cond ((= 0 V1548) ()) (true (cons (gensym V) (shen.parameters (- V1548 1))))))

(kl-defun shen.application_build (V1551 V1552) (cond ((= () V1551) V1552) ((cons? V1551) (shen.application_build (tl V1551) (cons V1552 (cons (hd V1551) ())))) (true (shen.f_error shen.application_build))))

(kl-defun shen.compile_to_kl (V1555 V1556) (cond ((and (cons? V1556) (and (cons? (tl V1556)) (= () (tl (tl V1556))))) (let Arity (shen.store-arity V1555 (length (hd V1556))) (let Reduce (map (lambda X (shen.reduce X)) (hd (tl V1556))) (let CondExpression (shen.cond-expression V1555 (hd V1556) Reduce) (let TypeTable (if (value shen.*optimise*) (shen.typextable (shen.get-type V1555) (hd V1556)) shen.skip) (let TypedCondExpression (if (value shen.*optimise*) (shen.assign-types (hd V1556) TypeTable CondExpression) CondExpression) (cons defun (cons V1555 (cons (hd V1556) (cons TypedCondExpression ())))))))))) (true (shen.f_error shen.compile_to_kl))))

(kl-defun shen.get-type (V1562) (cond ((cons? V1562) shen.skip) (true (let FType (assoc V1562 (value shen.*signedfuncs*)) (if (empty? FType) shen.skip (tl FType))))))

(kl-defun shen.typextable (V1573 V1574) (cond ((and (cons? V1573) (and (cons? (tl V1573)) (and (= --> (hd (tl V1573))) (and (cons? (tl (tl V1573))) (and (= () (tl (tl (tl V1573)))) (cons? V1574)))))) (if (variable? (hd V1573)) (shen.typextable (hd (tl (tl V1573))) (tl V1574)) (cons (cons (hd V1574) (hd V1573)) (shen.typextable (hd (tl (tl V1573))) (tl V1574))))) (true ())))

(kl-defun shen.assign-types (V1578 V1579 V1580) (cond ((and (cons? V1580) (and (= let (hd V1580)) (and (cons? (tl V1580)) (and (cons? (tl (tl V1580))) (and (cons? (tl (tl (tl V1580)))) (= () (tl (tl (tl (tl V1580)))))))))) (cons let (cons (hd (tl V1580)) (cons (shen.assign-types V1578 V1579 (hd (tl (tl V1580)))) (cons (shen.assign-types (cons (hd (tl V1580)) V1578) V1579 (hd (tl (tl (tl V1580))))) ()))))) ((and (cons? V1580) (and (= lambda (hd V1580)) (and (cons? (tl V1580)) (and (cons? (tl (tl V1580))) (= () (tl (tl (tl V1580)))))))) (cons lambda (cons (hd (tl V1580)) (cons (shen.assign-types (cons (hd (tl V1580)) V1578) V1579 (hd (tl (tl V1580)))) ())))) ((and (cons? V1580) (= cond (hd V1580))) (cons cond (map (lambda Y (cons (shen.assign-types V1578 V1579 (hd Y)) (cons (shen.assign-types V1578 V1579 (hd (tl Y))) ()))) (tl V1580)))) ((cons? V1580) (let NewTable (shen.typextable (shen.get-type (hd V1580)) (tl V1580)) (cons (hd V1580) (map (lambda Y (shen.assign-types V1578 (append V1579 NewTable) Y)) (tl V1580))))) (true (let AtomType (assoc V1580 V1579) (if (cons? AtomType) (cons type (cons V1580 (cons (tl AtomType) ()))) (if (element? V1580 V1578) V1580 (shen.atom-type V1580)))))))

(kl-defun shen.atom-type (V1582) (if (string? V1582) (cons type (cons V1582 (cons string ()))) (if (number? V1582) (cons type (cons V1582 (cons number ()))) (if (boolean? V1582) (cons type (cons V1582 (cons boolean ()))) (if (symbol? V1582) (cons type (cons V1582 (cons symbol ()))) V1582)))))

(kl-defun shen.store-arity (V1587 V1588) (cond ((value shen.*installing-kl*) shen.skip) (true (put V1587 arity V1588 (value *property-vector*)))))

(kl-defun shen.reduce (V1590) (do (set shen.*teststack* ()) (let Result (shen.reduce_help V1590) (cons (cons : (cons shen.tests (reverse (value shen.*teststack*)))) (cons Result ())))))

(kl-defun shen.reduce_help (V1592) (cond ((and (cons? V1592) (and (cons? (hd V1592)) (and (= /. (hd (hd V1592))) (and (cons? (tl (hd V1592))) (and (cons? (hd (tl (hd V1592)))) (and (= cons (hd (hd (tl (hd V1592))))) (and (cons? (tl (hd (tl (hd V1592))))) (and (cons? (tl (tl (hd (tl (hd V1592)))))) (and (= () (tl (tl (tl (hd (tl (hd V1592))))))) (and (cons? (tl (tl (hd V1592)))) (and (= () (tl (tl (tl (hd V1592))))) (and (cons? (tl V1592)) (= () (tl (tl V1592))))))))))))))) (do (shen.add_test (cons cons? (tl V1592))) (let Abstraction (cons /. (cons (hd (tl (hd (tl (hd V1592))))) (cons (cons /. (cons (hd (tl (tl (hd (tl (hd V1592)))))) (cons (shen.ebr (hd (tl V1592)) (hd (tl (hd V1592))) (hd (tl (tl (hd V1592))))) ()))) ()))) (let Application (cons (cons Abstraction (cons (cons hd (tl V1592)) ())) (cons (cons tl (tl V1592)) ())) (shen.reduce_help Application))))) ((and (cons? V1592) (and (cons? (hd V1592)) (and (= /. (hd (hd V1592))) (and (cons? (tl (hd V1592))) (and (cons? (hd (tl (hd V1592)))) (and (= @p (hd (hd (tl (hd V1592))))) (and (cons? (tl (hd (tl (hd V1592))))) (and (cons? (tl (tl (hd (tl (hd V1592)))))) (and (= () (tl (tl (tl (hd (tl (hd V1592))))))) (and (cons? (tl (tl (hd V1592)))) (and (= () (tl (tl (tl (hd V1592))))) (and (cons? (tl V1592)) (= () (tl (tl V1592))))))))))))))) (do (shen.add_test (cons tuple? (tl V1592))) (let Abstraction (cons /. (cons (hd (tl (hd (tl (hd V1592))))) (cons (cons /. (cons (hd (tl (tl (hd (tl (hd V1592)))))) (cons (shen.ebr (hd (tl V1592)) (hd (tl (hd V1592))) (hd (tl (tl (hd V1592))))) ()))) ()))) (let Application (cons (cons Abstraction (cons (cons fst (tl V1592)) ())) (cons (cons snd (tl V1592)) ())) (shen.reduce_help Application))))) ((and (cons? V1592) (and (cons? (hd V1592)) (and (= /. (hd (hd V1592))) (and (cons? (tl (hd V1592))) (and (cons? (hd (tl (hd V1592)))) (and (= @v (hd (hd (tl (hd V1592))))) (and (cons? (tl (hd (tl (hd V1592))))) (and (cons? (tl (tl (hd (tl (hd V1592)))))) (and (= () (tl (tl (tl (hd (tl (hd V1592))))))) (and (cons? (tl (tl (hd V1592)))) (and (= () (tl (tl (tl (hd V1592))))) (and (cons? (tl V1592)) (= () (tl (tl V1592))))))))))))))) (do (shen.add_test (cons shen.+vector? (tl V1592))) (let Abstraction (cons /. (cons (hd (tl (hd (tl (hd V1592))))) (cons (cons /. (cons (hd (tl (tl (hd (tl (hd V1592)))))) (cons (shen.ebr (hd (tl V1592)) (hd (tl (hd V1592))) (hd (tl (tl (hd V1592))))) ()))) ()))) (let Application (cons (cons Abstraction (cons (cons hdv (tl V1592)) ())) (cons (cons tlv (tl V1592)) ())) (shen.reduce_help Application))))) ((and (cons? V1592) (and (cons? (hd V1592)) (and (= /. (hd (hd V1592))) (and (cons? (tl (hd V1592))) (and (cons? (hd (tl (hd V1592)))) (and (= @s (hd (hd (tl (hd V1592))))) (and (cons? (tl (hd (tl (hd V1592))))) (and (cons? (tl (tl (hd (tl (hd V1592)))))) (and (= () (tl (tl (tl (hd (tl (hd V1592))))))) (and (cons? (tl (tl (hd V1592)))) (and (= () (tl (tl (tl (hd V1592))))) (and (cons? (tl V1592)) (= () (tl (tl V1592))))))))))))))) (do (shen.add_test (cons shen.+string? (tl V1592))) (let Abstraction (cons /. (cons (hd (tl (hd (tl (hd V1592))))) (cons (cons /. (cons (hd (tl (tl (hd (tl (hd V1592)))))) (cons (shen.ebr (hd (tl V1592)) (hd (tl (hd V1592))) (hd (tl (tl (hd V1592))))) ()))) ()))) (let Application (cons (cons Abstraction (cons (cons pos (cons (hd (tl V1592)) (cons 0 ()))) ())) (cons (cons tlstr (tl V1592)) ())) (shen.reduce_help Application))))) ((and (cons? V1592) (and (cons? (hd V1592)) (and (= /. (hd (hd V1592))) (and (cons? (tl (hd V1592))) (and (cons? (tl (tl (hd V1592)))) (and (= () (tl (tl (tl (hd V1592))))) (and (cons? (tl V1592)) (and (= () (tl (tl V1592))) (not (variable? (hd (tl (hd V1592))))))))))))) (do (shen.add_test (cons = (cons (hd (tl (hd V1592))) (tl V1592)))) (shen.reduce_help (hd (tl (tl (hd V1592))))))) ((and (cons? V1592) (and (cons? (hd V1592)) (and (= /. (hd (hd V1592))) (and (cons? (tl (hd V1592))) (and (cons? (tl (tl (hd V1592)))) (and (= () (tl (tl (tl (hd V1592))))) (and (cons? (tl V1592)) (= () (tl (tl V1592)))))))))) (shen.reduce_help (shen.ebr (hd (tl V1592)) (hd (tl (hd V1592))) (hd (tl (tl (hd V1592))))))) ((and (cons? V1592) (and (= where (hd V1592)) (and (cons? (tl V1592)) (and (cons? (tl (tl V1592))) (= () (tl (tl (tl V1592)))))))) (do (shen.add_test (hd (tl V1592))) (shen.reduce_help (hd (tl (tl V1592)))))) ((and (cons? V1592) (and (cons? (tl V1592)) (= () (tl (tl V1592))))) (let Z (shen.reduce_help (hd V1592)) (if (= (hd V1592) Z) V1592 (shen.reduce_help (cons Z (tl V1592)))))) (true V1592)))

(kl-defun shen.+string? (V1594) (cond ((= "" V1594) false) (true (string? V1594))))

(kl-defun shen.+vector? (V1596) (and (absvector? V1596) (> (<-address V1596 0) 0)))

(kl-defun shen.ebr (V1610 V1611 V1612) (cond ((= V1612 V1611) V1610) ((and (cons? V1612) (and (= /. (hd V1612)) (and (cons? (tl V1612)) (and (cons? (tl (tl V1612))) (and (= () (tl (tl (tl V1612)))) (> (occurrences V1611 (hd (tl V1612))) 0)))))) V1612) ((and (cons? V1612) (and (= lambda (hd V1612)) (and (cons? (tl V1612)) (and (cons? (tl (tl V1612))) (and (= () (tl (tl (tl V1612)))) (> (occurrences V1611 (hd (tl V1612))) 0)))))) V1612) ((and (cons? V1612) (and (= let (hd V1612)) (and (cons? (tl V1612)) (and (cons? (tl (tl V1612))) (and (cons? (tl (tl (tl V1612)))) (and (= () (tl (tl (tl (tl V1612))))) (= (hd (tl V1612)) V1611))))))) (cons let (cons (hd (tl V1612)) (cons (shen.ebr V1610 (hd (tl V1612)) (hd (tl (tl V1612)))) (tl (tl (tl V1612))))))) ((cons? V1612) (cons (shen.ebr V1610 V1611 (hd V1612)) (shen.ebr V1610 V1611 (tl V1612)))) (true V1612)))

(kl-defun shen.add_test (V1614) (set shen.*teststack* (cons V1614 (value shen.*teststack*))))

(kl-defun shen.cond-expression (V1618 V1619 V1620) (let Err (shen.err-condition V1618) (let Cases (shen.case-form V1620 Err) (let EncodeChoices (shen.encode-choices Cases V1618) (shen.cond-form EncodeChoices)))))

(kl-defun shen.cond-form (V1624) (cond ((and (cons? V1624) (and (cons? (hd V1624)) (and (= true (hd (hd V1624))) (and (cons? (tl (hd V1624))) (= () (tl (tl (hd V1624)))))))) (hd (tl (hd V1624)))) (true (cons cond V1624))))

(kl-defun shen.encode-choices (V1629 V1630) (cond ((= () V1629) ()) ((and (cons? V1629) (and (cons? (hd V1629)) (and (= true (hd (hd V1629))) (and (cons? (tl (hd V1629))) (and (cons? (hd (tl (hd V1629)))) (and (= shen.choicepoint! (hd (hd (tl (hd V1629))))) (and (cons? (tl (hd (tl (hd V1629))))) (and (= () (tl (tl (hd (tl (hd V1629)))))) (and (= () (tl (tl (hd V1629)))) (= () (tl V1629))))))))))) (cons (cons true (cons (cons let (cons Result (cons (hd (tl (hd (tl (hd V1629))))) (cons (cons if (cons (cons = (cons Result (cons (cons fail ()) ()))) (cons (if (value shen.*installing-kl*) (cons shen.sys-error (cons V1630 ())) (cons shen.f_error (cons V1630 ()))) (cons Result ())))) ())))) ())) ())) ((and (cons? V1629) (and (cons? (hd V1629)) (and (= true (hd (hd V1629))) (and (cons? (tl (hd V1629))) (and (cons? (hd (tl (hd V1629)))) (and (= shen.choicepoint! (hd (hd (tl (hd V1629))))) (and (cons? (tl (hd (tl (hd V1629))))) (and (= () (tl (tl (hd (tl (hd V1629)))))) (= () (tl (tl (hd V1629)))))))))))) (cons (cons true (cons (cons let (cons Result (cons (hd (tl (hd (tl (hd V1629))))) (cons (cons if (cons (cons = (cons Result (cons (cons fail ()) ()))) (cons (shen.cond-form (shen.encode-choices (tl V1629) V1630)) (cons Result ())))) ())))) ())) ())) ((and (cons? V1629) (and (cons? (hd V1629)) (and (cons? (tl (hd V1629))) (and (cons? (hd (tl (hd V1629)))) (and (= shen.choicepoint! (hd (hd (tl (hd V1629))))) (and (cons? (tl (hd (tl (hd V1629))))) (and (= () (tl (tl (hd (tl (hd V1629)))))) (= () (tl (tl (hd V1629))))))))))) (cons (cons true (cons (cons let (cons Freeze (cons (cons freeze (cons (shen.cond-form (shen.encode-choices (tl V1629) V1630)) ())) (cons (cons if (cons (hd (hd V1629)) (cons (cons let (cons Result (cons (hd (tl (hd (tl (hd V1629))))) (cons (cons if (cons (cons = (cons Result (cons (cons fail ()) ()))) (cons (cons thaw (cons Freeze ())) (cons Result ())))) ())))) (cons (cons thaw (cons Freeze ())) ())))) ())))) ())) ())) ((and (cons? V1629) (and (cons? (hd V1629)) (and (cons? (tl (hd V1629))) (= () (tl (tl (hd V1629))))))) (cons (hd V1629) (shen.encode-choices (tl V1629) V1630))) (true (shen.f_error shen.encode-choices))))

(kl-defun shen.case-form (V1637 V1638) (cond ((= () V1637) (cons V1638 ())) ((and (cons? V1637) (and (cons? (hd V1637)) (and (cons? (hd (hd V1637))) (and (= : (hd (hd (hd V1637)))) (and (cons? (tl (hd (hd V1637)))) (and (= shen.tests (hd (tl (hd (hd V1637))))) (and (= () (tl (tl (hd (hd V1637))))) (and (cons? (tl (hd V1637))) (and (cons? (hd (tl (hd V1637)))) (and (= shen.choicepoint! (hd (hd (tl (hd V1637))))) (and (cons? (tl (hd (tl (hd V1637))))) (and (= () (tl (tl (hd (tl (hd V1637)))))) (= () (tl (tl (hd V1637)))))))))))))))) (cons (cons true (tl (hd V1637))) (shen.case-form (tl V1637) V1638))) ((and (cons? V1637) (and (cons? (hd V1637)) (and (cons? (hd (hd V1637))) (and (= : (hd (hd (hd V1637)))) (and (cons? (tl (hd (hd V1637)))) (and (= shen.tests (hd (tl (hd (hd V1637))))) (and (= () (tl (tl (hd (hd V1637))))) (and (cons? (tl (hd V1637))) (= () (tl (tl (hd V1637)))))))))))) (cons (cons true (tl (hd V1637))) ())) ((and (cons? V1637) (and (cons? (hd V1637)) (and (cons? (hd (hd V1637))) (and (= : (hd (hd (hd V1637)))) (and (cons? (tl (hd (hd V1637)))) (and (= shen.tests (hd (tl (hd (hd V1637))))) (and (cons? (tl (hd V1637))) (= () (tl (tl (hd V1637))))))))))) (cons (cons (shen.embed-and (tl (tl (hd (hd V1637))))) (tl (hd V1637))) (shen.case-form (tl V1637) V1638))) (true (shen.f_error shen.case-form))))

(kl-defun shen.embed-and (V1640) (cond ((and (cons? V1640) (= () (tl V1640))) (hd V1640)) ((cons? V1640) (cons and (cons (hd V1640) (cons (shen.embed-and (tl V1640)) ())))) (true (shen.f_error shen.embed-and))))

(kl-defun shen.err-condition (V1642) (cons true (cons (cons shen.f_error (cons V1642 ())) ())))

(kl-defun shen.sys-error (V1644) (simple-error (cn "system function " (shen.app V1644 ": unexpected argument
" shen.a))))



