DROP DATABASE IF EXISTS dealership;
CREATE DATABASE IF NOT EXISTS dealership;
USE dealership;

CREATE TABLE dealerships(
dealership_id INT AUTO_INCREMENT PRIMARY KEY,
dealership_name VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
phone VARCHAR(12) NOT NULL
);

INSERT INTO dealerships(dealership_name, address, phone) VALUES
('Fast Lane Motors', '123 Main St, NY', '212-555-1234'),
('Budget Auto Sales', '456 Elm St, NY', '212-555-5678'),
('Luxury Rides NYC', '789 Park Ave, NY', '212-555-9876');

CREATE TABLE vehicles(
VIN VARCHAR(17) PRIMARY KEY,
vehicle_year INT NOT NULL,
make VARCHAR(20) NOT NULL,
model VARCHAR(20) NOT NULL,
vehicle_type VARCHAR(20) NOT NULL,
color VARCHAR(10) NOT NULL,
odometer INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
SOLD VARCHAR(3) NOT NULL
); 

INSERT INTO vehicles (VIN, make, model, vehicle_type, color, vehicle_year, odometer, price, SOLD) VALUES
('1HGCM82633A004352', 'Honda', 'Accord', 'Sedan', 'Black', 2022, 15000, 22000.00, 'NO'),
('1N4AL11D75C109151', 'Nissan', 'Altima', 'Sedan', 'White', 2021, 22000, 18000.00, 'NO'),
('2C3KA53G66H123456', 'Chrysler', '300', 'Sedan', 'Silver', 2020, 30000, 19500.00, 'YES'),
('3VWFE21C04M000001', 'Volkswagen', 'Jetta', 'Sedan', 'Blue', 2023, 8000, 25000.00, 'NO'),
('5FNYF4H97FB045678', 'Honda', 'Pilot', 'SUV', 'Gray', 2019, 45000, 27000.00, 'YES');


CREATE TABLE inventory(
dealership_id INT,
VIN VARCHAR(17),
FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
FOREIGN KEY (VIN) REFERENCES vehicles(VIN),
PRIMARY KEY (dealership_id, VIN)
);

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A004352'),
(1, '1N4AL11D75C109151'),
(2, '2C3KA53G66H123456'),
(2, '3VWFE21C04M000001'),
(3, '5FNYF4H97FB045678');


CREATE TABLE sales_contracts(
contract_id INT PRIMARY KEY AUTO_INCREMENT,
contract_date DATE NOT NULL,
customer_name VARCHAR(40) NOT NULL,
customer_email VARCHAR(40) NOT NULL,
total_price DECIMAL(10,2) NOT NULL,
VIN VARCHAR(17) NOT NULL,
FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO sales_contracts (contract_date, customer_name, customer_email, total_price, VIN) VALUES
('2025-06-01', 'John Doe', 'john.doe@example.com', 19500.00, '2C3KA53G66H123456'),
('2025-06-03', 'Jane Smith', 'jane.smith@example.com', 27000.00, '5FNYF4H97FB045678');






