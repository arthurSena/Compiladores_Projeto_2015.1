package lexico;

public class Yytoken extends java_cup.runtime.Symbol{
	Yytoken(int numToken, Object text, int compo, int line, int charBegin) {
		super(compo, -1, -1, text);
		// Contador para el número de tokens reconocidos
		m_numToken = numToken;
		// String del token reconocido
		//m_text = (String) text;
		// Tipo de componente léxico encontrado
//		m_compo = compo;
		// Número de linea
		m_line = line;
		// Columna donde empieza el primer carácter del toke
		column = charBegin;
	}

	// Métodos de los atributos de la clase
	public int m_numToken;
	public String m_text;
	public int m_compo;
	public int m_line;
	public int column;

	public String toString() {
			return "Token #" + m_numToken + " " + m_text + " Value: " + value
					+ " Line: " + m_line + " Column: " + column;
	}

}