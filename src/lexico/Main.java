package lexico;

import java.io.FileReader;

import sintatico.*;

import java.io.*;

import java_cup.parser;
import java_cup.sym;
import java_cup.runtime.Symbol;

public class Main {

	public static void main(String[] args) throws Exception{
		//##########################----Analise Lexica-----####################
		FileReader file = new FileReader("/home/arthur/workspace/JflexExemplo/src/lexico/entrada.txt");
		alexico(file);
		
		//#########################-----Essa vai ser a parte da Analise Sintatica-----####################
//		try {
//		      parser p = new parser(new Analizador(new FileReader("/home/arthur/workspace/JflexExemplo/src/lexico/entrada.txt")));
//		      Object result = p.parse().value;
//		 
//
//		    } catch (Exception e) {
//		      /* do cleanup here -- possibly rethrow e */
//		      } finally {
//		        /* do close out here */
//		        }
		  } 

	public static void alexico(FileReader fichero) {
		// Creamos la instancia de la clase analizador (yyle x)
		Analizador sampleLex = new Analizador(fichero);
//		Yytoken token = null;
		java_cup.runtime.Symbol token = null;
		String buff;
		do {
			try {
				// como hemos renombrado el metodo en las directiva ahora es
				// nextToken
//				token = (Yytoken) sampleLex.yylex();
				token =  sampleLex.next_token();
			} catch (java.io.IOException e) {
				System.out.println("Error em nextToken()");
			} 
//				catch (java.lang.Error e) {
//					System.out.println("Lexic Error.");
//					System.out.println(token);
//					break;
//				}
			// Mientrasno este vacio
			if (token != null)
				// Escribimos en fichero Salida
				System.out.println(token  + "\n");
//			System.out.println(token==null);
		} while (!token.equals((new java_cup.runtime.Symbol(sym.EOF))));
	}
}
