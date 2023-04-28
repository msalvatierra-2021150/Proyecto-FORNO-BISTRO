<%-- 
    Document   : index
    Created on : Sep 2, 2022, 2:48:53 PM
    Author     : W10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <title>Forno Bistro</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/hoja-estilo-kinal.css" />
    <script src="./assets/js/fonticon.js" def></script>
</head>

<body>
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-2">
                    <a href="${pageContext.request.contextPath}/login/login.jsp">
                        <i class="fa-solid fa-bars fa-2x settings"></i>
                    </a>
                </div>
                <div class="col-lg-8 col-md-8 col-8">
                    <a href="${pageContext.request.contextPath}/index.jsp">
                        <img src="./assets/images/logo/imagenes_logos/logo_fondos_oscuros.png" class="logo imag-fluid" />
                      </a>
                </div>
                <div class="col-lg-2 col-md-2 col-2">
                    <a href="${pageContext.request.contextPath}/carrito/carrito.jsp">
                        <i class="fa-solid fa-cart-shopping fa-2x carrito"></i>
                    </a>

                </div>
            </div>
        </div>
    </header>
                        
        <jsp:include page="./WEB-INF/paginas/comunes/cabecera.jsp"/>
    <main>
        <section class="slider">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./assets/images/slide_images/slide1.jpg" class="w-100">
                    </div>
                    <div class="carousel-item">
                        <img src="./assets/images/slide_images/slide2_.jpg" class="d-block w-100">
                    </div>
                    <div class="carousel-item">
                        <img src="./assets/images/slide_images/slide3.jpg" class="d-block w-100">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>
    </main>

    <div class="container">
        <div class="row">
            <div class="col-12 subtitulo">
                <figure class="text-center">
                    <blockquote class="blockquote">
                      <p>Detrás de cada platillo existe arte. Buen gusto, buena vida</p>
                    </blockquote>
                    <figcaption class="blockquote-footer">
                       <cite title="Source Title">Att. Equipo de Forno Bistro</cite>
                    </figcaption>
                  </figure>
            </div>
        </div>
    </div>

    <div class="card-group d-flex justify-content-center">

        <!--Otra fila-->
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="col-md-4">
                <div class="card" style="width: 18rem;">
                    <img src="./assets/images/bebidas/coca-cola-disminuido-2.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title d-flex justify-content-center">Coca-Cola</h5>
                        <a href="#" class="btn btn-primary d-flex justify-content-center">Ordenar</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card" style="width: 18rem;">
                    <img src="./assets/images/bebidas/coca-cola-disminuido-2.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title d-flex justify-content-center">Coca-Cola</h5>
                        <a href="#" class="btn btn-primary d-flex justify-content-center">Ordenar</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card" style="width: 18rem;">
                    <img src="./assets/images/bebidas/coca-cola-disminuido-2.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title d-flex justify-content-center">Coca-Cola</h5>
                        <a href="#" class="btn btn-primary d-flex justify-content-center">Ordenar</a>
                    </div>
                </div>
            </div>
          </div>

          <!--Otra fila-->
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="col-md-4">
                <div class="card" style="width: 18rem;">
                    <img src="./assets/images/bebidas/coca-cola-disminuido-2.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title d-flex justify-content-center">Coca-Cola</h5>
                        <a href="#" class="btn btn-primary d-flex justify-content-center">Ordenar</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card" style="width: 18rem;">
                    <img src="./assets/images/bebidas/coca-cola-disminuido-2.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title d-flex justify-content-center">Coca-Cola</h5>
                        <a href="#" class="btn btn-primary d-flex justify-content-center">Ordenar</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card" style="width: 18rem;">
                    <img src="./assets/images/bebidas/coca-cola-disminuido-2.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title d-flex justify-content-center">Coca-Cola</h5>
                        <a href="#" class="btn btn-primary d-flex justify-content-center">Ordenar</a>
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
