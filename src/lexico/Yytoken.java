package lexico;

class Yytoken {
	Yytoken(int numToken, String text, String compo, int line, int charBegin) {
		// Contador para el número de tokens reconocidos
		m_numToken = numToken;
		// String del token reconocido
		m_text = new String(text);
		// Tipo de componente léxico encontrado
		m_compo = compo;
		// Número de linea
		m_line = line;
		// Columna donde empieza el primer carácter del toke
		m_charBegin = charBegin;
	}

	// Métodos de los atributos de la clase
	public int m_numToken;
	public String m_text;
	public String m_compo;
	public int m_line;
	public int m_charBegin;

	public String toString() {
		if (m_compo.equals("ERRO")){
			return  m_compo 
					+ " Line: " + m_line + " Column: " + m_charBegin;			
		}
		else{
			return "Token #" + m_numToken + ": " + m_text + " C.Lexico: " + m_compo
					+ " Line: " + m_line + " Column: " + m_charBegin;
		}
	}

}