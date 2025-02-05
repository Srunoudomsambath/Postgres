CREATE TABLE Customers(
    id INT PRIMARY KEY ,
    firstName varchar(50),
    lastName varchar(50),
    date_of_birth DATE,
    postcode CHAR(4)
);

CREATE TABLE Store(
    id SERIAL8 PRIMARY KEY ,
    address varchar(50),
    postcode CHAR(4)
);


CREATE TABLE Checkout(
    store INT PRIMARY KEY ,
    store_id SERIAL4 REFERENCES Store (id),
    id INT
);


CREATE TABLE PurchaseItem(
    id SERIAL2 PRIMARY KEY ,
    purchase bigint,
    product INT,
    quantity SMALLINT
);

CREATE TABLE PaymentMethod(
    id char PRIMARY KEY ,
    name varchar(50)
);

CREATE TABLE Purchase(
    user_id INT4 PRIMARY KEY REFERENCES Customers (id),
    id bigint REFERENCES PurchaseItem(id),
    checkout_store INT REFERENCES Checkout(store),
    time TIMESTAMP,
    payMethod CHAR,
    customer char REFERENCES PaymentMethod(id)
);

CREATE TABLE ProductCategory(
    id char PRIMARY KEY ,
    name varchar(50)
);

CREATE TABLE Product(
    id INT,
    product_category_id char REFERENCES ProductCategory(id),
    Purchase_item_id SERIAL2 REFERENCES PurchaseItem(id),
    name varchar(50),
    category char,
    price DECIMAL(5,2),
    tax DECIMAL(5,2)
);


