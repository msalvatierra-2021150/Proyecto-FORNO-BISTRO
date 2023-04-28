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
                        <i class="fas fa-user-cog"></i>Control Personas
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
                    <button type="button" class="btn btn-secondary btn-agregar" data-bs-toggle="modal" data-bs-target="#addModal">Agregar Persona</button>
                <hr class="lineas-separacion">
            </div>
        </div>
            </div>
        </section>
        
        <section id="estudiante">
            <div class="container pb-5">             
                <div class="row">
                    <div class="col-12 col-md-12 col-xl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Listado de Personas</h4>
                            </div>
                        </div>  
                        
                        <table class="table table-striped">
                            <thead class="table-dark cabeza-tabla">
                                <tr>
                                    <th>Id</th>
                                    <th>Nombre</th>
                                    <th>Nombre2 </th>
                                    <th>Nombre3</th>
                                    <th>Apellido1</th>
                                    <th>Apellido2</th>
                                    <th>Telefono</th>
                                    <th>Direccion</th>
                                    <th>Ciudad</th>
                                    <th>Codigo Postal</th>
                                    <th>Estado</th>
                                    <th>Pais</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${data}" var="persona">
                                    <tr>
                                        <td>${persona.id}</td>
                                        <td>${persona.nombre1}</td>
                                        <td>${persona.nombre2}</td>
                                        <td>${persona.nombre3}</td>
                                        <td>${persona.apellido1}</td>
                                        <td>${persona.apellido2}</td>
                                        <td>${persona.telefono}</td>
                                        <td>${persona.direccion}</td>
                                        <td>${persona.ciudad}</td>
                                        <td>${persona.codigoPostal}</td>
                                        <td>${persona.estado}</td>
                                        <td>${persona.pais}</td>
                                        <td>
                                            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletPersona?accion=editar&id=${persona.id}">
                                                <i class="far fa-edit"></i>Editar
                                            </a>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/ServletPersona?accion=eliminar&id=${persona.id}" class="btn btn-secondary">
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

    
            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar persona</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/ServletPersona?" class="was-validated">
                    <div class="modal-body">
                            <div class="form-group">
                                <label for="nombre1" class="col-form-label">Primer Nombre</label>
                                <input type="text" class="form-control" id="nombre1" name="nombre1" required>
                            </div>
                            <div class="form-group">
                                <label for="nombre2" class="col-form-label">Segundo nombre</label>
                                <input type="text" class="form-control" id="nombre2" name="nombre2" required>
                            </div>
                            <div class="form-group">
                                <label for="nombre3" class="col-form-label">Tercer nombre</label>
                                <input type="text" class="form-control" id="nombre3" name="nombre3" required>
                            </div>
                            <div class="form-group">
                                <label for="apellido1" class="col-form-label">Primer apellido</label>
                                <input type="text" class="form-control" id="apellido1" name="apellido1" required>
                            </div>
                            <div class="form-group">
                                <label for="apellido2" class="col-form-label">Segundo apellido</label>
                                <input type="text" class="form-control" id="apellido2" name="apellido2" required>
                            </div>
                            <div class="form-group">
                                <label for="telefono" class="col-form-label">Telefono</label>
                                <input type="tel" class="form-control" id="telefono" name="telefono" required>
                            </div>
                            <div class="form-group">
                                <label for="direccion" class="col-form-label">Direccion</label>
                                <input type="text" class="form-control" id="direccion" name="direccion" required>
                            </div>
                            <div class="form-group">
                                <label for="ciudad" class="col-form-label">Ciudad</label>
                                <input type="text" class="form-control" id="ciudad" name="ciudad" required>
                            </div>
                            <div class="form-group">
                                <label for="codigoPostal" class="col-form-label">Codigo Postal</label>
                                <input type="text" class="form-control" id="codigoPostal" name="codigoPostal" required>
                            </div>      
                            <div class="form-group">
                                <label for="estado" class="col-form-label">Estado</label>
                                <input type="text" class="form-control" id="estado" name="estado" required>
                            </div>
                            <div class="form-group">
                                <label for="pais" class="col-form-label">Pais</label>
                                <input type="text" class="form-control" id="pais" name="pais" required>
                            </div>                            
                             <input type="hidden" value="insertar" id="accion" name="accion" >     
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
                      
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
