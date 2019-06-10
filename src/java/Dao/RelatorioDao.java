/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.ProdutoBean;
import Model.RelatorioBean;
import Model.VendaBean;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anesi
 */
public class RelatorioDao {

    private Connection conexao;

    public RelatorioDao() {
        try {
            this.conexao = Conexao.getConnection();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public List<RelatorioBean> proMaisVendido() {
        try {
            PreparedStatement pstm = conexao.prepareStatement("select sum(quantidade) as quant, cod_produto from item_venda group by cod_produto order by quant desc limit 7;");
            ResultSet rs = pstm.executeQuery();
            List<RelatorioBean> relatorios = new ArrayList<>();
            while (rs.next()) {
                RelatorioBean relatorio = new RelatorioBean();
                ProdutoBean produto = new ProdutoBean();
                ProdutoDAO pDao = new ProdutoDAO();
                produto = pDao.selecionaPorId(rs.getInt("cod_produto"));
                produto.setQuant(rs.getInt("quant"));
                relatorio.setProduto(produto);
                relatorios.add(relatorio);
            }
            return relatorios;
        } catch (Exception e) {
        }
        return null;
    }

    public List<RelatorioBean> entreDatas(String inicial, String dfinal) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("select * FROM venda WHERE (data BETWEEN ? AND ?)");
            System.out.println(inicial);
            pstm.setString(1, "'"+inicial+"'");
            pstm.setString(2, "'"+dfinal+"'");
            ResultSet rs = pstm.executeQuery();
            List<RelatorioBean> relatorios = new ArrayList<>();
            while (rs.next()) {
                RelatorioBean relatorio = new RelatorioBean();
                VendaBean venda = new VendaBean();
                VendaDAO vDao = new VendaDAO();
                venda = vDao.selecionaPorId(rs.getInt("codigo"));
                relatorio.setVenda(venda);
                relatorios.add(relatorio);
            }
            return relatorios;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        return null;
    }
}
