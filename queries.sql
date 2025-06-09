USE dealership;

-- 1) get all dealerships
SELECT * FROM dealerships;


-- 2) find all vehicles for a specified dealership
SELECT dealership_id, vehicle_year, make, model, vehicle_type, color, odometer, price, vehicles.VIN
FROM vehicles
JOIN inventory ON vehicles.VIN = inventory.VIN
WHERE dealership_id = 2;


-- 3) find a car by VIN
SELECT * FROM vehicles
WHERE VIN = '1HGCM82633A004352';


-- 4) find the dealership where a certain car is located, by VIN
SELECT inventory.VIN, dealership_name AS `Dealership`
FROM dealerships
JOIN inventory ON inventory.dealership_id = dealerships.dealership_id
WHERE VIN = '1HGCM82633A004352';


-- 5) find all dealerships that have a certain car type (i.e. Red Ford Mustang)
SELECT dealership_name AS `Dealership`, Color, Make, Model, vehicles.VIN 
FROM dealerships
JOIN inventory ON inventory.dealership_id = dealerships.dealership_id
JOIN vehicles ON vehicles.vin = inventory.vin
WHERE color = 'black' AND make = 'honda' AND model = 'accord';


-- 6) Get all sales information for a specific dealer for a specific date range
USE dealership;
SELECT sales_contracts.*, dealership_name AS `Dealership`
FROM sales_contracts
JOIN vehicles ON vehicles.VIN = sales_contracts.VIN
JOIN inventory ON inventory.VIN = vehicles.VIN
JOIN dealerships ON dealerships.dealership_id = inventory.dealership_id
WHERE 
dealership_name = 'Budget Auto Sales' AND 
contract_date BETWEEN '2025-06-01' AND '2025-06-06';
