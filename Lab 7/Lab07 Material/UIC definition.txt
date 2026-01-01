CREATE TABLE program(
    p_code		INT,
    p_name		VARCHAR(40) NOT NULL,
    division	VARCHAR(40),
    director_id	INT,
    PRIMARY KEY(p_code)
);
CREATE TABLE course(
    c_name		VARCHAR(40),
    credits		INT NOT NULL,
    domain		VARCHAR(4) NOT NULL,
    c_number	INT NOT NULL,
    PRIMARY KEY(c_name)
);
CREATE TABLE offer(
    p_code		INT,
    c_name		VARCHAR(40),
    PRIMARY KEY(p_code,c_name)
);
CREATE TABLE section(
    c_name		VARCHAR(40),
    s_number	INT,
    sem			CHAR(3),
    venue		VARCHAR(10),
    s_time		VARCHAR(20),
    instructor_id INT,
    PRIMARY KEY(c_name,s_number,sem)
);
CREATE TABLE student(
    id			INT,
    s_name		VARCHAR(20) NOT NULL,
    yr		    INT NOT NULL,
    gpa			NUMERIC(3,2),
    p_code		INT NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE enroll(
    id          INT,
    c_name      VARCHAR(40),
    s_number    INT,
    sem         CHAR(3),
    grade       VARCHAR(4),
    PRIMARY KEY(id,c_name,s_number,sem)
);
CREATE TABLE instructor(
    id			INT,
    i_name		VARCHAR(20) NOT NULL,
    title		VARCHAR(20) NOT NULL,
    salary		INT NOT NULL,
    p_code		INT NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE contact(
    id			INT,
    phone		BIGINT,
    PRIMARY KEY(id, phone)
);
CREATE TABLE book(
    ISBN		VARCHAR(15),
    b_title		VARCHAR(40) NOT NULL,
    author 		VARCHAR(20),
    PRIMARY KEY(ISBN)
);
CREATE TABLE borrow(
    id			INT,
    ISBN		VARCHAR(15),
    return_date	DATE,
    borrow_date	DATE NOT NULL,
    PRIMARY KEY (id, ISBN)
);
ALTER TABLE program ADD FOREIGN KEY (director_id) REFERENCES instructor(id);
ALTER TABLE offer ADD FOREIGN KEY (p_code) REFERENCES program(p_code);
ALTER TABLE offer ADD FOREIGN KEY (c_name) REFERENCES course(c_name);
ALTER TABLE section ADD FOREIGN KEY (c_name) REFERENCES course(c_name);
ALTER TABLE section ADD FOREIGN KEY (instructor_id) REFERENCES instructor(id);
ALTER TABLE student ADD FOREIGN KEY (p_code) REFERENCES program(p_code);
ALTER TABLE instructor ADD FOREIGN KEY (p_code) REFERENCES program(p_code);
ALTER TABLE borrow ADD FOREIGN KEY (ISBN) REFERENCES book(ISBN);
ALTER TABLE enroll ADD FOREIGN KEY (id) REFERENCES student(id);
ALTER TABLE enroll ADD FOREIGN KEY (c_name,s_number,sem) REFERENCES section(c_name,s_number,sem);