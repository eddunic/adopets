<%-- 
    Document   : visao_geral
    Created on : 19/04/2019, 21:57:26
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="pt-br">
    <head>
        <title>Adopets</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap-fileupload/bootstrap-fileupload.css">
        <link rel="stylesheet" href="../css/visao_geral.css" type="text/css">
        <link rel="stylesheet" href="../css/formularios.css" type="text/css">
        <link rel="stylesheet" href="../css/croppie.css" media="all" type="text/css"/>
        <script src="../js/jquery/dist/jquery.min.js"></script>
        <script src="../js/popper.js/dist/umd/popper.min.js"></script>
    </head>
    <body>

        <div id="header_logado"></div>
        <!--            <div class="hr dotted"></div>-->
        <!-- Visão geral-->
        <div class="row mx-auto justify-content-center visao_geral">

            <!--  card col-md-3-->
            <div class="col-md-3">

                <center>
                    <div class="form-panel">
                        <form id="formAlterar" name="formAlterar" action="#" class="form-horizontal style-form" data-id="<c:out value="${usuario.email}"/>">

                            <div class="form-group last">
                                <div class="col-xs-3">
                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                            <c:choose>
                                                <c:when test="${fn:length(usuario.foto) > 0}">
                                                    <div>
                                                        <img class="border border-light rounded z-depth-1" src="${IOUtils.toString(usuario.foto, 'UTF-8')}">
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div>
                                                        <img class="border border-light rounded z-depth-1" src="../img/perfil.jpg" alt="Nenhuma imagem foi enviada">
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                        <div>
                                            <span class="btn btn-theme02 btn-file">
                                                <span class="fileupload-new"><i class="fa fa-paperclip"></i> Selecione uma imagem</span>
                                                <span class="fileupload-exists"><i class="fa fa-undo"></i> Trocar</span>
                                                <input class="upload-result" type="file" id="upload" name="upload" accept="image/*"/>
                                            </span>
                                            <a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload">
                                                <i class="fas fa-trash-alt"></i> Apagar</a>
                                        </div>
                                    </div>
                                </div>
