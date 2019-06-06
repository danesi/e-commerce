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
}
