create table order_(
   order_no int,
   order_date varchar(30),
   quantity_ordered int,
   primary key (order_no)
   );
   
insert into order_ values ( 1, '12-09-14', 5);
insert into order_ values ( 2, '10-09-14', 7);
insert into order_ values ( 3, '13-09-14', 8);
insert into order_ values ( 4, '18-09-14', 9);

create table customer(
   customer_id integer,
   customer_add varchar(30),
   customer_city varchar(25),
   customer_name varchar(35),
   order_no int,
   due_date varchar(30),
   pay_date varchar(30),
   credit_remaining numeric(15,5),
   password_ varchar(30),
   email varchar(70),
   primary key (customer_id),
   foreign key (order_no) references order_
   );
   
insert into customer values ( 1,'Motijheel,Dhaka','Dhaka','Sheikh Nabil Mohammad',1, '20-10-14','20-10-14', 121,'023489t','nabilcse@gmail.com');
insert into customer values ( 2,'Mohammadpur,Dhaka','Dhaka','Sheikh Pranob',2, '20-11-14','20-12-14', 122,'desh234','pranobcse@gmail.com');
insert into customer values ( 3,'Elahabad,Barisal','Barisal','Alamin',3, '20-10-14','20-10-14', 123,'icu4cu','alaminsust@gmail.com');
insert into customer values ( 4,'kotBari,Comilla','Comilla','Subrata',4, '27-10-14','22-10-14', 124,'gotohell','subratasust@gmail.com');

   
create table branch(
   branch_code int,
   branch_name varchar(30),
   branch_add varchar(300),
   phone_no varchar(30),
   order_no int,
   primary key (branch_code),
   foreign key (order_no)references order_
   );
   
<here>
insert into branch values( 1,'Dhaka', 'Farm Gate, Dhaka',  '+8801738898661', 1);
insert into branch values( 2,'Dhaka', 'Mirpur, Dhaka',  '+8801738898672',2 );
insert into branch values( 3,'Dhaka', 'Dhanmondi, Dhaka',  '+8801738898663', 3);
insert into branch values( 4,'Dhaka', 'Golsan, Dhaka',  '+8801738898664', 4);
</here>

create table category_(
  category_id int,
  category_type varchar(30),
  primary key (category_id)
  );

<here>
insert into category_ values ( 1, 'Grocery');
insert into category_ values ( 2, 'Office');
insert into category_ values ( 3, 'Sweets');
insert into category_ values ( 4, 'BeautyHealth');
insert into category_ values ( 5, 'Dress');
insert into category_ values ( 6, 'Electrical');
insert into category_ values ( 7, 'Babycare');
insert into category_ values ( 8, 'Cosmetics');
</here>


create table subcategory(
  subcategory_id int,
  subcategory_name varchar(40),
  category_id int,
  primary key (subcategory_id),
  foreign key (category_id) references category_
  );

<here>
insert into subcategory values ( 1,'FruitsVegetables',1);
insert into subcategory values ( 2,'Breakfast',1);
insert into subcategory values ( 3,'Bevarage',1);
insert into subcategory values ( 4,'MeatFish',1);
insert into subcategory values ( 5,'Batteries',2);
insert into subcategory values ( 6,'Printing',2);
insert into subcategory values ( 7,'HealthCare',4);
insert into subcategory values ( 8,'PersonalCare',4);
insert into subcategory values ( 9,'Cooking',1);
insert into subcategory values ( 10,'MenDress',5);
insert into subcategory values ( 11,'WomenDress',5);
insert into subcategory values ( 12,'Electrical',6);
insert into subcategory values ( 13,'Sweets',3);
insert into subcategory values ( 14,'Food',7);
insert into subcategory values ( 15,'Care',7);
insert into subcategory values ( 16,'Cosmetics',8);
</here>


