/* Database schema based on given diagram */
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
    medical_history_id INT NULL REFERENCES medical_histories(id) ON DELETE CASCADE,
);

CREATE TABLE treatments (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    type VARCHAR(100) NOT NULL,
    name VARCHAR(50) NOT NULL
);
