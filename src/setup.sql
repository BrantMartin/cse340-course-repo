DROP TABLE IF EXISTS organization;
DROP TABLE IF EXISTS service_project;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS service_project_category;

-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Service Projects Table
-- ========================================

CREATE TABLE service_project (
    service_project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL REFERENCES organization (organization_id),
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL
);

-- ========================================
-- Categories Table
-- ========================================
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- ========================================
-- Junction Table: Service Project <-> Category
-- ========================================
CREATE TABLE service_project_category (
    service_project_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (service_project_id, category_id),
    FOREIGN KEY (service_project_id) REFERENCES service_project (service_project_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO
    organization (name, description, contact_email, logo_filename)
VALUES
    (
        'BrightFuture Builders',
        'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
        'info@brightfuturebuilders.org',
        'brightfuture-logo.png'
    ),
    (
        'GreenHarvest Growers',
        'An urban farming collective promoting food sustainability and education in local neighborhoods.',
        'contact@greenharvest.org',
        'greenharvest-logo.png'
    ),
    (
        'UnityServe Volunteers',
        'A volunteer coordination group supporting local charities and service initiatives.',
        'hello@unityserve.org',
        'unityserve-logo.png'
    );

-- ========================================
-- Insert sample data: Categories
-- ========================================
INSERT INTO
    category (name)
VALUES
    ('Environmental'),
    ('Education'),
    ('Health & Wellness'),
    ('Community Development'),
    ('Food Security'),
    ('Animal Welfare'),
    ('Arts & Culture'),
    ('Disaster Relief');