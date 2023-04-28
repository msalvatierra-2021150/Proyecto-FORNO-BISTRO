DROP DATABASE IF EXISTS bd_restaurante_in5bm_grupo5;
CREATE DATABASE IF NOT EXISTS bd_restaurante_in5bm_grupo5;
USE bd_restaurante_in5bm_grupo5;

/* Base de datos grupo 1 
	Integrantes:
		Michael Steven Salvatierra Ramirez 2021150
		Jose Mauricio Villeda Morales 2021075
		Octavio Alejandro Corzo Reyes 2021084
		Luis Fernando Archila Valdez 2021042
		Jose Pablo Fabian Herrera Garcia 2018183
    Catedratico: 
		Lic. Jorge Luis Perez Canto
    Grado:
		5to Perito en Informatica 
	Seccion: 
		IN5BM
	Grupo presencial: 2
*/

DROP TABLE IF EXISTS persona;
CREATE TABLE IF NOT EXISTS persona(
	id INT NOT NULL AUTO_INCREMENT,
    nombre1 VARCHAR(30) NOT NULL,
    nombre2 VARCHAR(30),
    nombre3 VARCHAR(30),
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30),
    telefono VARCHAR(8),
    direccion VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    codigo_postal VARCHAR(15) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    CONSTRAINT pk_persona
		PRIMARY KEY (id)
);

DROP TABLE IF EXISTS rol;
CREATE TABLE IF NOT EXISTS rol(
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_rol
		PRIMARY KEY (id)
);

