USE project_kukaj_lagredelle;

-- Query 1 
SELECT rentedVenues.venueName AS "Venue", rentedauxspace.auxSpaceName AS "Auxillary", rental.datedDepositPaid AS "Date Deposite Paid", 
rental.insuranceCarrier AS "Insurance Carrier",
rental.propertyDamageCoverage, rental.workersComp,rental.bodilyInjuryCoverage, rental.disabilityCoverage, rental.generalAggregateCoverage 
FROM rentedVenues JOIN rental ON rentedVenues.rental = rental.id
JOIN rentedauxspace ON rentedauxspace.rental = rental.id
JOIN rentalClient ON rentalClient.email = rental.client
WHERE rentalClient.fname = "John"
AND rentalClient.lname = "Doe";

-- Query 2   
SELECT ticket.ticketID, ticket.dateTimeAndYear, event.name, ticket.price, ticket.priceLevel FROM ticket,event, `order`, contact
WHERE ticket.event = event.id AND ticket.order = `order`.confirmationNum AND `order`.contact = contact.email AND 
contact.fname = "Jane" AND contact.lname = "Smith"
 AND ticket.dateTimeAndYear > '2023-12-12 12:00:00';


-- Query 3
SELECT event.name AS "Event", eventGenre.genre AS "Genre"
FROM event, eventGenre
WHERE eventID = id 
AND name = "The Phantom of the Opera";

-- Query 4

SELECT event.name AS "Event", performance.dateTimeOccurring AS "Showing", COUNT(ticket.ticketID) AS "Number of Tickets Sold"
FROM event
JOIN performance ON event.id = performance.eventID
JOIN ticket ON ticket.event = event.id AND ticket.dateTimeAndYear = performance.dateTimeOccurring
GROUP BY event.name, performance.dateTimeOccurring
ORDER BY performance.dateTimeOccurring;


-- Query 5
SELECT contact.fname,contact.lname, amount 
FROM donation,contact
WHERE donation.contact = contact.email
AND amount > 25
ORDER BY fname;

-- Query 6
SELECT personnel.employeeID, personnel.firstName, personnel.lastName
FROM personnel, rentalstaff
WHERE rentalstaff.employeeID = personnel.employeeID 
AND rentalstaff.rental = "RNT001";

-- Query 7
INSERT INTO contact (email, salutation, fname, lname, streetAddress, zip, city, state, country, phoneNum) VALUES
('jimshort@gmail.com', 'Mr.', 'Jim', 'Short', '789 London Lane', '12579', 'New York', 'NY', 'USA', '1178652155');


INSERT INTO `order` (confirmationNum, contact, eventDiscovery, price, cardNum, CVC, cardExpDate, cardCountry, comments, deliveryMethod) VALUES
('ORD005', 'jimshort@gmail.com', 'Instagram', 20.00, '1292856578901478', '456', '2026-09-30', 'USA', 'Can’t wait to attend!', 'Email');

INSERT INTO ticket (ticketID, event, dateTimeAndYear, discount, price, priceLevel, seat, `order`) VALUES
('T03206316', 'EVT001', '2024-06-01 20:00:00', 0.00, 50.00, 'Regular', 'S001', 'ORD005'),
('T03206317', 'EVT001', '2024-06-01 20:00:00', 0.00, 50.00, 'Regular', 'S002', 'ORD005');


-- Query 8 

SELECT event.*, performance.dateTimeOccurring
FROM  event
JOIN performer_event
ON event_id = id
JOIN performer
ON performer.ssn = performer_event.ssn
JOIN performance
WHERE id = eventID
AND performer.name = "Bill Jones";

-- Query 9

SELECT rentalclient.fname, rentalclient.lname, rental.datedDepositPaid, rental.dateFullyPaid, rental.cost, rentedauxspace.auxSpaceName
FROM rentalclient
JOIN rental ON rentalclient.email = rental.client
LEFT JOIN rentedauxspace ON rentedauxspace.rental = rental.id;



-- Query 10

-- Descending order of the venue that earned the most in box office revenue since 2020 

SELECT rentedVenues.venueName AS "Venue", rental.boxOfficeRevenue AS "Box Office Revenue", rental.totalTicketsSold AS "Total Tickets Sold"
FROM rentedVenues, Rental
WHERE rental.id = rentedVenues.rental 
AND rental.startDate > '2020-01-01'
ORDER BY boxOfficeRevenue DESC;


