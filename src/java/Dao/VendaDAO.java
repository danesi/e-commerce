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
import java.util.ArrayList;
import java.util.List;

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
    
    public List<VendaBean> selecionaPorUsuario(int id) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("select * from venda where cod_usuario = ?");
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            List<VendaBean> vendas = new ArrayList<>();
            while(rs.next()) {
                VendaBean venda = new VendaBean();
                venda.setCodigo(rs.getInt("codigo"));
                venda.setData(String.valueOf(rs.getDate("data")));
                venda.setPreco(rs.getDouble("preco"));
                UsuarioDAO Udao = new UsuarioDAO();
                venda.setUsuario(Udao.selecionaPorId(rs.getInt("cod_usuario")));
                vendas.add(venda);
            }
            pstm.close();
            rs.close();
            return vendas;
        } catch (Exception e) {
        }
        return null;
    }
    
    public int selecionaUltima() {
        
        try {
            int id = 0;
            PreparedStatement pstm = conexao.prepareStatement("Select Max(codigo) as codigo from venda ");
            ResultSet rs = pstm.executeQuery();
            while(rs.next()) {
                id = rs.getInt("codigo");
            }
            return id;
        } catch (Exception e) {
        }
        return 0;
    }
    
    public VendaBean selecionaPorId(int id) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("select * from venda where codigo = ?");
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            VendaBean venda = new VendaBean();
            while(rs.next()) {
                venda.setCodigo(rs.getInt("codigo"));
                venda.setData(String.valueOf(rs.getDate("data")));
                venda.setPreco(rs.getDouble("preco"));
                UsuarioDAO Udao = new UsuarioDAO();
                venda.setUsuario(Udao.selecionaPorId(rs.getInt("cod_usuario")));
            }
            pstm.close();
            rs.close();
            return venda;
        } catch (Exception e) {
        }
        return null;
    }
}