<!--                                <div class="form-group col-sm-12 col-lg-5">
                                    <div class="form-group"> 
                                        <div class="text-center">
                                            <div class="crop"> 
                                                <div id="upload-demo"></div>
                                                <button type="button" class="upload-result btn btn-md btn-primary">
                                                    <i class="fa fa-cut fa-lg"></i>Recortar imagem
                                                </button> 
                                            </div> 
                                        </div> 
                                    </div> 
                                </div>-->
                                <div class="form-group col-sm-12 col-lg-4">
                                    <div class="text-center" id="result"></div> 
                                    <input type="hidden" value="" name="foto" id="foto" class="upload-result">
                                </div>
                            </div>
                        </form>
                    </div>
                </center>
                <!-- END SIDEBAR USERPIC -->
                <!-- SIDEBAR USER TITLE -->
                <h4><c:out value="${usuario.nome}"></c:out></h4>


                    <!-- SIDEBAR BUTTONS -->
                    <center>
                        <div class="badges">
                            <span class="badge badge-primary">Iniciante</span>
                            <span class="badge badge-danger">Doador</span>
                            <span class="badge badge-secondary">Adotante</span>
                            <span class="badge badge-success">Voluntário</span>
                        </div>
                    </center>

                    <!-- SIDEBAR MENU -->
                    <nav> 
                        <div class="nav nav-tabs tabs-left"  id="navTab" role="tablist">
                            <a class="nav-item nav-link active" id="profile-tab" data-toggle="tab" href="#profile" aria-controls="profile" aria-selected="true" role="tab">
                                <i class="fas fa-user-alt"></i>
                                Meu perfil </a>
                            <a class="nav-item nav-link" id="activy-tab" data-toggle="tab" href="#activy" aria-controls="activy" aria-selected="false" role="tab">
                                <i class="fas fa-hands-helping"></i>
                                Minhas atividades </a>
                            <a class="nav-item nav-link" id="animals-tab" data-toggle="tab" href="#animals" aria-controls="animals" aria-selected="false" role="tab">
                                <i class="fas fa-paw"></i>
                                Animais ajudados
                            </a>
                        </div>
                    </nav>

                </div>


                <div class="tab-content col-6" id="tabContent">
                    <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <!-- form user info -->

                        <h4>Meu Perfil</h4>
                        <div class="alert alert-warning">
                            <a class="close font-weight-light" data-dismiss="alert" href="#">×</a>Clique em Salvar Alterações, caso tenha modificado o seu perfil.
                        </div>
                        <form class="form" role="form" autocomplete="off" action="/adopets/AlterarUsuarioServlet">
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Nome Completo</label>
                                <div class="col-lg-9">                                
                                    <input class="form-control" type="text" name="nome" value="<c:out value="${usuario.nome}"></c:out>">                                    
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">CPF</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="text" name="cpf_cnpj" value="<c:out value="${usuario.cpf_cnpj}"></c:out>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">E-mail</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="email" name="email" value="<c:out value="${usuario.email}"></c:out>" readonly> 
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Bairro</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="text" name="bairro" value="<c:out value="${usuario.bairro}"></c:out>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Senha</label>
                                <div class="col-lg-7">
                                    <input name="senha" type="password" class="form-control" maxlength="20" placeholder="Senha" id="pass" onkeypress="capsLock(event)" value="<c:out value="${usuario.senha}"></c:out>">
                                </div>
                                <div class="row-lg-7">
                                    <div class="input-group-text">
                                        <a href="#" class="text-dark" id="icon-click">
                                            <i class="fa fa-eye-slash" id="icon" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Telefone</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="text" name="telefone" value="<c:out value="${usuario.telefone}"></c:out>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-9">
                                <input type="button" class="btn btn-danger" value="Excluir Conta">
                                <input type="submit" class="btn btn-primary" value="Salvar Alterações">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="activy" role="tabpanel" aria-labelledby="activy-tab">
                    <h4>Minhas Atividades</h4>
                    <div class="card-group">
                        <div class="card border-danger" style="max-width: 15rem;">
                            <img class="card-img-top" src="../img/dog.gif" alt="Imagem de capa do card">
                            <div class="card-body text-danger">
                                <h5 class="card-title">Doações</h5>
                                <p class="card-text">Aqui você pode ver as solicitações e doações efetuadas por você.</p>
                            </div>
                            <a href="#" class="btn btn-secondary btn-lg disabled" role="button" aria-disabled="true">Doações indisponíveis</a>

                            <div class="card-footer">
                                <small class="text-muted">Não há nenhum registro</small>
                            </div>
                        </div>

                        <div class="card border-success">
                            <img class="card-img-top" src="../img/dogdribbble.gif" alt="Imagem de capa do card">
                            <div class="card-body text-success">
                                <h5 class="card-title">Adoções</h5>
                                <p class="card-text">Uouu, aqui você tem todas as suas adoções efetuadas.</p>
                            </div>
                            <a href="#" class="btn btn-secondary btn-lg disabled" role="button" aria-disabled="true">Adoções indisponíveis</a>

                            <div class="card-footer">
                                <small class="text-muted">Não há nenhum registro</small>
                            </div>
                        </div>
                        <div class="card border-dark">
                            <img class="card-img-top" src="../img/animals.gif" alt="Imagem de capa do card">
                            <div class="card-body text-dark">
                                <h5 class="card-title">Voluntariado</h5>
                                <p class="card-text">Faça algo produtivo, ajude um <i>petamigo</i>!</p>
                            </div>

                            <a href="#" class="btn btn-secondary btn-lg disabled" role="button" aria-disabled="true">Atividades indisponíveis</a>
                            <div class="card-footer">
                                <small class="text-muted">Não há nenhum registro</small>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="tab-pane fade" id="animals" role="tabpanel" aria-labelledby="animals-tab">

                    <h4>Animais ajudados</h4>
                    <div class="card border-danger mx-auto col-md-4">
                        <img class="card-img-top" src="../img/dogAns.gif" alt="Imagem de capa do card">
                        <div class="card-body text-danger">
                            <h5 class="card-title">Não ajudou nenhum pet até o momento?</h5>
                            <p class="card-text">Calma. Comece procurando na barra de pesquisa!</p>
                            <p class="card-text"><small class="text-muted">Tente pesquisar algo como "Pug da Zona Leste".</small></p>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- /#profile -->
        <script type="text/javascript" src="../js/index.js"></script>
        <script type="text/javascript" src="../css/bootstrap-fileupload/bootstrap-fileupload.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>
        <script src="../js/croppie.min.js"></script>
        <script>
                                        var id = $('form[name="formAlterar"]').attr("email");
                                        $(function () {
//                                            var $uploadCrop;

                                            function readFile(input) {
                                                if (input.files && input.files[0]) {
                                                    var reader = new FileReader();

                                                    reader.onload = function (e) {
                                                        $uploadCrop.croppie('bind', {
                                                            url: e.target.result
                                                        });
                                                    }

                                                    reader.readAsDataURL(input.files[0]);
                                                } else {
                                                    alert("Sorry - you're browser doesn't support the FileReader API");
                                                }
                                            }

//                                            $uploadCrop = $('#upload-demo').croppie({
//                                                viewport: {
//                                                    width: 150,
//                                                    height: 200,
//                                                    type: 'square'
//                                                },
//                                                boundary: {
//                                                    width: 250,
//                                                    height: 250
//                                                }
//                                            });

                                            $('#upload').on('change', function () {
//                                                $(".crop").show();
                                                readFile(this);
                                            });
                                            $('.upload-result').on('click', function (ev) {
                                                then(function (resp) {
                                                    popupResult({
                                                        src: resp
                                                    });
                                                });
                                            });

                                            function popupResult(result) {
                                                var html;
                                                if (result.html) {
                                                    html = result.html;
                                                }
                                                if (result.src) {
                                                    var label = "<figcaption>Foto nova</figcaption>";
                                                    html = '<img class="border border-light rounded z-depth-1 mb-4" src="' + result.src + '" />' + label;
                                                }
                                                $("#result").html(html);
                                                $("foto").val(result.src);
                                            }
                                        });
        </script>
    </body>
</html>