DROP TABLE IF EXISTS usuario;
CREATE TABLE IF NOT EXISTS usuario(
    correo VARCHAR(40) NOT NULL,
    password BINARY(20) NOT NULL,
    rol_id INT NOT NULL,
    persona_id INT NOT NULL,
    CONSTRAINT pk_usuario
		PRIMARY KEY (correo),
	CONSTRAINT fk_rol_id
		FOREIGN KEY (rol_id) REFERENCES rol(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_persona_id
		FOREIGN KEY (persona_id) REFERENCES persona(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS sede;
CREATE TABLE IF NOT EXISTS sede(
	id INT NOT NULL AUTO_INCREMENT,
    nombre_agencia VARCHAR(50) NOT NULL,
    NIT VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    ruta_imagen VARCHAR(255),
    CONSTRAINT pk_sede
		PRIMARY KEY (id)
);

DROP TABLE IF EXISTS order_status;
CREATE TABLE IF NOT EXISTS order_status(
	id INT NOT NULL AUTO_INCREMENT,
    status VARCHAR(50) NOT NULL,
    CONSTRAINT pk_order_status
		PRIMARY KEY (id)
);

DROP TABLE IF EXISTS tarjeta;
CREATE TABLE IF NOT EXISTS tarjeta (
    numero_de_tarjeta VARCHAR(30) NOT NULL,
    nombre_en_tarjeta VARCHAR(50) NOT NULL,
    fecha_de_vencimiento DATE NOT NULL,
    tipo_de_tarjeta VARCHAR(50) NOT NULL,
    CONSTRAINT pk_tarjeta_de_credito PRIMARY KEY (numero_de_tarjeta)
);

DROP TABLE IF EXISTS postre;
CREATE TABLE IF NOT EXISTS postre(
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) ,
    precio FLOAT NOT NULL,
    descuento FLOAT NOT NULL,
    ruta_imagen VARCHAR(255),
    CONSTRAINT pk_postre
		PRIMARY KEY (id)
);

DROP TABLE IF EXISTS platillo;
CREATE TABLE IF NOT EXISTS platillo(
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(50) ,
    precio FLOAT NOT NULL,
    descuento FLOAT NOT NULL,
    ruta_imagen VARCHAR(255),
    CONSTRAINT pk_platillo
		PRIMARY KEY (id)
);

DROP TABLE IF EXISTS bebida;
CREATE TABLE IF NOT EXISTS bebida(
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) ,
    precio FLOAT NOT NULL,
    descuento FLOAT NOT NULL,
    ruta_imagen VARCHAR(255),
    CONSTRAINT pk_bebida
		PRIMARY KEY (id)
);


DROP TABLE IF EXISTS combo;
CREATE TABLE IF NOT EXISTS combo(
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    postre_id INT NOT NULL,
    platillo_id INT NOT NULL,
    bebida_id INT NOT NULL,
    descripcion VARCHAR(255),
    precio FLOAT NOT NULL,
    ruta_imagen VARCHAR(255),
    tiempo VARCHAR(255),
    CONSTRAINT pk_menu
		PRIMARY KEY (id),
	CONSTRAINT fk_postre_id
		FOREIGN KEY (postre_id) REFERENCES postre(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_platillo_id
		FOREIGN KEY (platillo_id) REFERENCES platillo(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_bebida_id
		FOREIGN KEY (bebida_id) REFERENCES bebida(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS pedidos;
CREATE TABLE IF NOT EXISTS pedidos(
	id INT NOT NULL AUTO_INCREMENT,
    tarjeta_id VARCHAR(30) NOT NULL,
    combo_id INT NOT NULL,
    usuario_id VARCHAR(40) NOT NULL,
    sede_id INT NOT NULL,
    order_status_id INT NOT NULL,
	comentario VARCHAR(1000),
    CONSTRAINT pk_pedidos
		PRIMARY KEY (id),
    CONSTRAINT fk_tarjeta
		FOREIGN KEY (tarjeta_id) REFERENCES tarjeta(numero_de_tarjeta)
        ON DELETE CASCADE ON UPDATE CASCADE,        
	CONSTRAINT fk_combo_id
		FOREIGN KEY (combo_id) REFERENCES combo(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_usuario_id
		FOREIGN KEY (usuario_id) REFERENCES usuario(correo)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_sede_id
		FOREIGN KEY (sede_id) REFERENCES sede(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_order_status_id 
		FOREIGN KEY (order_status_id) REFERENCES order_status(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ---------------------------------
-- Inserciones de la tabla persona
-- ---------------------------------

INSERT INTO persona(nombre1, apellido1, telefono, direccion, ciudad, codigo_postal, estado, pais)
VALUES("Luis", "Archila", "31355235", "Zona 4, 23-41", "Cd. de Guatemala", "01057", "Mixco", "Guatemala");

INSERT INTO persona(nombre1, nombre2, apellido1, apellido2, telefono, direccion, ciudad, codigo_postal, estado, pais)
VALUES("Octavio", "Alejandro", "Corzo", "Reyes", "33990101","Zona 11, 25-31", "Cd. de Guatemala", "01011", "Guatemala", "Guatemala");

INSERT INTO persona(nombre1, apellido1, telefono, direccion, ciudad, codigo_postal, estado, pais)
VALUES("Jose", "Fernández", "59219031","Zona 12, 40-23", "Cd. de Guatemala", "01052", "San José Pinula", "Guatemala");

INSERT INTO persona(nombre1, apellido1, telefono, direccion, ciudad, codigo_postal, estado, pais)
VALUES("Heydy", "García", "59867812","Zona 6, 22-23", "Cd. de Guatemala", "01057", "Mixco", "Guatemala");

INSERT INTO persona(nombre1, nombre2, nombre3, apellido1, apellido2, telefono, direccion, ciudad, codigo_postal, estado, pais)
VALUES("Mario", "Roberto", "Alejandro", "Pérez", "García", "43050089", "Zona 12, 10-01", "Cd. de Guatemala", "01064:", "Villa Nueva", "Guatemala");

INSERT INTO persona(nombre1, nombre2, nombre3, apellido1, apellido2, telefono, direccion, ciudad, codigo_postal, estado, pais)
VALUES("Gabriel", "Ernesto", "Carlos", "Valdez", "Aguilar", "22150787", "Zona 9, 0-53", "Cd. de Guatemala", "01064:", "La Florida", "Guatemala");

INSERT INTO persona(nombre1, nombre2, apellido1, apellido2, telefono, direccion, ciudad, codigo_postal, estado, pais)
VALUES("Sergio", "Juan", "Perez", "Ordoñez", "45879871","Zona 4, 22-15", "Cd. de Guatemala", "61980", "San lucas", "Guatemala");

INSERT INTO persona(nombre1, apellido1, telefono, direccion, ciudad, codigo_postal, estado, pais)
VALUES("Fernando", "Castillo", "36718974", "Zona 10, 10-11", "Aldea Cerro Alto", "01059", "San Juan Sac.", "Guatemala");

INSERT INTO persona(nombre1, apellido1, telefono, direccion, ciudad, codigo_postal, estado, pais)
VALUES("Pedro", "Rodriguez", "35912215","Zona 7, 25-20", "Cd. de Guatemala", "01057", "Mixco", "Guatemala");

INSERT INTO persona(nombre1, nombre2, nombre3, apellido1, apellido2, telefono, direccion, ciudad, codigo_postal, estado, pais)
VALUES("Emilio", "Mario", "Fernando", "Vasquez", "Fernandez", "22164587", "Zona 1, 12-13", "San Lucas Sacatepequez", "03003:", "Sacatepequez", "Guatemala");

-- -------------------------------
-- Inserciones rol
-- --------------------------------
INSERT INTO rol(nombre)
VALUES("Administrador");

INSERT INTO rol(nombre)
VALUES("Clientes");

-- --------------------------------
-- Inserciones de usuario
-- --------------------------------
INSERT INTO usuario(correo, password, rol_id, persona_id)
VALUES("luisarchila@fornobistro.gt.com", 12345, 1, 1);

INSERT INTO usuario(correo, password, rol_id, persona_id)
VALUES("octavicorzo@fornobistro.gt.com", 12345, 2, 2);

INSERT INTO usuario(correo, password, rol_id, persona_id)
VALUES("josefernandez@fornobistro.gt.com", 12345, 1, 3);

INSERT INTO usuario(correo, password, rol_id, persona_id)
VALUES("heydygarcia@fornobistro.gt.com", 12345, 2, 4);

INSERT INTO usuario(correo, password, rol_id, persona_id)
VALUES("marioroberto@fornobistro.gt.com", 12345, 2, 5);

INSERT INTO usuario(correo, password, rol_id, persona_id)
VALUES("gabrielvaldez@fornobistro.gt.com", 12345, 1, 6);

INSERT INTO usuario(correo, password, rol_id, persona_id)
VALUES("sergioperez@fornobistro.gt.com", 12345, 2, 7);

INSERT INTO usuario(correo, password, rol_id, persona_id)
VALUES("fernandocastillo@fornobistro.gt.com", 12345, 1, 8);

INSERT INTO usuario(correo, password, rol_id, persona_id)
VALUES("pedrorodriguez@fornobistro.gt.com", 12345, 2, 9);

INSERT INTO usuario(correo, password, rol_id, persona_id)
VALUES("emiliovasquez@fornobistro.gt.com", 12345, 1, 10);

-- -------------------------
-- Inserciones de sede
-- -------------------------
INSERT INTO sede(nombre_agencia, NIT, direccion)
VALUES("Forno Bistro, CAYALA", "26031-0101", "22 calle 9-33 zona 16, Paseo Cayalá");

INSERT INTO sede(nombre_agencia, NIT, direccion)
VALUES("Forno Bistro, Antigua Guatemala", "47090-0101", "6a Calle Poniente 7, Antigua Guatemala");

INSERT INTO sede(nombre_agencia, NIT, direccion)
VALUES("Forno Bistro, Zona-10", "87034-0101", "8a Calle 3-14, Cdad. de Guatemala");

INSERT INTO sede(nombre_agencia, NIT, direccion)
VALUES("Forno Bistro, Zona-14", "48091-0101", "10 Avenida 5-49, Cdad. de Guatemala");

INSERT INTO sede(nombre_agencia, NIT, direccion)
VALUES("Forno Bistro, Zona-9", "90012-0101", "4A Avenida 9-78, Cdad. de Guatemala");

INSERT INTO sede(nombre_agencia, NIT, direccion)
VALUES("Forno Bistro, Florida", "26257-7185", "Calzada San Juan 1-83 zona 7, Mixco, Guatemala");

INSERT INTO sede(nombre_agencia, NIT, direccion)
VALUES("Forno Bistro, Naranjo", "50277-2711", "23 calle 10-00, Condado Naranjo, Guatemala");

INSERT INTO sede(nombre_agencia, NIT, direccion)
VALUES("Forno Bistro, Miraflores", "200928-0901", "21 avenida 4-32, zona 11, Cdad. de Guatemala");

INSERT INTO sede(nombre_agencia, NIT, direccion)
VALUES("Forno Bistro, Fontabella", "200554-2215", "4A Avenida 12-59, zona 10, Cdad. de Guatemala");

INSERT INTO sede(nombre_agencia, NIT, direccion)
VALUES("Forno Bistro, Petapa", "15988-3659", "Avenida Petapa 42-36, zona 12, Cdad. de Guatemala");

-- ---------------------------
-- Inserciones de order status
-- ---------------------------
INSERT INTO order_status(status)
VALUES("En camino");

INSERT INTO order_status(status)
VALUES("Entregado");

INSERT INTO order_status(status)
VALUES("Preparando");

-- -----------------------
-- Inserciones en tarjeta
-- -----------------------
INSERT INTO tarjeta(numero_de_tarjeta, nombre_en_tarjeta, fecha_de_vencimiento, tipo_de_tarjeta)
VALUES("4385822056110982", "MasterCard", "11/09/23", "Crédito");

INSERT INTO tarjeta(numero_de_tarjeta, nombre_en_tarjeta, fecha_de_vencimiento, tipo_de_tarjeta)
VALUES("1245642676220821", "Visa", "20/10/25", "Débito");

INSERT INTO tarjeta(numero_de_tarjeta, nombre_en_tarjeta, fecha_de_vencimiento, tipo_de_tarjeta)
VALUES("3234566078240123", "MasterCard", "11/07/23", "Débito");

INSERT INTO tarjeta(numero_de_tarjeta, nombre_en_tarjeta, fecha_de_vencimiento, tipo_de_tarjeta)
VALUES("5435677056134333", "Visa", "21/11/24", "Crédito");

INSERT INTO tarjeta(numero_de_tarjeta, nombre_en_tarjeta, fecha_de_vencimiento, tipo_de_tarjeta)
VALUES("4589175466134678", "Visa", "10/05/23", "Débito");

INSERT INTO tarjeta(numero_de_tarjeta, nombre_en_tarjeta, fecha_de_vencimiento, tipo_de_tarjeta)
VALUES("346859996814820", "American Express", "01/05/24", "Crédito");

INSERT INTO tarjeta(numero_de_tarjeta, nombre_en_tarjeta, fecha_de_vencimiento, tipo_de_tarjeta)
VALUES("4269370868393062", "Visa", "01/10/23", "Crédito");

INSERT INTO tarjeta(numero_de_tarjeta, nombre_en_tarjeta, fecha_de_vencimiento, tipo_de_tarjeta)
VALUES("5461508168852849", "Mastercard", "11/11/25", "Crédito");

INSERT INTO tarjeta(numero_de_tarjeta, nombre_en_tarjeta, fecha_de_vencimiento, tipo_de_tarjeta)
VALUES("6011766059532127", "Discover", "15/08/23", "Crédito");

INSERT INTO tarjeta(numero_de_tarjeta, nombre_en_tarjeta, fecha_de_vencimiento, tipo_de_tarjeta)
VALUES("375096974512357", "American Express", "05/06/24", "Crédito");



-- ----------------------
-- Inserciones de postre
-- ----------------------
INSERT INTO postre(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Pie de queso", "Este pie de queso tradicional tiene una consistencia cremosa pero ligera al mismo tiempo. Un postre ideal para tus comidas o fiestas.", "20.99", "0.25", "/pie_de_queso.png");

INSERT INTO postre(nombre,descripcion ,precio, descuento, ruta_imagen)
VALUES("Pie de Manzana", "El pie de manzana es un postre que se puede degustar frío o caliente y consiste en una masa suave o crujiente rellena de manzanas","20.50", "0.00", "/pie_de_manzana.png");

INSERT INTO postre(nombre,descripcion ,precio, descuento, ruta_imagen)
VALUES("Helado de chocolate", "Helados de chocolate negro. El intenso sabor que caracteriza a estos helados, no puede compararse con nada que hayas probado.","15.00", "0.45", "/helado_de_chocolate.png");

INSERT INTO postre(nombre, descripcion,precio, descuento, ruta_imagen)
VALUES("Helado de fresa","El helado de fresa artesano es de los helados más deliciosos que pueden existir.", "15.00", "0.45", "/helado_de_fresa.jpg");

INSERT INTO postre(nombre,descripcion ,precio, descuento, ruta_imagen)
VALUES("Banana split", "Disfrute de unas deliciosas bolas de elado acompañanda de una banana recien cosechada.","25.00", "0.00", "/banana_split.png");

INSERT INTO postre(nombre,descripcion, precio, descuento, ruta_imagen)
VALUES("Crepa con Nutella", "Tortita fina de pasta dulce o salada, flexible y ligera, que se cuece en un sartén.","30.00", "0.10", "/Crepa.png");

INSERT INTO postre(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Pie de queso", "Este pie de queso tradicional tiene una consistencia cremosa pero ligera al mismo tiempo. Un postre ideal para tus comidas o fiestas.", "20.99", "0.25", "/pie_de_queso.png");

INSERT INTO postre(nombre, descripcion,precio, descuento, ruta_imagen)
VALUES("Croissant Simple", "Pocos son capaces de resistirse a su crujiente textura, su particular sabor entre dulce y salado y el potente aroma de la mantequilla.","8.50", "0.17", "/croissant.png");

INSERT INTO postre(nombre, descripcion,precio, descuento, ruta_imagen)
VALUES("Cañoncito de Nutella","Pasta de hojaldre crujiente y semidulce enrollada y rellena con abundante Nutella.","16.50", "0.19", "/canon_de nutella.png");

INSERT INTO postre(nombre, descripcion ,precio, descuento, ruta_imagen)
VALUES("Cinnamon Roll", "Un sabor inigualable de roles de canela con pasas para disfrutar durante la merienda." , "7.50", "0.17", "/Cinnamon.png");

-- ------------------------
-- Inserciones en plantillo
-- ------------------------
INSERT INTO platillo(nombre, precio, descripcion, descuento,ruta_imagen)
VALUES("Carpaccio Il Jamone", "95.00","Delicioso Carpaccio", "0.17","/carpaccio-final.png");

INSERT INTO platillo(nombre, precio, descripcion, descuento,ruta_imagen)
VALUES("Calzone italianizimo", "30.00","Delicioso Calzone", "0.40","/calzone_final.png");

INSERT INTO platillo(nombre, precio, descripcion, descuento,ruta_imagen)
VALUES("Insalata Capresse", "65.00","Deliciosa Ensalada", "0.00","/insalata_final.png");

INSERT INTO platillo(nombre, precio, descripcion, descuento,ruta_imagen)
VALUES("Minestrone", "60.00","Delicioso Minestrone", "0.00","/mines_final.png");

INSERT INTO platillo(nombre, precio, descripcion, descuento,ruta_imagen)
VALUES("Lasaña dalla casa", "75.00","Deliciosa lasana", "0.25","/lasana_final.png");

INSERT INTO platillo(nombre, precio, descripcion, descuento,ruta_imagen)
VALUES("Mostaccioli", "75.00","Delicioso Mostaccioli", "0.41","/mosta-final.png");

INSERT INTO platillo(nombre, precio, descripcion, descuento,ruta_imagen)
VALUES("Pasta a la carbonara", "75.00","Deliciosa Pasta a la carbonara", "0.00","/pasta-final.png");

INSERT INTO platillo(nombre, precio, descripcion, descuento,ruta_imagen)
VALUES("Ravioles in Rossa", "80.00","Deliciosos Ravioles", "0.28","/ravioles-final.png");

INSERT INTO platillo(nombre, precio, descripcion, descuento,ruta_imagen)
VALUES("Pizza Margherita", "125.00","Delicioso Pizza", "0.00","/pizza-final.png");

INSERT INTO platillo(nombre, precio, descripcion, descuento,ruta_imagen)
VALUES("Rissoto Stracceti", "80.00","Delicioso Risotto", "0.00","/risoto-final.png");

INSERT INTO platillo(nombre, precio, descripcion, descuento,ruta_imagen)
VALUES("Omelette", "30.00","Delicioso Omelette", "0.00","/omelete.png");

-- -------------------------
-- Inserciones en bebida
-- -------------------------
-- -------------------------
-- Inserciones en bebida
-- -------------------------
INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Coca-Cola", "Disfrute de una refrescante gaseosa Coca-Cola de 1.25 litros. A tan solo 5.99.","5.99", 0.00, "/coca_cola_larga.png");

INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Té frío", "Disfrute de una refrescante té frío a un precio de tan solo 9.99 Quetzales.", "9.99", 0.00, "/te_alargado.png");

INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Vino tinto SOLEA", "Disfrute de un refinado vino tinto de la mejor calidad a un precio de 139.99 Quetzales.", "139.99", 0.35, "/vino_tinto_alargado.png");

INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Vino blanco HIGHLAND MANOR", "Disfrute de un refinado vino blanco de la mejor calidad a un precio de 139.99 Quetzales.", "139.99", 0.23, "/vino_blanco_alargado.png");

INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Limonada", "Disfrute de una refrescante limonada a un precio de tan solo 12.99 Quetzales.", "12.99", 0.12, "/limonada_alargada.png");

INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Jugo de naranja", "Disfrute de un delicioso jugo de naranja de la mejor calidad a tan solo 11.99 Quetzales.", "11.99", 0.00, "/jugo_naranja_alargado.png");

INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Cafe Negro", "Café hecho con los mejores granos de nuestra cosecha, caliente y listo para que lo tomes. A tan solo 12.99.", "12.99", 0.00, "/pruebaCafeNegro1.png");

INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Capuchinno", "Disfrute de una deliciosa taza de capuccino a tan solo 19.99 quetzales.","19.99", 0.00, "/capuchino_alargado.png");

INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Horchata", "Disfrute de una deliciosa y refrescante horchata a un precio de tan solo 12.99 Quetzales.", "12.99", 0.15, "/horchata_alargada.png");

INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Malteada de Fresa", "Disfrute de una deliciosa malteada de chocolate a un precio de tan solo 19.99 Quetzales.", "19.99", 0.00, "/malteada_fresa_alargada.png");

INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Malteada de Chocolate", "Disfrute de una deliciosa malteada de chocolate a un precio de tan solo 19.99 Quetzales.", "19.99", 0.00, "/malteada_chocolate_alargada.png");

INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Sprite", "Disfrute de una refrescante gaseosa en lata Sprite, a un precio de tan solo 5.99 Quetzales.", "5.99", 0.00, "/sprite_alargada.png");

INSERT INTO bebida(nombre, descripcion, precio, descuento, ruta_imagen)
VALUES("Fanta", "Disfrute de una refrescante gaseosa en lata fanta, a un precio de tan solo 5.99 Quetzales.","5.99", 0.00, "/fanta_alargada.png");


-- ---------------------------
-- Inserciones en combo
-- ---------------------------
INSERT INTO combo(nombre, postre_id, platillo_id, bebida_id, descripcion, precio, ruta_imagen,tiempo)
VALUES("Combo desayuno 1", 1, 11, 2,"Combo fenomenal si comienzas el dia. Este combo Incluye lo siguiente: " , "30.00", "/prueba-desayuno.png","DESAYUNO");

INSERT INTO combo(nombre, postre_id, platillo_id, bebida_id, descripcion, precio,tiempo,  ruta_imagen)
VALUES("Combo almuerzo 1", 2, 2, 1, "Un combo ideal para aquellos que disfruten a lo italian. Incluye Pie de Manzana, Calzone Italianisimo y una Clasica Coca-Cola.", "50.00","ALMUERZO","/menu_almuerzo_1_alargado.png");

INSERT INTO combo(nombre, postre_id, platillo_id, bebida_id, descripcion, precio, tiempo, ruta_imagen)
VALUES("Combo fit", 3, 3, 2, "Combo fenomenal si guardas la linea. Incluye un Helado,una Ensalada y un Te frio.", "47.00", "CENA", "/combo_fit_alargado.png");

INSERT INTO combo(nombre, postre_id, platillo_id, bebida_id, descripcion, precio, tiempo, ruta_imagen)
VALUES("Combo casual", 4, 4, 5, "Un combo que incluye un Helado un delicioso Minestrone y una Limonada.", "50.00", "CENA", "/combo_casual_cena.png");

INSERT INTO combo(nombre, postre_id, platillo_id, bebida_id, descripcion, precio, tiempo,  ruta_imagen)
VALUES("Combo pasta 1", 5, 5, 2, "Un combo clasico para los amantes de la pasta. Incluye una Banana Split, una deliciosa Lasana dalla Casa, y un Te frio", "45.00", "ALMUERZO", "/menu_pasta_alargado.png");

INSERT INTO combo(nombre, postre_id, platillo_id, bebida_id, descripcion, precio, tiempo, ruta_imagen)
VALUES("Combo Frutti", 9, 10, 8, "Incluye un Cañoncito de Nutella, Rissoto Stracceti y un Capuchinno.","300.00","CENA", "/combo_frutti_alargado.png");

INSERT INTO combo(nombre, postre_id, platillo_id, bebida_id, descripcion, precio, ruta_imagen,tiempo)
VALUES("Combo xibal zuppe", 7, 8, 6, "Combo fenomenal si para los amantes de la comida italiana este combo Incluye lo siguiente: " ,"85.00", "/zupe-prueba.png","DESAYUNO");

INSERT INTO combo(nombre, postre_id, platillo_id, bebida_id, descripcion, precio, ruta_imagen,tiempo)
VALUES("Combo parmigiana", 6, 6, 7, "Un combo para relajarse de mañana, Este combo incluye lo siguiente: " ,"85.00", "/prueba-parm.png","DESAYUNO");

INSERT INTO combo(nombre, postre_id, platillo_id, bebida_id, descripcion, precio, tiempo, ruta_imagen)
VALUES("Combo Cacciatora", 10, 7, 10, "Combo perfecto para unos bonitos recuerdos. Inclute Cinnamon Rolls, Exquisita Pasta a la Carbonara y una Malteada De Fresa.","169.00","ALMUERZO","/menu_cacciatora_alargado.png");

INSERT INTO combo(nombre, postre_id, platillo_id, bebida_id, descripcion, precio, tiempo, ruta_imagen)
VALUES("Combo pizza", 8, 9, 9, "Un combo para quedar saciados. Incluye un Croissant simple, una deleitosa Pizza Margherita y una Horchata","150.00","ALMUERZO","/menu_pizza_alargado.png");
-- ------------------------
-- Inserciones pedidos
-- -------------------------
INSERT INTO pedidos(tarjeta_id, combo_id, usuario_id, sede_id, order_status_id)
VALUES("1245642676220821", 1, 'heydygarcia@fornobistro.gt.com', 1, 1);

INSERT INTO pedidos(tarjeta_id, combo_id, usuario_id, sede_id, order_status_id)
VALUES("4385822056110982", 2, 'josefernandez@fornobistro.gt.com', 2, 2);

INSERT INTO pedidos(tarjeta_id, combo_id, usuario_id, sede_id, order_status_id)
VALUES("3234566078240123", 3, 'luisarchila@fornobistro.gt.com', 3, 3);

INSERT INTO pedidos(tarjeta_id, combo_id, usuario_id, sede_id, order_status_id)
VALUES("4589175466134678", 2, 'marioroberto@fornobistro.gt.com', 3, 3);

INSERT INTO pedidos(tarjeta_id, combo_id, usuario_id, sede_id, order_status_id)
VALUES("5435677056134333", 2, 'octavicorzo@fornobistro.gt.com', 2, 2);

INSERT INTO pedidos(tarjeta_id, combo_id, usuario_id, sede_id, order_status_id)
VALUES("346859996814820", 6, 'gabrielvaldez@fornobistro.gt.com', 6, 2);

INSERT INTO pedidos(tarjeta_id, combo_id, usuario_id, sede_id, order_status_id)
VALUES("4269370868393062", 7, 'sergioperez@fornobistro.gt.com', 7, 1);

INSERT INTO pedidos(tarjeta_id, combo_id, usuario_id, sede_id, order_status_id)
VALUES("5461508168852849", 8, 'fernandocastillo@fornobistro.gt.com', 8, 2);

INSERT INTO pedidos(tarjeta_id, combo_id, usuario_id, sede_id, order_status_id)
VALUES("6011766059532127", 9, 'pedrorodriguez@fornobistro.gt.com', 9, 3);

INSERT INTO pedidos(tarjeta_id, combo_id, usuario_id, sede_id, order_status_id)
VALUES("375096974512357", 10, 'emiliovasquez@fornobistro.gt.com', 10, 1);

/*SELECT PARA PLATILLOS, POSTRES Y BEBIDAS */
SELECT id, nombre, descripcion,precio,  descuento, ROUND(precio -(precio* descuento),2) AS precio_con_descuento , ruta_imagen FROM bebida;

/*SELECT PARA MOSTRAR LOS COMBOS SU NOMBRE Y SU TIEMPO PARA SE SERVIDOS*/
SELECT combo.id, combo.nombre, po.id, po.nombre, pla.id, pla.nombre, b.id, b.nombre, combo.descripcion, combo.precio, combo.ruta_imagen,combo.tiempo FROM combo 
JOIN postre AS po ON combo.postre_id = po.id 
JOIN platillo AS pla ON combo.platillo_id= pla.id 
JOIN bebida AS b ON combo.bebida_id=b.id AND tiempo="DESAYUNO";

/*SELECT PARA MOSTRAR LOS COMBOS SU NOMBRE Y SU TIEMPO PARA SE SERVIDOS*/
SELECT combo.id, combo.nombre, po.id, po.nombre, pla.id, pla.nombre, b.id, b.nombre, combo.descripcion, combo.precio, combo.ruta_imagen,combo.tiempo FROM combo 
JOIN postre AS po ON combo.postre_id = po.id 
JOIN platillo AS pla ON combo.platillo_id= pla.id 
JOIN bebida AS b ON combo.bebida_id=b.id AND tiempo="ALMUERZO";

/*SELECT PARA MOSTRAR LOS COMBOS SU NOMBRE Y SU TIEMPO PARA SE SERVIDOS*/
SELECT combo.id, combo.nombre, po.id, po.nombre, pla.id, pla.nombre, b.id, b.nombre, combo.descripcion, combo.precio, combo.ruta_imagen,combo.tiempo FROM combo 
JOIN postre AS po ON combo.postre_id = po.id 
JOIN platillo AS pla ON combo.platillo_id= pla.id 
JOIN bebida AS b ON combo.bebida_id=b.id AND tiempo="CENA";

/*SELECT PARA VER Usuario*/
SELECT us.correo, us.password, us.rol_id, r.nombre AS rol, us.persona_id, CONCAT(p.nombre1," ", p.apellido1) AS nombrePersona
FROM usuario AS us 
JOIN rol AS r ON us.rol_id=r.id
JOIN persona AS p ON us.persona_id= p.id;
