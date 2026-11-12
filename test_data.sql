START TRANSACTION;

INSERT INTO `Category` (`idCategory`, `label`) VALUES
    (1, 'Standard');

INSERT INTO `Category` (`idCategory`, `label`, `discount`) VALUES
    (2, 'Silver', 5.00),
    (3, 'Gold', 10.00);

INSERT INTO `Customer`
    (`idCustomer`, `firstNameCustomer`, `lastNameCustomer`, `phone`, `address`, `idCategory`)
VALUES
    (1, 'Aisha', 'Al Harthy', '10000001', 'Al Seeb', 3),
    (2, 'Khalid', 'Al Balushi', '10000002', 'Al Khoudh', 2),
    (3, 'Mariam', 'Al Rawahi', '10000003', 'Al Mawaleh', 1),
    (4, 'Omar', 'Al Zadjali', '10000004', 'Bawshar', 3),
    (5, 'Noor', 'Al Habsi', '10000005', 'Al Ghubrah', 2),
    (6, 'Hassan', 'Al Farsi', '10000006', 'Azaiba', 1),
    (7, 'Salma', 'Al Riyami', '10000007', 'Muttrah', 2),
    (8, 'Yusuf', 'Al Amri', '10000008', 'Qurum', 1),
    (205317, 'Hamad', 'Al-Balushi', '99123456', 'Seeb', 2);

INSERT INTO `Vehicle` (`idVehicle`, `plate`, `make`, `model`, `modelYear`, `idCustomer`) VALUES
    (1, 'TEST-101', 'Toyota', 'Corolla', 2019, 1),
    (2, 'TEST-102', 'Nissan', 'X-Trail', 2021, 1),
    (3, 'TEST-103', 'Hyundai', 'Elantra', 2020, 2),
    (4, 'TEST-104', 'Honda', 'Civic', 2018, 3),
    (5, 'TEST-105', 'Mazda', 'CX-5', 2022, 4),
    (6, 'TEST-106', 'Kia', 'Sportage', 2021, 5),
    (7, 'TEST-107', 'Toyota', 'Yaris', 2017, 6),
    (8, 'TEST-108', 'Nissan', 'Sunny', 2020, 7),
    (9, 'TEST-109', 'Mitsubishi', 'ASX', 2019, 8),
    (10, '4521 AB', 'Toyota', 'Corolla', 2018, 205317);

INSERT INTO `Mechanic` (`idMechanic`, `firstNameMechanic`, `lastNameMechanic`, `phone`) VALUES
    (1, 'Salim', 'Al Lawati', '10000011'),
    (2, 'Yusuf', 'Al Mahrouqi', '10000012'),
    (3, 'Ahmed', 'Al Hinai', '10000013'),
    (4, 'Fahad', 'Al Kindi', '10000014'),
    (5, 'Nasser', 'Al Shukaili', '10000015');

INSERT INTO `Service` (`idService`, `nameService`, `hourlyRate`) VALUES
    (1, 'Oil change', 12.000),
    (2, 'Brake pad replacement', 16.000),
    (3, 'Battery replacement', 10.000),
    (4, 'Engine air filter replacement', 8.000),
    (5, 'Cooling system service', 14.000),
    (6, 'Spark plug replacement', 18.000),
    (7, 'Wiper blade replacement', 6.000),
    (8, 'Cabin air filter replacement', 8.000),
    (9, 'Wheel alignment', 10.000);

INSERT INTO `qualified_for` (`idService`, `idMechanic`) VALUES
    (1, 1), (1, 5),
    (2, 2),
    (3, 3),
    (4, 1), (4, 5),
    (5, 4),
    (6, 4),
    (7, 3), (7, 5),
    (8, 5),
    (9, 1);

