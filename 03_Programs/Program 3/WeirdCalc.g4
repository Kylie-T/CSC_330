// GRAMMAR
grammar WeirdCalc;
@header {import java.util.HashMap; }

// PARSER
program
@init {WeirdCalc.env = new HashMap<String, Integer>();}
: line* EOF ;
line: assignment SEMI_COLON | print SEMI_COLON;
assignment returns [int val]
    : IDENTIFIER EQUAL e=exp { WeirdCalc.env.put($IDENTIFIER.text, $e.val); };
print returns [int val]
    : PRINT LPAREN e=exp RPAREN { System.out.println($e.val); }
     | PRINT LPAREN RPAREN { System.out.println(); };
exp returns [int val]
    : left=exp HASH right=item { if ($left.val % $right.val == 0) { $val = 0; }
                    else { $val = 1; } }
    | i=item  { $val = $i.val; };
item returns [int val]
    : left=operand AT right=item { $val = Math.abs($left.val + $right.val); }
    | left=operand TILDE right=item { $val = ($left.val * $left.val) + ($right.val * $right.val); }
    | o=operand { $val = $o.val; };
operand returns [int val]
    : DOLLAR o=operand { if ($o.val < 0) { $val = -1; }
                        else if ($o.val == 0) { $val = 0; } 
                        else { $val = 1; } }
    | d=data { $val = $d.val;};
data returns [int val]
    : n=number { $val = $n.val; }
    | IDENTIFIER { Integer value = WeirdCalc.env.get($IDENTIFIER.text);
                 if (value == null) {
                    System.err.println("Must initialize value.");
                    $val = 0;
                 } else { $val = value; } };
number returns [int val]
    : DASH DIGIT
      { $val = -Integer.parseInt($DIGIT.text); }
    | DIGIT
      { $val = Integer.parseInt($DIGIT.text); };

// LEXER
SEMI_COLON: ';';
EQUAL: '=';
PRINT: 'print';
LPAREN: '(';
RPAREN: ')';
HASH: '#';
AT: '@';
DOLLAR: '$';
DASH: '-';
TILDE: '~';
DIGIT: [0-9]+;

IDENTIFIER: [A-Za-z][A-Za-z0-9]*;

WHITE_SPACE: [ \t\n\r\f]+ -> skip;
LINE_COMMENT: '//' ~('\r'|'\n')* -> skip;
