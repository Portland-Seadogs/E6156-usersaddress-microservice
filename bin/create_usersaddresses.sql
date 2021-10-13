CREATE DATABASE  IF NOT EXISTS `UsersAddresses`;

use `UsersAddresses`;

DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `address`;

create table users
(
	ID int auto_increment,
	nameLast varchar(32) null,
	nameFirst varchar(32) null,
	email varchar(32) null,
	addressID int null,
	constraint users_pk
		primary key (ID)
);

create unique index users_email_uindex
	on users (email);


create table address
(
	ID int not null,
	streetNo int null,
	streetName1 varchar(32) null,
	streetName2 varchar(32) null,
	city varchar(32) null,
	region varchar(32) null,
	countryCode varchar(32) null,
	postalCode varchar(32) null,
	constraint address_pk
		primary key (ID)
);

alter table users
	add constraint users_address_ID_fk
		foreign key (addressID) references address (ID);
