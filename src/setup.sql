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
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL
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


-- ========================================
-- Insert sample data: Service Projects
-- ========================================
INSERT INTO
    service_project (
        organization_id,
        title,
        description,
        location,
        project_date
    )
VALUES
    -- BrightFuture Builders (organization_id = 1)
    (
        1,
        'Community Playground Build',
        'Volunteers will assemble a new playground using recycled and sustainable materials for a neighborhood park.',
        'Riverside Park, 120 River St',
        '2026-12-05'
    ),
    (
        1,
        'Bus Stop Shelter Restoration',
        'Repair and repaint aging bus shelters to make public transit safer and more comfortable.',
        'Downtown Transit Center',
        '2027-01-16'
    ),
    (
        1,
        'Home Weatherization Day',
        'Help seniors seal windows and doors and install insulation before the coldest months.',
        'Maple Heights Neighborhood',
        '2026-12-12'
    ),
    -- GreenHarvest Growers (organization_id = 2)
    (
        2,
        'Urban Garden Planting Day',
        'Plant vegetables and herbs in raised beds that supply fresh produce to local families.',
        'Oak Street Community Garden',
        '2027-03-20'
    ),
    (
        2,
        'Composting Workshop',
        'A hands-on class teaching residents how to start composting at home and reduce food waste.',
        'GreenHarvest Education Center',
        '2027-02-07'
    ),
    (
        2,
        'School Garden Mentorship',
        'Volunteers help students plant, tend, and harvest a school garden while learning about nutrition.',
        'Lincoln Elementary School',
        '2027-04-10'
    ),
    -- UnityServe Volunteers (organization_id = 3)
    (
        3,
        'Neighborhood Food Drive',
        'Collect and sort non-perishable food donations for distribution to local food pantries.',
        'UnityServe Warehouse, 45 Commerce Ave',
        '2026-12-19'
    ),
    (
        3,
        'Shelter Pet Adoption Fair',
        'Help set up and run an adoption event connecting rescue animals with loving homes.',
        'Central Fairgrounds',
        '2027-02-21'
    ),
    (
        3,
        'Community Health Fair',
        'Support free health screenings and wellness education for local residents.',
        'Westside Community Center',
        '2027-03-06'
    ),
    (
        3,
        'Storm Relief Supply Packing',
        'Assemble and pack emergency supply kits for families affected by recent severe weather.',
        'UnityServe Warehouse, 45 Commerce Ave',
        '2027-01-30'
    );