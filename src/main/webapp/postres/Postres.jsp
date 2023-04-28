<%-- 
    Document   : Postres
    Created on : 2/09/2022, 22:18:13
    Author     : octav
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
                                <i class="fas fa-user-cog"></i>Control Postre
                        </h1>
                    </div>
                    <div  class="col-4"></div>
                </div>
            </div>
        </div>

        <div class="center">   
            <img src="../assets/images/banners/postres.png" class="img-fluid" alt="...">
        </div>
        
        <main>
            <section id="actions" class="py-3">
                <div class="container">
                    <div class="row ">
                        <div class="col-md-12 col-sm-12 col-12 upbar">
                            <hr class="lineas-separacion">
                            <button type="button" class="btn btn-secondary btn-agregar w-100" data-bs-toggle="modal" data-bs-target="#addModal">
                                Agregar Postres</button>
                            <hr class="lineas-separacion">
                        </div>
                    </div>
                </div>
            </section>

            <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar Postre</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <form method="POST" action="${pageContext.request.contextPath}/ServletPostre" class="was-validated">
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="nombre" class="col-form-label">Nombre:</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="descripcion" class="col-form-label">Descripción:</label>
                                        <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="precio" class="col-form-label">Precio</label>
                                        <input type="number" class="form-control" id="precio" name="precio" required step="any" min="0" max="100000">
                                    </div>
                                    <div class="mb-3">
                                        <label for="descuento" class="col-form-label">Descuento</label>
                                        <input type="number" class="form-control" id="descuento" name="descuento" required step="any" min="0" max="100000">
                                    </div>
                                    <div class="mb-3">
                                        <label for="rutaImagen" class="col-form-label">Ruta imagen:</label>
                                        <input type="text" class="form-control" id="rutaImagen" name="rutaImagen" required>
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
                                    <h4>Listado de Postres</h4>
                                </div>
                            </div>  

                            <table class="table table-striped">
                                <tbody>
                                    <c:forEach items="${arraylistPostre}" var="postres">
                                        <tr>

                                    <div class="card mb-3 w-100">
                                        <img class="card-img-top" src="../assets/images/POSTRES${postres.rutaImagen}" alt="Card image cap">
                                        <div class="card-body">
                                            <h5 class="card-title text-center">${postres.nombre}</h5>
                                            <h5 class="card-title text-center">${postres.descripcion}</h5>
                                            <p class="card-text text-center">Q ${postres.precio}</p>
                                            <p class="card-text text-center">Q ${postres.descuento}</p>
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-2 text-center">            
                                                    <a href="${pageContext.request.contextPath}/ServletPostre?accion=eliminar&id=${postres.id}" class="btn btn-secondary">
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
                                                   
                                                        <a class="btn btn-warning" href="${pageContext.request.contextPath}/ServletPostre?accion=editar&id=${postres.id}">
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
                                    </div>
                                            
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