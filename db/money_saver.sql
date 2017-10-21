DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS vendors;

CREATE TABLE vendors (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE types (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  amount INT8,
  vendor_id INT8 REFERENCES vendors(id),
  type_id INT8 REFERENCES types(id),
  date_of_buy DATE
);
