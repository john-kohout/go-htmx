INSERT INTO contacts (first_name, last_name, phone, email)
SELECT 'Johnathan', 'Smith', "123-456-7890", "john@example.comz"
WHERE (SELECT COUNT(*) FROM contacts) = 0
UNION ALL
SELECT 'Dana', 'Crandith', "123-456-7890", "dcran@example.comz"
WHERE (SELECT COUNT(*) FROM contacts) = 0
UNION ALL
SELECT 'Edith', 'Neutvaar', "123-456-7890", "en@example.comz"
WHERE (SELECT COUNT(*) FROM contacts) = 0;


