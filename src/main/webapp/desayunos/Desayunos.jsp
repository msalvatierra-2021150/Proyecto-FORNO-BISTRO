<%-- 
    Document   : Desayunos
    Created on : 3 sept. 2022, 0:38:55
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es GT"/>

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

        <div id="main-header" class="py-2 bg-light text-dark" >
            <div class="container">
                <div class="row">
                    <div class="col-4"></div>
                    <div class="col-4">
                        <h1>
                            <i class="fas fa-user-cog"></i>Control Desayunos
                        </h1>
                    </div>
                    <div  class="col-4"></div>
                </div>
            </div>
        </div>

        <div class="center">   
            <img src="../assets/images/banners/desayunos.png" class="img-fluid" alt="...">
        </div>

        <main>
            <<section id="actions" class="py-3">
                <div class="container">
                    <div class="row ">
                        <div class="col-md-12 col-sm-12 col-12 upbar">
                            <hr class="lineas-separacion">
                            <button type="button" class="btn btn-secondary btn-agregar" data-bs-toggle="modal" data-bs-target="#addModal">Agregar Desayunos</button>
                            <hr class="lineas-separacion">
                        </div>
                    </div>
                </div>
            </section>

            <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ingrese los datos del combo</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <form method="POST" action="${pageContext.request.contextPath}/ServletDesayuno" class="was-validated">
                            <div class="modal-body">
                                <form>
                                                         
                                    <div class="form-group">
                                        <label for="nombre" class="col-form-label">Nombre del platillo</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" value="" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="postreId" class="col-form-label">ID Postre</label>
                                        <input type="number" class="form-control" id="postreId" name="postreId" value="" required>
                                    </div> 
                                    <div class="form-group">
                                        <label for="platilloId" class="col-form-label">ID Platillo</label>
                                        <input type="number" class="form-control" id="platilloId" name="platilloId" value="" required>
                                    </div> 

                                    <div class="form-group">
                                        <label for="bebidaId" class="col-form-label">ID Bebida</label>
                                        <input type="number" class="form-control" id="bebidaId" name="bebidaId" value="$" required>
                                    </div> 

                                    <div class="form-group">
                                        <label for="descripcion" class="col-form-label">Descripcion</label>
                                        <input type="text" class="form-control" id="descripcion" name="descripcion" value="" required>
                                    </div> 

                                    <div class="form-group">
                                        <label for="precio" class="col-form-label">Precio</label>
                                        <input type="number" class="form-control" id="precio" name="precio" value="" required>
                                    </div> 
                                    <div class="form-group">
                                        <label for="rutaImagen" class="col-form-label">Ruta de la imagen</label>
                                        <input type="text" class="form-control" id="rutaImagen" name="rutaImagen" value="" required>
                                    </div> 
                                    <div class="form-group">
                                        <label for="tiempo" class="col-form-label">Tiempo</label>
                                        <input type="text" class="form-control" id="tiempo" name="tiempo" value="" required >
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
                                        <h4>Listado de Desayunos</h4>
                                    </div>
                                </div>  

                                <table class="table table-striped">
                                    <tbody>
                                        <c:forEach items="${data}" var="desayunos">
                                            <tr>

                                        <div class="card mb-3 w-100">
                                            <img class="card-img-top" src="../assets/images/MENUS/desayunos${desayunos.rutaImagen}" alt="Card image cap">
                                            <div class="card-body">
                                                <h5 class="card-title text-center">${desayunos.nombre}</h5>
                                                <h5 class="card-title text-center">Q ${desayunos.precio}</h5>
                                                <p class="card-text text-center">${desayunos.descripcion}</p>
                                                <p class="card-text text-center">1x ${desayunos.nombrePostre}</p>
                                                <p class="card-text text-center">1x ${desayunos.nombrePlatillo}</p>
                                                <p class="card-text text-center">1x ${desayunos.nombreBebida}</p>

                                                <<div class="container">
                                                    <div class="row">
                                                        <div class="col-2 text-center">            
                                                            <a href="${pageContext.request.contextPath}/ServletDesayuno?accion=eliminar&id=${desayunos.id}" class="btn btn-secondary">
                                                                <i class="fa fa-trash-alt"></i>Eliminar
                                                            </a>
                                                        </div>   
                                                        <div class="col-2">            
                                                            <button class="my-button botonResta  float-end">-</button></div>
                                                        <div class="col-4">            
                                                            <input type="text" id="mostrador" class="w-100">   </div>
                                                        <div class="col-2">            
                                                            <button class="my-button botonSuma float-start">+</button></div>
                                                        <div class="col-2 text-center">            
                                                            <a class="btn btn-warning" href="${pageContext.request.contextPath}/ServletDesayuno?accion=editar&id=${desayunos.id}">
                                                                <i class="fa fa-edit"></i> Editar
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="row pt-2">
                                                        <div class="col-4"></div>
                                                        <div class="col-4">            
                                                            <a href="#" class="btn btn-primary w-100">Añadir al carrito</a> 
                                                        </div>
                                                        <div class="col-4">            
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <!--
                                        <td>${desayunos.id}</td>
                                        <td>${desayunos.nombre}</td>
                                        <td>${desayunos.postreId}</td>
                                        <td>${desayunos.nombrePostre}</td>
                                        <td>${desayunos.platilloId}</td>
                                        <td>${desayunos.nombrePlatillo}</td>
                                        <td>${desayunos.nombreBebida}</td>
                                        <td>${desayunos.precio}</td>
                                        <td>${desayunos.rutaImagen}</td>
                                        <td>${desayunos.tiempo}</td>
                                        <td>
                                            <i class="far fa-edit"></i>Editar
                                        </td>
                                        <td>
                                            <i class="fa fa-trash-alt"></i>Eliminar
                                        </td>
                                        -->
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

