CREATE TRIGGER trg_tax_payments ON TopTal.dbo.tax_payments
AFTER INSERT, UPDATE, DELETE
AS

IF OBJECT_ID ('TopTal_Replicate.dbo.tax_payments') IS NOT NULL

BEGIN

INSERT INTO TopTal_Replicate.dbo.tax_payments (agency_office_id, amt_paid, payment_date, tax_type_id, tax_payment_id, document_num, CUIT)
SELECT agency_office_id, amt_paid, payment_date, tax_type_id, tax_payment_id, document_num, CUIT
FROM TopTal.dbo.tax_payments c 
WHERE NOT EXISTS (SELECT 'X' FROM TopTal_Replicate.dbo.tax_payments c2 WHERE c.tax_payment_id = c2.tax_payment_id);

UPDATE TopTal_Replicate.dbo.tax_payments SET amt_paid = c.amt_paid, payment_date = c.payment_date, tax_type_id = c.tax_type_id, document_num = c.document_num, CUIT = c.CUIT
FROM TopTal.dbo.tax_payments c
WHERE TopTal_Replicate.dbo.tax_payments.tax_payment_id = c.tax_payment_id;

DELETE TopTal_Replicate.dbo.tax_payments
WHERE tax_payment_id NOT IN (SELECT tax_payment_id FROM TopTal.dbo.tax_payments);

END;

GO

CREATE TRIGGER trg_tax_type ON TopTal.dbo.tax_type
AFTER INSERT, UPDATE, DELETE
AS

IF OBJECT_ID ('TopTal_Replicate.dbo.tax_type') IS NOT NULL

BEGIN

INSERT INTO TopTal_Replicate.dbo.tax_type (tax_type_id, tax_type_desc)
SELECT tax_type_id, tax_type_desc
FROM TopTal.dbo.tax_type c 
WHERE NOT EXISTS (SELECT 'X' FROM TopTal_Replicate.dbo.tax_type c2 WHERE c.tax_type_id = c2.tax_type_id);

UPDATE TopTal_Replicate.dbo.tax_type SET tax_type_desc = c.tax_type_desc
FROM TopTal.dbo.tax_type c
WHERE TopTal_Replicate.dbo.tax_type.tax_type_id = c.tax_type_id;

DELETE TopTal_Replicate.dbo.tax_type
WHERE tax_type_id NOT IN (SELECT tax_type_id FROM TopTal.dbo.tax_type);

END;

GO

CREATE TRIGGER trg_phone_type ON TopTal.dbo.phone_type
AFTER INSERT, UPDATE, DELETE
AS

IF OBJECT_ID ('TopTal_Replicate.dbo.phone_type') IS NOT NULL

BEGIN

INSERT INTO TopTal_Replicate.dbo.phone_type (phone_type_id, phone_type_desc)
SELECT phone_type_id, phone_type_desc
FROM TopTal.dbo.phone_type p
WHERE NOT EXISTS (SELECT 'X' FROM TopTal_Replicate.dbo.phone_type p2 WHERE p2.phone_type_id = p.phone_type_id);

UPDATE TopTal_Replicate.dbo.phone_type SET phone_type_desc = p.phone_type_desc
FROM TopTal.dbo.phone_type p
WHERE TopTal_Replicate.dbo.phone_type.phone_type_id = p.phone_type_id;

DELETE TopTal_Replicate.dbo.phone_type 
WHERE phone_type_id NOT IN (SELECT phone_type_id FROM TopTal.dbo.phone_type);

END;

GO

CREATE TRIGGER trg_individuals ON TopTal.dbo.individuals
AFTER INSERT, UPDATE, DELETE
AS

IF OBJECT_ID ('TopTal_Replicate.dbo.individuals') IS NOT NULL

BEGIN

INSERT INTO TopTal_Replicate.dbo.individuals (document_num, full_name, date_of_birth, home_address, email_address, phone_num, phone_type_id)
SELECT document_num, full_name, date_of_birth, home_address, email_address, phone_num, phone_type_id
FROM TopTal.dbo.individuals c 
WHERE NOT EXISTS (SELECT 'X' FROM TopTal_Replicate.dbo.individuals c2 WHERE c.document_num = c2.document_num);

