CREATE DATABASE  IF NOT EXISTS `UsersAddresses`;

use `UsersAddresses`;

DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `address`;

create table users
(
	ID int auto_increment,
	nameLast varchar(32) null,
	nameFirst varchar(32) null,
	email varchar(120) null,
	addressID int null,
	constraint users_pk
		primary key (ID)
);

create unique index users_email_uindex
	on users (email);

create table address
(
	ID int auto_increment,
	street varchar(120) NOT NULL,
	street2 varchar(120) null,
	city varchar(32) null,
	state varchar(32) null,
	zipcode int null,
	constraint address_pk
		primary key (ID)
);

alter table users
	add constraint users_address_ID_fk
		foreign key (addressID) references address (ID);

insert into address(street, city, state, zipcode) VALUES
('777 Brockton Avenue','Abington','MA',2351),
('30 Memorial Drive','Avon','MA',2322),
('250 Hartford Avenue','Bellingham','MA',2019),
('700 Oak Street','Brockton','MA',2301),
('66-4 Parkhurst Rd','Chelmsford','MA',1824),
('591 Memorial Dr','Chicopee','MA',1020),
('55 Brooksby Village Way','Danvers','MA',1923),
('137 Teaticket Hwy','East Falmouth','MA',2536),
('42 Fairhaven Commons Way','Fairhaven','MA',2719),
('374 William S Canning Blvd','Fall River','MA',2721),
('121 Worcester Rd','Framingham','MA',1701),
('677 Timpany Blvd','Gardner','MA',1440),
('337 Russell St','Hadley','MA',1035),
('295 Plymouth Street','Halifax','MA',2338),
('1775 Washington St','Hanover','MA',2339),
('280 Washington Street','Hudson','MA',1749),
('20 Soojian Dr','Leicester','MA',1524),
('11 Jungle Road','Leominster','MA',1453),
('301 Massachusetts Ave','Lunenburg','MA',1462),
('780 Lynnway','Lynn','MA',1905),
('70 Pleasant Valley Street','Methuen','MA',1844),
('830 Curran Memorial Hwy','North Adams','MA',1247),
('1470 S Washington St','North Attleboro','MA',2760),
('506 State Road','North Dartmouth','MA',2747),
('742 Main Street','North Oxford','MA',1537),
('72 Main St','North Reading','MA',1864),
('200 Otis Street','Northborough','MA',1532),
('180 North King Street','Northhampton','MA',1060),
('555 East Main St','Orange','MA',1364),
('555 Hubbard Ave-Suite 12','Pittsfield','MA',1201),
('300 Colony Place','Plymouth','MA',2360),
('301 Falls Blvd','Quincy','MA',2169),
('36 Paramount Drive','Raynham','MA',2767),
('450 Highland Ave','Salem','MA',1970),
('1180 Fall River Avenue','Seekonk','MA',2771),
('1105 Boston Road','Springfield','MA',1119),
('100 Charlton Road','Sturbridge','MA',1566),
('262 Swansea Mall Dr','Swansea','MA',2777),
('333 Main Street','Tewksbury','MA',1876),
('550 Providence Hwy','Walpole','MA',2081),
('352 Palmer Road','Ware','MA',1082),
('3005 Cranberry Hwy Rt 6 28','Wareham','MA',2538),
('250 Rt 59','Airmont','NY',10901),
('141 Washington Ave Extension','Albany','NY',12205),
('13858 Rt 31 W','Albion','NY',14411),
('2055 Niagara Falls Blvd','Amherst','NY',14228),
('101 Sanford Farm Shpg Center','Amsterdam','NY',12010),
('297 Grant Avenue','Auburn','NY',13021),
('4133 Veterans Memorial Drive','Batavia','NY',14020),
('6265 Brockport Spencerport Rd','Brockport','NY',14420),
('5399 W Genesse St','Camillus','NY',13031),
('3191 County rd 10','Canandaigua','NY',14424);

