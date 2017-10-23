DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS vendors;

CREATE TABLE vendors (
  id SERIAL8 PRIMARY KEY,
  vendor_name VARCHAR(255)
);

CREATE TABLE types (
  id SERIAL8 PRIMARY KEY,
  type_name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  amount DECIMAL(10,2),
  description VARCHAR(255),
  vendor_id INT8 REFERENCES vendors(id) ON DELETE CASCADE,
  type_id INT8 REFERENCES types(id) ON DELETE CASCADE,
  date_of_buy DATE
);
