CREATE TABLE IF NOT EXISTS customers (
	phone_n VARCHAR(64) PRIMARY KEY,
	name VARCHAR(128)
);

CREATE TABLE IF NOT EXISTS cars (
    serial_n INT PRIMARY KEY,
    manufacturer VARCHAR(128),
    model VARCHAR(128),
    weight NUMERIC(8,2),
    price NUMERIC(10,2)
);

CREATE TABLE IF NOT EXISTS salespersons (
    id INT PRIMARY KEY,
    name VARCHAR(128)
);

CREATE TABLE IF NOT EXISTS transactions (
    transaction_n INT PRIMARY KEY,
    salesperson_id INT REFERENCES salespersons(id),
    car_serial_n INT REFERENCES cars(serial_n),
    timestamp TIMESTAMP,
    cust_phone_n VARCHAR(64) REFERENCES customers(phone_n)
);