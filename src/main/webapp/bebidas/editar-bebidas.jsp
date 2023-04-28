<%-- 
    Document   : editar-bebidas
    Created on : 2/09/2022, 18:25:13
    Author     : octav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es_GT"/>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Forno Bistro</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/css/hoja-estilo-menus.css"/>
        <script src="../assets/js/fonticon.js"></script>
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

    <main>

        <div class="container">
            <div class="row">
                <div class="col-1 col-md-1">

                </div>
                <div class="col-10 col-md-10 py-4">



                    <div class="card">
                        <div class="card-header">
                            <h4>Editar Bebida</h4>


                            <form method="POST" action="${pageContext.request.contextPath}/ServletBebida">



                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>

                                        <form method="POST" action="${pageContext.request.contextPath}/ServletBebida" class="was-validated">
                                            <div class="modal-body">
                                                <form>

                                                    <div class="mb-3">
                                                        <label for="idBebida" class="col-form-label">ID Bebida:</label>
                                                        <input type="text" class="form-control" id="idBebida" name="idBebida" value="${bebida.getId()}" readonly="true" disable>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="nombre" class="col-form-label">Nombre</label>
                                                        <input type="text" class="form-control" id="nombre" name="nombre" value="${bebida.nombre}" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="descripcion" class="col-form-label">Descripción:</label>
                                                        <input type="text" class="form-control" id="descripcion" name="descripcion" value="${bebida.descripcion}" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="precio" class="col-form-label">Precio:</label>
                                                        <input type="number" class="form-control" id="precio" name="precio" value="${bebida.getPrecio()}" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="descuento" class="col-form-label">Descuento:</label>
                                                        <input type="number" class="form-control" id="descuento" name="descuento" value="${bebida.getDescuento()}" required step="any" min="0" max="100000">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="rutaImagen" class="col-form-label">Ruta imagen:</label>
                                                        <input type="text" class="form-control" id="rutaImagen" name="rutaImagen" value="${bebida.getRutaImagen()}" required>
                                                    </div>


                                                    <input type="hidden" name="accion" value="actualizar">

                                                    </div>

                                                </form>
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-4 text-center">
                                                            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletBebida?accion=listar">
                                                                <i class="fa fa-arrow-left"></i>Regresar/cancelar
                                                            </a>
                                                        </div>
                                                        <div class="col-4 text-center">                                   
                                                            <button type="submit" class="btn btn-success">
                                                                <i class="fas fa-check"></i> Guardar cambios
                                                            </button>   
                                                        </div>
                                                        <div class="col-4 text-center">
                                                            <a class="btn btn-danger" href="${pageContext.request.contextPath}/ServletBebida?accion=eliminar&id=${bebida.id}">
                                                                <i class="fa fa-trash-alt"></i>Eliminar bebida
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

    <!-- Footer -->
    <jsp:include page="../WEB-INF/paginas/comunes/pie-pagina.jsp"/>

    <script type="text/javascript" src="../assets/js/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="../assets/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="../assets/js/script.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap.bundle.js"></script>
</body>
</html>


