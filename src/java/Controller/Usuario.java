/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UsuarioDAO;
import Model.UsuarioBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class Usuario extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        String acao = request.getParameter("acao");
        RequestDispatcher rd = null;

        UsuarioDAO dao = new UsuarioDAO();

        if (acao.equalsIgnoreCase("cadastrar")) {
            UsuarioBean usuario = new UsuarioBean();
            usuario.setNome(request.getParameter("nome"));
            usuario.setNascimento(request.getParameter("nascimento"));
            usuario.setTelefone(request.getParameter("telefone"));
            usuario.setCpf(request.getParameter("cpf"));
            usuario.setEstado(request.getParameter("estado"));
            usuario.setCidade(request.getParameter("cidade"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setSenha(request.getParameter("senha"));

            dao.inserir(usuario);
            rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

        if (acao.equalsIgnoreCase("editar")) {
            System.out.println(request.getParameter("id"));
            int id = Integer.parseInt(request.getParameter("id"));
            UsuarioBean usuario = new UsuarioBean();
            System.out.println("AAAAA" + request.getParameter("senhaNova"));
            if (!request.getParameter("senhaNova").equals("")) {
                if (dao.verificaSenha(request.getParameter("senha"), id)) {
                    usuario.setCodigo(id);
                    usuario.setNome(request.getParameter("nome"));
                    usuario.setNascimento(request.getParameter("nascimento"));
                    usuario.setTelefone(request.getParameter("telefone"));
                    usuario.setCpf(request.getParameter("cpf"));
                    usuario.setEstado(request.getParameter("estado"));
                    usuario.setCidade(request.getParameter("cidade"));
                    usuario.setEmail(request.getParameter("email"));
                    usuario.setSenha(request.getParameter("senhaNova"));
                    dao.editar(usuario);
                    session.setAttribute("usuario", usuario);
                    rd = request.getRequestDispatcher("usuarioView.jsp");
                    rd.forward(request, response);
                } else {
                    session.setAttribute("erro_atualizar_user", "A senha atual não corresposde!");
                    rd = request.getRequestDispatcher("usuarioEdit.jsp");
                    rd.forward(request, response);
                }

            } else {
                if (dao.verificaSenha(request.getParameter("senha"), id)) {
                    usuario.setCodigo(id);
                    usuario.setNome(request.getParameter("nome"));
                    usuario.setNascimento(request.getParameter("nascimento"));
                    usuario.setTelefone(request.getParameter("telefone"));
                    usuario.setCpf(request.getParameter("cpf"));
                    usuario.setEstado(request.getParameter("estado"));
                    usuario.setCidade(request.getParameter("cidade"));
                    usuario.setEmail(request.getParameter("email"));
                    dao.editarSemSenha(usuario);
                    session.setAttribute("usuario", usuario);
                    rd = request.getRequestDispatcher("usuarioView.jsp");
                    rd.forward(request, response);
                } else {
                    session.setAttribute("erro_atualizar_user", "A senha atual não corresposde!");
                    rd = request.getRequestDispatcher("usuarioEdit.jsp");
                    rd.forward(request, response);
                }
            }

        }

        if (acao.equalsIgnoreCase("login")) {
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            UsuarioBean user = new UsuarioBean();
            user.setEmail(email);
            user.setSenha(senha);
            UsuarioBean usuario = dao.login(user);
            if (usuario.getNome() != null) {
                session.setAttribute("usuario", usuario);
                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else {
                session.setAttribute("erro", "E-mail ou senha incorretos");
                rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        }

        if (acao.equalsIgnoreCase("sair")) {
            session.invalidate();
            rd = request.getRequestDispatcher("login.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
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
