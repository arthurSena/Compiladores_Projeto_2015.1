package lexico;

import java.io.FileReader;

import java_cup.runtime.Symbol;

public class Main {

	public static void main(String[] args) throws Exception{
		// new Symbol(Simbolos.PLUS);
		FileReader file = new FileReader("/home/arthur/workspace/Compiladores_Projeto_2015.1/src/lexico/entrada.txt");
		alexico(file);
		String _i=  "";
	}

	public static void alexico(FileReader fichero) {
		// Creamos la instancia de la clase analizador (yyle x)
		Analizador sampleLex = new Analizador(fichero);
		Yytoken token = null;
		String buff;
		do {
			try {
				// como hemos renombrado el metodo en las directiva ahora es
				// nextToken
				token = sampleLex.nextToken();
			} catch (java.io.IOException e) {
				System.out.println("Error en nextToken()");
			}
//				catch (java.lang.Error e) {
//					System.out.println("Lexic Error.");
//					System.out.println(token);
//					break;
//				}
			// Mientrasno este vacio
			if (token != null)
				// Escribimos en fichero Salida
				System.out.println(token);
		} while (token != null);
	}
}
