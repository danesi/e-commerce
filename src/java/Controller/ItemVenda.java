/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.ItemVendaDao;
import Dao.VendaDAO;
import Model.ItemVendaBean;
import Model.ProdutoBean;
import Model.UsuarioBean;
import Model.VendaBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class ItemVenda extends HttpServlet {

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
        
        ItemVendaDao dao = new ItemVendaDao();
        
        if (acao.equalsIgnoreCase("cadastrar")) {
            List<ProdutoBean> produtos = (List<ProdutoBean>) session.getAttribute("carrinho");
            VendaBean venda = (VendaBean) session.getAttribute("vendaCadastrada");
            for (ProdutoBean produto : produtos) {
                ItemVendaBean ivb = new ItemVendaBean();
                ivb.setProduto(produto);
                ivb.setVenda(venda);
                ivb.setQuantidade(produto.getQuant());
                dao.cadastrar(ivb);
            }
            session.setAttribute("msg", "Compra efetuada com sucesso");
            session.setAttribute("carrinho", null);
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
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