insert into users (ID, nameLast, nameFirst, email, addressID) values (1, 'Flight', 'Jeri', 'jflight0@booking.com', 25);
insert into users (ID, nameLast, nameFirst, email, addressID) values (2, 'Carrol', 'Ronnie', 'rcarrol1@shinystat.com', 34);
insert into users (ID, nameLast, nameFirst, email, addressID) values (3, 'Rohlfing', 'Delora', 'drohlfing2@simplemachines.org', 50);
insert into users (ID, nameLast, nameFirst, email, addressID) values (4, 'Milroy', 'Madeleine', 'mmilroy3@bandcamp.com', 16);
insert into users (ID, nameLast, nameFirst, email, addressID) values (5, 'Patek', 'Janette', 'jpatek4@istockphoto.com', 44);
insert into users (ID, nameLast, nameFirst, email, addressID) values (6, 'Jori', 'Kent', 'kjori5@foxnews.com', 3);
insert into users (ID, nameLast, nameFirst, email, addressID) values (7, 'Georgiades', 'Derron', 'dgeorgiades6@umn.edu', 2);
insert into users (ID, nameLast, nameFirst, email, addressID) values (8, 'Oventon', 'Aleece', 'aoventon7@1und1.de', 25);
insert into users (ID, nameLast, nameFirst, email, addressID) values (9, 'Dugood', 'Ediva', 'edugood8@moonfruit.com', 14);
insert into users (ID, nameLast, nameFirst, email, addressID) values (10, 'Dyerson', 'Tonnie', 'tdyerson9@sciencedaily.com', 7);
insert into users (ID, nameLast, nameFirst, email, addressID) values (11, 'Gawen', 'Latisha', 'lgawena@imgur.com', 14);
insert into users (ID, nameLast, nameFirst, email, addressID) values (12, 'Breeze', 'Myron', 'mbreezeb@ox.ac.uk', 48);
insert into users (ID, nameLast, nameFirst, email, addressID) values (13, 'Crocombe', 'Chastity', 'ccrocombec@quantcast.com', 8);
insert into users (ID, nameLast, nameFirst, email, addressID) values (14, 'Vedenyapin', 'Tamera', 'tvedenyapind@columbia.edu', 15);
insert into users (ID, nameLast, nameFirst, email, addressID) values (15, 'Meaker', 'Perry', 'pmeakere@aboutads.info', 30);
insert into users (ID, nameLast, nameFirst, email, addressID) values (16, 'Gariff', 'Cecilla', 'cgarifff@delicious.com', 1);
insert into users (ID, nameLast, nameFirst, email, addressID) values (17, 'Edgson', 'Barnie', 'bedgsong@fc2.com', 1);
insert into users (ID, nameLast, nameFirst, email, addressID) values (18, 'Quilligan', 'Winfield', 'wquilliganh@auda.org.au', 15);
insert into users (ID, nameLast, nameFirst, email, addressID) values (19, 'Float', 'Marigold', 'mfloati@economist.com', 18);
insert into users (ID, nameLast, nameFirst, email, addressID) values (20, 'Goodlatt', 'Andonis', 'agoodlattj@g.co', 51);
insert into users (ID, nameLast, nameFirst, email, addressID) values (21, 'Puvia', 'Venus', 'vpuviak@indiegogo.com', 25);
insert into users (ID, nameLast, nameFirst, email, addressID) values (22, 'Brunelli', 'Cicely', 'cbrunellil@godaddy.com', 48);
insert into users (ID, nameLast, nameFirst, email, addressID) values (23, 'Putley', 'Essy', 'eputleym@discuz.net', 31);
insert into users (ID, nameLast, nameFirst, email, addressID) values (24, 'Slessor', 'Sheelah', 'sslessorn@globo.com', 52);
insert into users (ID, nameLast, nameFirst, email, addressID) values (25, 'Foli', 'Garner', 'gfolio@altervista.org', 18);
insert into users (ID, nameLast, nameFirst, email, addressID) values (26, 'Darnborough', 'Sutherlan', 'sdarnboroughp@wikispaces.com', 43);
insert into users (ID, nameLast, nameFirst, email, addressID) values (27, 'Overthrow', 'Prudence', 'poverthrowq@npr.org', 10);
insert into users (ID, nameLast, nameFirst, email, addressID) values (28, 'Lilie', 'Ardeen', 'alilier@a8.net', 44);
insert into users (ID, nameLast, nameFirst, email, addressID) values (29, 'Lacasa', 'Shanan', 'slacasas@yelp.com', 39);
insert into users (ID, nameLast, nameFirst, email, addressID) values (30, 'Sedworth', 'Stavros', 'ssedwortht@state.gov', 13);
insert into users (ID, nameLast, nameFirst, email, addressID) values (31, 'Faustian', 'Alikee', 'afaustianu@cam.ac.uk', 1);
insert into users (ID, nameLast, nameFirst, email, addressID) values (32, 'Alibone', 'Arne', 'aalibonev@phoca.cz', 40);
insert into users (ID, nameLast, nameFirst, email, addressID) values (33, 'Tregear', 'Derry', 'dtregearw@edublogs.org', 36);
insert into users (ID, nameLast, nameFirst, email, addressID) values (34, 'Diano', 'Tyrus', 'tdianox@wsj.com', 49);
insert into users (ID, nameLast, nameFirst, email, addressID) values (35, 'Craighead', 'Karl', 'kcraigheady@jimdo.com', 8);
insert into users (ID, nameLast, nameFirst, email, addressID) values (36, 'Semmens', 'Kimmy', 'ksemmensz@newyorker.com', 38);
insert into users (ID, nameLast, nameFirst, email, addressID) values (37, 'Cartmel', 'Link', 'lcartmel10@themeforest.net', 6);
insert into users (ID, nameLast, nameFirst, email, addressID) values (38, 'Patnelli', 'Ker', 'kpatnelli11@studiopress.com', 26);
insert into users (ID, nameLast, nameFirst, email, addressID) values (39, 'Rennenbach', 'Micky', 'mrennenbach12@forbes.com', 33);
insert into users (ID, nameLast, nameFirst, email, addressID) values (40, 'Gerran', 'Nancey', 'ngerran13@technorati.com', 21);
insert into users (ID, nameLast, nameFirst, email, addressID) values (41, 'Duffitt', 'Annice', 'aduffitt14@51.la', 21);
insert into users (ID, nameLast, nameFirst, email, addressID) values (42, 'Westgate', 'Fred', 'fwestgate15@nationalgeographic.com', 41);
insert into users (ID, nameLast, nameFirst, email, addressID) values (43, 'Crabtree', 'Stanislaw', 'scrabtree16@fda.gov', 8);
insert into users (ID, nameLast, nameFirst, email, addressID) values (44, 'Glowinski', 'Madlen', 'mglowinski17@comcast.net', 43);
insert into users (ID, nameLast, nameFirst, email, addressID) values (45, 'Crosthwaite', 'Octavia', 'ocrosthwaite18@mashable.com', 42);
insert into users (ID, nameLast, nameFirst, email, addressID) values (46, 'Cadden', 'Joel', 'jcadden19@nih.gov', 17);
insert into users (ID, nameLast, nameFirst, email, addressID) values (47, 'O''Breen', 'Janey', 'jobreen1a@boston.com', 41);
insert into users (ID, nameLast, nameFirst, email, addressID) values (48, 'Barabich', 'Ola', 'obarabich1b@storify.com', 46);
insert into users (ID, nameLast, nameFirst, email, addressID) values (49, 'Salla', 'Modesta', 'msalla1c@skyrock.com', 52);
insert into users (ID, nameLast, nameFirst, email, addressID) values (50, 'Showalter', 'Sashenka', 'sshowalter1d@google.ca', 5);
insert into users (ID, nameLast, nameFirst, email, addressID) values (51, 'Dunnan', 'Jeralee', 'jdunnan1e@networkadvertising.org', 1);
insert into users (ID, nameLast, nameFirst, email, addressID) values (52, 'Tuite', 'Nelia', 'ntuite1f@bbb.org', 33);
insert into users (ID, nameLast, nameFirst, email, addressID) values (53, 'Cordelet', 'Kim', 'kcordelet1g@huffingtonpost.com', 42);
insert into users (ID, nameLast, nameFirst, email, addressID) values (54, 'Lyttle', 'Kippar', 'klyttle1h@auda.org.au', 2);
insert into users (ID, nameLast, nameFirst, email, addressID) values (55, 'Larciere', 'Zaccaria', 'zlarciere1i@youku.com', 22);
insert into users (ID, nameLast, nameFirst, email, addressID) values (56, 'Edwicker', 'Dorie', 'dedwicker1j@xrea.com', 40);
insert into users (ID, nameLast, nameFirst, email, addressID) values (57, 'Dymott', 'Kev', 'kdymott1k@cbslocal.com', 45);
insert into users (ID, nameLast, nameFirst, email, addressID) values (58, 'Drever', 'Stevy', 'sdrever1l@deviantart.com', 44);
insert into users (ID, nameLast, nameFirst, email, addressID) values (59, 'Connachan', 'Georgie', 'gconnachan1m@4shared.com', 34);
insert into users (ID, nameLast, nameFirst, email, addressID) values (60, 'L''Amie', 'Garth', 'glamie1n@google.cn', 37);
insert into users (ID, nameLast, nameFirst, email, addressID) values (61, 'Cluitt', 'Kain', 'kcluitt1o@a8.net', 7);
insert into users (ID, nameLast, nameFirst, email, addressID) values (62, 'Oliveras', 'Happy', 'holiveras1p@example.com', 47);
insert into users (ID, nameLast, nameFirst, email, addressID) values (63, 'Elcombe', 'Allyson', 'aelcombe1q@jiathis.com', 4);
insert into users (ID, nameLast, nameFirst, email, addressID) values (64, 'Hayer', 'Justus', 'jhayer1r@mysql.com', 31);
insert into users (ID, nameLast, nameFirst, email, addressID) values (65, 'Sandhill', 'Tybalt', 'tsandhill1s@ca.gov', 25);
insert into users (ID, nameLast, nameFirst, email, addressID) values (66, 'Dows', 'Jacinda', 'jdows1t@wp.com', 1);
insert into users (ID, nameLast, nameFirst, email, addressID) values (67, 'Banghe', 'Samson', 'sbanghe1u@unicef.org', 39);
insert into users (ID, nameLast, nameFirst, email, addressID) values (68, 'O'' Borne', 'Orin', 'ooborne1v@noaa.gov', 6);
insert into users (ID, nameLast, nameFirst, email, addressID) values (69, 'Shemmin', 'Sheri', 'sshemmin1w@stanford.edu', 7);
insert into users (ID, nameLast, nameFirst, email, addressID) values (70, 'Wasteney', 'Dillon', 'dwasteney1x@ca.gov', 25);
insert into users (ID, nameLast, nameFirst, email, addressID) values (71, 'Grenville', 'Reggy', 'rgrenville1y@ocn.ne.jp', 49);
insert into users (ID, nameLast, nameFirst, email, addressID) values (72, 'Yurshev', 'Lorianna', 'lyurshev1z@wiley.com', 6);
insert into users (ID, nameLast, nameFirst, email, addressID) values (73, 'Munden', 'Madonna', 'mmunden20@sina.com.cn', 16);
insert into users (ID, nameLast, nameFirst, email, addressID) values (74, 'Nulty', 'Phylys', 'pnulty21@about.com', 40);
insert into users (ID, nameLast, nameFirst, email, addressID) values (75, 'Heaviside', 'Bernardine', 'bheaviside22@squidoo.com', 25);
insert into users (ID, nameLast, nameFirst, email, addressID) values (76, 'Gatenby', 'Tynan', 'tgatenby23@auda.org.au', 3);
insert into users (ID, nameLast, nameFirst, email, addressID) values (77, 'Weathers', 'Benedikta', 'bweathers24@geocities.com', 52);
insert into users (ID, nameLast, nameFirst, email, addressID) values (78, 'Keoghan', 'Reg', 'rkeoghan25@jimdo.com', 9);
insert into users (ID, nameLast, nameFirst, email, addressID) values (79, 'Davydoch', 'Kale', 'kdavydoch26@twitpic.com', 51);
insert into users (ID, nameLast, nameFirst, email, addressID) values (80, 'Jouhandeau', 'Dotty', 'djouhandeau27@stanford.edu', 22);
insert into users (ID, nameLast, nameFirst, email, addressID) values (81, 'Narramore', 'Marcella', 'mnarramore28@networksolutions.com', 22);
insert into users (ID, nameLast, nameFirst, email, addressID) values (82, 'Castenda', 'Audra', 'acastenda29@ovh.net', 3);
insert into users (ID, nameLast, nameFirst, email, addressID) values (83, 'Darkott', 'Loy', 'ldarkott2a@yolasite.com', 51);
insert into users (ID, nameLast, nameFirst, email, addressID) values (84, 'Mountain', 'Brander', 'bmountain2b@xrea.com', 9);
insert into users (ID, nameLast, nameFirst, email, addressID) values (85, 'Petrazzi', 'Sandye', 'spetrazzi2c@techcrunch.com', 8);
insert into users (ID, nameLast, nameFirst, email, addressID) values (86, 'Rickersy', 'Ebony', 'erickersy2d@cafepress.com', 14);
insert into users (ID, nameLast, nameFirst, email, addressID) values (87, 'Losemann', 'Yardley', 'ylosemann2e@shareasale.com', 40);
insert into users (ID, nameLast, nameFirst, email, addressID) values (88, 'Shoosmith', 'Tuckie', 'tshoosmith2f@dedecms.com', 40);
insert into users (ID, nameLast, nameFirst, email, addressID) values (89, 'Litchfield', 'Davon', 'dlitchfield2g@wufoo.com', 28);
insert into users (ID, nameLast, nameFirst, email, addressID) values (90, 'MacCome', 'Joy', 'jmaccome2h@loc.gov', 34);
insert into users (ID, nameLast, nameFirst, email, addressID) values (91, 'Reast', 'Luis', 'lreast2i@opensource.org', 47);
insert into users (ID, nameLast, nameFirst, email, addressID) values (92, 'Ellerton', 'Rustin', 'rellerton2j@blogspot.com', 40);
insert into users (ID, nameLast, nameFirst, email, addressID) values (93, 'Fissenden', 'Sibella', 'sfissenden2k@mail.ru', 43);
insert into users (ID, nameLast, nameFirst, email, addressID) values (94, 'Ruger', 'Rudolph', 'rruger2l@digg.com', 27);
insert into users (ID, nameLast, nameFirst, email, addressID) values (95, 'Hirsch', 'Doretta', 'dhirsch2m@tripod.com', 5);
insert into users (ID, nameLast, nameFirst, email, addressID) values (96, 'Schankel', 'Abbey', 'aschankel2n@lycos.com', 50);
insert into users (ID, nameLast, nameFirst, email, addressID) values (97, 'Malling', 'Maryanna', 'mmalling2o@youtube.com', 13);
insert into users (ID, nameLast, nameFirst, email, addressID) values (98, 'Downs', 'Morna', 'mdowns2p@unesco.org', 38);
insert into users (ID, nameLast, nameFirst, email, addressID) values (99, 'Shearstone', 'Jule', 'jshearstone2q@howstuffworks.com', 49);
insert into users (ID, nameLast, nameFirst, email, addressID) values (100, 'Ottewell', 'Barnard', 'bottewell2r@smugmug.com', 50);
insert into users (ID, nameLast, nameFirst, email, addressID) values (101, 'Petroulis', 'Swen', 'spetroulis2s@altervista.org', 34);
insert into users (ID, nameLast, nameFirst, email, addressID) values (102, 'Jopke', 'Dagmar', 'djopke2t@nydailynews.com', 9);
insert into users (ID, nameLast, nameFirst, email, addressID) values (103, 'Arden', 'Norry', 'narden2u@ftc.gov', 25);
insert into users (ID, nameLast, nameFirst, email, addressID) values (104, 'Kerwood', 'Miguela', 'mkerwood2v@istockphoto.com', 9);
insert into users (ID, nameLast, nameFirst, email, addressID) values (105, 'Patterson', 'Artie', 'apatterson2w@scientificamerican.com', 10);
insert into users (ID, nameLast, nameFirst, email, addressID) values (106, 'Rraundl', 'Boyd', 'brraundl2x@hao123.com', 10);
insert into users (ID, nameLast, nameFirst, email, addressID) values (107, 'Nightingale', 'Theo', 'tnightingale2y@over-blog.com', 36);
insert into users (ID, nameLast, nameFirst, email, addressID) values (108, 'Bebbell', 'Lynnet', 'lbebbell2z@nifty.com', 29);
insert into users (ID, nameLast, nameFirst, email, addressID) values (109, 'Etty', 'Cleo', 'cetty30@biglobe.ne.jp', 39);
insert into users (ID, nameLast, nameFirst, email, addressID) values (110, 'Windridge', 'Pail', 'pwindridge31@1und1.de', 7);
insert into users (ID, nameLast, nameFirst, email, addressID) values (111, 'Barford', 'Tabor', 'tbarford32@scribd.com', 45);
insert into users (ID, nameLast, nameFirst, email, addressID) values (112, 'Blackborn', 'Sula', 'sblackborn33@cnn.com', 7);
insert into users (ID, nameLast, nameFirst, email, addressID) values (113, 'Brill', 'Ophelia', 'obrill34@pcworld.com', 27);
insert into users (ID, nameLast, nameFirst, email, addressID) values (114, 'Benzi', 'Horton', 'hbenzi35@who.int', 22);
insert into users (ID, nameLast, nameFirst, email, addressID) values (115, 'Scatchard', 'Camella', 'cscatchard36@state.gov', 14);
insert into users (ID, nameLast, nameFirst, email, addressID) values (116, 'Eagles', 'Meridith', 'meagles37@samsung.com', 5);
insert into users (ID, nameLast, nameFirst, email, addressID) values (117, 'Dunlop', 'Uri', 'udunlop38@dailymotion.com', 25);
insert into users (ID, nameLast, nameFirst, email, addressID) values (118, 'Skakunas', 'Cathryn', 'cskakunas39@histats.com', 5);
insert into users (ID, nameLast, nameFirst, email, addressID) values (119, 'Heckney', 'Tome', 'theckney3a@blogger.com', 39);
insert into users (ID, nameLast, nameFirst, email, addressID) values (120, 'Beatens', 'Corbie', 'cbeatens3b@hibu.com', 26);
insert into users (ID, nameLast, nameFirst, email, addressID) values (121, 'Gerrietz', 'Joyous', 'jgerrietz3c@51.la', 12);
insert into users (ID, nameLast, nameFirst, email, addressID) values (122, 'Jewes', 'Chucho', 'cjewes3d@moonfruit.com', 39);
insert into users (ID, nameLast, nameFirst, email, addressID) values (123, 'Ledwich', 'Karita', 'kledwich3e@umich.edu', 47);
insert into users (ID, nameLast, nameFirst, email, addressID) values (124, 'Deschlein', 'Pavia', 'pdeschlein3f@ycombinator.com', 33);
insert into users (ID, nameLast, nameFirst, email, addressID) values (125, 'Alesin', 'Chiquia', 'calesin3g@unesco.org', 7);
insert into users (ID, nameLast, nameFirst, email, addressID) values (126, 'Takos', 'Nataniel', 'ntakos3h@nih.gov', 23);
insert into users (ID, nameLast, nameFirst, email, addressID) values (127, 'Swale', 'Bernarr', 'bswale3i@youtu.be', 45);
insert into users (ID, nameLast, nameFirst, email, addressID) values (128, 'Hasely', 'Zechariah', 'zhasely3j@acquirethisname.com', 38);
insert into users (ID, nameLast, nameFirst, email, addressID) values (129, 'Banfield', 'Priscilla', 'pbanfield3k@webeden.co.uk', 11);
insert into users (ID, nameLast, nameFirst, email, addressID) values (130, 'Maillard', 'Ray', 'rmaillard3l@flickr.com', 48);
insert into users (ID, nameLast, nameFirst, email, addressID) values (131, 'Sushams', 'Ethelin', 'esushams3m@weibo.com', 5);
insert into users (ID, nameLast, nameFirst, email, addressID) values (132, 'Lux', 'Carolyne', 'clux3n@hugedomains.com', 44);
insert into users (ID, nameLast, nameFirst, email, addressID) values (133, 'Sebastian', 'Hewie', 'hsebastian3o@cam.ac.uk', 19);
insert into users (ID, nameLast, nameFirst, email, addressID) values (134, 'Richen', 'Creight', 'crichen3p@cyberchimps.com', 32);
insert into users (ID, nameLast, nameFirst, email, addressID) values (135, 'Hardwich', 'Tiertza', 'thardwich3q@devhub.com', 49);
insert into users (ID, nameLast, nameFirst, email, addressID) values (136, 'Playdon', 'Charlean', 'cplaydon3r@webeden.co.uk', 43);
insert into users (ID, nameLast, nameFirst, email, addressID) values (137, 'Brierly', 'Claus', 'cbrierly3s@msn.com', 17);
insert into users (ID, nameLast, nameFirst, email, addressID) values (138, 'Chiechio', 'Vic', 'vchiechio3t@dyndns.org', 15);
insert into users (ID, nameLast, nameFirst, email, addressID) values (139, 'McGray', 'Cherida', 'cmcgray3u@pbs.org', 48);
insert into users (ID, nameLast, nameFirst, email, addressID) values (140, 'Broadbere', 'Nana', 'nbroadbere3v@mapy.cz', 41);
insert into users (ID, nameLast, nameFirst, email, addressID) values (141, 'Neaves', 'Doloritas', 'dneaves3w@state.tx.us', 21);
insert into users (ID, nameLast, nameFirst, email, addressID) values (142, 'Da Costa', 'Nolana', 'ndacosta3x@chicagotribune.com', 1);
insert into users (ID, nameLast, nameFirst, email, addressID) values (143, 'Rabb', 'Harrison', 'hrabb3y@bluehost.com', 5);
insert into users (ID, nameLast, nameFirst, email, addressID) values (144, 'Corbet', 'Bird', 'bcorbet3z@si.edu', 44);
insert into users (ID, nameLast, nameFirst, email, addressID) values (145, 'Colt', 'Cyrill', 'ccolt40@cnn.com', 4);
insert into users (ID, nameLast, nameFirst, email, addressID) values (146, 'Matyatin', 'Marlon', 'mmatyatin41@blog.com', 29);
insert into users (ID, nameLast, nameFirst, email, addressID) values (147, 'Dallimore', 'Gilly', 'gdallimore42@google.nl', 6);
insert into users (ID, nameLast, nameFirst, email, addressID) values (148, 'Wolffers', 'Bern', 'bwolffers43@people.com.cn', 43);
insert into users (ID, nameLast, nameFirst, email, addressID) values (149, 'Botright', 'Dorette', 'dbotright44@google.it', 14);
insert into users (ID, nameLast, nameFirst, email, addressID) values (150, 'Mawford', 'Ilsa', 'imawford45@cnet.com', 23);
insert into users (ID, nameLast, nameFirst, email, addressID) values (151, 'Jacobsson', 'Dov', 'djacobsson46@unesco.org', 18);
insert into users (ID, nameLast, nameFirst, email, addressID) values (152, 'Bagster', 'Devi', 'dbagster47@gmpg.org', 47);
insert into users (ID, nameLast, nameFirst, email, addressID) values (153, 'Fruin', 'Vinny', 'vfruin48@ocn.ne.jp', 45);
insert into users (ID, nameLast, nameFirst, email, addressID) values (154, 'Antonoczyk', 'Deana', 'dantonoczyk49@linkedin.com', 30);
insert into users (ID, nameLast, nameFirst, email, addressID) values (155, 'Schach', 'Rubie', 'rschach4a@histats.com', 10);
insert into users (ID, nameLast, nameFirst, email, addressID) values (156, 'Gantley', 'Justin', 'jgantley4b@dropbox.com', 17);
insert into users (ID, nameLast, nameFirst, email, addressID) values (157, 'Blanque', 'Leona', 'lblanque4c@seattletimes.com', 3);
insert into users (ID, nameLast, nameFirst, email, addressID) values (158, 'Ducker', 'Gertrud', 'gducker4d@jiathis.com', 20);
insert into users (ID, nameLast, nameFirst, email, addressID) values (159, 'Hullyer', 'Sibella', 'shullyer4e@creativecommons.org', 21);
insert into users (ID, nameLast, nameFirst, email, addressID) values (160, 'Croan', 'Sammy', 'scroan4f@livejournal.com', 2);
insert into users (ID, nameLast, nameFirst, email, addressID) values (161, 'Bruhn', 'Bellina', 'bbruhn4g@senate.gov', 9);
insert into users (ID, nameLast, nameFirst, email, addressID) values (162, 'Farndell', 'Siegfried', 'sfarndell4h@cargocollective.com', 43);
insert into users (ID, nameLast, nameFirst, email, addressID) values (163, 'Ert', 'Mirilla', 'mert4i@boston.com', 40);
insert into users (ID, nameLast, nameFirst, email, addressID) values (164, 'Moizer', 'Carmen', 'cmoizer4j@nymag.com', 6);
insert into users (ID, nameLast, nameFirst, email, addressID) values (165, 'Grindley', 'Georgeta', 'ggrindley4k@alibaba.com', 21);
insert into users (ID, nameLast, nameFirst, email, addressID) values (166, 'Scarr', 'Bronnie', 'bscarr4l@friendfeed.com', 38);
insert into users (ID, nameLast, nameFirst, email, addressID) values (167, 'Ashingden', 'Easter', 'eashingden4m@theatlantic.com', 38);
insert into users (ID, nameLast, nameFirst, email, addressID) values (168, 'Hause', 'Edouard', 'ehause4n@sphinn.com', 32);
insert into users (ID, nameLast, nameFirst, email, addressID) values (169, 'Magauran', 'Luke', 'lmagauran4o@google.it', 21);
insert into users (ID, nameLast, nameFirst, email, addressID) values (170, 'Lile', 'Bryn', 'blile4p@tmall.com', 26);
insert into users (ID, nameLast, nameFirst, email, addressID) values (171, 'Goodhay', 'Hayden', 'hgoodhay4q@huffingtonpost.com', 6);
insert into users (ID, nameLast, nameFirst, email, addressID) values (172, 'Arson', 'Melisandra', 'marson4r@chronoengine.com', 29);
insert into users (ID, nameLast, nameFirst, email, addressID) values (173, 'Semonin', 'Tierney', 'tsemonin4s@1und1.de', 30);
insert into users (ID, nameLast, nameFirst, email, addressID) values (174, 'Saenz', 'Reena', 'rsaenz4t@uol.com.br', 23);
insert into users (ID, nameLast, nameFirst, email, addressID) values (175, 'Elcy', 'Loise', 'lelcy4u@discovery.com', 17);
insert into users (ID, nameLast, nameFirst, email, addressID) values (176, 'Sustins', 'Davina', 'dsustins4v@abc.net.au', 11);
insert into users (ID, nameLast, nameFirst, email, addressID) values (177, 'Tyt', 'Lorraine', 'ltyt4w@japanpost.jp', 25);
insert into users (ID, nameLast, nameFirst, email, addressID) values (178, 'McConachie', 'Emma', 'emcconachie4x@nsw.gov.au', 30);
insert into users (ID, nameLast, nameFirst, email, addressID) values (179, 'Pedro', 'Kissie', 'kpedro4y@nationalgeographic.com', 45);
insert into users (ID, nameLast, nameFirst, email, addressID) values (180, 'Capozzi', 'Noah', 'ncapozzi4z@sbwire.com', 18);
insert into users (ID, nameLast, nameFirst, email, addressID) values (181, 'Wilbore', 'Fredrika', 'fwilbore50@macromedia.com', 52);
insert into users (ID, nameLast, nameFirst, email, addressID) values (182, 'O''Kennavain', 'Tobey', 'tokennavain51@spiegel.de', 40);
insert into users (ID, nameLast, nameFirst, email, addressID) values (183, 'Marval', 'Stanfield', 'smarval52@sitemeter.com', 38);
insert into users (ID, nameLast, nameFirst, email, addressID) values (184, 'Winskill', 'Salvatore', 'swinskill53@fotki.com', 18);
insert into users (ID, nameLast, nameFirst, email, addressID) values (185, 'Depport', 'Ainslee', 'adepport54@rediff.com', 24);
insert into users (ID, nameLast, nameFirst, email, addressID) values (186, 'Windrass', 'Cory', 'cwindrass55@cisco.com', 32);
insert into users (ID, nameLast, nameFirst, email, addressID) values (187, 'Rearie', 'Lura', 'lrearie56@cloudflare.com', 26);
insert into users (ID, nameLast, nameFirst, email, addressID) values (188, 'McGuffie', 'Farah', 'fmcguffie57@4shared.com', 52);
insert into users (ID, nameLast, nameFirst, email, addressID) values (189, 'Pottes', 'Quentin', 'qpottes58@disqus.com', 28);
insert into users (ID, nameLast, nameFirst, email, addressID) values (190, 'Dakers', 'Bevin', 'bdakers59@ca.gov', 52);
insert into users (ID, nameLast, nameFirst, email, addressID) values (191, 'Lidbetter', 'Ara', 'alidbetter5a@theglobeandmail.com', 29);
insert into users (ID, nameLast, nameFirst, email, addressID) values (192, 'Mulroy', 'Reinhold', 'rmulroy5b@live.com', 2);
insert into users (ID, nameLast, nameFirst, email, addressID) values (193, 'Crossgrove', 'Rozamond', 'rcrossgrove5c@pen.io', 22);
insert into users (ID, nameLast, nameFirst, email, addressID) values (194, 'Pollicote', 'Marthena', 'mpollicote5d@webs.com', 45);
insert into users (ID, nameLast, nameFirst, email, addressID) values (195, 'Croome', 'Johnathon', 'jcroome5e@cafepress.com', 12);
insert into users (ID, nameLast, nameFirst, email, addressID) values (196, 'Wimlet', 'Sigfrid', 'swimlet5f@blogtalkradio.com', 29);
insert into users (ID, nameLast, nameFirst, email, addressID) values (197, 'Fuentes', 'Tynan', 'tfuentes5g@mapquest.com', 47);
insert into users (ID, nameLast, nameFirst, email, addressID) values (198, 'Daniele', 'Morlee', 'mdaniele5h@chicagotribune.com', 3);
insert into users (ID, nameLast, nameFirst, email, addressID) values (199, 'Colclough', 'Joey', 'jcolclough5i@apache.org', 45);
insert into users (ID, nameLast, nameFirst, email, addressID) values (200, 'Scade', 'Jens', 'jscade5j@hugedomains.com', 10);


