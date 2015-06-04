package lexico;

//import java_cup.runtime.Symbol;
//import static lexico.Simbolos.java

%% 
//permite cambiar el nombre de la función de yylex que reconoce los tokens (next token)

%function nextToken 

//permite cambiar el nombre de la clase del analizador léxico, desde Yylex. 

%class Analizador 

//se define in integer para el contador de tokens 

%{ 
  private int contador; 
%}  

//con init inicializamos variables 

%init{ 
       contador = 0; 
%init} 

//fin de fichero 

%eof{  
%eof} 

//Activa el contador de líneas, almacena en al variable entera yyline el índice de la primera //línea del token reconocido 
%line 

//activa el contador de caracteres, por defecto desactivado, almacena en al variable entera yychar el índice del primer caracter del token reconocido 
%char 

EXP_ALPHA=[A-Za-z] 
EXP_DIGITO=[0-9] 
EXP_ALPHA_NUMERIC={EXP_ALPHA}|{EXP_DIGITO} 
NUMERO=({EXP_DIGITO})* 
EXP_ENTERO=[1-9] 
NUMERO_ENTERO="0"|{EXP_ENTERO}({EXP_DIGITO})* 
EXP_OCTAL=[0-8] 
NUMERO_OCTAL="0"({EXP_OCTAL})+ 
EXP_HEX=[0-9a-fA-F] 
NUMERO_HEX="0x"({EXP_HEX})+ 
IDENTIFICADOR={EXP_ALPHA}({EXP_ALPHA_NUMERIC})* 



%%

