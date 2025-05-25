CREATE DATABASE Event_Management;

USE Event_Management;
-- Users
CREATE TABLE Users (
user_id int auto_increment,
full_name varchar(100) NOT NULL,
email varchar(100) NOT NULL UNIQUE,
city varchar(100) NOT NULL,
registration_date DATE NOT NULL,
primary key(user_id));

desc users;

-- Events
CREATE TABLE Events(
event_id int auto_increment,
title VARCHAR(200) NOT NULL,
description text,
city VARCHAR(100) NOT NULL,
start_date DATETIME NOT NULL,
end_date DATETIME NOT NULL,
status enum('upcoming','completed','cancelled') NOT NULL,
organizer_id INT,
primary key(event_id),
foreign key(organizer_id)  references Users(user_id));

desc Events;
-- Sessions
CREATE TABLE Sessions(
session_id int auto_increment,
event_id int,
title VARCHAR(200) NOT NULL,
speaker_name VARCHAR(100) NOT NULL,
start_date DATETIME NOT NULL,
end_date DATETIME NOT NULL,
PRIMARY KEY(session_id),
foreign key(event_id) references Events(event_id));

desc Sessions;

-- Registrations
CREATE TABLE Registrations(
registration_id int auto_increment,
user_id int,
event_id int,
registration_date DATE NOT NULL,
primary key(registration_id),
foreign key(user_id) references Users(user_id),
foreign key(event_id) references Events(event_id));

-- Feedback
create table Feedback(
feedback_id int auto_increment,
user_id int,
event_id int,
rating int CHECK(rating BETWEEN 1 AND 5),
comments text,
feedback_date DATE NOT NULL,
primary key(feedback_id),
foreign key(user_id) references Users(user_id),
foreign key(event_id) references Events(event_id));

-- Resources
create table resources(
resource_id int auto_increment,
event_id int,
resource_type enum('pdf','image','link'),
resource_url varchar(255) not null,
uploaded_at DATETIME not null,
primary key(resource_id),
foreign key(event_id) references Events(event_id));

INSERT INTO Users (full_name, email, city, registration_date) VALUES
('Alice Johnson', 'alice@example.com', 'New York', '2024-12-01'),
('Bob Smith', 'bob@example.com', 'Los Angeles', '2024-12-05'),
('Charlie Lee', 'charlie@example.com', 'Chicago', '2024-12-10'),
('Diana King', 'diana@example.com', 'New York', '2025-01-15'),
('Ethan Hunt', 'ethan@example.com', 'Los Angeles', '2025-02-01');

INSERT INTO Events (title, description, city, start_date, end_date, status, organizer_id) VALUES
('Tech Innovators Meetup', 'A meetup for tech enthusiasts.', 'New York', '2025-06-10 10:00:00', '2025-06-10 16:00:00', 'upcoming', 1),
('AI & ML Conference', 'Conference on AI and ML advancements.', 'Chicago', '2025-05-15 09:00:00', '2025-05-15 17:00:00', 'completed', 3),
('Frontend Development Bootcamp', 'Hands-on training on frontend tech.', 'Los Angeles', '2025-07-01 10:00:00', '2025-07-03 16:00:00', 'upcoming', 2);

INSERT INTO Sessions (event_id, title, speaker_name, start_date, end_date) VALUES
(1, 'Opening Keynote', 'Dr. Tech', '2025-06-10 10:00:00', '2025-06-10 11:00:00'),
(1, 'Future of Web Dev', 'Alice Johnson', '2025-06-10 11:15:00', '2025-06-10 12:30:00'),
(2, 'AI in Healthcare', 'Charlie Lee', '2025-05-15 09:30:00', '2025-05-15 11:00:00'),
(3, 'Intro to HTML5', 'Bob Smith', '2025-07-01 10:00:00', '2025-07-01 12:00:00');

INSERT INTO Registrations (user_id, event_id, registration_date) VALUES
(1, 1, '2025-05-01'),
(2, 1, '2025-05-02'),
(3, 2, '2025-04-30'),
(4, 2, '2025-04-28'),
(5, 3, '2025-06-15');

INSERT INTO Feedback (user_id, event_id, rating, comments, feedback_date) VALUES
(3, 2, 4, 'Great insights!', '2025-05-16'),
(4, 2, 5, 'Very informative.', '2025-05-16'),
(2, 1, 3, 'Could be better.', '2025-06-11');
INSERT INTO Resources (event_id, resource_type, resource_url, uploaded_at) VALUES
(1, 'pdf', 'https://portal.com/resources/tech_meetup_agenda.pdf', '2025-05-01 10:00:00'),
(2, 'image', 'https://portal.com/resources/ai_poster.jpg', '2025-04-20 09:00:00'),
(3, 'link', 'https://portal.com/resources/html5_docs', '2025-06-25 15:00:00');



