<%-- 
    Document   : editar-pedidos
    Created on : 16 sept. 2022, 22:51:25
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
                                <h4>Editar pedidos</h4>
                                <form method="POST" action="${pageContext.request.contextPath}/ServletPedidos">
                                    <div class="modal-body">
                                        
                                        <div class="form-group">
                                            <label for="id" class="col-form-label">ID Pedido</label>
                                            <input type="number" class="form-control" id="id"  name="id" value="${pedidos.getId()}"  readonly="true" required>
                                        </div>                        
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
                                        
      
                                        <input type="hidden" value="actualizar" id="accion" name="accion" >     
                                    </div>
                                        
                                    <div class="mb-3 mt-3">
                                        <div class="container">

                                            <div class="row">
                                                <div class="col-1">  </div>
                                                <div class="col-3">
                                                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletPedidos?accion=listar">
                                                        <i class="fa fa-arrow-left"></i> Cancelar/Regresar
                                                    </a> 
                                                </div>
                                                <div class="col-1">  </div>
                                                <div class="col-3">
                                                    <button type="submit" href="${pageContext.request.contextPath}/ServletPedidos?accion=listar" class="btn btn-success">
                                                        <i class="fas fa-check"></i> Guardar cambios
                                                    </button>
                                                </div>
                                                <div class="col-1">  </div>
                                                <div class="col-3">
                                                    <a class="btn btn-danger" href="${pageContext.request.contextPath}/ServletPedidos?accion=eliminar&id=${pedidos.id}">
                                                        <i class="fa fa-trash-alt"></i> Eliminar Pedido
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