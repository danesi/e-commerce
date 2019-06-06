/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.EnderecoDao;
import Dao.VendaDAO;
import Model.EnderecoBean;
import Model.ProdutoBean;
import Model.UsuarioBean;
import Model.VendaBean;
import Model.Venda_ItemVendaBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class Venda extends HttpServlet {

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
        
        VendaDAO dao = new VendaDAO();
        
        if (acao.equalsIgnoreCase("concluir")) {
            EnderecoDao enderecoDao = new EnderecoDao();
            if (session.getAttribute("usuario") != null) {
                UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario");
                EnderecoBean endereco = enderecoDao.selecionaPorIdUsuario(usuario.getCodigo());
                if (endereco.getComplemento() != null) {
                    session.setAttribute("endereco", endereco);
                }                
            }           
            rd = request.getRequestDispatcher("vendaAdd.jsp");
            rd.forward(request, response);
        }
        
        if (acao.equalsIgnoreCase("cadastrar")) {
            Date data = new Date();
            SimpleDateFormat formatador = new SimpleDateFormat("yyyy-MM-dd");
            double precoTotal = 0;
            List<ProdutoBean> produtos = (List<ProdutoBean>) session.getAttribute("carrinho");
            UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario");
            for (ProdutoBean produto : produtos) {
                precoTotal += produto.getPreco() * produto.getQuant();
            }
            
            System.out.println(usuario.getNome());
            VendaBean venda = new VendaBean();
            venda.setData(formatador.format(data));
            venda.setPreco(precoTotal);
            venda.setUsuario(usuario);
             
            dao.cadastrar(venda);
            int id = dao.selecionaUltima();
            System.out.println(id);
            VendaBean vendaB = dao.selecionaPorId(id);
            session.setAttribute("vendaCadastrada", vendaB);
            rd = request.getRequestDispatcher("ItemVenda?acao=cadastrar");
            rd.forward(request, response);
        }
        
        if (acao.equalsIgnoreCase("verVenda")) {
            int id = Integer.parseInt(request.getParameter("id"));
            List<Venda_ItemVendaBean> venda = dao.selecionaVenda(id);
            session.setAttribute("vendaView", venda);
            rd = request.getRequestDispatcher("vendaView.jsp");
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
