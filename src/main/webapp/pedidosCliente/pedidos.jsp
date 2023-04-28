<%-- 
    Document   : pedidos
    Created on : Sep 6, 2022, 7:20:22 PM
    Author     : W10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Forno Bistro</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/checkout/">
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/hoja-estilo-kinal.css" />
    <script src="../assets/js/fonticon.js" def></script>


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

  </head>

  <body>
    <header>
        <div class="container">
            <div class="row">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-2">
                            <a href="../index.jsp">
                                <i class="fa-solid fa-arrow-left fa-2x settings"></i>
                            </a>
                        </div>
                        <div class="col-lg-8 col-md-8 col-8">
                            <a href="../index.jsp">
                                <img src="../assets/images/logo/imagenes_logos/logo_fondos_oscuros.png" class="logo imag-fluid" />
                              </a>
                        </div>
                        <div class="col-lg-2 col-md-2 col-2">
                            <!--AQUI IBA EL CARRITO PERO SE QUITO-->
                        </div>
                    </div>
                </div>
    </header>

    <nav class="navbar navbar-expand-lg navbar-light bg-light mb-5">
        <div class="container-fluid mb">
            <img src="../assets/images/logo/imagenes_logos/logo_transparente_fondos_claros.png"
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
    
<div class="container">
  <div class="row">
    <div class="col-md-4 order-md-2 mb-4">
      <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted">Tu carrito</span>
        <span class="badge badge-secondary badge-pill">3</span>
      </h4>
      <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="row">
            <div class="col-4">
                <img src="../assets/images/MENUS/desayunos/menu_parmigiana.png" class="card-img-top w-100" alt="...">

            </div>
            <div class="col-6">
                <h6 class="my-0">Combo Pasta 1</h6>
                <small class="text-muted">Almuerzo</small>
            </div>
            <div class="col-2">
            </div>
          </div>
          
          <span class="text-muted">Q12</span>
        </li>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
            <div class="row">
                <div class="col-4">
                    <img src="../assets/images/MENUS/desayunos/menu_parmigiana.png" class="card-img-top w-100" alt="...">
    
                </div>
                <div class="col-6">
                    <h6 class="my-0">Combo Frutti</h6>
                    <small class="text-muted">Desayuno</small>
                </div>
                <div class="col-2">
                </div>
              </div>
          <span class="text-muted">Q8</span>
        </li>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
            <div class="row">
                <div class="col-4">
                    <img src="../assets/images/MENUS/desayunos/menu_parmigiana.png" class="card-img-top w-100" alt="...">
    
                </div>
                <div class="col-6">
                    <h6 class="my-0">Helado</h6>
                    <small class="text-muted">Postre</small>
                </div>
                <div class="col-2">
                </div>
              </div>
          <span class="text-muted">Q5</span>
        </li>

        <li class="list-group-item d-flex justify-content-between">
          <span>Total (Q)</span>
          <strong>Q20</strong>
        </li>
      </ul>

    </div>
    <div class="col-md-8 order-md-1">
      <h4 class="mb-3">Dirección de envío</h4>
      <form class="needs-validation" novalidate>
        <div class="row">
          <div class="col-md-4 mb-3">
            <label for="firstName">Primer nombre</label>
            <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
            <div class="invalid-feedback">
              El primer nombre es requerido.
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <label for="lastName">Segundo nombre <span class="text-muted">(Opcional)</span></label>
            <input type="text" class="form-control" id="lastName" placeholder="" value="">
          </div>
          <div class="col-md-4 mb-3">
            <label for="lastName">Tercer Nombre <span class="text-muted">(Opcional)</span></label>
            <input type="text" class="form-control" id="lastName" placeholder="" value="">
          </div>

        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
              <label for="firstName">Primer apellido</label>
              <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
              <div class="invalid-feedback">
                El primer apellido
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="lastName">Segundo apellido <span class="text-muted">(Opcional)</span></label>
              <input type="text" class="form-control" id="lastName" placeholder="" value="">
            </div>
  
          </div>

        <div class="mb-3">
          <label for="email">Correo electrónico </label>
          <input type="email" class="form-control" id="email" placeholder="correo@ejemplo.com">
          <div class="invalid-feedback">
            El correo electrónico es requerido.
          </div>
        </div>

        <div class="mb-3">
          <label for="address">Dirección</label>
          <input type="text" class="form-control" id="address" placeholder="1234 Avenida A" required>
          <div class="invalid-feedback">
            Por favor ingrese la dirección de domicilio.
          </div>
        </div>

        <div class="row">
          <div class="col-md-5 mb-3">
            <label for="country">País</label>
            <input type="text" class="form-control" id="zip" placeholder="" required>
            <div class="invalid-feedback">
              El país es requerido
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <label for="state">Estado</label>
            <input type="text" class="form-control" id="zip" placeholder="" required>
            <div class="invalid-feedback">
              El estado postal es requerido
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="zip">Código postal</label>
            <input type="text" class="form-control" id="zip" placeholder="" required>
            <div class="invalid-feedback">
              El código postal es requerido
            </div>
          </div>
        </div>
        <hr class="mb-4">

        <h4 class="mb-3">Pago</h4>

        <div class="d-block my-3">
          <div class="custom-control custom-radio">
            <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
            <label class="custom-control-label" for="credit">Tarjeta de Crédito</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
            <label class="custom-control-label" for="debit">Tarjeta de Débito</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
            <label class="custom-control-label" for="paypal">PayPal</label>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="cc-name">Nombre de la tarjeta</label>
            <input type="text" class="form-control" id="cc-name" placeholder="" required>
            <small class="text-muted">Nombre completo en la tarjeta</small>
            <div class="invalid-feedback">
              El nombre en la tarjeta es requerido
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <label for="cc-number">Numero de tarjeta</label>
            <input type="text" class="form-control" id="cc-number" placeholder="" required>
            <div class="invalid-feedback">
                El numero de tarjeta es requerido
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 mb-3">
            <label for="cc-expiration">Fecha de vencimiento</label>
            <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
            <div class="invalid-feedback">
              La fecha de vencimiento es requerido
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="cc-cvv">CVV</label>
            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
            <div class="invalid-feedback">
              El código de seguridad es requerido
            </div>
          </div>
        </div>
        <hr class="mb-4">
        <button class="btn btn-primary btn-lg btn-block" type="submit">Realizar pedido</button>
      </form>
    </div>
  </div>

</div>
<footer class>
    <div class="container pie-de-pagina">
        <table class="table">
            <thead>
                <tr>
                    <td scope="col"><a href="../index.jsp" class="links-deactivated">Inicio</a></th>
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
</body>
    <script src="../assets/js/pedidos.js"></script>   
    <script type="text/javascript" src="../assets/js/js_paginas/bebidas.js"></script>
    <script type="text/javascript" src="../assets/js/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="../assets/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="../assets/js/script.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap.bundle.js"></script>
</html>