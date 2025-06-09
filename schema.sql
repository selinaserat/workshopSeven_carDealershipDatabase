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
('1HGCM82633A004352', 'Honda', 'Accord', 'Sedan', 'Black', 2022, 15000, 22000.00, 'YES'),
('1N4AL11D75C109151', 'Nissan', 'Altima', 'Sedan', 'White', 2021, 22000, 18000.00, 'YES'),
('2C3KA53G66H123456', 'Chrysler', '300', 'Sedan', 'Silver', 2020, 30000, 19500.00, 'YES'),
('3VWFE21C04M000001', 'Volkswagen', 'Jetta', 'Sedan', 'Blue', 2023, 8000, 25000.00, 'YES'),
('5FNYF4H97FB045678', 'Honda', 'Pilot', 'SUV', 'Gray', 2019, 45000, 27000.00, 'YES'),
('1FTFW1EF1EKE12345', 'Ford', 'F-150', 'Truck', 'Red', 2022, 12000, 35000.00, 'YES'),
('WBA8D9C57HA012345', 'BMW', '328i', 'Sedan', 'Black', 2021, 18000, 32000.00, 'YES'),
('JHMFA16586S012345', 'Honda', 'Civic', 'Sedan', 'White', 2020, 28000, 19000.00, 'NO'),
('3FA6P0K96DR123456', 'Ford', 'Fusion', 'Sedan', 'Silver', 2019, 40000, 17000.00, 'YES'),
('1C4RJFBG0FC123456', 'Jeep', 'Grand Cherokee', 'SUV', 'Gray', 2022, 16000, 40000.00, 'NO');

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
(3, '5FNYF4H97FB045678'),
(1, '1FTFW1EF1EKE12345'),
(2, 'WBA8D9C57HA012345'),
(3, 'JHMFA16586S012345'),
(1, '3FA6P0K96DR123456'),
(2, '1C4RJFBG0FC123456');


CREATE TABLE sales_contracts(
contract_id INT PRIMARY KEY AUTO_INCREMENT,
contract_date DATE NOT NULL,
customer_name VARCHAR(40) NOT NULL,
customer_email VARCHAR(40),
total_price DECIMAL(10,2) NOT NULL,
financed VARCHAR(3) NOT NULL,
VIN VARCHAR(17) NOT NULL,
FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO sales_contracts (contract_date, customer_name, customer_email, total_price, financed, VIN) VALUES
('2025-06-01', 'John Doe', 'john.doe@example.com', 19500.00, 'YES', '2C3KA53G66H123456'),
('2025-06-03', 'Jane Smith', 'jane.smith@example.com', 27000.00, 'NO', '5FNYF4H97FB045678'),
('2024-06-02', 'Jayla Dolly', 'jayla.dolly@example.com', 25000.00, 'YES', '3VWFE21C04M000001'),
('2024-05-20', 'Carlos Martinez', 'carlos.martinez@example.com', 18000.00, 'NO', '1N4AL11D75C109151'),
('2024-07-15', 'Emily Clark', 'emily.clark@example.com', 32000.00, 'YES', 'WBA8D9C57HA012345'),
('2024-08-10', 'Samuel Green', 'samuel.green@example.com', 35000.00, 'YES', '1FTFW1EF1EKE12345'),
('2023-11-25', 'Olivia Brown', 'olivia.brown@example.com', 22000.00, 'NO', '1HGCM82633A004352'),
('2024-02-18', 'David Lee', 'david.lee@example.com', 17000.00, 'NO', '3FA6P0K96DR123456');


CREATE TABLE lease_contracts(
contract_id  INT PRIMARY KEY AUTO_INCREMENT,
contract_date DATE NOT NULL,
customer_name VARCHAR(40) NOT NULL,
customer_email VARCHAR(40),
monthly_payment DECIMAL(10,2) NOT NULL,
leasing_period INT NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
VIN VARCHAR(17) NOT NULL,
FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO lease_contracts (contract_date, customer_name, customer_email, monthly_payment, leasing_period, start_date, end_date, VIN) VALUES
('2025-06-08', 'Alice Johnson', 'alice.johnson@example.com', 399.99, 36, '2025-06-15', '2028-06-15', '1HGCM82633A004352'),
('2025-05-20', 'Bob Smith', 'bob.smith@example.com', 299.99, 24, '2025-06-01', '2027-06-01', '1N4AL11D75C109151'),
('2025-04-10', 'Charlie Lee', 'charlie.lee@example.com', 450.00, 48, '2025-05-01', '2029-05-01', '2C3KA53G66H123456'),
('2025-03-01', 'Diana Ross', 'diana.ross@example.com', 325.50, 36, '2025-03-15', '2028-03-15', '3VWFE21C04M000001'),
('2025-02-18', 'Ethan Brown', 'ethan.brown@example.com', 275.00, 24, '2025-03-01', '2027-03-01', '5FNYF4H97FB045678'),
('2024-11-12', 'Fiona White', 'fiona.white@example.com', 410.00, 36, '2024-12-01', '2027-12-01', '1FTFW1EF1EKE12345'),
('2024-10-05', 'George Adams', 'george.adams@example.com', 365.50, 24, '2024-11-01', '2026-11-01', 'WBA8D9C57HA012345'),
('2024-09-15', 'Hannah Kim', 'hannah.kim@example.com', 280.00, 24, '2024-10-01', '2026-10-01', 'JHMFA16586S012345');
