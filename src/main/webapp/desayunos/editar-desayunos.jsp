<%-- 
    Document   : editar-tarjetas
    Created on : 14 sept. 2022, 21:25:02
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es GT"/>
<!DOCTYPE html>
<html>
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
                                <h4>Editar desayuno</h4>
                                <form method="POST" action="${pageContext.request.contextPath}/ServletDesayuno">
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="id" class="col-form-label">Id del desayuno</label>
                                            <input type="number" class="form-control" id="id"  name="id" value="${desayunos.getId()}"  readonly="true" required>
                                        </div>                        
                                        <div class="form-group">
                                            <label for="nombre" class="col-form-label">Nombre del platillo</label>
                                            <input type="text" class="form-control" id="nombre" name="nombre" value="${desayunos.getNombre()}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="postreId" class="col-form-label">ID Postre</label>
                                            <input type="number" class="form-control" id="postreId" name="postreId" value="${desayunos.getPostreId()}" required>
                                        </div> 
                                        <div class="form-group">
                                            <label for="platilloId" class="col-form-label">ID Platillo</label>
                                            <input type="number" class="form-control" id="platilloId" name="platilloId" value="${desayunos.getPlatilloId()}" required>
                                        </div> 
                                        
                                        <div class="form-group">
                                            <label for="bebidaId" class="col-form-label">ID Bebida</label>
                                            <input type="number" class="form-control" id="bebidaId" name="bebidaId" value="${desayunos.getBebidaId()}" required>
                                        </div> 
                                                                       
                                        <div class="form-group">
                                            <label for="descripcion" class="col-form-label">Descripcion</label>
                                            <input type="text" class="form-control" id="descripcion" name="descripcion" value="${desayunos.getDescripcion()}" required>
                                        </div> 
                                        
                                         <div class="form-group">
                                            <label for="precio" class="col-form-label">Precio</label>
                                            <input type="number" class="form-control" id="precio" name="precio" value="${desayunos.getPrecio()}" required>
                                        </div> 
                                        <div class="form-group">
                                            <label for="rutaImagen" class="col-form-label">Ruta de la imagen</label>
                                            <input type="text" class="form-control" id="rutaImagen" name="rutaImagen" value="${desayunos.getRutaImagen()}" required>
                                        </div> 
                                        
                                        <div class="form-group">
                                            <label for="tiempo" class="col-form-label">Tiempo</label>
                                            <input type="text" class="form-control" id="tiempo" name="tiempo" value="${desayunos.getTiempo()}" required>
                                        </div> 
                                        
      
                                        <input type="hidden" value="actualizar" id="accion" name="accion" >     
                                    </div>
                                        
                                    <div class="mb-3 mt-3">
                                        <div class="container">

                                            <div class="row">
                                                <div class="col-1">  </div>
                                                <div class="col-3">
                                                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletDesayuno?accion=listar">
                                                        <i class="fa fa-arrow-left"></i> Cancelar/Regresar
                                                    </a> 
                                                </div>
                                                <div class="col-1">  </div>
                                                <div class="col-3">
                                                    <button type="submit" href="${pageContext.request.contextPath}/ServletDesayuno?accion=listar" class="btn btn-success">
                                                        <i class="fas fa-check"></i> Guardar cambios
                                                    </button>
                                                </div>
                                                <div class="col-1">  </div>
                                                <div class="col-3">
                                                    <a class="btn btn-danger" href="${pageContext.request.contextPath}/ServletDesayuno?accion=eliminar&id=${desayunos.getId()}">
                                                        <i class="fa fa-trash-alt"></i> Eliminar Tarjerta
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
       

        <script type="text/javascript" src="../assets/js/bootstrap.bundle.js"></script>                            

    </body>
</html>