create  table product(
  product_code integer,
  product_descrip varchar(100),
  product_sell_price numeric(15,5),
  product_purchase_price numeric(15,5),
  product_exp_date varchar(30),
  product_offer int,
  product_stock_remaining integer,
  branch_code int,
  subcategory_id int,
  unit varchar(30),
  foreign key (branch_code) references branch,
  foreign key (subcategory_id) references subcategory,
  primary key (product_code)
  );
  
  <here>
  insert into product values (1,'Rice-atap',115,106,'12-03-2015',0,45,1,9,'/Kg');
  insert into product values (2,'Dal-Mug',115,106,'12-03-2015',0,45,1,9,'/Kg');
  insert into product values (3,'Soyabean Oil',110,106,'01-04-2015',0,11,1,9,'/L');
  
  insert into product values (4,'Coca Cola',41,39,'01-06-2014',0,12,1,3,'/L');
  insert into product values (5,'Pepsi',40,38,'12-02-2015',0,29,1,3,'/L');
  insert into product values (6,'Mountain Dew',42,39,'12-02-2015',0,20,1,3,'/L');
  
  insert into product values (7,'T-Shirt',550,350,'12-02-2015',0,12,1,10,'/Piece');
  insert into product values (8,'Pant-Jeans',1050,800,'12-02-2015',0,2,1,10,'/Piece');
  insert into product values (9,'Fair-&-Lovely',45,35,'12-02-2015',0,14,1,8,'/Piece');
  insert into product values (10,'Axe-BodySpray',250,230,'12-02-2015',0,92,1,8,'/Piece');

  
  insert into product values (11,'Banana',42,39,'12-02-2015',0,20,1,1,'/Dozen');
  insert into product values (12,'Apple',150,120,'12-02-2015',0,12,1,1,'/Kg');
  insert into product values (13,'Grape',550,500,'12-02-2015',0,2,1,1,'/Kg');
  insert into product values (14,'Orange',110,90,'12-02-2015',0,14,1,1,'/Kg');
  insert into product values (15,'Pineapple',80,65,'12-02-2015',0,92,1,1,'/Piece');
  insert into product values (16,'JackFruit',90,80,'12-02-2015',0,20,1,1,'/Piece');
  insert into product values (17,'Mango',80,50,'12-02-2015',0,12,1,1,'/Kg');
  insert into product values (18,'Papaya',65,55,'12-02-2015',0,2,1,1,'/Piece');
  insert into product values (19,'Pomegranate',145,125,'12-02-2015',0,14,1,1,'/Kg');
  insert into product values (20,'Guava',95,80,'12-02-2015',0,92,1,1,'/Kg');
  insert into product values (21,'WaterMelon',130,115,'12-02-2015',0,14,1,1,'/Piece');
  insert into product values (22,'GreenCoconut',30,22,'12-02-2015',0,92,1,1,'/Piece'); 
  
  insert into product values (23,'Special Paratha',42,39,'12-02-2015',0,20,1,2,'/Piece');
  insert into product values (24,'Atta Rooti',45,35,'12-02-2015',0,14,1,2,'/Piece');
  insert into product values (25,'Natural Honey',95,80,'12-02-2015',0,92,1,2,'/Kg');
  insert into product values (26,'Koel Eggs',130,115,'12-02-2015',0,14,1,2,'/Dozen');
  insert into product values (27,'Deshi Paratha Mega',30,22,'12-02-2015',0,92,1,2,'/Piece'); 
  insert into product values (28,'Pran Flattened Rice ',42,39,'12-02-2015',0,20,1,2,'/Kg');
  insert into product values (29,'Frozen Paratha',150,120,'12-02-2015',0,12,1,2,'/Piece');
  insert into product values (30,'Alpen-blue-no-sugar-560-gm',90,80,'12-02-2015',0,20,1,2,'/Kg');
  insert into product values (31,'Alpen-red-swiss-recipe-375-gm',180,100,'12-02-2015',0,12,1,2,'/Kg');
  insert into product values (32,'Carmans-natural-bircher-muesli-500-gm',95,80,'12-02-2015',0,92,1,2,'/Kg');
  insert into product values (33,'crown-choco-pops-250-gm',130,115,'12-02-2015',0,14,1,2,'/Kg');
  insert into product values (34,'general-mills-cookie-crisp-cereal-318-gm',30,22,'12-02-2015',0,92,1,2,'/Kg'); 
  insert into product values (35,'heinz-breakfast-mini-berry-flakes-200-gm',42,39,'12-02-2015',0,20,1,2,'/Kg');
  insert into product values (36,'iko-high-fibre-daily-700-gm',150,120,'12-02-2015',0,12,1,2,'/Kg');
  
  insert into product values (37,'Brooke Bond Taaza Tea 400 gm',150,120,'12-02-2015',0,2,1,3,'/Kg');
  insert into product values (38,'Brooke Bond Taaza Tea 100 gm',140,138,'12-02-2015',0,14,1,3,'/Kg');
  insert into product values (39,'Tetley Premium Leaf Tea 200 gm',80,65,'12-02-2015',0,92,1,3,'/Kg');
  insert into product values (40,'MacCoffee Original 50 gm',90,80,'12-02-2015',0,20,1,3,'/Kg');
  insert into product values (41,'Ispahani Zareen Premium Tea',80,50,'12-02-2015',0,12,1,3,'/Kg');
  
  insert into product values (42,'Frozen Hilsha 1 kg',965,955,'12-02-2015',0,2,1,4,'/Kg');
  insert into product values (43,'chapila-shutki-500-gm',145,125,'12-02-2015',0,14,1,4,'/Kg');
  insert into product values (44,'churi-shutki-500-gm',195,180,'12-02-2015',0,92,1,4,'/Kg');
  insert into product values (45,'rupchanda-shutki-500-gm',130,115,'12-02-2015',0,14,1,4,'/Kg');
  insert into product values (46,'shurma-shutki-500-gm',130,122,'12-02-2015',0,92,1,4,'/Kg'); 
  
  insert into product values (47,'Duracell Alkaline AA Battery',50,30,'12-02-2015',0,2,1,5,'/Piece');
  insert into product values (48,'Maxell Alkaline Battery',40,30,'12-02-2015',0,14,1,5,'/Piece');
  insert into product values (49,'Olympic AAA Battery',50,45,'12-02-2015',0,92,1,5,'/Piece');
  insert into product values (50,'Olympic Gold AA Battery',40,30,'12-02-2015',0,20,1,5,'/Piece');
  insert into product values (51,'Pakko Heavy Duty Battery 9V',40,30,'12-02-2015',0,12,1,5,'/Piece');
  
  insert into product values (52,'Bashundhara A4 paper',265,255,'12-02-2015',0,2,1,6,'/Ream');
  insert into product values (53,'Century A4 Size Paper',245,225,'12-02-2015',0,14,1,6,'/Ream');
  insert into product values (54,'Paper Tech- A4 size (80 GSM)',295,280,'12-02-2015',0,92,1,6,'/Ream');
  insert into product values (55,'Double A A4 Size Paper',430,415,'12-02-2015',0,14,1,6,'/Ream');
  insert into product values (56,'Ink-Win HP Ink 20 ml',130,122,'12-02-2015',0,92,1,6,'/Piece'); 
  insert into product values (57,'Samsung Laser Toner ML-1666',295,280,'12-02-2015',0,92,1,6,'/Piece');
  
  insert into product values (58,'Anlene Gold Nutrition Drink',550,500,'12-02-2015',0,2,1,7,'/L');
  insert into product values (59,'Dabur Chyawanprash 250 gm',110,90,'12-02-2015',0,14,1,7,'/Kg');
  insert into product values (60,'Sona Chandi Chyawanprash',180,165,'12-02-2015',0,92,1,7,'/Kg');
  insert into product values (61,'Isubgul Vushi',90,80,'12-02-2015',0,20,1,7,'/Kg');
  insert into product values (62,'julie-e-bhushi-powder-sugar-free-50-gm',80,50,'12-02-2015',0,12,1,7,'/Kg');
  insert into product values (63,'Dabur Chyawanprash 200 gm',130,115,'12-02-2015',0,14,1,7,'/Kg');
    
  insert into product values (64,'Axe Aero Excite',265,255,'12-02-2015',0,2,1,8,'/Piece');
  insert into product values (65,'Rexona Men Deodorant V8 40 ml',145,125,'12-02-2015',0,14,1,8,'/Piece');
  insert into product values (66,'Rexona men quantum -dry 40 ml',95,80,'12-02-2015',0,92,1,8,'/Piece');
  insert into product values (67,'Close Up Toothpaste 200 gm',130,115,'12-02-2015',0,14,1,8,'/Piece');
  insert into product values (68,'Pepsodent Germi Check 45 gm',30,22,'12-02-2015',0,92,1,8,'/Piece'); 
  insert into product values (69,'Oral-B ToothBrush',130,122,'12-02-2015',0,92,1,8,'/Piece'); 
    
  insert into product values (70,'Fresh Soyabean Oil',120,100,'12-02-2015',0,2,1,9,'/L');
  insert into product values (71,'Rupchanda Soyabean Oil 1 ltr',117,90,'12-02-2015',0,14,1,9,'/L');
  insert into product values (72,'ACI Nutrilife Rice Bran Oil',80,65,'12-02-2015',0,92,1,9,'/L');
  insert into product values (73,'Chef Mate Soybean Oil',120,110,'12-02-2015',0,20,1,9,'/L');
  insert into product values (74,'Fresh Mustard Oil 1 ltr',180,150,'12-02-2015',0,12,1,9,'/L');
  

  insert into product values (75,'Coca Cola Can 250 ml',40,38,'12-02-2015',0,14,1,3,'/L');
  insert into product values (76,'Sprite 1 ltr',80,65,'12-02-2015',0,92,1,3,'/L');
  insert into product values (77,'Sprite Can 250 ml',30,20,'12-02-2015',0,20,1,3,'/L');
  insert into product values (78,'Pepsi Pet 250ml',18,10,'12-02-2015',0,12,1,3,'/L');
  
  insert into product values (79,'beef-bone-in-1-kg',965,955,'12-02-2015',0,2,1,4,'/Kg');
  insert into product values (80,'bengal-meat-boneless-chicken-breast-1-kg',145,125,'12-02-2015',0,14,1,4,'/Kg');
  insert into product values (81,'german-butcher-beef-for-roast-3-kg',195,180,'12-02-2015',0,92,1,4,'/Kg');
  insert into product values (82,'german-butcher-beef-sliced-meat-250-gm',1130,1115,'12-02-2015',0,14,1,4,'/Kg');
  insert into product values (83,'mutton-regular-1-kg',530,522,'12-02-2015',0,92,1,4,'/Kg'); 
  insert into product values (84,'german-butcher-chicken-minced-meat-1-kg',965,955,'12-02-2015',0,2,1,4,'/Kg');
  insert into product values (85,'whole-deshi-chicken-1-kg',145,125,'12-02-2015',0,14,1,4,'/Kg');
  
  insert into product values (86,'sunlite-hi-super-jambo-battry',110,90,'12-02-2015',0,14,1,5,'/Piece');
  insert into product values (87,'sony-dry-battey-size-aa-2-pcs',50,45,'12-02-2015',0,92,1,5,'/Piece');
  insert into product values (88,'sony-aaa-batteries',90,80,'12-02-2015',0,20,1,5,'/Piece');
  
  insert into product values (89,'Tuil Pant- Dark brown',1130,1022,'12-02-2015',0,92,1,10,'/Piece'); 
  insert into product values (90,'H and M Pant Navy Blue',1142,1039,'12-02-2015',0,20,1,10,'/Piece');
  insert into product values (91,'Tuil Pant- Navy Blue',1150,1020,'12-02-2015',0,12,1,10,'/Piece');
  insert into product values (92,'Denim Pant',1190,1080,'12-02-2015',0,20,1,10,'/Piece');
  insert into product values (93,'Lee Denim Pant',1118,1010,'12-02-2015',0,12,1,10,'/Piece');
  insert into product values (94,'Casual denim Pant',1195,1080,'12-02-2015',0,92,1,10,'/Piece');
  insert into product values (95,'Full Sleev T-Shirt blue',1130,1015,'12-02-2015',0,14,1,10,'/Piece');
  insert into product values (96,'G Star Raw T-Shirt',1130,1022,'12-02-2015',0,92,1,10,'/Piece'); 
  insert into product values (97,'Polo T-Shirt',420,390,'12-02-2015',0,20,1,10,'/Piece');
  insert into product values (98,'weed Farmer T-Shirt',350,320,'12-02-2015',0,12,1,10,'/Piece');
  
  insert into product values (99,'Glossy Three piece ',30,22,'12-02-2015',0,92,1,11,'/Piece'); 
  insert into product values (100,'Unsteached Three Piece ',42,39,'12-02-2015',0,20,1,11,'/Piece');
  insert into product values (101,'Shifon Printed Three Piece',150,120,'12-02-2015',0,12,1,11,'/Piece');
  insert into product values (102,'Shifon Printed four Piece',90,80,'12-02-2015',0,20,1,11,'/Piece');
  insert into product values (103,'Aarushi Sharee',18,10,'12-02-2015',0,12,1,11,'/Piece');
  insert into product values (104,'Silk Sharee',95,80,'12-02-2015',0,92,1,11,'/Piece');
  insert into product values (105,'Shifon Silk Sharee',130,115,'12-02-2015',0,14,1,11,'/Piece');
  insert into product values (106,'Dhupain Silk Sharee',30,22,'12-02-2015',0,92,1,11,'/Piece'); 
  insert into product values (107,'Lehenga Sharee',42,39,'12-02-2015',0,20,1,11,'/Piece');
  insert into product values (108,'Silk Coton Sharee',150,120,'12-02-2015',0,12,1,11,'/Piece');
  
  insert into product values (109,'decent-energy-saving-light-7w-patch',30,22,'12-02-2015',0,92,1,12,'/Piece'); 
  insert into product values (110,'decent-energy-saving-light-7w-pin ',42,39,'12-02-2015',0,20,1,12,'/Piece');
  insert into product values (111,'mk-bell-push',150,120,'12-02-2015',0,12,1,12,'/Piece');
  insert into product values (112,'mk-fan-regulator',90,80,'12-02-2015',0,20,1,12,'/Piece');
  insert into product values (113,'osm-energy-saving-light-8w-patch',18,10,'12-02-2015',0,12,1,12,'/Piece');
  insert into product values (114,'osram-tube-light-36w',95,80,'12-02-2015',0,92,1,12,'/Piece');
  insert into product values (115,'mk-socket-2-pin',130,115,'12-02-2015',0,14,1,12,'/Piece');
  insert into product values (116,'mk-socket-3-pin',30,22,'12-02-2015',0,92,1,12,'/Piece'); 
  insert into product values (117,'energy-saving-light-32w',42,39,'12-02-2015',0,20,1,12,'/Piece');
  insert into product values (118,'osm-energy-saving-light-65w-pin',150,120,'12-02-2015',0,12,1,12,'/Piece');
  
  insert into product values (119,'glazed-amazed-2-pcs',30,22,'12-02-2015',110,92,1,13,'/Piece'); 
  insert into product values (120,'glazed-angelic-white-chocolate-2-pcs ',42,39,'12-02-2015',0,20,1,13,'/Piece');
  insert into product values (121,'glazed-blueberry-pie-2-pcs',150,120,'12-02-2015',0,12,1,13,'/Piece');
  insert into product values (122,'glazed-caramel-blonde-2-pcs',90,80,'12-02-2015',0,20,1,13,'/Piece');
  insert into product values (123,'glazed-chocolate-custard-2-pcs',180,150,'12-02-2015',0,12,1,13,'/Piece');
  insert into product values (124,'glazed-dazzled-2-pcs',95,80,'12-02-2015',0,92,1,13,'/Piece');
  insert into product values (125,'glazed-double-chocolate-2-pcs',130,115,'12-02-2015',0,14,1,13,'/Piece');
  insert into product values (126,'glazed-original-sugar-glazed-2-pcs',30,22,'12-02-2015',0,92,1,13,'/Piece'); 
  insert into product values (127,'glazed-strawberry-2-pcs',42,39,'12-02-2015',0,20,1,13,'/Piece');
  insert into product values (128,'glazed-strawberry-2-pcs',150,120,'12-02-2015',0,12,1,13,'/Piece');
  
  insert into product values (129,'cow-gate-baby-cauliflower-and-cheese-125-gm',130,122,'12-02-2015',0,92,1,14,'/Kg'); 
  insert into product values (130,'cow-gate-baby-fruit-cocktail-4-6m-125-gm ',142,139,'12-02-2015',0,20,1,14,'/Kg');
  insert into product values (131,'cow-gate-banana-porridge-cereal-4-6m-125-gm',150,120,'12-02-2015',0,12,1,14,'/Kg');
  insert into product values (132,'cow-gate-egg-custard-4-6-month-125-gm',90,80,'12-02-2015',0,20,1,14,'/Kg');
  insert into product values (133,'gerber-baby-food-green-beans-113-gm',180,150,'12-02-2015',0,12,1,14,'/Kg');
  insert into product values (134,'gerber-pears-baby-food-198-gm',95,80,'12-02-2015',0,92,1,14,'/Kg');
  insert into product values (135,'heinz-apple-custard-110-gm',130,115,'12-02-2015',0,14,1,14,'/Kg');
  insert into product values (136,'heinz-smooth-egg-custard-110-gm',30,22,'12-02-2015',0,92,1,14,'/Kg'); 
  insert into product values (137,'heinz-banana-delight-baby-food-128-gm',42,39,'12-02-2015',0,20,1,14,'/Kg');
  insert into product values (138,'nestle-nido-growing-up-3-tin-1800-gm',150,120,'12-02-2015',0,12,1,14,'/Kg');
  
  insert into product values (139,'booty-baby-lotion',30,22,'12-02-2015',0,92,1,15,'/L'); 
  insert into product values (140,'cool-cool-baby-bath-250-ml',42,39,'12-02-2015',0,20,1,15,'/Piece');
  insert into product values (141,'farmasi-baby-bath-445-ml',150,120,'12-02-2015',0,12,1,15,'/Piece');
  insert into product values (142,'johnsons-baby-bath-milk-500ml',90,80,'12-02-2015',0,20,1,15,'/Piece');
  insert into product values (143,'johnsons-baby-milk-cream-100-gm',18,10,'12-02-2015',0,12,1,15,'/Kg');
  insert into product values (144,'meril-baby-shampoo',95,80,'12-02-2015',0,92,1,15,'/Piece');
  insert into product values (145,'johnsons-baby-lotion-300ml',130,115,'12-02-2015',0,14,1,15,'/Piece');
  insert into product values (146,'no-tears-simple-baby-moisturising-shampoo',30,22,'12-02-2015',0,92,1,15,'/Piece'); 
  insert into product values (147,'mother-care-baby-lotion-300-ml',42,39,'12-02-2015',0,20,1,15,'/Piece');
  insert into product values (148,'loreal-kids-strawberry-smoothie-shampoo-265-ml',150,120,'12-02-2015',0,12,1,15,'/Piece');
  insert into product values (149,'new-loreal-kids-extra-gentile-2-in-1-tropical-mango-shampoo',42,39,'12-02-2015',0,20,1,15,'/Piece');
  insert into product values (150,'meril-baby-lotion',150,120,'12-02-2015',0,12,1,15,'/L');  
  
  insert into product values (151,'Eye-brushes-set-eyeshadow-Mascara',1500,1200,'12-02-2015',0,12,1,16,'/Piece'); 
  insert into product values (152,'Eyeshadow-Concealer-Brush',1150,1100,'12-02-2015',0,12,1,16,'/Piece'); 
  insert into product values (153,'Bronzing-Powder-Poudre-Soleil-Blush',1290,1200,'12-02-2015',0,12,1,16,'/Piece'); 
  insert into product values (154,'mineralize-blush',1000,900,'12-02-2015',0,12,1,16,'/Piece'); 
  insert into product values (155,'Eye-Shadow',1810,1700,'12-02-2015',0,12,1,16,'/Piece'); 
  insert into product values (156,'Woman-s-Pink-Pincel-Maquiagem',1200,1000,'12-02-2015',0,12,1,16,'/Piece'); 
  insert into product values (157,'Concealer-Contour-Face-Cream',1320,1200,'12-02-2015',0,12,1,16,'/Piece'); 
  </here>  
    
  create table cart(
  email int,
  product_code int,
  quantity int
  );
  select * from cart;
  
  create table wishlist(
  email varchar(50),
  product_code int
  );
  
  create table logs(
  product_name varchar(100),
  product_code int,
  subcategory varchar(50),
  sell_date_time varchar(30),
  quantity_sold int,
  purchase_price int,
  sell_price int,
  email varchar(50)
  );
  insert into logs values('Coca Cola',4,3,'2014-02-11T01:00',5,70,75,'alaminbbsc@gmail.com');
  insert into logs values('Koel Eggs',26,2,'2014-11-11T21:22',1,30,45,'pranabkhiyo@gmail.com');
  insert into logs values('Hilsha Fish',102,3,'2015-02-11T11:45',2,44,45,'nabil-cse@gmail.com');
  insert into logs values('T-Shirt Navy-blue',26,1,'2015-03-01T06:33',3,90,755,'alaminbbsc@gmail.com');
  insert into logs values ('Eye-brushes-set-eyeshadow-Mascara',151,16,'2015-03-01T06:33',2,1200,1500,'alaminbbsc@gmail.com'); 
  insert into logs values ('Eyeshadow-Concealer-Brush',152,16,'2015-03-01T06:33',1,1100,1150,'nabil-cse@gmail.com'); 
  insert into logs values ('Bronzing-Powder-Poudre-Soleil-Blush',153,16,'2015-03-01T06:33',2,1200,1290,'pranabkhiyo@gmail.com'); 
  insert into logs values ('mineralize-blush',154,16,'2014-11-11T21:22',3,900,1000,'nabil-cse@gmail.com'); 
  insert into logs values ('Eye-Shadow',155,16,'2014-11-11T21:22',4,1700,1810,'pranabkhiyo@gmail.com'); 
  insert into logs values ('Woman-s-Pink-Pincel-Maquiagem',156,16,'2014-11-11T21:22',2,1000,1200,'pranabkhiyo@gmail.com'); 
  insert into logs values ('Concealer-Contour-Face-Cream',157,16,'2014-11-11T21:22',1,1200,1320,'nabil-cse@gmail.com'); 
  
  select * from product;
  delete from product;
  
  select * from cart where email like 'alaminbbsc@gmail.com';
  select sum(product_sell_price * quantity) from cart join product using(product_code) where email like 'alaminbbsc@gmail.com';
  
  select * from product;
  
  update product set product_sell_price=41, product_purchase_price=39 , product_stock_remaining=112 where product_code=1;\
  
  
  
  create table customer_product(
  customer_id integer,
  product_code integer,
  product_descrip varchar(100),
  product_sell_price numeric(15,5),
  product_purchase_price numeric(15,5),
  product_exp_date varchar(30),
  product_offer int,
  product_stock_remaining integer,
  subcategory_id int,
  unit varchar(30)
  );
  
  <here>
  insert into customer_product values(18,0,'',0,0,'',0,0,0,'');
  </here>
  drop table customer_product;
 
  
  create table product_coupon(
  customer_id int,
  product_code int,
  coupon_code varchar(100)
  );
  
  drop table product_coupon;
  
  