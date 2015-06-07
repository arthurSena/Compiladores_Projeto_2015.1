package lexico;

//import java_cup.runtime.*;
//import static lexico.Simbolos.java

%% 

%public
//%function nextToken 

%class Analizador 

%{ 
  private int contador; //CONTADOR DE TOKENS
  
  private void printError(String text, int line, int column){
  		System.out.println("Lexical Error on character: " + text + "at Line: " + line + " Column: " + column);
  }
  
%}  

%init{ 
       contador = 0; 
%init} 

%line 

%char 

//%cup

%eof{//break;
%eof}

LETRAS=[A-Za-z] 
DIGITOS=[0-9]
ALFA_NUMERICO={LETRAS}|{DIGITOS}
IDENTIFICADOR={LETRAS}({ALFA_NUMERICO})* 

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]

DecIntegerLiteral = 0 | [1-9][0-9]*

FLit1    = [0-9]+ \. [0-9]* 
FLit2    = \. [0-9]+ 
FLit3    = [0-9]+ 
Exponent = [eE] [+-]? [0-9]+                                    
                                    
floatingPointLiteral = ({FLit1}|{FLit2}|{FLit3}) {Exponent}? [fF]
DoubleLiteral = ({FLit1}|{FLit2}|{FLit3}) {Exponent}?

special = "!"|"%"|"^"|"&"|"-"|"|"|"~"|"["|"]"|"\"|"'"|":"|"""|"?"|","|"."|"#"|"@"|"`"|"_"

Operators = "=="|"**"	| ">"|"<"|	"!"|	"~"|	"?"|	":"|	  	 	 	 
"="|	"<="|	">="|	"!="|	"&&"|	"||"|	"++"|	"--" 	 	 	 
|"+"|	"-"	|"*"|	"/"|	"&"	"|"|	"^"|	"%"| 	"<<="|	">>="|	">>>"|
"+="|	"-="|	"*="|	"/="|	"&="|	"|="	|"^="|	"%=" 	|"<<"	|">>"	


Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
// Comment can be the last line of the file, without line terminator.
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*
    
 "ERRO"
modifier = 
 "public" 
 |  "private" 
 |  "protected" 
 |  "static" 
 |  "final" 
 |  "native" 
 |  "synchronized" 
 |  "abstract" 
 |  "transient"  
 
 type_specifier = 
 "boolean" 
 |  "byte" 
 |  "char" 
 |  "short" 
 |  "int" 
 |  "float" 
 |  "long" 
 |  "double" 
 | "String"
 | "enum"
 
 

%%
//----------------------------------------SEPARATORS------------------------------------------------
("(") {contador ++; return new Yytoken(contador, yytext(), Simbolos.OpenPar.ordinal(), yyline, yychar);}
(")") {contador ++; return new Yytoken(contador, yytext(), Simbolos.ClosePar.ordinal(), yyline, yychar);}
("{") {contador ++; return new Yytoken(contador, yytext(), Simbolos.OpenCurlyBraces.ordinal(), yyline, yychar); }
("}") {contador ++; return new Yytoken(contador, yytext(), Simbolos.CloseCurlyBraces.ordinal(), yyline, yychar); }
(";") {contador ++; return new Yytoken(contador, yytext(), Simbolos.SEMICOLON.ordinal(), yyline, yychar);}
("[") {contador ++; return new Yytoken(contador, yytext(), Simbolos.OpenBracket.ordinal(), yyline, yychar);}
("]") {contador ++; return new Yytoken(contador, yytext(), Simbolos.CloseBracket.ordinal(), yyline, yychar);}
(",") {contador ++; return new Yytoken(contador, yytext(), Simbolos.COMMA.ordinal(), yyline, yychar);}
(".") {contador ++; return new Yytoken(contador, yytext(), Simbolos.POINT.ordinal(), yyline, yychar);}
//--------------------------------------------------------------------------------------------------

