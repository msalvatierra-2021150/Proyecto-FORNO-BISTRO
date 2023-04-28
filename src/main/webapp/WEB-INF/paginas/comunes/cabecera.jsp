    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <!--<img src="${pageContext.request.contextPath}/logo_transparente_fondos_claros.png"
                class="logo_nav">-->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item padding-items-navbar">
                        <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Menú
                        </a>
                        <ul class="dropdown-menu menu" aria-labelledby="navbarScrollingDropdown">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletDesayuno?accion=listar">Desayunos</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletAlmuerzo?accion=listar">Almuerzos</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletCena?accion=listar">Cenas</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletPostre?accion=listar">Postres</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletBebida?accion=listar">Bebidas</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletPlatillo?accion=listar">Platillos</a></li>
                        </ul>
                    </li>
                    <li class="nav-item padding-items-navbar">
                        <a class="nav-link" href="${pageContext.request.contextPath}/acercaDe.jsp">Acerca de Nosotros</a>
                    </li>
                    <li class="nav-item padding-items-navbar">
                        <a class="nav-link" href="${pageContext.request.contextPath}/ServletSede?accion=listar">Sedes</a>
                    </li>
                    <li class="nav-item padding-items-navbar">
                        <a class="nav-link " href="#">Contáctanos</a>
                    </li>
                                        <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Menú
                        </a>
                        <ul class="dropdown-menu menu" aria-labelledby="navbarScrollingDropdown">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletPersona?accion=listar">Persona</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletUsuario?accion=listar">Usuarios</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletRol?accion=listar">Roles</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletOrderStatus?accion=listar">Status de la Orden</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletTarjeta?accion=listar">Tarjetas</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ServletPedidos?accion=listar">Pedidos</a></li>
                        </ul>
                    </li>

      
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Buscar..." aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Buscar</button>
                </form>
            </div>
        </div>
    </nav>
