package servlet;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Json2csv extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String json = request.getParameter("json");
		json = json.replace("{", "");
		// json=json.replace("}", "");
		json = json.replace("[", "");
		json = json.replace("]", "");
		json = json.trim();
		String csvfinal = "";
		String[] cabecalho = null;
		String[][] dados = null;
		String[] separaobj;
		try {
			String[] jsonobj = json.split("}");
			System.out.println(jsonobj.length);
			for (int cont = 0; cont < jsonobj.length; cont++) {
				separaobj = jsonobj[cont].split(",");
				System.out.println(Arrays.toString(separaobj));
				System.out.println(cont);
				if (cont == 0) {
					cabecalho = new String[separaobj.length];
					dados = new String[jsonobj.length][separaobj.length];
					for (int cont2 = 0; cont2 < separaobj.length; cont2++) {
						System.out.println(cont2);
						cabecalho[cont2] = separaobj[cont2].split(":")[0].trim();
						dados[cont][cont2] = separaobj[cont2].split(":")[1].trim();
					}

				} else {
					for (int cont2 = 1; cont2 < separaobj.length; cont2++) {

						dados[cont][cont2 - 1] = separaobj[cont2].split(":")[1].trim();
					}
				}
			}
			for (int cont = 0; cont < cabecalho.length; cont++) {
				csvfinal += (cabecalho[cont] + ",");

			}
			csvfinal += "\n";
			for (int cont = 0; cont < dados.length; cont++) {
				for (int cont2 = 0; cont2 < dados[cont].length; cont2++) {

					csvfinal += dados[cont][cont2] + ",";
				}
				csvfinal += "\n";

			}
		} catch (Exception e) {
			csvfinal = "Formato não suportado";
			dados = null;
			cabecalho = null;
		}
		csvfinal.replace("[", "");
		csvfinal.replace("]", "");
		System.out.println(csvfinal);
		request.setAttribute("csvfinal", csvfinal);
		RequestDispatcher rd = request.getRequestDispatcher("csv.jsp");
		request.setAttribute("teste", dados);
		request.setAttribute("cabecalho", cabecalho);
		rd.forward(request, response);

	}

}
