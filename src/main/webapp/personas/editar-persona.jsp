<%-- 
    Created on : Aug 19, 2022, 4:48:50 PM
    Author     : Michael Steven Salvatierra Ramirez
    Carne: 2021150
    Codigo tecnico: IN5BM
    Jornada: Matutina
    Grado: 5to Perito en informatica 
    Profesor: Lic. Jorge Luis Perez Canto
    Grupo presencial: 2 (Lunes)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

        <main class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-1 col-md-1">



                    </div>
                    <div class="col-10 col-md-10">


                        <div class="container">
                            <div class="row">
                                <div class="col-3">

                                </div>
                                <div class="col-3">

                                </div>
                                <div class="col-3">

                                </div>
                                <div class="col-3">

                                </div>
                            </div>
                        </div>





                        <div class="card">
                            <div class="card-header">
                                <h4>Editar Estudiante</h4>
                                <form method="POST" action="${pageContext.request.contextPath}/ServletPersona">
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="id" class="col-form-label">ID Persona</label>
                                            <input type="text" class="form-control" id="id" readonly="readonly" name="id" value="${persona.getId()}" required>
                                        </div>                        
                                        <div class="form-group">
                                            <label for="nombre1" class="col-form-label">Primer Nombre</label>
                                            <input type="text" class="form-control" id="nombre1" name="nombre1" value="${persona.nombre1}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="nombre2" class="col-form-label">Segundo nombre</label>
                                            <input type="text" class="form-control" id="nombre2" name="nombre2" value="${persona.nombre2}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="nombre3" class="col-form-label">Tercer nombre</label>
                                            <input type="text" class="form-control" id="nombre3" name="nombre3" value="${persona.nombre3}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="apellido1" class="col-form-label">Primer apellido</label>
                                            <input type="text" class="form-control" id="apellido1" name="apellido1" value="${persona.apellido1}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="apellido2" class="col-form-label">Segundo apellido</label>
                                            <input type="text" class="form-control" id="apellido2" name="apellido2" value="${persona.apellido2}"required>
                                        </div>
                                        <div class="form-group">
                                            <label for="telefono" class="col-form-label">Telefono</label>
                                            <input type="tel" class="form-control" id="telefono" name="telefono" value="${persona.telefono}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="direccion" class="col-form-label">Direccion</label>
                                            <input type="text" class="form-control" id="direccion" name="direccion" value="${persona.direccion}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="ciudad" class="col-form-label">Ciudad</label>
                                            <input type="text" class="form-control" id="ciudad" name="ciudad" value="${persona.ciudad}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="codigoPostal" class="col-form-label">Codigo Postal</label>
                                            <input type="text" class="form-control" id="codigoPostal" name="codigoPostal" value="${persona.codigoPostal}" required>
                                        </div>      
                                        <div class="form-group">
                                            <label for="estado" class="col-form-label">Estado</label>
                                            <input type="text" class="form-control" id="estado" name="estado" value="${persona.estado}" required>
                                        </div>
                                        <div class="form-group pb-4">
                                            <label for="pais" class="col-form-label">Pais</label>
                                            <input type="text" class="form-control" id="pais" name="pais" value="${persona.pais}" required>
                                        </div>                            
                                        <input type="hidden" value="actualizar" id="accion" name="accion" >     
                                    </div>
                                    <div class="mb-3">
                                        <div class="container">

                                            <div class="row">
                                                <div class="col-1">  </div>
                                                <div class="col-3">
                                                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletPersona?accion=listar">
                                                        <i class="fa fa-arrow-left"></i> Cancelar/Regresar
                                                    </a> 
                                                </div>
                                                <div class="col-1">  </div>
                                                <div class="col-3">
                                                    <button type="submit" href="${pageContext.request.contextPath}/ServletPersona?accion=listar" class="btn btn-success">
                                                        <i class="fas fa-check"></i> Guardar cambios
                                                    </button>
                                                </div>
                                                <div class="col-1">  </div>
                                                <div class="col-3">
                                                    <a class="btn btn-danger" href="${pageContext.request.contextPath}/ServletPersona?accion=eliminar&id=${persona.id}">
                                                        <i class="fa fa-trash-alt"></i> Eliminar Estudiante
                                                    </a> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="accion" value="actualizar">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-1 col-md-1">


                    </div>
                </div>
            </div>

        </main>  

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