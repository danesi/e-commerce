/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.EnderecoDao;
import Model.EnderecoBean;
import Model.UsuarioBean;
import java.io.IOException;
import java.io.PrintWriter;
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
public class Endereco extends HttpServlet {

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

        EnderecoDao dao = new EnderecoDao();

        if (acao.equalsIgnoreCase("cadastrar")) {
            EnderecoBean endereco = new EnderecoBean();
            endereco.setEndereco(request.getParameter("endereco"));
            endereco.setCep(request.getParameter("cep"));
            endereco.setNum_casa(Integer.parseInt(request.getParameter("num_casa")));
            endereco.setComplemento(request.getParameter("complemento"));
            endereco.setEstado(request.getParameter("estado"));
            endereco.setCidade(request.getParameter("cidade"));
            UsuarioBean usuario = (UsuarioBean) session.getAttribute("u_cadastrado");
            endereco.setUsuario(usuario);

            dao.cadastrar(endereco);

            session.setAttribute("msg", "Endereço cadastrado");
            rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

        if (acao.equalsIgnoreCase("cadastrarDepois")) {
            boolean aux = Boolean.parseBoolean(request.getParameter("aux"));
            EnderecoBean endereco = new EnderecoBean();
            endereco.setEndereco(request.getParameter("endereco"));
            endereco.setCep(request.getParameter("cep"));
            endereco.setNum_casa(Integer.parseInt(request.getParameter("num_casa")));
            endereco.setComplemento(request.getParameter("complemento"));
            endereco.setEstado(request.getParameter("estado"));
            endereco.setCidade(request.getParameter("cidade"));
            UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario");
            endereco.setUsuario(usuario);

            dao.cadastrar(endereco);
            if (aux) {
                session.setAttribute("endereco", endereco);
                session.setAttribute("msg", "Endereço cadastrado");
                rd = request.getRequestDispatcher("Usuario?acao=verUsuario");
                rd.forward(request, response);
            } else {
                session.setAttribute("endereco", endereco);
                session.setAttribute("msg", "Endereço cadastrado");
                rd = request.getRequestDispatcher("vendaAdd.jsp");
                rd.forward(request, response);
            }
        }

        if (acao.equalsIgnoreCase("editarDaVenda")) {
            rd = request.getRequestDispatcher("enderecoEdit.jsp");
            rd.forward(request, response);
        }

        if (acao.equalsIgnoreCase("editarParaVenda")) {
            EnderecoBean endereco = new EnderecoBean();
            endereco.setEndereco(request.getParameter("endereco"));
            endereco.setCep(request.getParameter("cep"));
            endereco.setNum_casa(Integer.parseInt(request.getParameter("num_casa")));
            endereco.setComplemento(request.getParameter("complemento"));
            endereco.setEstado(request.getParameter("estado"));
            endereco.setCidade(request.getParameter("cidade"));

            UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario");

            endereco.setUsuario(usuario);
            dao.editar(endereco);
            EnderecoBean e = dao.selecionaPorIdUsuario(usuario.getCodigo());
            session.setAttribute("endereco", e);
            if (session.getAttribute("aux") != null) {
                session.setAttribute("aux", null);
                session.setAttribute("msg", "Endereco atualizado");
                rd = request.getRequestDispatcher("Usuario?acao=verUsuario");
                rd.forward(request, response);
            } else {
                rd = request.getRequestDispatcher("vendaAdd.jsp");
                rd.forward(request, response);
            }
        }

        if (acao.equalsIgnoreCase("excluir")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.excluir(id);
            session.setAttribute("msg", "Endereco excluido com sucesso");
            rd = request.getRequestDispatcher("Usuario?acao=verUsuario");
            rd.forward(request, response);
        }

        if (acao.equalsIgnoreCase("edit")) {
            session.setAttribute("aux", true);
            rd = request.getRequestDispatcher("enderecoEdit.jsp");
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