//----------------------------------------MODIFIER--------------------------------------------------
//{modifier} {contador ++; return new Yytoken(contador, yytext(), Simbolos.MODIFIER.ordinal(), yyline, yychar);}
("public")  {contador ++; return new Yytoken(contador, yytext(), Simbolos.PUBLIC.ordinal(), yyline, yychar);}
("private") {contador ++; return new Yytoken(contador, yytext(), Simbolos.PRIVATE.ordinal(), yyline, yychar);}
("protected") {contador ++; return new Yytoken(contador, yytext(), Simbolos.PROTECTED.ordinal(), yyline, yychar);}
("static") {contador ++; return new Yytoken(contador, yytext(), Simbolos.STATIC.ordinal(), yyline, yychar);}
("final") {contador ++; return new Yytoken(contador, yytext(), Simbolos.FINAL.ordinal(), yyline, yychar);}
("native") {contador ++; return new Yytoken(contador, yytext(), Simbolos.NATIVE.ordinal(), yyline, yychar);}
("synchronized") {contador ++; return new Yytoken(contador, yytext(), Simbolos.SYNCHRONIZED.ordinal(), yyline, yychar);}
("abstract") {contador ++; return new Yytoken(contador, yytext(), Simbolos.ABSTRACT.ordinal(), yyline, yychar);}
( "transient") {contador ++; return new Yytoken(contador, yytext(), Simbolos.TRANSIENT.ordinal(), yyline, yychar);} 
//--------------------------------------------------------------------------------------------------

//----------------------------------------TYPE SPECIFIER--------------------------------------------
{type_specifier} {contador ++; return new Yytoken(contador, yytext(), Simbolos.TYPE_SPECIFIER.ordinal(), yyline, yychar);}
//--------------------------------------------------------------------------------------------------

//--------------------------------------KEYWORDS------------------------------------------------------
("break") {contador++; return new Yytoken(contador, yytext(), Simbolos.BREAK.ordinal(), yyline, yychar); }
("case") {contador++; return new Yytoken(contador, yytext(), Simbolos.CASE.ordinal(), yyline, yychar); }
("catch") {contador++; return new Yytoken(contador, yytext(), Simbolos.CATCH.ordinal(), yyline, yychar); }
("class") {contador++; return new Yytoken(contador, yytext(), Simbolos.CLASS.ordinal(), yyline, yychar); }
("continue") {contador++; return new Yytoken(contador, yytext(), Simbolos.CONTINUE.ordinal(), yyline, yychar); }
("default") {contador++; return new Yytoken(contador, yytext(), Simbolos.DEFAULT.ordinal(), yyline, yychar); }
("do") {contador++; return new Yytoken(contador, yytext(), Simbolos.DO.ordinal(), yyline, yychar); }
("else") {contador++; return new Yytoken(contador, yytext(), Simbolos.ELSE.ordinal(), yyline, yychar); }
("extends") {contador++; return new Yytoken(contador, yytext(), Simbolos.EXTENDS.ordinal(), yyline, yychar); }
("false") {contador++; return new Yytoken(contador, yytext(), Simbolos.FALSE.ordinal(), yyline, yychar); }
("finally") {contador++; return new Yytoken(contador, yytext(), Simbolos.FINALLY.ordinal(), yyline, yychar); }
("for") {contador++; return new Yytoken(contador, yytext(), Simbolos.FOR.ordinal(), yyline, yychar); }
("if") {contador++; return new Yytoken(contador, yytext(), Simbolos.IF.ordinal(), yyline, yychar); }
("implements") {contador++; return new Yytoken(contador, yytext(), Simbolos.IMPLEMENTS.ordinal(), yyline, yychar); }
("import") {contador++; return new Yytoken(contador, yytext(), Simbolos.IMPORT.ordinal(), yyline, yychar); }
("instanceof") {contador++; return new Yytoken(contador, yytext(), Simbolos.INSTANCEOF.ordinal(), yyline, yychar); }
("interface") {contador++; return new Yytoken(contador, yytext(), Simbolos.INTERFACE.ordinal(), yyline, yychar); }
("new") {contador++; return new Yytoken(contador, yytext(), Simbolos.NEW.ordinal(), yyline, yychar); }
("null") {contador++; return new Yytoken(contador, yytext(), Simbolos.NULL.ordinal(), yyline, yychar); }
("package") {contador++; return new Yytoken(contador, yytext(), Simbolos.PACKAGE.ordinal(), yyline, yychar); }
("return") {contador++; return new Yytoken(contador, yytext(), Simbolos.RETURN.ordinal(), yyline, yychar); }
("super") {contador++; return new Yytoken(contador, yytext(), Simbolos.SUPER.ordinal(), yyline, yychar); }
("switch") {contador++; return new Yytoken(contador, yytext(), Simbolos.SWITCH.ordinal(), yyline, yychar); }
("this") {contador++; return new Yytoken(contador, yytext(), Simbolos.THIS.ordinal(), yyline, yychar); }
("throw") {contador++; return new Yytoken(contador, yytext(), Simbolos.THROW.ordinal(), yyline, yychar); }
("true") {contador++; return new Yytoken(contador, yytext(), Simbolos.TRUE.ordinal(), yyline, yychar); }
("try") {contador++; return new Yytoken(contador, yytext(), Simbolos.TRY.ordinal(), yyline, yychar); }
("while") {contador++; return new Yytoken(contador, yytext(), Simbolos.WHILE.ordinal(), yyline, yychar); }
("void") {contador++; return new Yytoken(contador, yytext(), Simbolos.VOID.ordinal(), yyline, yychar); }


