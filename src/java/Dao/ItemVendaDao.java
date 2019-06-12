/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.ItemVendaBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Anesi
 */
public class ItemVendaDao {
    private Connection conexao;

    public ItemVendaDao() {
        try {
            this.conexao = Conexao.getConnection();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    
    public void cadastrar(ItemVendaBean itemVenda) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("insert into item_venda values (default, ?, ?, ?)");
            pstm.setInt(1, itemVenda.getProduto().getCodigo());
            pstm.setInt(2, itemVenda.getVenda().getCodigo());
            pstm.setInt(3, itemVenda.getQuantidade());
            ResultSet rs = pstm.executeQuery();
            pstm.close();
            rs.close();
        } catch (Exception e) {
        }
    }
    
    public ItemVendaBean selecionaPorVenda(int id){
        try {
            PreparedStatement pstm = conexao.prepareStatement("select * from item_venda where cod_venda = ?");
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            ItemVendaBean venda = new ItemVendaBean();
            while(rs.next()){
                ProdutoDAO pDao = new ProdutoDAO();
                VendaDAO vDao = new VendaDAO();
                venda.setCodigo(rs.getInt("codigo"));
                venda.setProduto(pDao.selecionaPorId(rs.getInt("cod_produto")));
                venda.setQuantidade(rs.getInt("quantidade"));
                venda.setVenda(vDao.selecionaPorId(rs.getInt("cod_venda")));
            }
            return venda;
        } catch (Exception e) {
        }
        return null;
    }
}
