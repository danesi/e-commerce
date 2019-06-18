/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.ItemVendaDao;
import Dao.RelatorioDao;
import Dao.VendaDAO;
import Model.ItemVendaBean;
import Model.RelatorioBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anesi
 */
public class Relatorio extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String acao = request.getParameter("acao");
        RequestDispatcher rd = null;

        RelatorioDao dao = new RelatorioDao();

        if (acao.equalsIgnoreCase("produtoMaisVendido")) {
            List<RelatorioBean> relatorios = dao.proMaisVendido();
            session.setAttribute("produtoMaisVendido", relatorios);
            rd = request.getRequestDispatcher("produtosMaisVendidos.jsp");
            rd.forward(request, response);
        }

        if (acao.equalsIgnoreCase("entreDatas")) {
            String dataInicial = request.getParameter("dataInicial");
            String dataFinal = request.getParameter("dataFinal");
            List<RelatorioBean> relatorios = dao.entreDatas(dataInicial, dataFinal);
            try {
                if (relatorios == null) {
                    session.setAttribute("msg", "Nenhuma arrecadação nas datas informadas");
                    rd = request.getRequestDispatcher("administrativa.jsp");
                    rd.forward(request, response);
                } else {
                    session.setAttribute("datas", dataInicial + " e " + dataFinal);
                    session.setAttribute("entreDatas", relatorios);
                    rd = request.getRequestDispatcher("produtoPorData.jsp");
                    rd.forward(request, response);
                }
            } catch (IOException | ServletException e) {

            }

        }

        if (acao.equalsIgnoreCase("ClienteMaisComprou")) {
            List<RelatorioBean> relatorios = dao.clienteMaisCompra();
            if (relatorios.size() > 0) {
                session.setAttribute("clienteCompra", relatorios);
                rd = request.getRequestDispatcher("clienteQueMaisCompra.jsp");
                rd.forward(request, response);
            } else {
                System.out.println("aaaADSD");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
