<%-- 
    Document   : Usuario
    Created on : Sep 2, 2022, 7:19:03 PM
    Author     : W10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Created on : Aug 19, 2022, 5:43:42 PM
    Author     : Michael Steven Salvatierra Ramirez
    Carne: 2021150
    Codigo tecnico: IN5BM
    Jornada: Matutina
    Grado: 5to Perito en informatica 
    Profesor: Lic. Jorge Luis Perez Canto
    Grupo presencial: 2 (Lunes)
--%>

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
                        <i class="fas fa-user-cog"></i>Control Usuario
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
                    <button type="button" class="btn btn-secondary btn-agregar" data-bs-toggle="modal" data-bs-target="#addModal">Agregar Usuarios</button>
                <hr class="lineas-separacion">
            </div>
        </div>
            </div>
        </section>
        
        <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                    <label for="correo" class="col-form-label">Correo:</label>
                                    <input type="email" class="form-control" id="correo" name="correo" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="col-form-label">Password:</label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>
                                <div class="mb-3">
                                    <label for="rolId" class="col-form-label">Id Rol:</label>
                                    <input type="number" class="form-control" id="rolId" name="rolId" required>
                                </div>
                                <div class="mb-3">
                                    <label for="personaId" class="col-form-label">Id Persona:</label>
                                    <input type="number" class="form-control" id="personaId" name="personaId" required>
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
                                <h4>Listado de Usuarios</h4>
                            </div>
                        </div>  
                        
                        <table class="table table-striped">
                            <thead class="table-dark cabeza-tabla">
                                <tr>
                                    <th>Correo</th>
                                    <th>Contrasena</th>
                                    <th>Id Rol</th>
                                    <th>Rol</th>
                                    <th>Id Persona</th>
                                    <th>Nombre Persona</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${data}" var="usuario">
                                    <tr>
                                        <td>${usuario.correo}</td>
                                        <td>${usuario.password}</td>
                                        <td>${usuario.rol_id}</td>
                                        <td>${usuario.rol}</td>
                                        <td>${usuario.persona_id}</td>
                                        <td>${usuario.nombrePersona}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/ServletUsuario?accion=editar&correo=${usuario.correo}" class="btn btn-warning">
                                                <i class="fa fa-edit"></i>Editar
                                            </a>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/ServletUsuario?accion=eliminar&correo=${usuario.correo}" class="btn btn-secondary">
                                                <i class="fa fa-trash-alt"></i>Eliminar
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
    
    <script type="text/javascript" src="../assets/js/bootstrap.bundle.js"></script>
</body>

</html>
