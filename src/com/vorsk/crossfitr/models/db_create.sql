CREATE TABLE score_type
(
	_id           INTEGER PRIMARY KEY,
	name          TEXT UNIQUE NOT NULL,
	description   TEXT,
	date_created  INTEGER NOT NULL,
	date_modified INTEGER NOT NULL
);

CREATE TABLE workout_type
(
	_id           INTEGER PRIMARY KEY,
	name          TEXT UNIQUE NOT NULL,
	description   TEXT,
	date_created  INTEGER NOT NULL,
	date_modified INTEGER NOT NULL
);

CREATE TABLE workout
(
	_id              INTEGER PRIMARY KEY,
	name             TEXT UNIQUE NOT NULL,
	description      TEXT,
	workout_type_id  INTEGER REFERENCES workout_type ON DELETE RESTRICT NOT NULL,
	record           INTEGER,
	record_type_id   INTEGER REFERENCES score ON DELETE RESTRICT NOT NULL,
	date_created     INTEGER NOT NULL,
	date_modified    INTEGER NOT NULL
);

CREATE TABLE workout_session
(
	_id            INTEGER PRIMARY KEY,
	workout_id     INTEGER REFERENCES workout ON DELETE RESTRICT NOT NULL,
	score          INTEGER,
	score_type_id  INTEGER REFERENCES score ON DELETE RESTRICT NOT NULL,
	date_created   INTEGER NOT NULL
);

CREATE TABLE profile
(
	_id            INTEGER PRIMARY KEY,
	attribute      TEXT UNIQUE NOT NULL,
	value          TEXT NOT NULL,
	date_modified  INTEGER NOT NULL
);

CREATE TABLE injury
(
	_id            INTEGER PRIMARY KEY,
	description    TEXT,
	date_begin     INTEGER NOT NULL,
	date_end       INTEGER NOT NULL,
	date_created   INTEGER NOT NULL,
	date_modified  INTEGER NOT NULL
);

CREATE TABLE achievement
(
	_id                 INTEGER PRIMARY KEY,
	name                TEXT UNIQUE NOT NULL,
	description         TEXT,
	achievement_type_id INTEGER REFERENCES achievement_type ON DELETE RESTRICT NOT NULL,
	progress_thresh     INTEGER,
	progress            INTEGER NOT NULL DEFAULT 0,
	count               INTEGER NOT NULL DEFAULT 0,
	date_created        INTEGER NOT NULL,
	date_modified       INTEGER NOT NULL
);

CREATE TABLE achievement_type
(
	_id            INTEGER PRIMARY KEY,
	name           TEXT UNIQUE NOT NULL,
	description    TEXT,
	date_created   INTEGER NOT NULL,
	date_modified  INTEGER NOT NULL
);


INSERT INTO workout_type (_id, name, description) VALUES
	(1, 'WOD', 'Workout of the Day'),
	(2, 'Girl', 'Girl Workout'),
	(3, 'Hero', 'Hero Workout'),
	(4, 'Custom', 'Custom Workout');

INSERT INTO score_type (_id, name, description) VALUES
	(1, 'Time', 'Best time'),
	(2, 'Reps', 'Maximum repititions'),
	(3, 'Weight', 'Most weight');

INSERT INTO workout (name, description, workout_type_id, record_type_id) VALUES
	-- Girls
	('Angie', '100 Pull-ups, 100 Push-ups, 100 Sit-ups, 100 squats', 2, 1),
	('Barbara', '20 Pull-ups, 30 Push-ups, 40 Sit-ups, 50 Squats, 5 rounds', 2, 1),
	('Chelsea', '5 Pull-ups, 10 Push-ups, 15 Squats, 30 min', 2, 2),
	('Cindy', '5 Pull-ups, 10 Push-ups, 15 Squats, 20 min', 2, 2),
	('Diane', 'Deadlift 225 lbs, Handstand push-ups, 21-5-9', 2, 1),
	('Elizabeth', 'Clean 135lbs, Ring Dips, 21-5-9', 2, 1),
	('Fran', 'Thruster 95lbs, Pull-ups, 21-5-9', 2, 1),
	('Grace', 'Clean and Jerk 135lbs, 30 reps', 2, 1),
	('Helen', '400m run, 1.5 pood KB swing x21, Pull-ups 12 reps', 2, 1),
	('Isabel', 'Snatch 135lbs, 30 reps', 3, 1),
	('Jackie', '1000m row, 50 Thrusters 45lbs, 30 Pull-ups', 2, 1),
	('Karen', '150 Wall-ball shots', 2, 1),
	('Linda', 'Deadlift 1.5 BW, Bench BW, Clean 3/4 BW, 10/9/8/7/6/5/4/3/2/1 reps', 2, 1),
	('Mary', '5 Handstand push-ups, 10 1-leg squats, 15 Pull-ups, 20min', 2, 2),
	('Nancy', '400m run, 15 Overhead squat 95lbs, 5 rounds', 2, 1),
	
	-- New Girls
	('Annie', 'Double unders, Sit-ups, 50/40/30/20/10 rounds', 2, 1),
	('Eva', '800m Run, 2 pood KB swing x30, 30 Pull-ups, 5 rounds', 2, 1),
	('Kelly', '400m Run, 30 24in box jump, 30 20lb Wall-ball shot, 5 rounds', 2, 1),
	('Lynne', 'Bodyweight benchpress, Pull-ups, 5 rounds', 2, 2),
	('Nicole', '400m Run, Pull-ups, 20min', 2, 2),
	
	-- Heroes? Holy shit there seem to be a lot of these...
	('JT', 'Handstand push-ups, Ring dips, Push-ups, 21-15-9', 3, 1),
	('Michael', '800m Run, 50 back extensions, 50 sit-ups, 3 rounds', 3, 1),
	('Murph', '1 mile run, 100 Pull-ups, 200 Push-ups, 300 Squats, 1 mile run', 3, 1),
	('Daniel', '50 Pull-ups, 400m run, 95lb Thruster x21, 800m run, 95lb Thruster x21, 400m Run, 50 Pull-ups', 3, 1),
	('Josh', '95lb Overhead Squat x21, 42 Pull-ups, 95lb Overhead Squat x15, 30 Pull-ups, 95lb Overhead Squat x9, 18 Pull-ups', 3, 1),
	('Jason', '100 Squats, 5 Muscle-ups, 75 Squats, 10 Muscle-ups, 50 Squats, 15 Muscle-ups, 25 Squats, 20 Muscle-ups', 3, 1),
	('Badger', '95lb Squat clean x30, 30 Pull-ups, 800m, 3 rounds', 3, 1),
	('Joshie', '40lb R Dumbbell snatch x21, 21 L Pull-ups, 40lb L Dumbbell snatch x21, 21 L pull-ups, 3 rounds', 3, 1),
	('Nate', '2 muscle-ups, 4 Handstand Push-ups, 8 2 ppd KB swing, 20 min', 3, 2),
	('Randy', '75 power snatch, 75 reps', 3, 1);
	