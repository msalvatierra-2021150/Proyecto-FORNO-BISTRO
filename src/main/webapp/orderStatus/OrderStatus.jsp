<%-- 
    Document   : OrderStatus
    Created on : 2/09/2022, 20:29:08
    Author     : octav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es GT"/>

<!DOCTYPE html>
<html lang="es">

    <head>
        <title>Fundación Kinal</title>
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
                            <i class="fas fa-user-cog"></i>Control Order Status
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
                            <button type="button" class="btn btn-secondary btn-agregar"  data-bs-toggle="modal" data-bs-target="#addModal">Agregar Order</button>
                            <hr class="lineas-separacion">
                        </div>
                    </div>
                </div>
            </section>
            
            <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar Order</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <form method="POST" action="${pageContext.request.contextPath}/ServletOrderStatus" class="was-validated">
                        <div class="modal-body">
                            <form>
                                <div class="mb-3">
                                    <label for="status" class="col-form-label">Status:</label>
                                    <input type="text" class="form-control" id="status" name="status" required>
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
                                    <h4>Listado de Order Status</h4>
                                </div>
                            </div>  

                            <table class="table table-striped">
                                <thead class="table-dark cabeza-tabla">
                                    <tr>
                                        <th>Id</th>
                                        <th>Status</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${data}" var="order">
                                        <tr>
                                            <td>${order.id}</td>
                                            <td>${order.status}</td>
                                            <td>
                                                <a class="btn btn-warning" href="${pageContext.request.contextPath}/ServletOrderStatus?accion=editar&id=${order.id}">
                                                <i class="fa fa-edit"></i> Editar
                                                </a>
                                            </td>
                                            <td>
                                                 <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletOrderStatus?accion=eliminar&id=${order.id}">
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

