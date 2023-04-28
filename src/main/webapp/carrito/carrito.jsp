<%-- 
    Document   : carrito
    Created on : Sep 2, 2022, 2:46:35 PM
    Author     : W10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
  <title>Forno Bistro</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="../assets/css/hoja-estilo-carrito.css" />
  <script src="../assets/js/fonticon.js" def></script>
</head>

<body>
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-2">
                    <a href="./login/login.jsp">
                        <i class="fa-solid fa-bars fa-2x settings"></i>
                    </a>
                </div>
                <div class="col-lg-8 col-md-8 col-8">
                    <a href="${pageContext.request.contextPath}/index.jsp">
                        <img src="../assets/images/logo/imagenes_logos/logo_fondos_oscuros.png" class="logo imag-fluid" />
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

    <jsp:include page="../WEB-INF/paginas/comunes/cabecera.jsp"/>

  <main>
    <section class="pt-5 pb-5">
      <div class="container">
        <div class="row w-100">
          <div class="col-lg-12 col-md-12 col-12">
            <h3 class="display-5 mb-2 text-center pt-3 pb-3"> <i class="fa-solid fa-cart-shopping"></i> Carrito de
              compras</h3>
            <p class="mb-5 text-center">
              <i class="text-info font-weight-bold"></i> Items a comprar:
            </p>
            <table id="shoppingCart" class="table table-condensed table-responsive">
              <thead>
                <tr>
                  <th style="width: 60%">Productos</th>
                  <th style="width: 12%">Precio</th>
                  <th style="width: 10%">Cantidad</th>
                  <th style="width: 16%"></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td data-th="Product">
                    <div class="row">
                      <div class="col-md-3 text-left">
                        <img src="../assets/images/bebidas/coca_cola.png" alt=""
                          class="img-fluid d-none d-md-block rounded mb-2 shadow" />
                      </div>
                      <div class="col-md-9 text-left mt-sm-2">
                        <h4>Coca-Cola</h4>
                        <p class="font-weight-light">Bebida</p>
                      </div>
                    </div>
                  </td>
                  <td data-th="Price">Q.5.99</td>
                  <td data-th="Quantity">
                    <input type="number" class="form-control form-control-lg text-center" value="1" />
                  </td>
                  <td class="actions" data-th="">
                    <div class="text-right">
                      <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                        <i class="fas fa-sync"></i>
                      </button>
                      <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                        <i class="fas fa-trash"></i>
                      </button>
                    </div>
                  </td>
                </tr>

                <tr>
                  <td data-th="Product">
                    <div class="row">
                      <div class="col-md-3 text-left">
                        <img src="../assets/images/bebidas/capuchino.png" alt=""
                          class="img-fluid d-none d-md-block rounded mb-2 shadow" />
                      </div>
                      <div class="col-md-9 text-left mt-sm-2">
                        <h4>Capuchinno</h4>
                        <p class="font-weight-light">Bebida</p>
                      </div>
                    </div>
                  </td>
                  <td data-th="Price">Q.19.99</td>
                  <td data-th="Quantity">
                    <input type="number" class="form-control form-control-lg text-center" value="1" />
                  </td> 
                  <td class="actions" data-th="">
                    <div class="text-right">
                      <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                        <i class="fas fa-sync"></i>
                      </button>
                      <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                        <i class="fas fa-trash"></i>
                      </button>
                    </div>
                  </td>
                </tr>

                <tr>
                    <td data-th="Product">
                      <div class="row">
                        <div class="col-md-3 text-left">
                          <img src="../assets/images/platillos/CALZONE FINAL.png" alt=""
                            class="img-fluid d-none d-md-block rounded mb-2 shadow" />
                        </div>
                        <div class="col-md-9 text-left mt-sm-2">
                          <h4>Calzone</h4>
                          <p class="font-weight-light">Platillo</p>
                        </div>
                      </div>
                    </td>
                    <td data-th="Price">Q.30.00</td>
                    <td data-th="Quantity">
                      <input type="number" class="form-control form-control-lg text-center" value="1" />
                    </td> 
                    <td class="actions" data-th="">
                      <div class="text-right">
                        <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                          <i class="fas fa-sync"></i>
                        </button>
                        <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                          <i class="fas fa-trash"></i>
                        </button>
                      </div>
                    </td>
                  </tr>

              </tbody>
            </table>
            <div class="float-right text-right">
              <h4>Subtotal:</h4>
              <h1>Q.56.00</h1>
            </div>
          </div>
        </div>
        <div class="row mt-4 d-flex align-items-center">
          <div class="col-sm-6 order-md-2 text-right">
            <a href="../pedidosCliente/pedidos.jsp" class="btn btn-primary mb-4 btn-lg pl-5 pr-5">Finalizar Compra</a>
          </div>
          <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
            <a href="../index.html">
              <i class="fas fa-arrow-left mr-2"></i> Continuar Comprando</a>
          </div>
        </div>
      </div>
    </section>

    <footer>

      <div class="container pie-de-pagina">

        <table class="table">

          <thead>

            <tr>

              <td scope="col"><a href="../index.html" class="links-deactivated">Inicio</a></th>

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

  </main>

  <script type="text/javascript" src="../assets/js/jquery-3.6.0.js"></script>
  <script type="text/javascript" src="../assets/js/jquery.flexslider.js"></script>
  <script type="text/javascript" src="../assets/js/script.js"></script>
  <script type="text/javascript" src="../assets/js/bootstrap.bundle.js"></script>
</body>

</html>
