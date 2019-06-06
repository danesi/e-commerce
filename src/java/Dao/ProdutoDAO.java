/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.ProdutoBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anesi
 */
public class ProdutoDAO {

    private Connection conexao;

    public ProdutoDAO() {
        try {
            this.conexao = Conexao.getConnection();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public List<ProdutoBean> selecionaTodos() {
        try {
            PreparedStatement pstm = conexao.prepareStatement("select * from produtos order by codigo");
            ResultSet rs = pstm.executeQuery();
            List<ProdutoBean> produtos = new ArrayList<>();
            while (rs.next()) {
                if (rs.getInt("quant_estoque") > 0) {
                    ProdutoBean produto = new ProdutoBean();
                    produto.setCodigo(rs.getInt("codigo"));
                    produto.setNome(rs.getString("nome"));
                    produto.setImagem(rs.getString("imagem"));
                    produto.setPreco(rs.getDouble("preco"));
                    produto.setQuant_estoque(rs.getInt("quant_estoque"));
                    produtos.add(produto);
                }

            }
            pstm.close();
            rs.close();
            return produtos;
        } catch (SQLException e) {

        }
        return null;
    }

    public List<ProdutoBean> selecionaTodosParaEditar() {
        try {
            PreparedStatement pstm = conexao.prepareStatement("select * from produtos order by codigo");
            ResultSet rs = pstm.executeQuery();
            List<ProdutoBean> produtos = new ArrayList<>();
            while (rs.next()) {
                ProdutoBean produto = new ProdutoBean();
                produto.setCodigo(rs.getInt("codigo"));
                produto.setNome(rs.getString("nome"));
                produto.setImagem(rs.getString("imagem"));
                produto.setPreco(rs.getDouble("preco"));
                produto.setQuant_estoque(rs.getInt("quant_estoque"));
                produtos.add(produto);
            }
            pstm.close();
            rs.close();
            return produtos;
        } catch (SQLException e) {

        }
        return null;
    }

    public void inserir(ProdutoBean produto) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("insert into produtos values (default, ?, ?, ?, ?)");
            pstm.setString(1, produto.getNome());
            pstm.setString(2, produto.getImagem());
            pstm.setDouble(3, produto.getPreco());
            pstm.setInt(4, produto.getQuant_estoque());
            ResultSet rs = pstm.executeQuery();
            pstm.close();
            rs.close();
        } catch (SQLException e) {
        }
    }

    public ProdutoBean selecionaPorId(int id) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("select * from produtos where codigo = ?");
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            ProdutoBean produto = new ProdutoBean();
            while (rs.next()) {
                produto.setCodigo(rs.getInt("codigo"));
                produto.setNome(rs.getString("nome"));
                produto.setImagem(rs.getString("imagem"));
                produto.setPreco(rs.getDouble("preco"));
                produto.setQuant_estoque(rs.getInt("quant_estoque"));
            }
            pstm.close();
            rs.close();
            return produto;
        } catch (SQLException e) {
        }
        return null;
    }

    public void removerProduto(int id) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("delete from produtos where codigo = ?");
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            pstm.close();
            rs.close();
        } catch (SQLException e) {
        }
    }

    public void editar(ProdutoBean produto) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("update produtos set nome = ?, imagem = ?, preco = ?, quant_estoque = ? where codigo = ?");
            pstm.setString(1, produto.getNome());
            pstm.setString(2, produto.getImagem());
            pstm.setDouble(3, produto.getPreco());
            pstm.setInt(4, produto.getQuant_estoque());
            pstm.setInt(5, produto.getCodigo());
            ResultSet rs = pstm.executeQuery();
            System.out.println("veio aqui");
            pstm.close();
            rs.close();
        } catch (SQLException e) {
        }
    }

    public void editarSemImagem(ProdutoBean produto) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("update produtos set nome = ?, preco = ?, quant_estoque = ? where codigo = ?");
            pstm.setString(1, produto.getNome());
            pstm.setDouble(2, produto.getPreco());
            pstm.setInt(3, produto.getQuant_estoque());
            pstm.setInt(4, produto.getCodigo());
            ResultSet rs = pstm.executeQuery();
            System.out.println("veio aqui");
            pstm.close();
            rs.close();
        } catch (SQLException e) {
        }
    }
}
