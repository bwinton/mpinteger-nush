(load "MPInteger")

; What?  No ++?!?
(macro ++ (n)
    `(set ,n (+ ,n 1))
)
(macro genTest (name cmp)
    `(function ,name (a b)
    (if ,cmp
    (puts "PASS")
    (else
      (print "FAIL: " a " != " b "\n")
      (++ failCount)
      (++ totalFail)
    )
  )
)
)
(macro startSection (name)
    `((do ()
          (if (!= failCount 0)
              (print failCount " tests failed\n")
          )
          (puts "")
          (puts ,name)
          (set failCount 0)
    ))
)

(genTest testMPI (== (a intValue) b))
(genTest testNumber (== a b))
(genTest testStr (a isEqualToString: b))
(genTest testBool (== a b))

; From Compare.h
(set MPIOrderedAscending -1)
(set MPIOrderedSame 0)
(set MPIOrderedDescending 1)

; Main method.
(set ansInt 9000)
(set totalFail 0)
(set failCount 0)
  

(startSection "INITIALIZING:")
  
(set i1 ((MPInteger alloc) init))
(print "init\t\t\t")
(testMPI i1 0)
(i1 release)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 534))
(set i2 ((MPInteger alloc) initWithMPInteger: i1))
(i1 release)
(print "initWithMPInteger:\t")
(testMPI i2 534)
(i2 release)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 349))
(print "initWithUnsignedInt:\t")
(testMPI i1 349)
(i1 release)

(set i1 ((MPInteger alloc) initWithString: "884"))
(print "initWithString:\t\t")
(testMPI i1 884)
(i1 release)

(set i1 ((MPInteger alloc) initWithString: "0b1010110001011011"))
(print "initWithString:\t\t")
(testMPI i1 44123)
(i1 release)

(set i1 ((MPInteger alloc) initWithString: "0xAC5b"))
(print "initWithString:\t\t")
(testMPI i1 44123)
(i1 release)

(set i1 ((MPInteger alloc) initWithString: "FE502A" inBase: 16))
(print "initWithString:inBase:\t")
(testMPI i1 16666666)
(i1 release)

;mpz_t a;
;mpz_init(a);
;mpz_set_si(a, -348);
;(set i1 ((MPInteger alloc) initWithMpz: a))
;(print "initWithMpz:\t\t")
;(testMPI i1 -348)
;mpz_clear(a);
;(i1 release)


(startSection "ARITHMETIC:")

(set i1 ((MPInteger alloc) initWithUnsignedInt: 543))
(set i2 ((MPInteger alloc) initWithUnsignedInt: 2319))
(set ans (i1 mpIntegerByAddingMPInteger: i2))
(i1 release)
(i2 release)
(print "mpIntegerByAddingMPInteger:\t\t")
(testMPI ans (+ 543 2319))
(ans release)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 543))
(set ans (i1 mpIntegerByAddingUnsignedInt: 2319))
(i1 release)
(print "mpIntegerByAddingUnsignedInt:\t\t")
(testMPI ans (+ 543 2319))
(ans release)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 543))
(set i2 ((MPInteger alloc) initWithUnsignedInt: 2319))
(set ans (i1 mpIntegerBySubtractingMPInteger: i2))
(i1 release)
(i2 release)
(print "mpIntegerBySubtractingMPInteger:\t")
(testMPI ans (- 543 2319))
(ans release)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 543))
(set ans (i1 mpIntegerBySubtractingUnsignedInt: 2319))
(i1 release)
(print "mpIntegerBySubtractingUnsignedInt:\t")
(testMPI ans (- 543 2319))
(ans release)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 543))
(set i2 ((MPInteger alloc) initWithUnsignedInt: 2319))
(set ans (i1 mpIntegerByMultiplyingMPInteger: i2))
(i1 release)
(i2 release)
(print "mpIntegerByMultiplyingMPInteger:\t")
(testMPI ans (* 543 2319))
(ans release)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 543))
(set ans (i1 mpIntegerByMultiplyingUnsignedInt: 2319))
(i1 release)
(print "mpIntegerByMultiplyingUnsignedInt:\t")
(testMPI ans (* 543 2319))
(ans release)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 543))
(set ans (i1 mpIntegerByNegating))
(i1 release)
(print "mpIntegerByNegating\t\t\t")
(testMPI ans -543)
(ans release)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 543))
(set i2 (i1 mpIntegerByNegating))
(set ans (i2 mpIntegerByNegating))
(i1 release)
(i2 release)
(print "mpIntegerByNegating\t\t\t")
(testMPI ans 543)
(ans release)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 543))
(set ans (i1 mpIntegerByAbsoluteValue))
(i1 release)
(print "mpIntegerByAbsoluteValue\t\t")
(testMPI ans 543)
(ans release)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 543))
(set i2 (i1 mpIntegerByNegating))
(set ans (i2 mpIntegerByAbsoluteValue))
(i1 release)
(i2 release)
(print "mpIntegerByAbsoluteValue\t\t")
(testMPI ans 543)
(ans release)


(startSection "COMPARISON:")

(set i1 ((MPInteger alloc) initWithString: "12332165465491414212131"))
(set i2 ((MPInteger alloc) initWithString: "12332165465491414212130"))
(set ansInt (i1 compare: i2))
(i1 release)
(i2 release)
(print "compare:\t\t")
(testNumber ansInt MPIOrderedDescending)
(set ansInt 9000)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 123))
(set i2 (i1 mpIntegerByNegating))
(set ansInt (i2 compare: i1))
(i1 release)
(i2 release)
(print "compare:\t\t")
(testNumber ansInt MPIOrderedAscending)
(set ansInt 9000)

(set i1 ((MPInteger alloc) initWithString: "6543211871002102102154547"))
(set i2 ((MPInteger alloc) initWithString: "6543211871002102102154547"))
(set ansInt (i2 compare: i1))
(i1 release)
(i2 release)
(print "compare:\t\t")
(testNumber ansInt MPIOrderedSame)
(set ansInt 9000)

(set i1 ((MPInteger alloc) initWithString: "-6543211871002102102154547"))
(set i2 ((MPInteger alloc) initWithString: "-6543211871002102102154547"))
(set ansInt (i2 isEqualToMPInteger: i1))
(i1 release)
(i2 release)
(print "isEqualToMPInteger\t")
(testNumber ansInt YES)
(set ansInt 9000)

(set i1 ((MPInteger alloc) initWithString: "6543211871002102102154547"))
(set i2 ((MPInteger alloc) initWithString: "6543211871002102102154543"))
(set ansInt (i2 isEqualToMPInteger: i1))
(i1 release)
(i2 release)
(print "isEqualToMPInteger\t")
(testNumber ansInt NO)
(set ansInt 9000)


(startSection "CONVERSION:")

(set i1 ((MPInteger alloc) initWithString: "-6541"))
(print "intValue\t\t")
(testNumber (i1 intValue) -6541)
(i1 release)

(set i1 ((MPInteger alloc) initWithString: "879456"))
(print "unsignedIntValue\t")
(testNumber (i1 unsignedIntValue) 879456)
(i1 release)

(set i1 ((MPInteger alloc) initWithString: "-789456156"))
(print "unsignedIntValue\t")
(testNumber (i1 unsignedIntValue) 789456156)
(i1 release)

(set i1 ((MPInteger alloc) initWithString: "-456112"))
(print "doubleValue\t\t")
(testNumber (i1 doubleValue) -456112.0)
(i1 release)

(set i1 ((MPInteger alloc) initWithString: "-456112"))
(print "stringValue\t\t")
(set ansStr (i1 stringValue))
(i1 release)
(testStr ansStr "-456112")
(ansStr release)

(set i1 ((MPInteger alloc) initWithString: "9842313251891816132135464"))
(print "stringValue\t\t")
(set ansStr (i1 stringValue))
(i1 release)
(testStr ansStr "9842313251891816132135464")
(ansStr release)

(set i1 ((MPInteger alloc) initWithString: "984231325135464"))
(print "stringValueInBase:\t")
(set ansStr (i1 stringValueInBase: 16))
(i1 release)
(testStr ansStr "37f273682f268")
(ansStr release)

(set i1 ((MPInteger alloc) initWithString: "65412" inBase: 16))
(print "stringValueInBase:\t")
(set ansStr (i1 stringValueInBase: 2))
(i1 release)
(testStr ansStr "1100101010000010010")
(ansStr release)


(startSection "DIVISION:")

(set i1 ((MPInteger alloc) initWithUnsignedInt: 2090140))
(set i2 ((MPInteger alloc) initWithUnsignedInt: 32156))
(set ans (i1 mpIntegerByDividingMPInteger: i2))
(i1 release)
(i2 release)
(print "mpIntegerByDividingMPInteger:\t\t")
(testMPI ans (/ 2090140 32156))
(ans release)

(set i1 ((MPInteger alloc) initWithUnsignedInt: 2090140))
(set ans (i1 mpIntegerByDividingUnsignedInt: 32156))
(i1 release)
(print "mpIntegerByDividingUnsignedInt:\t\t")
(testMPI ans (/ 2090140 32156))
(ans release)

(set i1 ((MPInteger alloc) initWithString: "-2090140"))
(set i2 ((MPInteger alloc) initWithUnsignedInt: 32156))
(set ans (i1 mpIntegerByDividingMPIntegerExactly: i2))
(i1 release)
(i2 release)
(print "mpIntegerByDividingMPIntegerExactly:\t")
(testMPI ans (/ -2090140 32156))
(ans release)

(set i1 ((MPInteger alloc) initWithString: "-2090140"))
(set ans (i1 mpIntegerByDividingUnsignedIntExactly: 32156))
(i1 release)
(print "mpIntegerByDividingUnsignedIntExactly:\t")
(testMPI ans (/ -2090140 32156))
(ans release)

(set i1 ((MPInteger alloc) initWithString: "-52537239720"))
(set i2 ((MPInteger alloc) initWithString: "9875421"))
(set ans (i1 mpIntegerByDividingMPInteger: i2 exactly: YES))
(i1 release)
(i2 release)
(print "mpIntegerByDividingMPInteger:exactly:\t")
(testMPI ans -5320)
(ans release)

(set i1 ((MPInteger alloc) initWithString: "-52537239720"))
(set i2 ((MPInteger alloc) initWithString: "-9875421"))
(set ans (i1 mpIntegerByDividingMPInteger: i2 exactly: NO))
(i1 release)
(i2 release)
(print "mpIntegerByDividingMPInteger:exactly:\t")
(testMPI ans 5320)
(ans release)

(set i1 ((MPInteger alloc) initWithString: "23123132564"))
(set i2 ((MPInteger alloc) initWithString: "545412"))
(set ans (i1 mpIntegerByDividingMPInteger: i2 exactly: NO))
(i1 release)
(i2 release)
(print "mpIntegerByDividingMPInteger:exactly:\t")
(testMPI ans 42395)
(ans release)

(set i1 ((MPInteger alloc) initWithString: "-52537239720"))
(set ans (i1 mpIntegerByDividingUnsignedInt: 9875421 exactly: YES))
(i1 release)
(print "mpIntegerByDividingUnsignedInt:exactly:\t")
(testMPI ans -5320)
(ans release)

(set i1 ((MPInteger alloc) initWithString: "52537239720"))
(set ans (i1 mpIntegerByDividingUnsignedInt: 9875421 exactly: NO))
(i1 release)
(print "mpIntegerByDividingUnsignedInt:exactly:\t")
(testMPI ans 5320)
(ans release)

(set i1 ((MPInteger alloc) initWithString: "23123132564"))
(set ans (i1 mpIntegerByDividingUnsignedInt: 545412 exactly: NO))
(i1 release)
(print "mpIntegerByDividingUnsignedInt:exactly:\t")
(testMPI ans 42395)
(ans release)

(set i1 ((MPInteger alloc) initWithString: "23123132564"))
(set i2 ((MPInteger alloc) initWithString: "545412"))
(set ans (i1 mpIntegerByModuloMPInteger: i2))
(i1 release)
(i2 release)
(print "mpIntegerByModuloMPInteger:\t\t")
(testMPI ans 390824)
(ans release)

(set i1 ((MPInteger alloc) initWithString: "23123132564"))
(set ans (i1 mpIntegerByModuloUnsignedInt: 545412))
(i1 release)
(print "mpIntegerByModuloUnsignedInt:\t\t")
(testMPI ans 390824)
(ans release)

(set i1 ((MPInteger alloc) initWithString: "23123132564"))
(set i2 ((MPInteger alloc) initWithString: "545412"))
(print "isDivisibleByMPInteger:\t\t\t")
(testBool (i1 isDivisibleByMPInteger: i2) NO)
(i1 release)
(i2 release)

(set i1 ((MPInteger alloc) initWithString: "23122741740"))
(set i2 ((MPInteger alloc) initWithString: "545412"))
(print "isDivisibleByMPInteger:\t\t\t")
(testBool (i1 isDivisibleByMPInteger: i2) YES)
(i1 release)
(i2 release)

(set i1 ((MPInteger alloc) initWithString: "23123132564"))
(print "isDivisibleByUnsignedInt:\t\t")
(testBool (i1 isDivisibleByUnsignedInt: 545412) NO)
(i1 release)

(set i1 ((MPInteger alloc) initWithString: "23122741740"))
(print "isDivisibleByUnsignedInt:\t\t")
(testBool (i1 isDivisibleByUnsignedInt: 545412) YES)
(i1 release)


(startSection "EXPONENTIATION:")

(set i1 ((MPInteger alloc) initWithString: "23123132564"))
(set ans (i1 mpIntegerByRaisingToExponentUnsignedInt: 54))
(i1 release)
(set ansStr (ans stringValue))
(ans release)
(print "mpIntegerByRaisingToExponentUnsignedInt:\t\t")
(testStr ansStr
"45553329496117015643764134219441699227872903253210864779493216543926346085953683913036755965537414565544980209697361981908141639768664699786434167359755647155031222329812354906069138767021232720100148609019582493217312660223948308981591995735741912418489445310892977912544590921590452549791238876304012217612399427774860340669559281870831241809258606155243165936895673123541488940200346255723766638607893118031096484770633138653781038434287249702117847855750352788326901203148441948001937172096139015959456071178944459119322130527518420143344518943136039305216"
)
(ansStr release)

(set i1 ((MPInteger alloc) initWithString: "23123132564"))
(set i2 ((MPInteger alloc) initWithUnsignedInt: 54))
(set i3 ((MPInteger alloc) initWithUnsignedInt: 200))
(set ans (i1 mpIntegerByRaisingToExponentMPInteger: i2
                                      modMPInteger: i3))
(i1 release)
(i2 release)
(i3 release)
(print "mpIntegerByRaisingToExponentMPInteger:modMPInteger:\t")
(testMPI ans 16)
(ans release)

(set i1 ((MPInteger alloc) initWithString: "-23123132564"))
(set i2 ((MPInteger alloc) initWithUnsignedInt: 200))
(set ans (i1 mpIntegerByRaisingToExponentUnsignedInt: 54
                                        modMPInteger: i2))
(i1 release)
(i2 release)
(print "mpIntegerByRaisingToExponentUnsignedInt:modMPInteger:\t")
(testNumber (ans intValue) 16)
(ans release)


(if (!= failCount 0)
  (print failCount " tests failed\n")
)
(puts "")

(puts "SUMMARY:")
(if (== totalFail 0)
    (puts "All tests passed")
    (else
      (puts totalFail " tests failed\n")
    )
)

(totalFail)
