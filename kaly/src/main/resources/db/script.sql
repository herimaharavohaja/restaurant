CREATE TABLE IF NOT EXISTS ingredient (
  idingredient SERIAL PRIMARY KEY,
  stock_ingredient_idstockingredient INTEGER NOT NULL,
  unit_idunit INTEGER NOT NULL,
  Menu_idMenu INTEGER NOT NULL,
  name_ingredient VARCHAR,
  FOREIGN KEY (Menu_idMenu) REFERENCES Menu(idMenu),
  FOREIGN KEY (unit_idunit) REFERENCES unit(idunit),
  FOREIGN KEY (stock_ingredient_idstockingredient) REFERENCES stock_ingredient(idstockingredient)
);

CREATE TABLE IF NOT EXISTS Menu (
  idMenu SERIAL PRIMARY KEY,
  name_product VARCHAR
);

CREATE TABLE IF NOT EXISTS price (
  idprice SERIAL PRIMARY KEY,
  ingredient_idingredient INTEGER NOT NULL,
  ingredient_price NUMERIC NOT NULL,
  menu_price NUMERIC NOT NULL,
  date_price TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  FOREIGN KEY (ingredient_idingredient) REFERENCES ingredient(idingredient)
);

CREATE TABLE IF NOT EXISTS restaurant (
  idrestaurant SERIAL PRIMARY KEY,
  Localisation VARCHAR
);

CREATE TABLE IF NOT EXISTS restaurant_has_Menu (
  restaurant_idrestaurant INTEGER NOT NULL,
  Menu_idMenu INTEGER NOT NULL,
  PRIMARY KEY(restaurant_idrestaurant, Menu_idMenu),
  FOREIGN KEY (restaurant_idrestaurant) REFERENCES restaurant(idrestaurant),
  FOREIGN KEY (Menu_idMenu) REFERENCES Menu(idMenu)
);

CREATE TABLE IF NOT EXISTS stock_ingredient (
  idstockingredient SERIAL PRIMARY KEY,
  stock_ingredien FLOAT,
  date_stock_ingredient TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  System_ingredient VARCHAR
);

CREATE TABLE IF NOT EXISTS unit (
  idunit SERIAL PRIMARY KEY,
  name VARCHAR
);
