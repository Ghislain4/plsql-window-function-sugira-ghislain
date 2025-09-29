-- Use this to create the sample schema (MySQL / Oracle small adjustments may be needed)
CREATE TABLE Manager (
  manager_id    INT PRIMARY KEY,
  name          VARCHAR2(100)
);

CREATE TABLE Apartment (
  apartment_id  INT PRIMARY KEY,
  unit_number   VARCHAR2(10) NOT NULL,
  floor         INT,
  bedrooms      INT,
  rent_amount   DECIMAL(10,2),
  status        VARCHAR2(20) DEFAULT 'Vacant',
  manager_id    INT,
  CONSTRAINT fk_manager FOREIGN KEY(manager_id) REFERENCES Manager(manager_id)
);

CREATE TABLE Customer (
  customer_id   INT PRIMARY KEY,
  name          VARCHAR2(100),
  email         VARCHAR2(100),
  phone         VARCHAR2(20),
  move_in_date  DATE,
  apartment_id  INT,
  CONSTRAINT fk_apartment FOREIGN KEY(apartment_id) REFERENCES Apartment(apartment_id)
);

-- Payments / Transactions table (monthly rent receipts)
CREATE TABLE Payments (
  payment_id    INT PRIMARY KEY,
  customer_id   INT,
  apartment_id  INT,
  payment_date  DATE,
  amount        DECIMAL(12,2),
  CONSTRAINT fk_pay_customer FOREIGN KEY(customer_id) REFERENCES Customer(customer_id),
  CONSTRAINT fk_pay_apartment FOREIGN KEY(apartment_id) REFERENCES Apartment(apartment_id)
);
