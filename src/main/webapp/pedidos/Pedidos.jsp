<%-- 
    Document   : Pedidos
    Created on : 3 sept. 2022, 8:06:32
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es GT"/>

<!DOCTYPE html>
<html lang="es">

    <head>
        <title>Forno Bistro</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/css/hoja-estilo-crud.css"/>
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

        <div id="main-header" class="py-2 bg-light text-dark" >
            <div class="container">
                <div class="row">
                    <div class="col-4"></div>
                    <div class="col-4">
                        <h1>
                            <i class="fas fa-user-cog"></i>Control Pedidos
                        </h1>
                    </div>
                    <div  class="col-4"></div>
                </div>
            </div>
        </div>

        <main>
            <section id="actions" class="py-3">
                <div class="container">
                    <div class="row ">
                        <div class="col-md-12 col-sm-12 col-12 upbar">
                            <hr class="lineas-separacion">
                            <button type="button" class="btn btn-secondary btn-agregar" data-bs-toggle="modal" data-bs-target="#addModal">Agregar Pedidos</button>
                            <hr class="lineas-separacion">
                        </div>
                    </div>
                </div>
            </section>

            <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ingrese los datos del pedido</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <form method="POST" action="${pageContext.request.contextPath}/ServletPedidos" class="was-validated">
                            <div class="modal-body">
                                <form>
                                                        
                                    <div class="form-group">
                                        <label for="TarjetaId" class="col-form-label">Numero de la Tarjeta</label>
                                        <input type="text" class="form-control" id="TarjetaId" name="TarjetaId" value="${pedidos.getTarjetaId()}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="comboId" class="col-form-label">ID combo</label>
                                        <input type="number" class="form-control" id="comboId" name="comboId" value="${pedidos.getComboId()}" required>
                                    </div> 
                                    <div class="form-group">
                                        <label for="usuarioId" class="col-form-label">Correo del usuario</label>
                                        <input type="text" class="form-control" id="usuarioId" name="usuarioId" value="${pedidos.getUsuarioId()}" required>
                                    </div> 

                                    <div class="form-group">
                                        <label for="sedeId" class="col-form-label">ID de la Sede</label>
                                        <input type="number" class="form-control" id="sedeId" name="sedeId" value="${pedidos.getSedeId()}" required>
                                    </div> 

                                    <div class="form-group">
                                        <label for="orderStatusId" class="col-form-label">ID del Status de la orden</label>
                                        <input type="number" class="form-control" id="orderStatusId" name="orderStatusId" value="${pedidos.getOrderStatusId()}" required>
                                    </div> 

                                    <div class="form-group">
                                        <label for="comentario" class="col-form-label">Comentario</label>
                                        <input type="text" class="form-control" id="comentario" name="comentario" value="${pedidos.getComentario()}" required>
                                    </div> 

                                    <input type="hidden" value="insertar" id="accion" name="accion">


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-primary">Guardar</button>
                                    </div>
                                </form>
                            </div>
                    </div>
                </div>

                <section id="estudiante">
                    <div class="container pb-5">             
                        <div class="row">
                            <div class="col-12 col-md-12 col-xl-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>Listado de Pedidos</h4>
                                    </div>
                                </div>  

                                <table class="table table-striped">
                                    <thead class="table-dark cabeza-tabla">
                                        <tr>
                                            <th>Id</th>
                                            <th>Numero de Tarjeta</th>
                                            <th>Combo Id</th>
                                            <th>Correo del Usuario</th>
                                            <th>Sede Id</th>
                                            <th>Order Status</th>
                                            <th>Comentario</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${data}" var="pedidos">
                                            <tr>
                                                <td>${pedidos.id}</td>
                                                <td>${pedidos.tarjetaId}</td>
                                                <td>${pedidos.comboId}</td>
                                                <td>${pedidos.usuarioId}</td>
                                                <td>${pedidos.sedeId}</td>
                                                <td>${pedidos.orderStatusId}</td>
                                                <td>${pedidos.comentario}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/ServletPedidos?accion=editar&id=${pedidos.id}" class="btn btn-warning">
                                                        <i class="fa fa-edit"></i>Editar
                                                    </a>
                                                </td>
                                                <td>
                                                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletPedidos?accion=eliminar&id=${pedidos.id}">
                                                        <i class="far fa-trash-alt"></i> Eliminar
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </section>

        </main>


        <aside>
            <!-- Aquí va ir el contenido secundaio -->
        </aside>

        <!-- Footer -->
        <jsp:include page="../WEB-INF/paginas/comunes/pie-pagina.jsp"/>

        <script type="text/javascript" src="../assets/js/jquery-3.6.0.js"></script>
        <script type="text/javascript" src="../assets/js/jquery.flexslider.js"></script>
        <script type="text/javascript" src="../assets/js/script.js"></script>
        <!--
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        -->

        <script type="text/javascript" src="../assets/js/bootstrap.bundle.js"></script>
    </body>

</html>
