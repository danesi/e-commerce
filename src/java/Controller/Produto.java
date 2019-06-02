/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.ProdutoDAO;
import Model.ProdutoBean;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Anesi
 */
public class Produto extends HttpServlet {

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
            throws ServletException, IOException, FileUploadException {
        HttpSession session = request.getSession();
        String acao = request.getParameter("acao");
        RequestDispatcher rd = null;

        ProdutoDAO dao = new ProdutoDAO();

        if (acao.equalsIgnoreCase("addCarrinho")) {
            if (session.getAttribute("usuario") == null) {
                rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            } else {
                int quantidade = Integer.parseInt(request.getParameter("quant"));
                int id = Integer.parseInt(request.getParameter("id"));
                ProdutoBean produto = dao.selecionaPorId(id);
                List<ProdutoBean> carrinho = new ArrayList<>();
                if (session.getAttribute("carrinho") != null) {
                    List<ProdutoBean> produtos = (List<ProdutoBean>) session.getAttribute("carrinho");
                    for (ProdutoBean p : produtos) {
                        carrinho.add(p);
                    }
                }
                produto.setQuant(quantidade);
                carrinho.add(produto);
                session.setAttribute("carrinho", carrinho);
                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);

            }
        }

        if (acao.equalsIgnoreCase("verProduto")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ProdutoBean produto = dao.selecionaPorId(id);
            session.setAttribute("produto", produto);
            rd = request.getRequestDispatcher("produtoVerMais.jsp");
            rd.forward(request, response);
        }

        if (acao.equalsIgnoreCase("removeCarrinho")) {
            List<ProdutoBean> carrinho = new ArrayList<>();
            List<ProdutoBean> produtos = (List<ProdutoBean>) session.getAttribute("carrinho");
            int id = Integer.parseInt(request.getParameter("id"));
            for (ProdutoBean p : produtos) {
                if (p.getCodigo() != id) {
                    carrinho.add(p);
                }
            }
            session.setAttribute("carrinho", carrinho);
            rd = request.getRequestDispatcher("carrinho.jsp");
            rd.forward(request, response);
        }

        if (acao.equalsIgnoreCase("cadastrar")) {
            if (!ServletFileUpload.isMultipartContent(request)) {
                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }

            ProdutoBean produto = new ProdutoBean();

            DiskFileItemFactory factory = new DiskFileItemFactory();

            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servel.context.tempdir");
            factory.setRepository(repository);

            ServletFileUpload upload = new ServletFileUpload(factory);

            List<FileItem> items = upload.parseRequest(request);

            Iterator<FileItem> iter = items.iterator();

            while (iter.hasNext()) {
                FileItem item = iter.next();

                if (item.isFormField()) {
                    produto = processFormField(item, produto);
                    if (produto.getNome() == null) {
                        request.setAttribute("error", "Ocorreu um erro durante o processamento dos valores. Tente novamente.");
                        rd = request.getRequestDispatcher("/products?action=index");
                        rd.forward(request, response);
                    }

                } else {
                    produto = processUploadedFile(item, produto);

                    if (produto.getImagem() == null) {
                        request.setAttribute("error", "Falha ao salvar imagem. Tente novamente.");
                        rd = request.getRequestDispatcher("/products?action=index");
                        rd.forward(request, response);
                    }
                }
            }

            dao.inserir(produto);
            rd = request.getRequestDispatcher("produtoAdd.jsp");
            rd.forward(request, response);
        }

        if (acao.equalsIgnoreCase("editar")) {
            if (!ServletFileUpload.isMultipartContent(request)) {
                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }

            ProdutoBean produto = new ProdutoBean();
            
            int id = Integer.parseInt(request.getParameter("id"));
            produto.setCodigo(id);

            DiskFileItemFactory factory = new DiskFileItemFactory();

            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servel.context.tempdir");
            factory.setRepository(repository);

            ServletFileUpload upload = new ServletFileUpload(factory);

            List<FileItem> items = upload.parseRequest(request);

            Iterator<FileItem> iter = items.iterator();

            while (iter.hasNext()) {
                FileItem item = iter.next();

                if (item.isFormField()) {
                    produto = processFormField(item, produto);
                    if (produto.getNome() == null) {
                        request.setAttribute("error", "Ocorreu um erro durante o processamento dos valores. Tente novamente.");
                        rd = request.getRequestDispatcher("/products?action=index");
                        rd.forward(request, response);
                    }
                } else {
                    System.out.println("AAAAA");
                    produto = processUploadedFile(item, produto);

                    if (produto.getImagem() == null) {
                        request.setAttribute("error", "Falha ao salvar imagem. Tente novamente.");
                        rd = request.getRequestDispatcher("/products?action=index");
                        rd.forward(request, response);
                    }
                }
            }

            dao.editar(produto);
            List<ProdutoBean> p = dao.selecionaTodos();
            session.setAttribute("produtos", p);
            rd = request.getRequestDispatcher("produtoView.jsp");
            rd.forward(request, response);
        }

        if (acao.equalsIgnoreCase("verProdutos")) {
            List<ProdutoBean> produtos = dao.selecionaTodos();
            session.setAttribute("produtos", produtos);
            rd = request.getRequestDispatcher("produtoView.jsp");
            rd.forward(request, response);
        }

        if (acao.equalsIgnoreCase("deletarProduto")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.removerProduto(id);
            List<ProdutoBean> produtos = dao.selecionaTodos();
            session.setAttribute("produtos", produtos);
            rd = request.getRequestDispatcher("produtoView.jsp");
            rd.forward(request, response);
        }

        if (acao.equalsIgnoreCase("editarProduto")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ProdutoBean produto = dao.selecionaPorId(id);
            session.setAttribute("produtoEditar", produto);
            rd = request.getRequestDispatcher("produtoEdit.jsp");
            rd.forward(request, response);
        }

    }

    private ProdutoBean processFormField(FileItem item, ProdutoBean product) {
        String fieldName = item.getFieldName();
        String value = item.getString();
        System.out.println("CODIGO: ");
        switch (fieldName) {
            case "nome":
                product.setNome(value);
                break;

            case "preco":
                product.setPreco(Double.parseDouble(value));
                break;

            case "quant_estoque":
                product.setQuant_estoque(Integer.parseInt(value));
                break;
        }

        return product;
    }

    private ProdutoBean processUploadedFile(FileItem item, ProdutoBean product) {
        try {
            File uploadDir = new File(getServletContext().getRealPath("/") + "/Imagens");
            File file = File.createTempFile("img", ".png", uploadDir);
            item.write(file);
            product.setImagem(file.getName());

        } catch (Exception ex) {

        }

        return product;
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
        } catch (FileUploadException ex) {
            Logger.getLogger(Produto.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (FileUploadException ex) {
            Logger.getLogger(Produto.class.getName()).log(Level.SEVERE, null, ex);
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