UPDATE TopTal_Replicate.dbo.individuals SET full_name = c.full_name, date_of_birth = c.date_of_birth, home_address = c.home_address, email_address = c.email_address, phone_num = c.phone_num, phone_type_id = c.phone_type_id
FROM TopTal.dbo.individuals c
WHERE TopTal_Replicate.dbo.individuals.document_num = c.document_num;

DELETE TopTal_Replicate.dbo.individuals
WHERE document_num NOT IN (SELECT document_num FROM TopTal.dbo.individuals);

END;

GO

CREATE TRIGGER trg_company_owners ON TopTal.dbo.company_owners
AFTER INSERT, UPDATE, DELETE
AS

IF OBJECT_ID ('TopTal_Replicate.dbo.company_owners') IS NOT NULL

BEGIN

INSERT INTO TopTal_Replicate.dbo.company_owners (CUIT, document_num)
SELECT CUIT, document_num
FROM TopTal.dbo.company_owners c 
WHERE NOT EXISTS (SELECT 'X' FROM TopTal_Replicate.dbo.company_owners c2 WHERE c.CUIT = c2.CUIT AND c.document_num = c2.document_num);

DELETE TopTal_Replicate.dbo.company_owners
WHERE NOT EXISTS (SELECT 'X' FROM TopTal.dbo.company_owners c WHERE TopTal_Replicate.dbo.company_owners.CUIT = c.CUIT AND TopTal_Replicate.dbo.company_owners.document_num = c.document_num);

END;

GO

CREATE TRIGGER trg_companies ON TopTal.dbo.companies
AFTER INSERT, UPDATE, DELETE
AS

IF OBJECT_ID ('TopTal_Replicate.dbo.companies') IS NOT NULL

BEGIN

INSERT INTO TopTal_Replicate.dbo.companies (CUIT, email_address, phone_num, phone_type_id, website, activity_commencement_date, primary_owner_document_num)
SELECT CUIT, email_address, phone_num, phone_type_id, website, activity_commencement_date, primary_owner_document_num
FROM TopTal.dbo.companies c 
WHERE NOT EXISTS (SELECT 'X' FROM TopTal_Replicate.dbo.companies c2 WHERE c.CUIT = c2.CUIT);

UPDATE TopTal_Replicate.dbo.companies SET email_address = c.email_address, phone_num = c.phone_num, phone_type_id = c.phone_type_id, website = c.website, activity_commencement_date = c.activity_commencement_date, primary_owner_document_num = c.primary_owner_document_num
FROM TopTal.dbo.companies c
WHERE TopTal_Replicate.dbo.companies.CUIT = c.CUIT;

DELETE TopTal_Replicate.dbo.companies
WHERE CUIT NOT IN (SELECT CUIT FROM TopTal.dbo.companies);

END;

GO

CREATE TRIGGER trg_agency_offices ON TopTal.dbo.agency_offices
AFTER INSERT, UPDATE, DELETE
AS

IF OBJECT_ID ('TopTal_Replicate.dbo.agency_offices') IS NOT NULL

BEGIN

INSERT INTO TopTal_Replicate.dbo.agency_offices(agency_office_id, office_address, num_employees, phone_num, mgr_document_num)
SELECT agency_office_id, office_address, num_employees, phone_num, mgr_document_num
FROM TopTal.dbo.agency_offices a
WHERE NOT EXISTS (SELECT 'X' FROM TopTal_Replicate.dbo.agency_offices a2 WHERE a2.agency_office_id = a.agency_office_id);

UPDATE TopTal_Replicate.dbo.agency_offices SET office_address = a.office_address, num_employees = a.num_employees, phone_num = a.phone_num, mgr_document_num = a.mgr_document_num
FROM TopTal.dbo.agency_offices a
WHERE TopTal_Replicate.dbo.agency_offices.agency_office_id = a.agency_office_id;

DELETE TopTal_Replicate.dbo.agency_offices
WHERE agency_office_id NOT IN (SELECT agency_office_id FROM TopTal.dbo.agency_offices);

END;

GO
