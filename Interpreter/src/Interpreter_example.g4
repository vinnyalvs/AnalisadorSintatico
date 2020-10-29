grammar Interpreter_example;

fragment DIGIT : [0-9] ;
fragment ALPHA : [A-Za-z] ;

OPEN_ROUND : '(' ;
CLOSE_ROUND : ')' ;
OPEN_SQUARE : '[' ;
CLOSE_SQUARE : ']' ;
OPEN_CURLY : '{';
CLOSE_CURLY : '}' ;

SEMI_COLON : ';' ;
COMMA : ','  ;
COLON : ':' ;
COLONCOLON : '::';
DOT : '.' ;

PLUS : '+' ;
MINUS : '-'  ;
MULT : '*';
DIV : '/' ;
MOD : '%';
AND : '&&';
NOT : '!';

EQ : '=';
EQEQ : '==';
LESS : '<';
GREATER : '>';
NOTEQ : '!=';

/* Palavras reservadas */
IF : 'if';
ELSE : 'else';
DATA : 'data';
ITERATE : 'iterate';
READ : 'read';
PRINT : 'print';
RETURN : 'return';
NEW : 'new';

TYPE_INT : 'Int';
TYPE_CHAR : 'Char';
TYPE_BOOL : 'Bool';
TYPE_FLOAT : 'Float';

LITERAL_NULL : 'null' ;

TRUE : 'true' ;
FALSE : 'false' ;


//{TYPE_IDENTIFIER}
ID : ALPHA ( ALPHA | DIGIT |'_')* ;

/* Literais */
LITERAL_INT :  DIGIT DIGIT* ;
LITERAL_FLOAT : (DIGIT)* '.' (DIGIT)+;

LITERAL_CHAR : '\'' (~['"\\] | '\\' ( 'r' | 'n' | 't' | 'b' | '\'' | '"' | '\\' )) '\'' ;

LITERAL_BOOL : TRUE | FALSE ;

NEWLINE: ('\r' '\n'? | '\n') -> skip;
WHITESPACE: [ \t]+ -> skip;

/* Comentários */
LINE_COMMENT : '--' ~ [\r\n]* -> skip;
MULTILNE_COMMENT : '{-' .*? '-}' -> skip;

prog :
    data* func* ;
data :
    DATA ID OPEN_CURLY (decl)* CLOSE_CURLY { if(!Character.isUpperCase($ID.text.charAt(0))) throw new RuntimeException();}
    ;
decl :
    ID COLONCOLON type SEMI_COLON ;
func :
    ID OPEN_ROUND params? CLOSE_ROUND (COLON type (COMMA type))? OPEN_CURLY (cmd) CLOSE_CURLY ;
params :
    ID COLONCOLON type (COMMA ID COLONCOLON type)* ;
type :
    type OPEN_SQUARE CLOSE_SQUARE
    | btype ;
btype :
    TYPE_INT
    | TYPE_CHAR
    | TYPE_BOOL
    | TYPE_FLOAT
    | ID { if(!Character.isUpperCase($ID.text.charAt(0))) throw new RuntimeException();} ;
cmd :
    OPEN_CURLY (cmd)* CLOSE_CURLY
    | IF OPEN_ROUND exp CLOSE_ROUND cmd
    | IF OPEN_ROUND exp CLOSE_ROUND cmd ELSE cmd
    | ITERATE OPEN_ROUND exp CLOSE_ROUND cmd
    | READ lvalue SEMI_COLON
    | PRINT exp SEMI_COLON
    | RETURN exp (COMMA exp)* SEMI_COLON
    | lvalue EQ exp SEMI_COLON
    | ID OPEN_ROUND (exps)? CLOSE_ROUND (LESS lvalue (COMMA lvalue)* GREATER)? SEMI_COLON ;

exp :
    exp AND exp
    | rexp ;
rexp :
    aexp LESS aexp
    | rexp EQEQ aexp
    | rexp NOTEQ aexp
    | aexp ;
aexp :
    aexp PLUS mexp
    | aexp MINUS mexp
    | mexp ;
mexp :
    mexp MULT sexp
    | mexp DIV sexp
    | mexp MOD sexp
    | sexp ;
sexp :
    <assoc=right> NOT sexp
    | <assoc=right> MINUS sexp
    | TRUE
    | FALSE
    | LITERAL_NULL
    | LITERAL_INT
    | LITERAL_FLOAT
    | LITERAL_CHAR
    | pexp ;
pexp :
    lvalue
    | OPEN_ROUND exp CLOSE_ROUND
    | NEW type (OPEN_SQUARE exp CLOSE_SQUARE)?
    | ID OPEN_ROUND exps? CLOSE_ROUND OPEN_SQUARE exp CLOSE_SQUARE ;
lvalue :
    ID
    | lvalue OPEN_SQUARE exp CLOSE_SQUARE
    | lvalue DOT ID ;
exps :
    exp (COMMA exp )* ;

