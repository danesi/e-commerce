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
            PreparedStatement pstm = conexao.prepareStatement("insert into usuarios values (default, ?, ?, ?, ?, ?, ?)");
            pstm.setString(1, usuario.getNome());
            pstm.setString(2, usuario.getNascimento());
            pstm.setString(3, usuario.getTelefone());
            pstm.setString(4, usuario.getCpf());
            pstm.setString(5, usuario.getEmail());
            pstm.setString(6, usuario.getSenha());
            ResultSet rs = pstm.executeQuery();
            pstm.close();
            rs.close();
        } catch (SQLException e) {

        }
    }

    public UsuarioBean login(UsuarioBean usuario) {
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
                user.setEmail(rs.getString("email"));
                user.setSenha(rs.getString("senha"));
                user.setAdm(rs.getBoolean("adm"));
            }
            pstm.close();
            rs.close();
            return user;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }
    
    public UsuarioBean selecionaPorEmail(String email) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("select * from usuarios where email = ?");
            pstm.setString(1, email);
            ResultSet rs = pstm.executeQuery();
            UsuarioBean user = new UsuarioBean();
            while (rs.next()) {
                user.setCodigo(rs.getInt("codigo"));
                user.setNome(rs.getString("nome"));
                user.setNascimento(rs.getString("nascimento"));
                user.setTelefone(rs.getString("telefone"));
                user.setCpf(rs.getString("cpf"));
                user.setEmail(rs.getString("email"));
                user.setSenha(rs.getString("senha"));
                user.setAdm(rs.getBoolean("adm"));
            }
            pstm.close();
            rs.close();
            return user;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public UsuarioBean selecionaPorId(int id) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("select * from usuarios where codigo = ?");
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            UsuarioBean user = new UsuarioBean();
            while (rs.next()) {
                user.setCodigo(rs.getInt("codigo"));
                user.setNome(rs.getString("nome"));
                user.setNascimento(rs.getString("nascimento"));
                user.setTelefone(rs.getString("telefone"));
                user.setCpf(rs.getString("cpf"));
                user.setEmail(rs.getString("email"));
                user.setSenha(rs.getString("senha"));
                user.setAdm(rs.getBoolean("adm"));
            }
            pstm.close();
            rs.close();
            return user;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }
    
    public void editar(UsuarioBean usuario) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("update usuarios set nome = ?, nascimento = ?, telefone = ?, cpf = ?, email = ?, senha = ?, adm = ? where codigo = ?");
            pstm.setString(1, usuario.getNome());
            pstm.setString(2, usuario.getNascimento());
            pstm.setString(3, usuario.getTelefone());
            pstm.setString(4, usuario.getCpf());
            pstm.setString(5, usuario.getEmail());
            pstm.setString(6, usuario.getSenha());
            pstm.setBoolean(7, usuario.isAdm());
            pstm.setInt(8, usuario.getCodigo());
            ResultSet rs = pstm.executeQuery();
            pstm.close();
            rs.close();
        } catch (SQLException e) {
        }
    }
    
    public void editarSemSenha(UsuarioBean usuario) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("update usuarios set nome = ?, nascimento = ?, telefone = ?, cpf = ?, email = ?, adm = ? where codigo = ?");
            pstm.setString(1, usuario.getNome());
            pstm.setString(2, usuario.getNascimento());
            pstm.setString(3, usuario.getTelefone());
            pstm.setString(4, usuario.getCpf());
            pstm.setString(5, usuario.getEmail());
            pstm.setBoolean(6, usuario.isAdm());
            pstm.setInt(7, usuario.getCodigo());
            ResultSet rs = pstm.executeQuery();
            pstm.close();
            rs.close();
        } catch (Exception e) {
            
        }
    }

    public boolean verificaSenha(String senha, int id) {
        boolean retorno = false;
        try {
            PreparedStatement pstm = conexao.prepareStatement("select senha from usuarios where codigo = ?");
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (rs.getString("senha").equals(senha)) {
                    retorno = true;
                }
            }
            pstm.close();
            rs.close();
        } catch (SQLException e) {
        }
        return retorno;
    }
    
    public void editarSenha(UsuarioBean usuario) {
        try {
            PreparedStatement pstm = conexao.prepareStatement("update usuarios set senha = ? where codigo = ?");
            pstm.setString(1, usuario.getSenha());
            pstm.setInt(2, usuario.getCodigo());
            ResultSet rs = pstm.executeQuery();
            pstm.close();
            rs.close();
        } catch (SQLException e) {
        }
    }
    
    public boolean verificaAdm(int id) {
        try {
            boolean retorno = false;
            PreparedStatement pstm = conexao.prepareStatement("Select adm from usuarios where codigo = ?");
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()) {
                retorno = rs.getBoolean("adm");
            }
            return retorno;
        } catch (SQLException e) {
        }
        return false;
    }
}