INSERT INTO `Part` (`idPart`, `namePart`, `unitPrice`) VALUES
    (1, 'Engine oil 5W-30 (litre)', 5.500),
    (2, 'Oil filter', 3.250),
    (3, 'Front brake pads (set)', 18.750),
    (4, 'Brake fluid (500 ml)', 3.750),
    (5, '12V battery', 32.500),
    (6, 'Battery terminal kit', 2.500),
    (7, 'Engine air filter', 6.750),
    (8, 'Engine coolant (1 litre)', 4.250),
    (9, 'Spark plug', 3.500),
    (10, 'Wiper blade', 5.250),
    (11, 'Cabin air filter', 7.250),
    (12, 'Rear brake pad set', 16.500),
    (13, 'Drain plug washer', 0.250),
    (14, 'Coolant hose clamp', 1.250),
    (15, 'Timing belt', 28.000);

INSERT INTO `Invoice`
    (`idInvoice`, `invoiceNo`, `invoiceDate`, `discountPct`, `vatRate`, `idVehicle`)
VALUES
    (1, '26-00001', '2026-09-02', 10.00, 5.00, 1),
    (2, '26-00002', '2026-09-04', 10.00, 5.00, 2),
    (3, '26-00003', '2026-09-07', 5.00, 5.00, 3),
    (4, '26-00004', '2026-09-10', 0.00, 5.00, 4),
    (5, '26-00005', '2026-09-14', 10.00, 5.00, 5),
    (6, '26-00006', '2026-09-18', 5.00, 5.00, 6),
    (7, '26-00007', '2026-09-22', 0.00, 5.00, 7),
    (8, '26-00008', '2026-09-27', 5.00, 5.00, 8),
    (9, '26-00009', '2026-10-03', 10.00, 5.00, 1),
    (10, '26-00010', '2026-10-09', 5.00, 5.00, 3),
    (11, '26-00011', '2026-10-16', 0.00, 5.00, 4),
    (12, '26-00457', '2026-10-14', 10.00, 5.00, 10);

INSERT INTO `Labour_line`
    (`lineNo`, `hours`, `rateCharged`, `idInvoice`, `idMechanic`, `idService`)
VALUES
    (1, 1, 12.000, 1, 1, 1),
    (2, 1, 8.000, 1, 1, 4),
    (3, 1, 10.000, 2, 3, 3),
    (4, 2, 15.000, 3, 2, 2),
    (5, 2, 14.000, 4, 4, 5),
    (6, 1, 18.000, 5, 4, 6),
    (7, 1, 6.000, 6, 3, 7),
    (8, 1, 8.000, 7, 5, 8),
    (9, 2, 15.000, 8, 2, 2),
    (10, 1, 6.000, 9, 5, 7),
    (11, 1, 8.000, 9, 5, 4),
    (12, 1, 12.000, 10, 5, 1),
    (13, 1, 15.000, 11, 2, 2),
    (14, 0.5, 12.000, 12, 1, 1),
    (15, 2, 16.000, 12, 2, 2),
    (16, 1, 10.000, 12, 1, 9),
    (17, 1, 10.000, 1, 3, 3);

INSERT INTO `Part_line` (`PartLineNo`, `quantity`, `priceCharged`, `idPart`, `idInvoice`) VALUES
    (1, 4, 5.500, 1, 1),
    (2, 1, 3.250, 2, 1),
    (3, 1, 6.750, 7, 1),
    (4, 1, 0.250, 13, 1),
    (5, 1, 32.500, 5, 2),
    (6, 1, 2.500, 6, 2),
    (7, 1, 18.750, 3, 3),
    (8, 1, 3.750, 4, 3),
    (9, 2, 4.250, 8, 4),
    (10, 1, 1.250, 14, 4),
    (11, 4, 3.500, 9, 5),
    (12, 2, 5.250, 10, 6),
    (13, 1, 7.250, 11, 7),
    (14, 1, 16.500, 12, 8),
    (15, 2, 5.250, 10, 9),
    (16, 1, 6.750, 7, 9),
    (17, 4, 5.500, 1, 10),
    (18, 1, 3.250, 2, 10),
    (19, 1, 0.250, 13, 10),
    (20, 1, 4.000, 2, 12),
    (21, 1, 28.000, 3, 12),
    (22, 4, 2.500, 1, 12),
    (23, 1, 27.750, 5, 1);

COMMIT;
