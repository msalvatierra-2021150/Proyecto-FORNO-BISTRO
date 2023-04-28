<%-- 
    Document   : sedes
    Created on : Sep 2, 2022, 2:51:41 PM
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
    <link rel="stylesheet" type="text/css" href="./assets/css/hoja-estilo-sedes.css" />
    <script src="./assets/js/fonticon.js" def></script>
</head>

<body>
  <header>
    <div class="container">
        <div class="row">
            <div class="col-lg-2 col-md-2 col-2">
                <a href="login.html">
                    <i class="fa-solid fa-bars fa-2x settings"></i>
                </a>
            </div>
            <div class="col-lg-8 col-md-8 col-8">
                <a href="index.html">
                    <img src="./assets/images/logo/imagenes_logos/logo_fondos_oscuros.png" class="logo imag-fluid" />
                  </a>
            </div>
            <div class="col-lg-2 col-md-2 col-2">
                <a href="carrito.html">
                    <i class="fa-solid fa-cart-shopping fa-2x carrito"></i>
                </a>

            </div>
        </div>
    </div>
</header>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <img src="./assets/images/logo/imagenes_logos/logo_transparente_fondos_claros.png"
            class="logo_nav">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item padding-items-navbar">
                    <a class="nav-link active" aria-current="page" href="index.html">Inicio</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        Menú
                    </a>
                    <ul class="dropdown-menu menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="desayunos.html">Desayunos</a></li>
                        <li><a class="dropdown-item" href="almuerzos.html">Almuerzos</a></li>
                        <li><a class="dropdown-item" href="cenas.html">Cena</a></li>
                        <li><a class="dropdown-item" href="postres.html">Postres</a></li>
                        <li><a class="dropdown-item" href="bebidas.html">Bebidas</a></li>
                        <li><a class="dropdown-item" href="platillos.html">Platillos</a></li>
                        <li><a class="dropdown-item" href="ofertas.html">Ofertas</a></li>
                    </ul>
                </li>
                <li class="nav-item padding-items-navbar">
                    <a class="nav-link" href="acercaDe.html">Acerca de Nosotros</a>
                </li>
                <li class="nav-item padding-items-navbar">
                    <a class="nav-link" href="sedes.html">Sedes</a>
                </li>
                <li class="nav-item padding-items-navbar">
                    <a class="nav-link " href="#">Contáctanos</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Buscar..." aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Buscar</button>
            </form>
        </div>
    </div>
</nav>

    <div class="center">   
            <h3 class="display-5 mb-2 text-center pt-3 pb-3"> <i class="fa-solid fa-school"></i> Sedes</h3>
    </div>

    <div class="container container-menu-cards">
        <div class="row ">
            <div class="col-md-12 col-sm-12 col-12 upbar">
                <hr class="lineas-separacion">
                    <button type="button" class="btn btn-color">Desayunos</button>
                    <a href="almuerzos.html"><button type="button" class="btn btn-color">Almuerzos</button></a>
                    <button type="button" class="btn btn-color">Cenas</button>
                    <button type="button" class="btn btn-color">Postres</button>
                    <a href="platillos.html"><button type="button" class="btn btn-color">Platillos</button></a>
                    <a href="bebidas.html"><button type="button" class="btn btn-color" href="bebidas.html">Bebidas</button></a>
                    <button type="button" class="btn btn-color">Descuentos</button>
                <hr class="lineas-separacion">
            </div>
        </div>
        <!--Otra fila-->
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="col">
              <div class="card h-100">
                <img src="./assets/images/sedes/cayala.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Forno Bistro Cayala</h5>
                  <p class="card-text">Restaurante y Market. 22 calle 9-33 zona 16, Paseo Cayalá.</p>               
                  <p class="card-text">Lunes a Domingo.</p>
                  <p class="card-text">9:00 -21:00</p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card h-100">
                <img src="./assets/images/sedes/antigua.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Forno Bistro Antigua Guatemala</h5>
                  <p class="card-text">Restaurante y Market. 6a Calle Poniente 7, Antigua Guatemala.</p>               
                  <p class="card-text">Lunes a Domingo.</p>
                  <p class="card-text">8:00 -21:00</p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card h-100">
                <img src="./assets/images/sedes/zona10.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Forno Bistro Zona 10</h5>
                  <p class="card-text">Restaurante y Market. 8a Calle 3-14, Cdad. de Guatemala.</p>               
                  <p class="card-text">Lunes a Domingo.</p>
                  <p class="card-text">10:00 -21:00</p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card h-100">
                <img src="./assets/images/sedes/zona14.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Forno Bistro Zona 14</h5>
                  <p class="card-text">Restaurante y Market. 10 Avenida 5-49, Cdad. de Guatemala.</p>               
                  <p class="card-text">Lunes a Domingo.</p>
                  <p class="card-text">9:00 -21:00</p>
                </div>
              </div>
            </div>
            <div class="col">
                <div class="card h-100">
                  <img src="./assets/images/sedes/zona9.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">Forno Bistro Zona 9</h5>
                    <p class="card-text">Restaurante y Market. 4A Avenida 9-78, Cdad. de Guatemala.</p>               
                  <p class="card-text">Lunes a Domingo.</p>
                  <p class="card-text">9:00 -21:00</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-100">
                  <img src="./assets/images/sedes/florida.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">Forno Bistro Florida</h5>
                    <p class="card-text">Restaurante y Market. Calzada San Juan 1-83 zona 7, Mixco, Guatemala.</p>               
                  <p class="card-text">Lunes a Domingo.</p>
                  <p class="card-text">10:00 -20:00</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-100">
                  <img src="./assets/images/sedes/fontabella.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">Forno Bistro Fontabella</h5>
                    <p class="card-text">Restaurante y Market. 4A Avenida 12-59, zona 10, Cdad. de Guatemala.</p>               
                  <p class="card-text">Lunes a Domingo.</p>
                  <p class="card-text">10:00 -22:00</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-100">
                  <img src="./assets/images/sedes/petapa.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">Forno Bistro Petapa</h5>
                    <p class="card-text">Restaurante y Market. Avenida Petapa 42-36, zona 12, Cdad. de Guatemala.</p>               
                  <p class="card-text">Lunes a Domingo.</p>
                  <p class="card-text">8:00 -22:00</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-100">
                  <img src="./assets/images/sedes/naranjo.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">Forno Bistro Naranjo</h5>
                    <p class="card-text">Restaurante y Market. 23 calle 10-00, Condado Naranjo, Guatemala.</p>               
                  <p class="card-text">Lunes a Domingo.</p>
                  <p class="card-text">8:00 -20:00</p>
                  </div>
                </div>
              </div>            
                <div class="col">
                  <div class="card h-100">
                    <img src="./assets/images/sedes/miraflores.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Forno Bistro Miraflores</h5>
                      <p class="card-text">Restaurante y Market. 21 avenida 4-32, zona 11, Cdad. de Guatemala.</p>               
                  <p class="card-text">Lunes a Domingo.</p>
                  <p class="card-text">9:00 -21:00</p>
                    </div>
                  </div>
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
    
    <script type="text/javascript" src="./assets/js/js_paginas/bebidas.js"></script>
    <script type="text/javascript" src="./assets/js/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="./assets/js/script.js"></script>
    <script type="text/javascript" src="./assets/js/bootstrap.bundle.js"></script>
</body>

</html>
