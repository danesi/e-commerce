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
public class RelatorioBean {
    private ProdutoBean produto;
    private UsuarioBean usuario;
    private VendaBean venda;
    private ItemVendaBean item_venda;

    public ProdutoBean getProduto() {
        return produto;
    }

    public void setProduto(ProdutoBean produto) {
        this.produto = produto;
    }

    public UsuarioBean getUsuario() {
        return usuario;
    }

    public void setUsuario(UsuarioBean usuario) {
        this.usuario = usuario;
    }

    public VendaBean getVenda() {
        return venda;
    }

    public void setVenda(VendaBean venda) {
        this.venda = venda;
    }

    public ItemVendaBean getItem_venda() {
        return item_venda;
    }

    public void setItem_venda(ItemVendaBean item_venda) {
        this.item_venda = item_venda;
    }
    
    
}
