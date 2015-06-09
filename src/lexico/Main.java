package lexico;

import java.io.FileReader;

import sintatico.*;

import java.io.*;

import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.DefaultSymbolFactory;
//import java_cup.parser;
//import java_cup.sym;
import java_cup.runtime.Symbol;
import java_cup.runtime.SymbolFactory;

public class Main {

	public static void main(String[] args) throws Exception{
		//##########################----Analise Lexica-----####################
//		FileReader file = new FileReader("/home/arthur/workspace/JflexExemplo/src/lexico/entrada.txt");
//		alexico(file);
		
		//#########################-----Essa vai ser a parte da Analise Sintatica-----####################
//		syntacticAnalysis(args);
		try {
			 Analizador scanner = new Analizador( new FileReader("/home/arthur/workspace/JflexExemplo/src/lexico/entrada.txt"));
		      parser p = new parser( scanner );
		      p.parse();
		      System.out.println("Sem erros de Sintaxe");

		    } catch (Exception e) {
		      /* do cleanup here -- possibly rethrow e */
		      } finally {
		        /* do close out here */
		        }
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
	
	public static void  syntacticAnalysis(String[] args){
		 for (int i = 0; i < args.length; i++) {
		      try {
		        System.out.println("#######---- Syntactic Analysis ----#######");
//		        Analizador s = new Analizador(new FileReader(args[i]));
		        parser p = new parser(new Analizador(new FileReader(args[i])));
				new parser(new Analizador(new FileReader(args[i])));
		        p.parse();
		        
		        System.out.println("No errors.");
		      }
		      catch (Exception e) {
		        e.printStackTrace(System.out);
		        System.exit(1);
		      }
		    }
	}
}
