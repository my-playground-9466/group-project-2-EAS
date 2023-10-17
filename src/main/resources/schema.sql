CREATE TABLE IF NOT EXISTS branch(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS employee_status(
    id INT PRIMARY KEY AUTO_INCREMENT ,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS employee(
    id VARCHAR(20) PRIMARY KEY ,
    username VARCHAR(50) UNIQUE NOT NULL ,
    name VARCHAR(20) NOT NULL ,
    password VARCHAR(100) NOT NULL ,
    nic VARCHAR(15) NOT NULL ,
    contact VARCHAR(15) NOT NULL ,
    role VARCHAR(20) NOT NULL ,
    branch_id INT NOT NULL ,
    employee_status INT NOT NULL ,
    CONSTRAINT fk1_employee FOREIGN KEY (branch_id) REFERENCES branch (id),
    CONSTRAINT fk2_employee FOREIGN KEY (employee_status) REFERENCES employee_status (id)
);

CREATE TABLE IF NOT EXISTS profile_pic(
    employee_id VARCHAR(20),
    picture BLOB NOT NULL ,
    CONSTRAINT fk_profile_pic FOREIGN KEY (employee_id) REFERENCES employee (id)
);

CREATE TABLE IF NOT EXISTS terminate_request(
    id INT PRIMARY KEY AUTO_INCREMENT,
    request_date DATE NOT NULL ,
    reason VARCHAR(100) NOT NULL ,
    status VARCHAR(30) NOT NULL ,
    employee_id VARCHAR(20) NOT NULL ,
    request_by VARCHAR(20),
    CONSTRAINT fk2_terminate FOREIGN KEY (request_by) REFERENCES employee (id)
);

CREATE TABLE IF NOT EXISTS attendance(
    id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(10) NOT NULL ,
    timestamp TIMESTAMP NOT NULL ,
    employee_id VARCHAR(20),
    CONSTRAINT fk_attendance FOREIGN KEY (employee_id) REFERENCES employee (id)
);

CREATE TABLE IF NOT EXISTS reset(
    timestamp TIMESTAMP NOT NULL ,
    employee_id VARCHAR(20),
    it_employee_id VARCHAR(20),
    CONSTRAINT pk_reset PRIMARY KEY (timestamp,employee_id,it_employee_id)
);



