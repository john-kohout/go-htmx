INSERT INTO contacts (first_name, last_name, phone, email)
SELECT 'Johnathan', 'Smith', '123-456-7890', 'john@example.comz'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Dana', 'Crandith', '123-456-7890', 'dcran@example.comz'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Edith', 'Neutvaar', '123-456-7890', 'en@example.comz'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'John', 'Doe', '(555) 123-4567', 'john.doe@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Jane', 'Smith', '(555) 234-5678', 'jane.smith@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Emily', 'Johnson', '(555) 345-6789', 'emily.johnson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Michael', 'Brown', '(555) 456-7890', 'michael.brown@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Sarah', 'Davis', '(555) 567-8901', 'sarah.davis@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'William', 'Miller', '(555) 678-9012', 'william.miller@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Jessica', 'Wilson', '(555) 789-0123', 'jessica.wilson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Daniel', 'Moore', '(555) 890-1234', 'daniel.moore@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Laura', 'Taylor', '(555) 901-2345', 'laura.taylor@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Robert', 'Anderson', '(555) 012-3456', 'robert.anderson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Alice', 'Taylor', '(555) 213-4567', 'alice.taylor@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Brian', 'Lee', '(555) 324-5678', 'brian.lee@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Catherine', 'Wang', '(555) 435-6789', 'catherine.wang@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'David', 'Kim', '(555) 546-7890', 'david.kim@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Evelyn', 'Martinez', '(555) 657-8901', 'evelyn.martinez@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Frank', 'Garcia', '(555) 768-9012', 'frank.garcia@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Grace', 'Hernandez', '(555) 879-0123', 'grace.hernandez@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Henry', 'Lopez', '(555) 980-1234', 'henry.lopez@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Isabel', 'Gonzalez', '(555) 091-2345', 'isabel.gonzalez@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Jack', 'Nguyen', '(555) 102-3456', 'jack.nguyen@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Karen', 'Patel', '(555) 203-4567', 'karen.patel@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Liam', 'Jenkins', '(555) 314-5678', 'liam.jenkins@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Mia', 'Robinson', '(555) 425-6789', 'mia.robinson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Noah', 'Hall', '(555) 536-7890', 'noah.hall@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Olivia', 'Sanchez', '(555) 647-8901', 'olivia.sanchez@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Paul', 'Morris', '(555) 758-9012', 'paul.morris@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Quinn', 'Clark', '(555) 869-0123', 'quinn.clark@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Rachel', 'Lewis', '(555) 970-1234', 'rachel.lewis@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Samuel', 'Young', '(555) 081-2345', 'samuel.young@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Tina', 'Allen', '(555) 192-3456', 'tina.allen@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Eva', 'Campbell', '(555) 123-4567', 'eva.campbell@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Felix', 'Rivera', '(555) 234-5678', 'felix.rivera@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Gina', 'Cox', '(555) 345-6789', 'gina.cox@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Hugo', 'Reed', '(555) 456-7890', 'hugo.reed@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Irene', 'Ward', '(555) 567-8901', 'irene.ward@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Jerry', 'Cook', '(555) 678-9012', 'jerry.cook@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Kathy', 'Morgan', '(555) 789-0123', 'kathy.morgan@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Leo', 'Bell', '(555) 890-1234', 'leo.bell@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Mona', 'Murphy', '(555) 901-2345', 'mona.murphy@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Nate', 'Bailey', '(555) 012-3456', 'nate.bailey@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Olivia', 'Foster', '(555) 123-6789', 'olivia.foster@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Peter', 'Hunter', '(555) 234-7890', 'peter.hunter@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Quincy', 'Russell', '(555) 345-8901', 'quincy.russell@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Rita', 'Ortiz', '(555) 456-9012', 'rita.ortiz@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Steve', 'Gutierrez', '(555) 567-0123', 'steve.gutierrez@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Tiffany', 'Sullivan', '(555) 678-1234', 'tiffany.sullivan@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Ursula', 'Ramirez', '(555) 789-2345', 'ursula.ramirez@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Vincent', 'Reynolds', '(555) 890-3456', 'vincent.reynolds@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Wanda', 'Burns', '(555) 901-4567', 'wanda.burns@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Xander', 'Carpenter', '(555) 012-5678', 'xander.carpenter@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Aaron', 'Ellis', '(555) 203-4567', 'aaron.ellis@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Bella', 'Fox', '(555) 314-5678', 'bella.fox@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Carlos', 'Diaz', '(555) 425-6789', 'carlos.diaz@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Diana', 'Grant', '(555) 536-7890', 'diana.grant@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Ethan', 'Harper', '(555) 647-8901', 'ethan.harper@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Fiona', 'Ingram', '(555) 758-9012', 'fiona.ingram@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'George', 'Jennings', '(555) 869-0123', 'george.jennings@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Hannah', 'Knox', '(555) 970-1234', 'hannah.knox@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Ian', 'Lawrence', '(555) 081-2345', 'ian.lawrence@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Julia', 'Meyers', '(555) 192-3456', 'julia.meyers@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Kevin', 'Nolan', '(555) 203-4567', 'kevin.nolan@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Lily', 'Owens', '(555) 314-5678', 'lily.owens@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Mason', 'Patterson', '(555) 425-6789', 'mason.patterson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Nora', 'Quinn', '(555) 536-7890', 'nora.quinn@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Oscar', 'Reed', '(555) 647-8901', 'oscar.reed@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Penelope', 'Silva', '(555) 758-9012', 'penelope.silva@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Quentin', 'Torres', '(555) 869-0123', 'quentin.torres@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Rachel', 'Underwood', '(555) 970-1234', 'rachel.underwood@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Samuel', 'Vaughn', '(555) 081-2345', 'samuel.vaughn@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Tara', 'Wallace', '(555) 192-3456', 'tara.wallace@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Ulysses', 'Xavier', '(555) 203-4567', 'ulysses.xavier@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Violet', 'York', '(555) 314-5678', 'violet.york@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'William', 'Zane', '(555) 425-6789', 'william.zane@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Adam', 'Bennett', '(555) 211-3456', 'adam.bennett@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Brooke', 'Carter', '(555) 322-4567', 'brooke.carter@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Charlie', 'Daniels', '(555) 433-5678', 'charlie.daniels@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Daisy', 'Evans', '(555) 544-6789', 'daisy.evans@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Eli', 'Fletcher', '(555) 655-7890', 'eli.fletcher@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Fiona', 'Gray', '(555) 766-8901', 'fiona.gray@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Gabe', 'Harris', '(555) 877-9012', 'gabe.harris@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Holly', 'Irwin', '(555) 988-0123', 'holly.irwin@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Ivan', 'Johnson', '(555) 099-1234', 'ivan.johnson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Julia', 'Klein', '(555) 110-2345', 'julia.klein@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Kyle', 'Lawson', '(555) 221-3456', 'kyle.lawson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Laura', 'Mason', '(555) 332-4567', 'laura.mason@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Mike', 'Nolan', '(555) 443-5678', 'mike.nolan@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Nina', 'Olsen', '(555) 554-6789', 'nina.olsen@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Oscar', 'Patel', '(555) 665-7890', 'oscar.patel@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Paige', 'Quinn', '(555) 776-8901', 'paige.quinn@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Quincy', 'Reed', '(555) 887-9012', 'quincy.reed@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Rachel', 'Stevens', '(555) 998-0123', 'rachel.stevens@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Sam', 'Turner', '(555) 109-1234', 'sam.turner@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Tina', 'Underwood', '(555) 210-2345', 'tina.underwood@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Ulysses', 'Vance', '(555) 321-3456', 'ulysses.vance@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Vera', 'Williams', '(555) 432-4567', 'vera.williams@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Walter', 'Xavier', '(555) 543-5678', 'walter.xavier@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Alex', 'Black', '(555) 101-2345', 'alex.black@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Beth', 'Cooper', '(555) 202-3456', 'beth.cooper@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Cory', 'Dawson', '(555) 303-4567', 'cory.dawson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Diane', 'Edwards', '(555) 404-5678', 'diane.edwards@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Evan', 'Fisher', '(555) 505-6789', 'evan.fisher@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Faith', 'Gibson', '(555) 606-7890', 'faith.gibson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Gary', 'Holt', '(555) 707-8901', 'gary.holt@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Heidi', 'Iverson', '(555) 808-9012', 'heidi.iverson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Ian', 'Jennings', '(555) 909-0123', 'ian.jennings@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Julie', 'Kramer', '(555) 110-1234', 'julie.kramer@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Karl', 'Lopez', '(555) 211-2345', 'karl.lopez@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Linda', 'Meyer', '(555) 312-3456', 'linda.meyer@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Miguel', 'Norton', '(555) 413-4567', 'miguel.norton@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Nancy', 'Owens', '(555) 514-5678', 'nancy.owens@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Owen', 'Peters', '(555) 615-6789', 'owen.peters@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Pamela', 'Quinn', '(555) 716-7890', 'pamela.quinn@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Quentin', 'Ross', '(555) 817-8901', 'quentin.ross@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Rachel', 'Stewart', '(555) 918-9012', 'rachel.stewart@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Steven', 'Turner', '(555) 119-0123', 'steven.turner@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Tara', 'Underwood', '(555) 220-1234', 'tara.underwood@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Ulysses', 'Vaughn', '(555) 221-4567', 'ulysses.vaughn@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Victoria', 'Waters', '(555) 332-5678', 'victoria.waters@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Walter', 'Xavier', '(555) 443-6789', 'walter.xavier@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Xenia', 'Young', '(555) 554-7890', 'xenia.young@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Yvonne', 'Zimmerman', '(555) 665-8901', 'yvonne.zimmerman@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Zachary', 'Adams', '(555) 776-9012', 'zachary.adams@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Amelia', 'Brooks', '(555) 887-0123', 'amelia.brooks@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Benjamin', 'Carter', '(555) 998-1234', 'benjamin.carter@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Claire', 'Dawson', '(555) 109-2345', 'claire.dawson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'David', 'Edwards', '(555) 210-3456', 'david.edwards@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Ella', 'Foster', '(555) 321-4567', 'ella.foster@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Frank', 'Gibson', '(555) 432-5678', 'frank.gibson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Grace', 'Hill', '(555) 543-6789', 'grace.hill@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Henry', 'Irwin', '(555) 654-7890', 'henry.irwin@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Isabella', 'Jones', '(555) 765-8901', 'isabella.jones@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Jacob', 'Klein', '(555) 876-9012', 'jacob.klein@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Kylie', 'Lawrence', '(555) 987-0123', 'kylie.lawrence@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Liam', 'Meyer', '(555) 198-1234', 'liam.meyer@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Mia', 'Nelson', '(555) 209-2345', 'mia.nelson@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Noah', 'OConnor', '(555) 310-3456', 'noah.oconnor@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Olivia', 'Parker', '(555) 401-4567', 'olivia.parker@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Peter', 'Quinn', '(555) 512-5678', 'peter.quinn@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Quincy', 'Roberts', '(555) 623-6789', 'quincy.roberts@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Rita', 'Smith', '(555) 734-7890', 'rita.smith@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Samuel', 'Taylor', '(555) 845-8901', 'samuel.taylor@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Tina', 'Underwood', '(555) 956-9012', 'tina.underwood@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Ursula', 'Vance', '(555) 067-0123', 'ursula.vance@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Victor', 'Williams', '(555) 178-1234', 'victor.williams@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Wendy', 'Xavier', '(555) 289-2345', 'wendy.xavier@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Xander', 'Young', '(555) 390-3456', 'xander.young@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150
UNION ALL
SELECT 'Yasmin', 'Zimmerman', '(555) 401-4567', 'yasmin.zimmerman@email.com'
WHERE (SELECT COUNT(*) FROM contacts) < 150;
