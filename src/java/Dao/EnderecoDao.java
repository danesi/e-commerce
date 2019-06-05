/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.EnderecoBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Anesi
 */
public class EnderecoDao {
     private Connection conexao;

    public EnderecoDao() {
        try {
            this.conexao = Conexao.getConnection();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    
    public void cadastrar(EnderecoBean endereco){
        try {
            PreparedStatement pstm = conexao.prepareStatement("insert into endereco values (default, ?, ?, ?, ?, ?, ?, ?)");
            pstm.setString(1, endereco.getEndereco());
            pstm.setString(2, endereco.getCep());
            pstm.setInt(3, endereco.getNum_casa());
            pstm.setString(4, endereco.getComplemento());
            pstm.setString(5, endereco.getEstado());
            pstm.setString(6, endereco.getCidade());
            pstm.setInt(7, endereco.getUsuario().getCodigo());
            ResultSet rs = pstm.executeQuery();
            pstm.close();
            rs.close();
            
        } catch (SQLException e) {
        }
        
    }
}