--   -------------------------------------------------- 
--   Generated by Enterprise Architect Version 9.2.921
--   Created On : Tuesday, 21 August, 2012 
--   DBMS       : MySql 
--   -------------------------------------------------- 


SET FOREIGN_KEY_CHECKS=0;


--  Drop Tables, Stored Procedures and Views 

DROP TABLE IF EXISTS configuration CASCADE;
DROP TABLE IF EXISTS device_type CASCADE;
DROP TABLE IF EXISTS fnc_system CASCADE;
DROP TABLE IF EXISTS signal_domain CASCADE;
DROP TABLE IF EXISTS signal_suffix CASCADE;
DROP TABLE IF EXISTS signal_type CASCADE;
DROP TABLE IF EXISTS subsystem CASCADE;
DROP VIEW IF EXISTS Class1 CASCADE;

--  Create Tables 
CREATE TABLE configuration
(
	name VARCHAR(64) NOT NULL,
	value VARCHAR(128),
	PRIMARY KEY (name)

) ;


CREATE TABLE device_type
(
	code VARCHAR(8) NOT NULL,
	instance VARCHAR(4) COMMENT 'The instance of the system:   n or nn from the naming convention ',
	description VARCHAR(255),
	date_modified DATE,
	modified_by VARCHAR(64),
	PRIMARY KEY (code)

) ;


CREATE TABLE fnc_system
(
	code VARCHAR(4) NOT NULL,
	instance VARCHAR(4) COMMENT 'The instance of the system:   n or nn from the naming convention ',
	description VARCHAR(255),
	date_modified DATE,
	modified_by VARCHAR(64),
	PRIMARY KEY (code)

) ;


CREATE TABLE signal_domain
(
	code VARCHAR(4) NOT NULL,
	instance VARCHAR(4) COMMENT 'For future use. Currently not needed. ',
	description VARCHAR(255),
	date_modified DATE,
	modified_by VARCHAR(64),
	PRIMARY KEY (code)

) ;


CREATE TABLE signal_suffix
(
	code VARCHAR(4) NOT NULL,
	instance VARCHAR(4) COMMENT 'For future use. Currently not needed. ',
	description VARCHAR(255),
	date_modified DATE,
	modified_by VARCHAR(64),
	PRIMARY KEY (code)

) ;


CREATE TABLE signal_type
(
	code VARCHAR(8) NOT NULL,
	instance VARCHAR(4) COMMENT 'For future use. Currently not needed. ',
	description VARCHAR(255),
	date_modified DATE,
	modified_by VARCHAR(64),
	PRIMARY KEY (code)

) ;


CREATE TABLE subsystem
(
	code VARCHAR(8) NOT NULL,
	instance VARCHAR(4) COMMENT 'The instance of the system:   n or nn from the naming convention ',
	description VARCHAR(255),
	date_modified DATE,
	modified_by VARCHAR(64),
	PRIMARY KEY (code)

) ;



SET FOREIGN_KEY_CHECKS=1;



--  Create Views 
create view fnc_name(id, category, code, instance,  description, date_modified,
modified_by) as
select concat('sys.', code) as id, 'System' as category, code, instance, descrip
tion, date_modified, modified_by from device_type
union
select concat('subs.', code) as id,'Subsystem' as category, code, instance, desc
ription, date_modified, modified_by from subsystem
union
select concat('dev.', code) as id,'Device Type' as category, code, instance, des
cription, date_modified, modified_by from device_type
union
select concat('sigt.', code) as id,'Signal Type' as category, code, "", descript
ion, date_modified, modified_by from signal_type
union
select concat('sigd.', code) as id,'Signal Domain' as category, code, "", descri
ption, date_modified, modified_by from signal_domain
union
select concat('sigs.', code) as id,'Signal Suffix' as category, code, "", descri
ption, date_modified, modified_by from signal_suffix;;