//-------------------------------------------------------------------------------------------------

//-------------------------------------IDENTIFIER--------------------------------------------------
{IDENTIFICADOR} {contador++; return new Yytoken(contador, yytext(), Simbolos.ID.ordinal(), yyline, yychar); }
//-------------------------------------------------------------------------------------------------

//-------------------------------------INTEGER_LITERAL---------------------------------------------
//{DecIntegerLiteral} {contador++; return new Yytoken(contador, yytext(), Simbolos.INTEGER_LITERAL.ordinal(), yyline, yychar);}
//-------------------------------------------------------------------------------------------------

//-------------------------------------FLOAT_LITERAL---------------------------------------------
{floatingPointLiteral} {contador++; return new Yytoken(contador, yytext(), Simbolos.FLOATING_POINT_LITERAL.ordinal(), yyline, yychar);}
//-------------------------------------------------------------------------------------------------

//------------------------------------------DOUBLE_LITERAL-------------------------------------------------------
{DoubleLiteral} {contador++; return new Yytoken(contador, yytext(), Simbolos.DOUBLE_LITERAL.ordinal(), yyline, yychar);}
//-------------------------------------------------------------------------------------------------

//----------------------------------------COMMENTS-------------------------------------------------
{Comment}                      { }
//-------------------------------------------------------------------------------------------------

//-----------------------------------------SPECIAL CHARACTER---------------------------------------
(\") {contador++; return new Yytoken(contador, yytext(), Simbolos.SPECIAL_CHARACTER.ordinal(), yyline, yychar);}
{special} {contador++; return new Yytoken(contador, yytext(), Simbolos.SPECIAL_CHARACTER.ordinal(), yyline, yychar); }
//-------------------------------------------------------------------------------------------------

//--------------------------------------------OPERATORS-----------------------------------------------------
{Operators} {contador++; return new Yytoken(contador, yytext(), Simbolos.OPERATORS.ordinal(), yyline, yychar);}
//-------------------------------------------------------------------------------------------------

//-------------------------------------------WHITESPACE--------------------------------------------
{WhiteSpace} {}
//-------------------------------------------------------------------------------------------------

//-----------------------------------------------ERROR---------------------------------------------
. { printError(yytext(), yyline, yychar);}
//-------------------------------------------------------------------------------------------------
