/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.VendaBean;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Anesi
 */
public class VendaDAO {
    private Connection conexao;

    public VendaDAO() {
        try {
            this.conexao = Conexao.getConnection();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    
    public void cadastrar(VendaBean venda) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("insert into venda values (default, ?, ?, ?)");
            pstm.setDate(1, Date.valueOf(venda.getData()));
            pstm.setDouble(2, venda.getPreco());
            pstm.setInt(3, venda.getUsuario().getCodigo());
            ResultSet rs = pstm.executeQuery();
            pstm.close();
            rs.close();
        } catch (Exception e) {
        }
    }
}
