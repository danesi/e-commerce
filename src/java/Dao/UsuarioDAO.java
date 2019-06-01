/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.UsuarioBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Anesi
 */
public class UsuarioDAO {

    private Connection conexao;

    public UsuarioDAO() {
        try {
            this.conexao = Conexao.getConnection();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public void inserir(UsuarioBean usuario) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("insert into usuarios values (default, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstm.setString(1, usuario.getNome());
            pstm.setString(2, usuario.getNascimento());
            pstm.setString(3, usuario.getTelefone());
            pstm.setString(4, usuario.getCpf());
            pstm.setString(5, usuario.getEstado());
            pstm.setString(6, usuario.getCidade());
            pstm.setString(7, usuario.getEmail());
            pstm.setString(8, usuario.getSenha());
            ResultSet rs = pstm.executeQuery();
            pstm.close();
            rs.close();
        } catch (SQLException e) {

        }
    }
    
    public UsuarioBean login(UsuarioBean usuario){
        try {
            PreparedStatement pstm = conexao.prepareStatement("select * from usuarios where email = ? and senha = ?");
            pstm.setString(1, usuario.getEmail());
            pstm.setString(2, usuario.getSenha());
            ResultSet rs = pstm.executeQuery();
            UsuarioBean user = new UsuarioBean();
            while (rs.next()) {
                user.setCodigo(rs.getInt("codigo"));
                user.setNome(rs.getString("nome"));
                user.setNascimento(rs.getString("nascimento"));
                user.setTelefone(rs.getString("telefone"));
                user.setCpf(rs.getString("cpf"));
                user.setEstado(rs.getString("estado"));
                user.setCidade(rs.getString("cidade"));
                user.setEmail(rs.getString("email"));
                user.setSenha(rs.getString("senha"));
            }
            pstm.close();
            rs.close();
            return user;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }
}
