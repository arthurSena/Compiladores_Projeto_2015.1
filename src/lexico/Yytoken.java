package lexico;
//Yytoken(contador, null, sym.CATCH, yyline + 1, yycolumn + 1);
public class Yytoken extends java_cup.runtime.Symbol{
	Yytoken(int numToken, Object value, int compo, int line, int column) {
		super(compo, 0, 0, value);
//		super()
		// Contador para el número de tokens reconocidos
		m_numToken = numToken;
		// String del token reconocido
		//m_text = (String) text;
		// Tipo de componente léxico encontrado
//		m_compo = compo;
		// Número de linea
		m_line = line;
		// Columna donde empieza el primer carácter del toke
		column = column;
	}

	// Métodos de los atributos de la clase
	public int m_numToken;
	public String m_text;
	public int m_compo;
	public int m_line;
	public int column;

	public String toString() {
		System.out.println("SDKLFJSALKDFJLSKADJ");
			return "Token #" + m_numToken + " " + m_text + " Value: " + value
					+ " Line: " + m_line + " Column: " + column + " SYM> " +sym + " ID> " + super.parse_state;
	}

}