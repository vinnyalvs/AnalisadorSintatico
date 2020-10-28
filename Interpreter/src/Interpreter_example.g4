grammar Interpreter_example;

start  :
     expression  EOF
  ;

expression
   :
   |   INT
   |   expression (PLUS | MINUS) expression
   ;

PLUS   :  '+';
MINUS  :  '-';
INT    :  '0'..'9'+;
