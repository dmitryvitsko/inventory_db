CREATE TABLE Employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Material (
    id SERIAL PRIMARY KEY, -- Автоинкрементный числовой ID
    name VARCHAR(100) NOT NULL,
    unit_of_measurement VARCHAR(50) NOT NULL,
    inventory_number VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT NOT NULL DEFAULT 0
);

CREATE TABLE "Transaction" (
    id SERIAL PRIMARY KEY, -- Автоинкрементный числовой ID
    employee_id INT NOT NULL REFERENCES Employee(id),
    material_id INT NOT NULL REFERENCES Material(id),
    action VARCHAR(20) NOT NULL CHECK (action IN ('took', 'spent')),
    quantity INT NOT NULL CHECK (quantity > 0),
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    address VARCHAR(255),
    phone_number VARCHAR(20),
    number_of_receipt VARCHAR(50)
);

CREATE TABLE Employee_Material_Balance (
    id SERIAL PRIMARY KEY, -- Автоинкрементный числовой ID
    employee_id INT NOT NULL REFERENCES Employee(id),
    material_id INT NOT NULL REFERENCES Material(id),
    balance_quantity INT NOT NULL DEFAULT 0 CHECK (balance_quantity >= 0)
);
