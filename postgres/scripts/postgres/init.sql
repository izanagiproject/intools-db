-- Plants Table
CREATE TABLE plants (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Teams Table
CREATE TABLE teams (
    id INT PRIMARY KEY,
    plant_id INT,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (plant_id) REFERENCES plants(id)
);

-- Employees Table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    team_id INT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
    CONSTRAINT fk_employees_teams FOREIGN KEY (team_id) REFERENCES teams(id)
);

-- Areas Table
CREATE TABLE areas (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    plant_id INT,
    FOREIGN KEY (plant_id) REFERENCES plants(id)
);

-- Categories Table
CREATE TABLE categories (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Materials Table
CREATE TABLE materials (
    id int PRIMARY KEY,
    qcode varchar,
    employee_id INT,
    area_id INT,
    category_id INT,
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    frame VARCHAR(50) NOT NULL,
    maker VARCHAR(50) NOT NULL,
    CONSTRAINT fk_materials_employees FOREIGN KEY (employee_id) REFERENCES employees(id),
    CONSTRAINT fk_materials_areas FOREIGN KEY (area_id) REFERENCES areas(id),
    CONSTRAINT fk_materials_categories FOREIGN KEY (category_id) REFERENCES categories(id)
);


-- Motors Specification Table
CREATE TABLE motors_specification (
    id INT PRIMARY KEY,
    material_id int,
    capacity INT NOT NULL,
    voltage INT NOT NULL,
    current INT NOT NULL,
    rpm INT NOT NULL,
    CONSTRAINT fk_motors_specification_materials FOREIGN KEY (material_id) REFERENCES materials(id)
);

-- Motors Size Table
CREATE TABLE motors_size (
    id INT PRIMARY KEY,
    material_id int,
    base_length INT NOT NULL,
    base_width INT NOT NULL,
    shaft_diameter INT NOT NULL,
    c INT NOT NULL,
    e INT NOT NULL,
    h INT NOT NULL,
    CONSTRAINT fk_motors_size_materials FOREIGN KEY (material_id) REFERENCES materials(id)
);

-- Indexes for the employees table
CREATE INDEX idx_employees_employee_id ON employees (id);
CREATE INDEX idx_employees_team_id ON employees (id);

-- Indexes for the teams table
CREATE INDEX idx_teams_team_id ON teams (id);
CREATE INDEX idx_teams_plant_id ON teams (id);

-- Indexes for the areas table
CREATE INDEX idx_areas_area_id ON areas (id);
CREATE INDEX idx_areas_plant_id ON areas (id);

-- Indexes for the materials table
CREATE INDEX idx_materials_employee_id ON materials (employee_id);
CREATE INDEX idx_materials_area_id ON materials (area_id);
CREATE INDEX idx_materials_material_id ON materials (id);

-- Indexes for the motors_specification table
CREATE INDEX idx_motors_specification_material_id ON motors_specification (material_id);

-- Plants Table
INSERT INTO plants (id, name) VALUES
(1, 'Plant A'),
(2, 'Plant B'),
(3, 'Plant C'),
(4, 'Plant D'),
(5, 'Plant E');

-- Teams Table
INSERT INTO teams (id, plant_id, name) VALUES
(1, 1, 'Team 1'),
(2, 1, 'Team 2'),
(3, 2, 'Team 3'),
(4, 2, 'Team 4'),
(5, 3, 'Team 5');

-- Employees Table
INSERT INTO employees (id, team_id, name, phone, email) VALUES
(1, 1, 'John Doe', '123-456-7890', 'john.doe@example.com'),
(2, 1, 'Jane Smith', '987-654-3210', 'jane.smith@example.com'),
(3, 2, 'Bob Johnson', '555-123-4567', 'bob.johnson@example.com'),
(4, 3, 'Alice White', '111-222-3333', 'alice.white@example.com'),
(5, 4, 'Charlie Brown', '999-888-7777', 'charlie.brown@example.com');

-- Areas Table
INSERT INTO areas (id, name, plant_id) VALUES
(1, 'Area 1', 1),
(2, 'Area 2', 1),
(3, 'Area 3', 2),
(4, 'Area 4', 2),
(5, 'Area 5', 3);

-- Categories Table
INSERT INTO categories (id, name) VALUES
(1, 'Category 1'),
(2, 'Category 2'),
(3, 'Category 3'),
(4, 'Category 4'),
(5, 'Category 5');

-- Materials Table
INSERT INTO materials (id, qcode, employee_id, area_id, category_id, name, quantity, frame, maker) VALUES
(1, '1', 1, 1, 1, 'Material A', 10, 'Frame A', 'Maker X'),
(2, '2', 2, 2, 2, 'Material B', 20, 'Frame B', 'Maker Y'),
(3, '3', 3, 3, 3, 'Material C', 15, 'Frame C', 'Maker Z'),
(4, '4', 4, 4, 4, 'Material D', 25, 'Frame D', 'Maker W'),
(5, '5', 5, 5, 5, 'Material E', 30, 'Frame E', 'Maker V');

-- Motors Specification Table
INSERT INTO motors_specification (id, material_id, capacity, voltage, current, rpm) VALUES
(1, 1, 100, 220, 10, 1500),
(2, 2, 150, 110, 15, 2000),
(3, 3, 120, 240, 12, 1800),
(4, 4, 200, 120, 20, 2500),
(5, 5, 180, 200, 18, 2200);

-- Motors Size Table
INSERT INTO motors_size (id, material_id, base_length, base_width, shaft_diameter, c, e, h) VALUES
(1, 1, 50, 30, 5, 15, 20, 10),
(2, 2, 60, 40, 6, 18, 25, 12),
(3, 3, 55, 35, 5.5, 17, 22, 11),
(4, 4, 70, 45, 7, 20, 28, 14),
(5, 5, 65, 38, 6.5, 19, 26, 13);