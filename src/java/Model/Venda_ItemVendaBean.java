/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Anesi
 */
public class Venda_ItemVendaBean {
    private int codigo;
    private String data;
    private double preco;
    private ProdutoBean produto;
    private VendaBean venda;
    private int quantidade;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public ProdutoBean getProduto() {
        return produto;
    }

    public void setProduto(ProdutoBean produto) {
        this.produto = produto;
    }

    public VendaBean getVenda() {
        return venda;
    }

    public void setVenda(VendaBean venda) {
        this.venda = venda;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
    
}
