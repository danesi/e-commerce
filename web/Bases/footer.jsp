<div class="caixacontato z-depth-4" hidden="true" style="z-index: 9;">
    <div class="topocontato center valign-wrapper z-depth-1-half">
        <span class="white-text spancontato">Informe seus Dados!</span>
        <a href="#slkdjhbdskalf" class="botaofechar"style="margin-right: 8px; position: absolute; right: 0;"><i class="material-icons right white-text" >close</i></a>
    </div>
    <div class="formcontato ">
        <form action="<?php echo $pontos; ?>Controle/contatoControle.php?function=contato" method="post" id="formContato">
            <div class="row">
                <div class="input-field col s12 ">
                    <input class="input-field" type="text" name='nome' id="nome" required="true"/>
                    <label for="nome">Nome</label>
                </div>
                <div class="input-field col s12 ">
                    <input class="input-field validate" type="email" name='email' id="email" required="true"/>
                    <label for="email">E-mail</label>
                </div>
                <div class="input-field col s12 ">
                    <input class="input-field" type="text" name='telefone' id="telefone" required="true"/>
                    <label for="telefone">Telefone</label>
                </div>
                <div class="input-field col s12 ">
                    <textarea class="materialize-textarea" name='mensagem' id="mensagem" required="true"></textarea>
                    <label for="mensagem">Sua mensagem</label>
                </div>
               
                <div class="col s12 center">
                    <a href="#quefrescura...." class="btn grey darken-3 botaofechar">Cancelar</a>
                    <input type="submit" class="btn orange darken-3" value="Enviar" id="submitForm"/>

                   

<!--                    <div class="row " style="margin-top: 1vh;">
                        <div class="preloader-wrapper small active escondeCarregador">
                            <div class="spinner-layer spinner-green-only">
                                <div class="circle-clipper left">
                                    <div class="circle"></div>
                                </div><div class="gap-patch">
                                    <div class="circle"></div>
                                </div><div class="circle-clipper right">
                                    <div class="circle"></div>
                                </div>
                            </div>
                        </div>
                    </div>-->
                </div>
            </div>
        </form>
    </div>
</div>



<a class="btn waves-effect waves-light orange darken-3 right botaocontato"><i class="material-icons left">mode_comment</i><div style="margin: auto auto auto auto;" class="right">Contato</div></a>
<div class="divider grey lighten-1" style="height: 2px;"></div>
<div class="center grey darken-3 white-text preFooter" style="width: 100%;">
    <div class="row">
        <div>
            <h5 class="white-text " style="font-size: 110%;">Shoping das Bebidas</h5>
            <p>Shoping da bebida LTDA</p>
            <p>Cnpj: 2865476965-5</p>
            <p>Endereço: Rua da bebida nº51 Pinga-SB</p>
        </div>
    </div>
</div>
<div class="divider white lighten-3" style="height: 2px;"></div>

<footer class="center black">
    <div class="footer-copyright white-text">
        <a target="_blank" href="http://markeyvip.com" class="center col l10 s12 offset-l1 white-text">
            © 2019 Desenvolvido por - MarkeyVip
        </a>
    </div>
</footer>




<script>
    var aberto = 'true';
    $('.botaocontato').click(function () {
        $(this).hide(500);
        $('.caixacontato').show(500);
        aberto = 'false';
    });
    $('.botaocontato2').click(function () {
        $('.caixacontato').show(500);
        aberto = 'false';
    });
    $('.botaofechar').click(function () {
        $('.botaocontato').show(500);
        $('.caixacontato').fadeOut(500);
        aberto = 'true';
    });
    $(document).ready(function () {
        $('.modal').modal();
        $(".escondeCarregador").attr("style", "display: none;");
    });
    $("#submitForm").mousedown(function () {
        $(".escondeCarregador").show();
    });
    $('#formContato').submit(function () {
        var dados = $(this).serialize();
        $.ajax({
            url: './Controle/contatoControle.php?function=contatoJs',
            type: 'POST',
            async: false,
            data: dados,
            success: function (data) {
                if (data == 'true') {
                    $('#nome').val('');
                    $('#email').val('');
                    $('#telefone').val('');
                    $('#mensagem').val('');
                    $('.botaocontato').show(200);
                    $('.caixacontato').hide(200);
                    aberto = 'true';
                    var instance = M.Modal.getInstance($('#modal1'));
                    instance.open();
                    $(".escondeCarregador").attr("style", "display: none;");
                } else {
                    alert('Algo deu errado!' + data);
                }
            },
            error: function () {
                $.ajax({
                    url: '../Controle/contatoControle.php?function=contatoJs',
                    type: 'POST',
                    async: false,
                    data: dados,
                    success: function (data) {
                        if (data == 'true') {
                            $('#nome').val('');
                            $('#email').val('');
                            $('#telefone').val('');
                            $('#mensagem').val('');
                            $('.botaocontato').show(200);
                            $('.caixacontato').hide(200);
                            aberto = 'true';
                            var instance = M.Modal.getInstance($('#modal1'));
                            instance.open();
                            $(".escondeCarregador").attr("style", "display: none;");
                        } else {
                            alert('Algo deu errado!' + data);
                        }
                    }
                });
            }
        });
        return false;
    });
</script>