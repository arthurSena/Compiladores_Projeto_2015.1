package lexico;

import java_cup.runtime.*;

//import static lexico.Simbolos.java

%% 

%public
//%function nextToken 

%class Analizador 

%{ 
  StringBuilder string = new StringBuilder();

  private int contador; //CONTADOR DE TOKENS
  
  private void printError(String text, int line, int column){
  		System.out.println("Lexical Error on character: " + text + " at Line: " + line + " Column: " + column);
  }
  
%}  

%init{ 
       contador = 0; 
%init} 

%column

%line 

%char 

%cup
%cupdebug

//%eofval{ return new Yytoken(contador, yytext(), sym.EOF, yyline, yycolumn);
//%eofval}

LETRAS=[A-Za-z] 
DIGITOS=[0-9]
ALFA_NUMERICO={LETRAS}|{DIGITOS}
IDENTIFICADOR={LETRAS}({ALFA_NUMERICO})* 

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]

DecIntegerLiteral = 0 | {DIGITOS}{DIGITOS}*

FLit1    = [0-9]+ \. [0-9]* 
FLit2    = \. [0-9]+ 
FLit3    = [0-9]+ 
Exponent = [eE] [+-]? [0-9]+                                    
                                    
floatingPointLiteral = ({FLit1}|{FLit2}|{FLit3}) {Exponent}? [fF]
DoubleLiteral = ({FLit1}|{FLit2}|{FLit3}) {Exponent}?[dD]

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
 
 StringCharacter = [^\r\n\"\\]
SingleCharacter = [^\r\n\'\\]
 
%state STRING 
%state CHARLITERAL	

%%
<YYINITIAL> {
//----------------------------------------SEPARATORS------------------------------------------------
("(") {contador ++; return new Yytoken(contador, null, sym.LPAREN, yyline+1, yycolumn+1);}
(")") {contador ++; return new Yytoken(contador, null, sym.RPAREN, yyline+1, yycolumn+1);}
("{") {contador ++; return new Yytoken(contador, null, sym.LBRACE, yyline+1, yycolumn+1); }
("}") {contador ++; return new Yytoken(contador, null, sym.RBRACE, yyline+1, yycolumn+1); }
(";") {contador ++; return new Yytoken(contador, null, sym.LBRACK, yyline+1, yycolumn+1);}
("[") {contador ++; return new Yytoken(contador, null, sym.RBRACK, yyline+1, yycolumn+1);}
("]") {contador ++; return new Yytoken(contador, null, sym.SEMICOLON, yyline+1, yycolumn+1);}
(",") {contador ++; return new Yytoken(contador, null, sym.COMMA, yyline+1, yycolumn+1);}
(".") {contador ++; return new Yytoken(contador, null, sym.DOT, yyline+1, yycolumn+1);}
//--------------------------------------------------------------------------------------------------

//----------------------------------------MODIFIER--------------------------------------------------
//{modifier} {contador ++; return new Yytoken(contador, null, sym.LPAREN, yyline+1, yycolumn+1);}
("public")  {contador ++; return new Yytoken(contador, null, sym.PUBLIC, yyline+1, yycolumn+1);}
("private") {contador ++; return new Yytoken(contador, null, sym.PRIVATE, yyline+1, yycolumn+1);}
("protected") {contador ++; return new Yytoken(contador, null, sym.PROTECTED, yyline+1, yycolumn+1);}
("static") {contador ++; return new Yytoken(contador, null,sym.STATIC, yyline+1, yycolumn+1);}
("final") {contador ++; return new Yytoken(contador, null, sym.FINAL, yyline+1, yycolumn+1);}
("native") {contador ++; return new Yytoken(contador, null, sym.NATIVE, yyline+1, yycolumn+1);}
("synchronized") {contador ++; return new Yytoken(contador, null, sym.SYNCHRONIZED, yyline+1, yycolumn+1);}
("abstract") {contador ++; return new Yytoken(contador, null, sym.ABSTRACT, yyline+1, yycolumn+1);}
( "transient") {contador ++; return new Yytoken(contador, null, sym.TRANSIENT, yyline+1, yycolumn+1);} 
//--------------------------------------------------------------------------------------------------

//----------------------------------------TYPE SPECIFIER--------------------------------------------
//{type_specifier} {contador ++; return new Yytoken(contador, null, sym.TRANSIENT, yyline+1, yycolumn+1);}
("boolean")  {contador ++; return new Yytoken(contador, null, sym.BOOLEAN, yyline+1, yycolumn+1);}
("byte") {contador ++; return new Yytoken(contador, null, sym.BYTE, yyline+1, yycolumn+1);}
("char") {contador ++; return new Yytoken(contador, null, sym.CHAR, yyline+1, yycolumn+1);}
("short") {contador ++; return new Yytoken(contador, null, sym.SHORT, yyline+1, yycolumn+1);}
("int") {contador ++; return new Yytoken(contador, null, sym.INT, yyline+1, yycolumn+1);}
("float") {contador ++; return new Yytoken(contador, null, sym.FLOAT, yyline+1, yycolumn+1);}
("long") {contador ++; return new Yytoken(contador, null, sym.LONG, yyline+1, yycolumn+1);}
("double") {contador ++; return new Yytoken(contador, null, sym.DOUBLE, yyline+1, yycolumn+1);}
//("String") {contador ++; return new Yytoken(contador, null, sym.STRING, yyline+1, yycolumn+1);}
("enum") {contador ++; return new Yytoken(contador, null, sym.ENUM, yyline+1, yycolumn+1);}
//--------------------------------------------------------------------------------------------------

//--------------------------------------KEYWORDS------------------------------------------------------

("break") {contador++; return new Yytoken(contador, null, sym.BREAK, yyline + 1, yycolumn + 1); }

("case") {contador++; return new Yytoken(contador, null, sym.CASE, yyline + 1, yycolumn + 1); }

("catch") {contador++; return new Yytoken(contador, null, sym.CATCH, yyline + 1, yycolumn + 1); }

("class") {contador++; return new Yytoken(contador, null, sym.CLASS, yyline + 1, yycolumn + 1); }

("continue") {contador++; return new Yytoken(contador, null, sym.CONTINUE, yyline + 1, yycolumn + 1); }

("default") {contador++; return new Yytoken(contador, null, sym.DEFAULT, yyline + 1, yycolumn + 1); }

("do") {contador++; return new Yytoken(contador, null, sym.DO, yyline + 1, yycolumn + 1); }

("else") {contador++; return new Yytoken(contador, null, sym.ELSE, yyline + 1, yycolumn + 1); }

("extends") {contador++; return new Yytoken(contador, null, sym.EXTENDS, yyline + 1, yycolumn + 1); }

("false") {contador++; return new Yytoken(contador, false, sym.BOOLEAN_LITERAL, yyline + 1, yycolumn + 1); }

("finally") {contador++; return new Yytoken(contador, null, sym.FINALLY, yyline + 1, yycolumn + 1); }

("for") {contador++; return new Yytoken(contador, null, sym.FOR, yyline + 1, yycolumn + 1); }

("if") {contador++; return new Yytoken(contador, null, sym.IF, yyline + 1, yycolumn + 1); }

("implements") {contador++; return new Yytoken(contador, null, sym.IMPLEMENTS, yyline + 1, yycolumn + 1); }

("import") {contador++; return new Yytoken(contador, null, sym.IMPORT, yyline + 1, yycolumn + 1); }

("instanceof") {contador++; return new Yytoken(contador, null, sym.INSTANCEOF, yyline + 1, yycolumn + 1); }

("interface") {contador++; return new Yytoken(contador, null, sym.INTERFACE, yyline + 1, yycolumn + 1); }

("new") {contador++; return new Yytoken(contador, null, sym.NEW, yyline + 1, yycolumn + 1); }

("null") {contador++; return new Yytoken(contador, null, sym.NULL, yyline + 1, yycolumn + 1); }

("package") {contador++; return new Yytoken(contador, null, sym.PACKAGE, yyline + 1, yycolumn + 1); }

("return") {contador++; return new Yytoken(contador, null, sym.RETURN, yyline + 1, yycolumn + 1); }

("super") {contador++; return new Yytoken(contador, null, sym.SUPER, yyline + 1, yycolumn + 1); }

("switch") {contador++; return new Yytoken(contador, null, sym.SWITCH, yyline + 1, yycolumn + 1); }

("this") {contador++; return new Yytoken(contador, null, sym.THIS, yyline + 1, yycolumn + 1); }

("throw") {contador++; return new Yytoken(contador, null, sym.THROW, yyline + 1, yycolumn + 1); }

("true") {contador++; return new Yytoken(contador, true, sym.BOOLEAN, yyline + 1, yycolumn + 1); }

("try") {contador++; return new Yytoken(contador, null, sym.TRY, yyline + 1, yycolumn + 1); }

("while") {contador++; return new Yytoken(contador, null, sym.WHILE, yyline + 1, yycolumn + 1); }

("void") {contador++; return new Yytoken(contador, null, sym.VOID, yyline + 1, yycolumn + 1); }
//-------------------------------------------------------------------------------------------------

 \" { yybegin(STRING); string.setLength(0); }

//-------------------------------------INTEGER_LITERAL---------------------------------------------
{DecIntegerLiteral} {contador++; return new Yytoken(contador, new Integer(yytext()), sym.INTEGER_LITERAL, yyline+1, yycolumn + 1);}
//-------------------------------------------------------------------------------------------------

//-------------------------------------FLOAT_LITERAL---------------------------------------------
{floatingPointLiteral} {contador++; return new Yytoken(contador, new Float(yytext().substring(0,yylength()-1)), sym.FLOATING_POINT_LITERAL, yyline+1, yycolumn + 1);}
//-------------------------------------------------------------------------------------------------

//------------------------------------------DOUBLE_LITERAL-------------------------------------------------------
{DoubleLiteral} {contador++; return new Yytoken(contador, new Double(yytext()), sym.FLOATING_POINT_LITERAL, yyline, yychar);}
//-------------------------------------------------------------------------------------------------

//-------------------------------------IDENTIFIER--------------------------------------------------
{IDENTIFICADOR} {contador++; return new Yytoken(contador, yytext(), sym.IDENTIFIER, yyline+1, yycolumn + 1); }
//-------------------------------------------------------------------------------------------------	
}
<STRING> {
(\") { yybegin(YYINITIAL); return new Yytoken(contador, string.toString(), sym.STRING_LITERAL, yyline+1, yycolumn + 1); }
{StringCharacter}+ { string.append( yytext() ); }
/* escape sequences */
"\\b" { string.append( '\b' ); }
"\\t" { string.append( '\t' ); }
"\\n" { string.append( '\n' ); }
"\\f" { string.append( '\f' ); }
"\\r" { string.append( '\r' ); }
"\\\"" { string.append( '\"' ); }
"\\'" { string.append( '\'' ); }
"\\\\" { string.append( '\\' ); }

/* error cases */
\\. { throw new RuntimeException("Illegal escape sequence \""+yytext()+"\""); }
{LineTerminator} { throw new RuntimeException("Unterminated string at end of line"); }
}


//----------------------------------------COMMENTS-------------------------------------------------
{Comment}                      { }
//-------------------------------------------------------------------------------------------------


//--------------------------------------------OPERATORS-----------------------------------------------------
//{Operators} {contador++; return new Yytoken(contador, yytext(), Simbolos.OPERATORS.ordinal(), yyline, yychar);}
 /* operators */
"=" {contador++; return new Yytoken(contador, null, sym.EQ, yyline + 1, yycolumn + 1); }
">" {contador++; return new Yytoken(contador, null, sym.GT, yyline + 1, yycolumn + 1); }
"<" {contador++; return new Yytoken(contador, null, sym.LT, yyline + 1, yycolumn + 1); }
"!" {contador++; return new Yytoken(contador, null, sym.NOT, yyline + 1, yycolumn + 1); }
"~" {contador++; return new Yytoken(contador, null, sym.COMP, yyline + 1, yycolumn + 1); }
"?" {contador++; return new Yytoken(contador, null, sym.QUESTION, yyline + 1, yycolumn + 1); }
":" {contador++; return new Yytoken(contador, null, sym.COLON, yyline + 1, yycolumn + 1); }
"==" {contador++; return new Yytoken(contador, null, sym.EQEQ, yyline + 1, yycolumn + 1); }
"<=" {contador++; return new Yytoken(contador, null, sym.LTEQ, yyline + 1, yycolumn + 1); }
">=" {contador++; return new Yytoken(contador, null, sym.GTEQ, yyline + 1, yycolumn + 1); }
"!=" {contador++; return new Yytoken(contador, null, sym.NOTEQ, yyline + 1, yycolumn + 1); }
"&&" {contador++; return new Yytoken(contador, null, sym.ANDAND, yyline + 1, yycolumn + 1); }
"||" {contador++; return new Yytoken(contador, null, sym.OROR, yyline + 1, yycolumn + 1); }
"++" {contador++; return new Yytoken(contador, null, sym.PLUSPLUS, yyline + 1, yycolumn + 1); }
"--" {contador++; return new Yytoken(contador, null, sym.MINUSMINUS, yyline + 1, yycolumn + 1); }
"+" {contador++; return new Yytoken(contador, null, sym.PLUS, yyline + 1, yycolumn + 1); }
"-" {contador++; return new Yytoken(contador, null, sym.MINUS, yyline + 1, yycolumn + 1); }
"*" {contador++; return new Yytoken(contador, null, sym.MULT, yyline + 1, yycolumn + 1); }
"/" {contador++; return new Yytoken(contador, null, sym.DIV, yyline + 1, yycolumn + 1); }
"&" {contador++; return new Yytoken(contador, null, sym.AND, yyline + 1, yycolumn + 1); }
"|" {contador++; return new Yytoken(contador, null, sym.OR, yyline + 1, yycolumn + 1); }
"^" {contador++; return new Yytoken(contador, null, sym.XOR, yyline + 1, yycolumn + 1); }
"%" {contador++; return new Yytoken(contador, null, sym.MOD, yyline + 1, yycolumn + 1); }
"<<" {contador++; return new Yytoken(contador, null, sym.LSHIFT, yyline + 1, yycolumn + 1); }
">>" {contador++; return new Yytoken(contador, null, sym.RSHIFT, yyline + 1, yycolumn + 1); }
">>>" {contador++; return new Yytoken(contador, null, sym.URSHIFT, yyline + 1, yycolumn + 1); }
"+=" {contador++; return new Yytoken(contador, null, sym.PLUSEQ, yyline + 1, yycolumn + 1); }
"-=" {contador++; return new Yytoken(contador, null, sym.MINUSEQ, yyline + 1, yycolumn + 1); }
"*=" {contador++; return new Yytoken(contador, null, sym.MULTEQ, yyline + 1, yycolumn + 1); }
"/=" {contador++; return new Yytoken(contador, null, sym.DIVEQ, yyline + 1, yycolumn + 1); }
"&=" {contador++; return new Yytoken(contador, null, sym.ANDEQ, yyline + 1, yycolumn + 1); }
"|=" {contador++; return new Yytoken(contador, null, sym.OREQ, yyline + 1, yycolumn + 1); }
"^=" {contador++; return new Yytoken(contador, null, sym.XOREQ, yyline + 1, yycolumn + 1); }
"%=" {contador++; return new Yytoken(contador, null, sym.MODEQ, yyline + 1, yycolumn + 1); }
"<<=" {contador++; return new Yytoken(contador, null, sym.LSHIFTEQ, yyline + 1, yycolumn + 1); }
">>=" {contador++; return new Yytoken(contador, null, sym.RSHIFTEQ, yyline + 1, yycolumn + 1); }
">>>=" {contador++; return new Yytoken(contador, null, sym.URSHIFTEQ, yyline + 1, yycolumn + 1); }
//-------------------------------------------------------------------------------------------------

//-------------------------------------------WHITESPACE--------------------------------------------
{WhiteSpace} {}
//-------------------------------------------------------------------------------------------------
<<EOF>> { return new Yytoken(contador, yytext(), sym.EOF, yyline, yycolumn); }
//-----------------------------------------------ERROR---------------------------------------------
. { printError(yytext(), yyline, yychar);}
//-------------------------------------------------------------------------------------------------
