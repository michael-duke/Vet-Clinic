/* Database schema based on given diagram */
--Week 2
--Tuesday
DROP TABLE IF EXISTS medical_histories_treatments;
DROP TABLE IF EXISTS invoice_items;
DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS medical_histories;
DROP TABLE IF EXISTS patients;

CREATE TABLE patients (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT NULL REFERENCES patients(id) ON DELETE CASCADE,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE invoices (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    total DECIMAL NOT NULL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT NULL REFERENCES medical_histories(id) ON DELETE CASCADE
);

CREATE TABLE treatments (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    type VARCHAR(100) NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE invoice_items (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    unit_price DECIMAL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL NOT NULL,
    invoice_id INT NULL REFERENCES invoices(id) ON DELETE CASCADE,
    treatment_id INT NULL REFERENCES treatments(id) ON DELETE CASCADE
);

CREATE TABLE medical_histories_treatments (
    medical_history_id INT REFERENCES medical_histories(id) ON DELETE CASCADE,
    treatment_id INT REFERENCES treatments(id) ON DELETE CASCADE
);