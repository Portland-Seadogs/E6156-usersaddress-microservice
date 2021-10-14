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
	ID int auto_increment,
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

use UsersAddresses;
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (1, '873', 'Homewood', 'Dwight', 'Suay', 'Philippines', 'PH', '8708');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (2, '29318', 'Mitchell', 'Meadow Valley', 'Kabale', 'Uganda', 'UG', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (3, '3', 'Independence', 'Gateway', 'Lechinkay', 'Russia', 'RU', '361405');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (4, '0720', 'Harper', 'Basil', 'Jansenville', 'South Africa', 'ZA', '6265');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (5, '74', 'Basil', 'Moose', 'Shuanglong', 'China', 'CN', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (6, '75335', 'Graceland', 'Spenser', 'Sudoměřice', 'Czech Republic', 'CZ', '696 66');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (7, '271', 'Eastwood', 'Kingsford', 'Millerovo', 'Russia', 'RU', '346134');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (8, '323', 'Red Cloud', 'Larry', 'Clermont-Ferrand', 'France', 'FR', '63057 CEDEX 1');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (9, '25892', 'Hallows', 'Saint Paul', 'Daveluyville', 'Canada', 'CA', 'R3P');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (10, '47736', 'Luster', 'Northfield', 'Rubio', 'Venezuela', 'VE', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (11, '4', 'Schiller', 'Rigney', 'Puerto Berrío', 'Colombia', 'CO', '053428');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (12, '4570', 'Bashford', 'Melrose', 'Rufino', 'Argentina', 'AR', '6100');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (13, '8', 'Meadow Valley', 'Monica', 'Maqian', 'China', 'CN', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (14, '68467', 'Mosinee', 'Westport', 'Candelaria', 'Colombia', 'CO', '111711');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (15, '540', 'Park Meadow', 'Clove', 'Now Zād', 'Afghanistan', 'AF', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (16, '8833', 'Northfield', 'Debra', 'Honggang', 'China', 'CN', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (17, '16', 'Portage', 'Anhalt', 'Turinsk', 'Russia', 'RU', '623900');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (18, '53', 'Artisan', 'Kim', 'São Paio de Seide', 'Portugal', 'PT', '4770-665');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (19, '1', 'Westerfield', 'Londonderry', 'Bardalah', 'Palestinian Territory', 'PS', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (20, '2540', '3rd', 'Reindahl', 'Puente Alto', 'Chile', 'CL', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (21, '90', 'Elmside', 'Nancy', 'El Ocotón', 'Honduras', 'HN', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (22, '7945', 'Beilfuss', 'Nova', 'Malimaneek', 'Indonesia', 'ID', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (23, '8549', 'Manufacturers', 'Farmco', 'Bogovinje', 'Macedonia', 'MK', '1220');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (24, '4256', 'Continental', 'Toban', 'San Vicente', 'Argentina', 'AR', '4608');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (25, '8', 'Dexter', 'Crescent Oaks', 'Zagórów', 'Poland', 'PL', '62-410');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (26, '53', 'Pleasure', 'Onsgard', 'Halong', 'Indonesia', 'ID', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (27, '20439', 'Rockefeller', 'Mcguire', 'Ponjen', 'Indonesia', 'ID', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (28, '3', 'Talmadge', 'Kipling', 'Kunyang', 'China', 'CN', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (29, '9520', 'Stang', 'Mitchell', 'Borovany', 'Czech Republic', 'CZ', '348 02');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (30, '87294', 'Shoshone', 'Everett', 'Louguan', 'China', 'CN', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (31, '94648', 'Colorado', 'Laurel', 'Kembang', 'Indonesia', 'ID', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (32, '3', 'Reindahl', 'Sutherland', 'Aviá Terai', 'Argentina', 'AR', '3706');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (33, '1068', 'Walton', 'Pawling', 'Yinying', 'China', 'CN', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (34, '3763', 'Corscot', 'Twin Pines', 'Ouaoula', 'Morocco', 'MA', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (35, '638', 'Tennyson', 'Pawling', 'Bibinje', 'Croatia', 'HR', '23205');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (36, '546', 'Fuller', 'Stephen', 'Grati Satu', 'Indonesia', 'ID', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (37, '84', 'Calypso', 'Springs', 'Vaiusu', 'Samoa', 'WS', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (38, '30', 'Holmberg', 'Division', 'Chaihu', 'China', 'CN', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (39, '1', 'Springview', 'Ramsey', 'Hobor', 'China', 'CN', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (40, '3254', 'Fremont', 'Pine View', 'Boliney', 'Philippines', 'PH', '2815');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (41, '80687', 'Grover', 'Ruskin', 'Samannūd', 'Egypt', 'EG', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (42, '1', 'Eastwood', 'Evergreen', 'Richmond', 'United States', 'US', '94807');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (43, '62', 'Vera', 'Sutteridge', 'Yiqian', 'China', 'CN', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (44, '307', 'Texas', 'Harper', 'Jambulang', 'Indonesia', 'ID', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (45, '9', 'Green Ridge', 'Bowman', 'Cosne-Cours-sur-Loire', 'France', 'FR', '58209 CEDEX');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (46, '47', 'Parkside', 'Eggendart', 'La Loma', 'Mexico', 'MX', '92148');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (47, '59357', 'Sutherland', 'Mccormick', 'Salogon', 'Philippines', 'PH', '4425');
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (48, '8', 'Vera', 'Fremont', 'Sahnaiya', 'Syria', 'SY', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (49, '2367', 'Merchant', 'Harper', 'Changshan', 'China', 'CN', null);
insert into address (ID, streetNo, streetName1, streetName2, city, region, countryCode, postalCode) values (50, '302', '8th', 'Katie', 'Zābolī', 'Iran', 'IR', null);

insert into users (ID, nameLast, nameFirst, email, addressID) values (1, 'Jessamine', 'Bloan', 'jbloan0@mozilla.com', 37);
insert into users (ID, nameLast, nameFirst, email, addressID) values (2, 'Dannie', 'Schule', 'dschule1@biblegateway.com', 30);
insert into users (ID, nameLast, nameFirst, email, addressID) values (3, 'Dianemarie', 'Medland', 'dmedland2@elpais.com', 38);
insert into users (ID, nameLast, nameFirst, email, addressID) values (4, 'Monah', 'Frankum', 'mfrankum3@cyberchimps.com', 25);
insert into users (ID, nameLast, nameFirst, email, addressID) values (5, 'Ariella', 'Halward', 'ahalward4@sciencedirect.com', 44);
insert into users (ID, nameLast, nameFirst, email, addressID) values (6, 'Forest', 'Garey', 'fgarey5@google.com', 46);
insert into users (ID, nameLast, nameFirst, email, addressID) values (7, 'Jimmy', 'Kennford', 'jkennford6@nps.gov', 15);
insert into users (ID, nameLast, nameFirst, email, addressID) values (8, 'Clarisse', 'Whitehorn', 'cwhitehorn7@merriam-webster.com', 44);
insert into users (ID, nameLast, nameFirst, email, addressID) values (9, 'Brendan', 'Semerad', 'bsemerad8@creativecommons.org', 42);
insert into users (ID, nameLast, nameFirst, email, addressID) values (10, 'Stearne', 'Maciejewski', 'smaciejewski9@skyrock.com', 13);
insert into users (ID, nameLast, nameFirst, email, addressID) values (11, 'Thaddus', 'Charlotte', 'tcharlottea@mysql.com', 36);
insert into users (ID, nameLast, nameFirst, email, addressID) values (12, 'Elianore', 'Foucar', 'efoucarb@purevolume.com', 38);
insert into users (ID, nameLast, nameFirst, email, addressID) values (13, 'Ella', 'Faulconer', 'efaulconerc@qq.com', 9);
insert into users (ID, nameLast, nameFirst, email, addressID) values (14, 'Ludwig', 'Allcock', 'lallcockd@godaddy.com', 35);
insert into users (ID, nameLast, nameFirst, email, addressID) values (15, 'Thelma', 'Askew', 'taskewe@clickbank.net', 31);
insert into users (ID, nameLast, nameFirst, email, addressID) values (16, 'Mattie', 'Ianno', 'miannof@comcast.net', 47);
insert into users (ID, nameLast, nameFirst, email, addressID) values (17, 'Kerry', 'Ibbett', 'kibbettg@opera.com', 46);
insert into users (ID, nameLast, nameFirst, email, addressID) values (18, 'Nelly', 'Nasi', 'nnasih@51.la', 48);
insert into users (ID, nameLast, nameFirst, email, addressID) values (19, 'Odo', 'Whatford', 'owhatfordi@forbes.com', 23);
insert into users (ID, nameLast, nameFirst, email, addressID) values (20, 'Almire', 'Bulford', 'abulfordj@nhs.uk', 45);
insert into users (ID, nameLast, nameFirst, email, addressID) values (21, 'Phillipe', 'Vowells', 'pvowellsk@over-blog.com', 40);
insert into users (ID, nameLast, nameFirst, email, addressID) values (22, 'Rodina', 'Scade', 'rscadel@devhub.com', 49);
insert into users (ID, nameLast, nameFirst, email, addressID) values (23, 'Deane', 'Mayer', 'dmayerm@wikispaces.com', 29);
insert into users (ID, nameLast, nameFirst, email, addressID) values (24, 'Kellyann', 'Briatt', 'kbriattn@miitbeian.gov.cn', 50);
insert into users (ID, nameLast, nameFirst, email, addressID) values (25, 'Harriet', 'Lyddy', 'hlyddyo@51.la', 39);
insert into users (ID, nameLast, nameFirst, email, addressID) values (26, 'Jefferey', 'Fant', 'jfantp@chronoengine.com', 21);
insert into users (ID, nameLast, nameFirst, email, addressID) values (27, 'Lauree', 'Bearham', 'lbearhamq@nps.gov', 3);
insert into users (ID, nameLast, nameFirst, email, addressID) values (28, 'Ashien', 'Tink', 'atinkr@apache.org', 48);
insert into users (ID, nameLast, nameFirst, email, addressID) values (29, 'Pace', 'Hounson', 'phounsons@dell.com', 20);
insert into users (ID, nameLast, nameFirst, email, addressID) values (30, 'Lucio', 'Beernt', 'lbeerntt@earthlink.net', 35);
insert into users (ID, nameLast, nameFirst, email, addressID) values (31, 'Clareta', 'Tydd', 'ctyddu@bloglines.com', 37);
insert into users (ID, nameLast, nameFirst, email, addressID) values (32, 'Bess', 'Purdy', 'bpurdyv@gov.uk', 16);
insert into users (ID, nameLast, nameFirst, email, addressID) values (33, 'Arden', 'Keedy', 'akeedyw@huffingtonpost.com', 38);
insert into users (ID, nameLast, nameFirst, email, addressID) values (34, 'Celka', 'Rebert', 'crebertx@vkontakte.ru', 24);
insert into users (ID, nameLast, nameFirst, email, addressID) values (35, 'Raphaela', 'Knobell', 'rknobelly@storify.com', 16);
insert into users (ID, nameLast, nameFirst, email, addressID) values (36, 'Ilario', 'Endicott', 'iendicottz@epa.gov', 27);
insert into users (ID, nameLast, nameFirst, email, addressID) values (37, 'Goran', 'Jacke', 'gjacke10@hibu.com', 27);
insert into users (ID, nameLast, nameFirst, email, addressID) values (38, 'Delainey', 'Forty', 'dforty11@slideshare.net', 11);
insert into users (ID, nameLast, nameFirst, email, addressID) values (39, 'Dino', 'Scheu', 'dscheu12@etsy.com', 10);
insert into users (ID, nameLast, nameFirst, email, addressID) values (40, 'Bettina', 'Mansuer', 'bmansuer13@google.fr', 43);
insert into users (ID, nameLast, nameFirst, email, addressID) values (41, 'Mickie', 'Zaniolini', 'mzaniolini14@google.de', 14);
insert into users (ID, nameLast, nameFirst, email, addressID) values (42, 'Marthena', 'Bevis', 'mbevis15@elegantthemes.com', 38);
insert into users (ID, nameLast, nameFirst, email, addressID) values (43, 'Marinna', 'Mariotte', 'mmariotte16@cam.ac.uk', 25);
insert into users (ID, nameLast, nameFirst, email, addressID) values (44, 'Everett', 'Denekamp', 'edenekamp17@dot.gov', 43);
insert into users (ID, nameLast, nameFirst, email, addressID) values (45, 'Shanta', 'Vuitton', 'svuitton18@umn.edu', 40);
insert into users (ID, nameLast, nameFirst, email, addressID) values (46, 'Marje', 'Easby', 'measby19@creativecommons.org', 7);
insert into users (ID, nameLast, nameFirst, email, addressID) values (47, 'Esteban', 'Hartless', 'ehartless1a@loc.gov', 29);
insert into users (ID, nameLast, nameFirst, email, addressID) values (48, 'Gena', 'Petriello', 'gpetriello1b@bandcamp.com', 43);
insert into users (ID, nameLast, nameFirst, email, addressID) values (49, 'Nicolais', 'Fabbri', 'nfabbri1c@alexa.com', 43);
insert into users (ID, nameLast, nameFirst, email, addressID) values (50, 'Merrick', 'Ashworth', 'mashworth1d@webnode.com', 24);
insert into users (ID, nameLast, nameFirst, email, addressID) values (51, 'Valdemar', 'McLaren', 'vmclaren1e@quantcast.com', 26);
insert into users (ID, nameLast, nameFirst, email, addressID) values (52, 'Maren', 'Pickthorn', 'mpickthorn1f@tuttocitta.it', 41);
insert into users (ID, nameLast, nameFirst, email, addressID) values (53, 'Adelina', 'Strover', 'astrover1g@prlog.org', 30);
insert into users (ID, nameLast, nameFirst, email, addressID) values (54, 'Baron', 'Jelk', 'bjelk1h@constantcontact.com', 48);
insert into users (ID, nameLast, nameFirst, email, addressID) values (55, 'Dugald', 'Huws', 'dhuws1i@bbb.org', 44);
insert into users (ID, nameLast, nameFirst, email, addressID) values (56, 'Hillery', 'Dunn', 'hdunn1j@opera.com', 3);
insert into users (ID, nameLast, nameFirst, email, addressID) values (57, 'Erik', 'Dawidowicz', 'edawidowicz1k@goodreads.com', 19);
insert into users (ID, nameLast, nameFirst, email, addressID) values (58, 'Mayer', 'Le Jean', 'mlejean1l@nydailynews.com', 38);
insert into users (ID, nameLast, nameFirst, email, addressID) values (59, 'Ody', 'Fleckness', 'ofleckness1m@over-blog.com', 8);
insert into users (ID, nameLast, nameFirst, email, addressID) values (60, 'Bailey', 'Tims', 'btims1n@ox.ac.uk', 41);
insert into users (ID, nameLast, nameFirst, email, addressID) values (61, 'Meggi', 'Fannin', 'mfannin1o@admin.ch', 13);
insert into users (ID, nameLast, nameFirst, email, addressID) values (62, 'Theo', 'Courvert', 'tcourvert1p@spotify.com', 22);
insert into users (ID, nameLast, nameFirst, email, addressID) values (63, 'Row', 'Kenward', 'rkenward1q@statcounter.com', 45);
insert into users (ID, nameLast, nameFirst, email, addressID) values (64, 'Cordula', 'Fiske', 'cfiske1r@privacy.gov.au', 21);
insert into users (ID, nameLast, nameFirst, email, addressID) values (65, 'Nate', 'Booy', 'nbooy1s@hc360.com', 23);
insert into users (ID, nameLast, nameFirst, email, addressID) values (66, 'Selby', 'Fevers', 'sfevers1t@i2i.jp', 14);
insert into users (ID, nameLast, nameFirst, email, addressID) values (67, 'Cory', 'Bateson', 'cbateson1u@zimbio.com', 27);
insert into users (ID, nameLast, nameFirst, email, addressID) values (68, 'Magdaia', 'Corthes', 'mcorthes1v@themeforest.net', 44);
insert into users (ID, nameLast, nameFirst, email, addressID) values (69, 'Dorthea', 'Yallowley', 'dyallowley1w@freewebs.com', 50);
insert into users (ID, nameLast, nameFirst, email, addressID) values (70, 'Bessy', 'Cheyney', 'bcheyney1x@umn.edu', 32);
insert into users (ID, nameLast, nameFirst, email, addressID) values (71, 'Karena', 'Coram', 'kcoram1y@hugedomains.com', 21);
insert into users (ID, nameLast, nameFirst, email, addressID) values (72, 'Madelaine', 'McNay', 'mmcnay1z@networkadvertising.org', 38);
insert into users (ID, nameLast, nameFirst, email, addressID) values (73, 'Saunders', 'Simioli', 'ssimioli20@sakura.ne.jp', 46);
insert into users (ID, nameLast, nameFirst, email, addressID) values (74, 'Mariya', 'O''Scollain', 'moscollain21@blog.com', 50);
insert into users (ID, nameLast, nameFirst, email, addressID) values (75, 'Sheba', 'Hawtin', 'shawtin22@princeton.edu', 23);
insert into users (ID, nameLast, nameFirst, email, addressID) values (76, 'Mack', 'Assante', 'massante23@netscape.com', 31);
insert into users (ID, nameLast, nameFirst, email, addressID) values (77, 'Gwenette', 'Girtin', 'ggirtin24@pagesperso-orange.fr', 14);
insert into users (ID, nameLast, nameFirst, email, addressID) values (78, 'Desdemona', 'Lytell', 'dlytell25@weebly.com', 9);
insert into users (ID, nameLast, nameFirst, email, addressID) values (79, 'Benedikt', 'Olesen', 'bolesen26@hud.gov', 19);
insert into users (ID, nameLast, nameFirst, email, addressID) values (80, 'Cart', 'Dealtry', 'cdealtry27@dagondesign.com', 34);
insert into users (ID, nameLast, nameFirst, email, addressID) values (81, 'Brandi', 'Kellert', 'bkellert28@behance.net', 12);
insert into users (ID, nameLast, nameFirst, email, addressID) values (82, 'Cordy', 'Horrigan', 'chorrigan29@biblegateway.com', 47);
insert into users (ID, nameLast, nameFirst, email, addressID) values (83, 'Roz', 'Klampt', 'rklampt2a@flavors.me', 24);
insert into users (ID, nameLast, nameFirst, email, addressID) values (84, 'Vincenz', 'Barosch', 'vbarosch2b@bing.com', 27);
insert into users (ID, nameLast, nameFirst, email, addressID) values (85, 'Hamlen', 'Astridge', 'hastridge2c@cdbaby.com', 1);
insert into users (ID, nameLast, nameFirst, email, addressID) values (86, 'Janot', 'Barthrup', 'jbarthrup2d@blogger.com', 27);
insert into users (ID, nameLast, nameFirst, email, addressID) values (87, 'Josias', 'Elcoux', 'jelcoux2e@elpais.com', 5);
insert into users (ID, nameLast, nameFirst, email, addressID) values (88, 'Ryon', 'Ghiroldi', 'rghiroldi2f@github.io', 16);
insert into users (ID, nameLast, nameFirst, email, addressID) values (89, 'Salomo', 'Cowlas', 'scowlas2g@surveymonkey.com', 29);
insert into users (ID, nameLast, nameFirst, email, addressID) values (90, 'Oneida', 'Setch', 'osetch2h@netlog.com', 6);
insert into users (ID, nameLast, nameFirst, email, addressID) values (91, 'Idell', 'O'' Finan', 'iofinan2i@123-reg.co.uk', 41);
insert into users (ID, nameLast, nameFirst, email, addressID) values (92, 'Welch', 'Mc Menamin', 'wmcmenamin2j@addthis.com', 50);
insert into users (ID, nameLast, nameFirst, email, addressID) values (93, 'Raine', 'Elgey', 'relgey2k@g.co', 8);
insert into users (ID, nameLast, nameFirst, email, addressID) values (94, 'Mame', 'Di Roberto', 'mdiroberto2l@prnewswire.com', 37);
insert into users (ID, nameLast, nameFirst, email, addressID) values (95, 'Tallie', 'Giacoppoli', 'tgiacoppoli2m@oaic.gov.au', 6);
insert into users (ID, nameLast, nameFirst, email, addressID) values (96, 'Maurits', 'Dubique', 'mdubique2n@symantec.com', 36);
insert into users (ID, nameLast, nameFirst, email, addressID) values (97, 'Dame', 'Kenwyn', 'dkenwyn2o@abc.net.au', 20);
insert into users (ID, nameLast, nameFirst, email, addressID) values (98, 'Richie', 'Yurocjhin', 'ryurocjhin2p@joomla.org', 25);
insert into users (ID, nameLast, nameFirst, email, addressID) values (99, 'Chaddy', 'Jeanes', 'cjeanes2q@geocities.com', 44);
insert into users (ID, nameLast, nameFirst, email, addressID) values (100, 'Oralia', 'Basek', 'obasek2r@alibaba.com', 47);
