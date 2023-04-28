<%-- 
    Document   : editar-usuario
    Created on : 15/09/2022, 10:40:02
    Author     : octav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es_GT"/>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Editar Estudiante</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link
            rel="stylesheet"
            type="text/css"
            href="../assets/css/hoja-estilo-kinal.css"
            />   
        <link
            rel="stylesheet"
            type="text/css"
            href="../assets/css/bootstrap.css"
            />

        <script src=../assets/js/041bd737b7.js ></script>
    </head>
    <body>
        <header>
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-2">
                        <a href="../login.jsp">
                            <i class="fa-solid fa-bars fa-2x settings"></i>
                        </a>
                    </div>
                    <div class="col-lg-8 col-md-8 col-8">
                        <a href="${pageContext.request.contextPath}/index.jsp">
                            <img src="../assets/images/logo/imagenes_logos/logo_fondos_oscuros.png" class="logo imag-fluid" />
                        </a>
                    </div>
                    <div class="col-lg-2 col-md-2 col-2">
                        <a href="../carrito.jsp">
                            <i class="fa-solid fa-cart-shopping fa-2x carrito"></i>
                        </a>

                    </div>
                </div>
            </div>
        </header>
        <jsp:include page="../WEB-INF/paginas/comunes/cabecera.jsp"/>
        <div id="main-header" class="py-2 bg-light text-dark" >
            <div class="container">
                <div class="row">
                    <div class="col-4"></div>
                    <div class="col-4">
                        <h1>
                            <i class="fas fa-user-cog"></i>Control Usuario
                        </h1>
                    </div>
                    <div  class="col-4"></div>
                </div>
            </div>
        </div>

        <main>

            <div class="container">
                <div class="row">
                    <div class="col-1 col-md-1">

                    </div>
                    <div class="col-10 col-md-10">



                        <div class="card">
                            <div class="card-header">
                                <h4>Editar Usuario</h4>


                                <form method="POST" action="${pageContext.request.contextPath}/ServletUsuario">



                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Agregar Usuario</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>

                                            <form method="POST" action="${pageContext.request.contextPath}/ServletUsuario" class="was-validated">
                                                <div class="modal-body">
                                                    <form>

                                                        <div class="mb-3">
                                                            <label for="correo" class="col-form-label">Correo</label>
                                                            <input type="text" class="form-control" id="correo" name="correo" value="${usuario.getCorreo()}" readonly="true" disable>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="password" class="col-form-label">Contraseña</label>
                                                            <input type="password" class="form-control" id="password" name="password" value="${usuario.password}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="rolId" class="col-form-label">Id rol:</label>
                                                            <input type="number" class="form-control" id="rolId" name="rolId" value="${usuario.getRol_id()}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="personaId" class="col-form-label">Id persona:</label>
                                                            <input type="number" class="form-control" id="personaId" name="personaId" value="${usuario.persona_id}" required>
                                                        </div>
                                                        <input type="hidden" name="accion" value="actualizar">

                                                        </div>

                                                    </form>
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-4 text-center">
                                                                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletUsuario?accion=listar">
                                                                    <i class="fa fa-arrow-left"></i>Regresar/cancelar
                                                                </a>
                                                            </div>
                                                            <div class="col-4 text-center">                                   
                                                                <button type="submit" class="btn btn-success">
                                                                    <i class="fas fa-check"></i> Guardar cambios
                                                                </button>   
                                                            </div>
                                                            <div class="col-4 text-center">
                                                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/ServletUsuario?accion=eliminar&correo=${usuario.correo}">
                                                                    <i class="fa fa-trash-alt"></i>Eliminar Usuario
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                            </div>
                            </form>


                        </div>
                        <div class="col-1 col-md-1">

                        </div>
                    </div>
                </div>
        </main>

        <aside>

        </aside>


        <jsp:include page="../WEB-INF/paginas/comunes/pie-pagina.jsp"/>                                                           
        <script type="text/javascript" src="../assets/js/jquery-3.6.0.js"></script>
        <script type="text/javascript" src="../assets/js/jquery.flexslider.js"></script>
        <script type="text/javascript" src="../assets/js/script.js"></script>

        <script type="text/javascript" src="../assets/js/bootstrap.bundle.js"></script>
    </body>
</html>