("public") {contador++; return new Yytoken(contador, yytext(), Simbolos.PUBLIC.toString(), yyline, yychar); }
("abstract") {contador++; return new Yytoken(contador, yytext(), Simbolos.ABSTRACT.toString(), yyline, yychar); }
("boolean") {contador++; return new Yytoken(contador, yytext(), Simbolos.BOOLEAN.toString(), yyline, yychar); }
("break") {contador++; return new Yytoken(contador, yytext(), Simbolos.BREAK.toString(), yyline, yychar); }
("byte") {contador++; return new Yytoken(contador, yytext(), Simbolos.BYTE.toString(), yyline, yychar); }
("case") {contador++; return new Yytoken(contador, yytext(), Simbolos.CASE.toString(), yyline, yychar); }
("catch") {contador++; return new Yytoken(contador, yytext(), Simbolos.CATCH.toString(), yyline, yychar); }
("char") {contador++; return new Yytoken(contador, yytext(), Simbolos.CHAR.toString(), yyline, yychar); }
("class") {contador++; return new Yytoken(contador, yytext(), Simbolos.CLASS.toString(), yyline, yychar); }
("continue") {contador++; return new Yytoken(contador, yytext(), Simbolos.CONTINUE.toString(), yyline, yychar); }
("default") {contador++; return new Yytoken(contador, yytext(), Simbolos.DEFAULT.toString(), yyline, yychar); }
("do") {contador++; return new Yytoken(contador, yytext(), Simbolos.DO.toString(), yyline, yychar); }
("double") {contador++; return new Yytoken(contador, yytext(), Simbolos.DOUBLE.toString(), yyline, yychar); }
("else") {contador++; return new Yytoken(contador, yytext(), Simbolos.ELSE.toString(), yyline, yychar); }
("extends") {contador++; return new Yytoken(contador, yytext(), Simbolos.EXTENDS.toString(), yyline, yychar); }
("false") {contador++; return new Yytoken(contador, yytext(), Simbolos.FALSE.toString(), yyline, yychar); }
("final") {contador++; return new Yytoken(contador, yytext(), Simbolos.FINAL.toString(), yyline, yychar); }
("finally") {contador++; return new Yytoken(contador, yytext(), Simbolos.FINALLY.toString(), yyline, yychar); }
("float") {contador++; return new Yytoken(contador, yytext(), Simbolos.FLOAT.toString(), yyline, yychar); }
("for") {contador++; return new Yytoken(contador, yytext(), Simbolos.FOR.toString(), yyline, yychar); }
("if") {contador++; return new Yytoken(contador, yytext(), Simbolos.IF.toString(), yyline, yychar); }
("implements") {contador++; return new Yytoken(contador, yytext(), Simbolos.IMPLEMENTS.toString(), yyline, yychar); }
("import") {contador++; return new Yytoken(contador, yytext(), Simbolos.IMPORT.toString(), yyline, yychar); }
("instanceof") {contador++; return new Yytoken(contador, yytext(), Simbolos.INSTANCEOF.toString(), yyline, yychar); }
("int") {contador++; return new Yytoken(contador, yytext(), Simbolos.INT.toString(), yyline, yychar); }
("interface") {contador++; return new Yytoken(contador, yytext(), Simbolos.INTERFACE.toString(), yyline, yychar); }
("long") {contador++; return new Yytoken(contador, yytext(), Simbolos.LONG.toString(), yyline, yychar); }
("native") {contador++; return new Yytoken(contador, yytext(), Simbolos.NATIVE.toString(), yyline, yychar); }
("new") {contador++; return new Yytoken(contador, yytext(), Simbolos.NEW.toString(), yyline, yychar); }
("null") {contador++; return new Yytoken(contador, yytext(), Simbolos.NULL.toString(), yyline, yychar); }
("package") {contador++; return new Yytoken(contador, yytext(), Simbolos.PACKAGE.toString(), yyline, yychar); }
("private") {contador++; return new Yytoken(contador, yytext(), Simbolos.PRIVATE.toString(), yyline, yychar); }
("protected") {contador++; return new Yytoken(contador, yytext(), Simbolos.PROTECTED.toString(), yyline, yychar); }
("public") {contador++; return new Yytoken(contador, yytext(), Simbolos.PUBLIC.toString(), yyline, yychar); }
("return") {contador++; return new Yytoken(contador, yytext(), Simbolos.RETURN.toString(), yyline, yychar); }
("short") {contador++; return new Yytoken(contador, yytext(), Simbolos.SHORT.toString(), yyline, yychar); }
("static") {contador++; return new Yytoken(contador, yytext(), Simbolos.STATIC.toString(), yyline, yychar); }
("super") {contador++; return new Yytoken(contador, yytext(), Simbolos.SUPER.toString(), yyline, yychar); }
("switch") {contador++; return new Yytoken(contador, yytext(), Simbolos.SWITCH.toString(), yyline, yychar); }
("synchronized") {contador++; return new Yytoken(contador, yytext(), Simbolos.SYNCHRONIZED.toString(), yyline, yychar); }
("this") {contador++; return new Yytoken(contador, yytext(), Simbolos.THIS.toString(), yyline, yychar); }
("threadsafe") {contador++; return new Yytoken(contador, yytext(), Simbolos.THREADSAFE.toString(), yyline, yychar); }
("throw") {contador++; return new Yytoken(contador, yytext(), Simbolos.THROW.toString(), yyline, yychar); }
("transient") {contador++; return new Yytoken(contador, yytext(), Simbolos.TRANSIENT.toString(), yyline, yychar); }
("true") {contador++; return new Yytoken(contador, yytext(), Simbolos.TRUE.toString(), yyline, yychar); }
("try") {contador++; return new Yytoken(contador, yytext(), Simbolos.TRY.toString(), yyline, yychar); }
("while") {contador++; return new Yytoken(contador, yytext(), Simbolos.WHILE.toString(), yyline, yychar); }



{NUMERO_HEX}    {    contador++; 
                            return new Yytoken(contador, yytext(),"Hexadecimal", yyline, yychar); 
                            } 
{NUMERO_ENTERO} {  contador++; 
                            return new Yytoken(contador, yytext(),"Entero",yyline, yychar); 
                            } 
{NUMERO_OCTAL}  {   contador++; 
                            return new Yytoken(contador, yytext(),"Octal", yyline, yychar); 
                            } 
{IDENTIFICADOR} {   contador++; 
                            return new Yytoken(contador, yytext(),"Identificador", yyline, yychar); 
} 
{NUMERO} {  contador++; 
                            return new Yytoken(contador, yytext(),"Numero",yyline, yychar); 
                     } 

" "         { } 
[\n]         { } 
[\t\r]             { } 