CREATE DATABASE garage;
USE garage;

-- 1. Category
CREATE TABLE Category (
    idCategory INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(50) NOT NULL UNIQUE,
    discount DECIMAL(5,2) NOT NULL DEFAULT 0,
    CHECK (discount BETWEEN 0 AND 100)
);

-- 2. Customer
CREATE TABLE Customer (
    idCustomer INT AUTO_INCREMENT PRIMARY KEY,
    firstNameCustomer VARCHAR(50) NOT NULL,
    lastNameCustomer VARCHAR(50) NOT NULL,
    phone INT NOT NULL,
    address VARCHAR(255),
    idCategory INT NOT NULL,
    FOREIGN KEY (idCategory) REFERENCES Category(idCategory)
);

-- 3. Vehicle
CREATE TABLE Vehicle (
    idVehicle INT AUTO_INCREMENT PRIMARY KEY,
    plate VARCHAR(20) NOT NULL UNIQUE,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
-- Renamed year to modelYear because SQL has a function called YEAR
    modelYear INT,
    idCustomer INT NOT NULL,
    FOREIGN KEY (idCustomer) REFERENCES Customer(idCustomer)
);

-- 4. Service
CREATE TABLE Service (
    idService INT AUTO_INCREMENT PRIMARY KEY,
    nameService VARCHAR(100) NOT NULL,
    hourlyRate DECIMAL(10,3) NOT NULL,
    CHECK (hourlyRate >= 0)
);

-- 5. Mechanic
CREATE TABLE Mechanic (
    idMechanic INT AUTO_INCREMENT PRIMARY KEY,
    firstNameMechanic VARCHAR(50) NOT NULL,
    lastNameMechanic VARCHAR(50) NOT NULL,
    phone VARCHAR(20)
);

-- 6. Part
CREATE TABLE Part (
    idPart INT AUTO_INCREMENT PRIMARY KEY,
    namePart VARCHAR(100) NOT NULL,
    unitPrice DECIMAL(10,3) NOT NULL,
    CHECK (unitPrice >= 0)
);

-- 7. Invoice
CREATE TABLE Invoice (
    idInvoice INT AUTO_INCREMENT PRIMARY KEY,
    invoiceNo VARCHAR(8) NOT NULL UNIQUE,
    invoiceDate DATE NOT NULL,
    discountPct DECIMAL(5,2) NOT NULL DEFAULT 0,
    vatRate DECIMAL(5,2) NOT NULL DEFAULT 5,
    idVehicle INT NOT NULL,
    FOREIGN KEY (idVehicle) REFERENCES Vehicle(idVehicle),
    CHECK (discountPct BETWEEN 0 AND 100),
    CHECK (vatRate BETWEEN 0 AND 100)
);

-- 8. Labour_line
CREATE TABLE Labour_line (
    lineNo INT AUTO_INCREMENT PRIMARY KEY,
    hours DECIMAL(6,2) NOT NULL,
    rateCharged DECIMAL(10,3) NOT NULL,
    idInvoice INT NOT NULL,
    idMechanic INT NOT NULL,
    idService INT NOT NULL,
    FOREIGN KEY (idInvoice) REFERENCES Invoice(idInvoice),
    FOREIGN KEY (idMechanic) REFERENCES Mechanic(idMechanic),
    FOREIGN KEY (idService) REFERENCES Service(idService),
    CHECK (hours > 0),
    CHECK (rateCharged >= 0)
);

-- 9. Part_line
CREATE TABLE Part_line (
    PartLineNo INT AUTO_INCREMENT PRIMARY KEY,
    quantity INT NOT NULL,
    priceCharged DECIMAL(10,3) NOT NULL,
    idPart INT NOT NULL,
    idInvoice INT NOT NULL,
    FOREIGN KEY (idPart) REFERENCES Part(idPart),
    FOREIGN KEY (idInvoice) REFERENCES Invoice(idInvoice),
    CHECK (quantity > 0),
    CHECK (priceCharged >= 0)
);

-- 10. qualified_for
CREATE TABLE qualified_for (
    idMechanic INT NOT NULL,
    idService INT NOT NULL,
    PRIMARY KEY (idMechanic, idService),
    FOREIGN KEY (idMechanic) REFERENCES Mechanic(idMechanic),
    FOREIGN KEY (idService) REFERENCES Service(idService)
);
