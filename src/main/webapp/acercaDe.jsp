<%-- 
    Document   : acercaDe
    Created on : Sep 2, 2022, 2:43:32 PM
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
    <link rel="stylesheet" type="text/css" href="./assets/css/hoja-estilo-acerca.css" />
    <script src="./assets/js/fonticon.js" def></script>
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
                    <a href="./carrito.jsp">
                        <i class="fa-solid fa-cart-shopping fa-2x carrito"></i>
                    </a>

                </div>
            </div>
        </div>
    </header>

        <jsp:include page="./WEB-INF/paginas/comunes/cabecera.jsp"/>
        
    <main>
        <h2 id="texto-an">Acerca de nosotros</h2>
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <img src="./assets/images/acerca_de_nosotros/quienes_somos.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">¿Quiénes somos?</h5>
                        <p class="card-text">Somos un restaurante de comida italiana, que busca darle la mejor
                            experiencia a
                            nuestros clientes. Empezamos en el año 2016, y desde entonces, nuestro objetivo ha sido
                            ofrecer el
                            mejor
                            servicio posible a nuestros clientes. Contamos con más de 10 sedes en Guatemala y más de 50
                            en todo
                            el mundo.
                            <br />
                            <br />
                            Somos de los pocos restaurantes que cuentan con 5 estrellas MICHELIN, que demuestran nuestra
                            excelencia y compromiso con entregar la mejor experiencia a nuestros clientes, llevando la
                            comida
                            italiana a un nivel nunca antes visto. Contamos con varios chefs que han recibido premios
                            culinarios por su talento, creatividad y dedicación en los platillos que cocinan.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <img src="./assets/images/acerca_de_nosotros/nuestra_mision.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">¿Cuál es nuestra misión?</h5>
                        <p class="card-text">Nuestra misión es entregar la mejor calidad en nuestros platillos al igual
                            que la
                            mejor experiencia dentro de nuestros restaurantes, para esto usamos ingredientes de la mejor
                            calidad
                            en nuestros platillos y cocinamos nuestros alimentos en la mejor parrilla y siempre
                            utilizando los mejores ingredientes, de igual manera
                            cuidamos
                            la higiene y orden de nuestras cocinas para entregarte tu comida de la mejor manera posible.
                            <br />
                            <br />
                            Para nosotros es muy importante que tengas una buena experiencia en nuestro restaurante, por
                            eso
                            capacitamos a todos nuestros empleados para que te atiendan de la mejor manera posible, al
                            igual que
                            cuidamos el aspecto de nuestras instalaciones, dándoles mantenimiento constantemente.
                        </p>
                    </div>
                </div>
            </div>
        </div>
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




    <footer>
        <div class="container pie-de-pagina">
            <table class="table">
                <thead>
                    <tr>
                        <td scope="col"><a href="index.html" class="links-deactivated">Inicio</a></th>
                        <td scope="col">¿Quiénes somos?</td>
                        <td scope="col">Contáctanos</td>
                        <td scope="col">Términos y condiciones</td>
                        <td scope="col">Política de privacidad</td>
                    </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <p class="copyright">Todos los derechos reservados &copy</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script type="text/javascript" src="./assets/js/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="./assets/js/script.js"></script>
    <script type="text/javascript" src="./assets/js/bootstrap.bundle.js"></script>
</body>

</html>