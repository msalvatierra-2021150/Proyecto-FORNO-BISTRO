<%-- 
    Document   : editProfile
    Created on : 5 sept. 2022, 21:22:06
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <title>Forno Bistro</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="./assets/css/hoja-estilo-acerca.css" />
        <script src="./assets/js/fonticon.js" def></script>
    </head>
</head>

<body>

    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-2">
                    <a href="./login.jsp">
                        <i class="fa-solid fa-bars fa-2x settings"></i>
                    </a>
                </div>
                <div class="col-lg-8 col-md-8 col-8">
                    <a href="${pageContext.request.contextPath}/index.jsp">
                        <img src="./assets/images/logo/imagenes_logos/logo_fondos_oscuros.png" class="logo imag-fluid" />
                    </a>
                </div>
                <div class="col-lg-2 col-md-2 col-2">
                    <a href="${pageContext.request.contextPath}/carrito.jsp">
                        <i class="fa-solid fa-cart-shopping fa-2x carrito"></i>
                    </a>

                </div>
            </div>
        </div>
    </header>
    <jsp:include page="./WEB-INF/paginas/comunes/cabecera.jsp"/>
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"></div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Editar Perfil</h4>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6"><label class="labels">Nombre</label><input type="text"
                                                                                         class="form-control" placeholder="Primer Nombre" value=""></div>
                        <div class="col-md-6"><label class="labels">Nombre 2</label><input type="text"
                                                                                           class="form-control" placeholder="Segundo Nombre" value=""></div>
                        <div class="col-md-6"><label class="labels">Nombre 3</label><input type="text"
                                                                                           class="form-control" placeholder="Tercer Nombre" value=""></div>
                        <div class="col-md-6"><label class="labels">Apellido 1</label><input type="text"
                                                                                             class="form-control" value="" placeholder="Apellido 1"></div>
                        <div class="col-md-6"><label class="labels">Apellido 2</label><input type="text"
                                                                                             class="form-control" placeholder="Apellido 2" value=""></div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12"><label class="labels">Numero Telefonico</label><input type="text"
                                                                                                     class="form-control" placeholder="Ingresa tu numero telefonico" value=""></div>
                        <div class="col-md-12"><label class="labels">Direccion</label><input type="text"
                                                                                             class="form-control" placeholder="Ingresa tu Direccion" value=""></div>
                        <div class="col-md-12"><label class="labels">Ciudad</label><input type="text"
                                                                                          class="form-control" placeholder="Ingresa tu Ciudad" value=""></div>
                        <div class="col-md-12"><label class="labels">Codigo Postal</label><input type="text"
                                                                                                 class="form-control" placeholder="Ingresa tu Codigo Postal" value=""></div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6"><label class="labels">Pais</label><input type="text"
                                                                                       class="form-control" placeholder="Pais" value=""></div>
                        <div class="col-md-6"><label class="labels">Estado</label><input type="text"
                                                                                         class="form-control" value="" placeholder="Estado"></div>
                    </div>
                    <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">Guardar Cambios</button></div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="./WEB-INF/paginas/comunes/pie-pagina.jsp"/>

<script type="text/javascript" src="./assets/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="./assets/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="./assets/js/script.js"></script>
<script type="text/javascript" src="./assets/js/bootstrap.bundle.js"></script>
</body>
</html>
