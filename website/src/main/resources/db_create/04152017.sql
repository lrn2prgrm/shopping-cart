-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-04-15 21:13:35.02

-- DROP
DROP TABLE "address" CASCADE;
DROP TABLE "card_info" CASCADE;
DROP TABLE "config" CASCADE;
DROP TABLE "order" CASCADE;
DROP TABLE "order_address" CASCADE;
DROP TABLE "order_detail" CASCADE;
DROP TABLE "payment" CASCADE;
DROP TABLE "payment_type" CASCADE;
DROP TABLE "person" CASCADE;
DROP TABLE "product" CASCADE;
DROP TABLE "product_type" CASCADE;
DROP TABLE "user" CASCADE;
-- End of DROP;

-- tables
-- Table: address
CREATE TABLE "address" (
  "id" serial  NOT NULL,
  "lat" varchar(300)  NULL,
  "lng" varchar(300)  NULL,
  "geohash" varchar(300)  NULL,
  "address" varchar(1000)  NOT NULL,
  "active" boolean  NOT NULL,
  "person_id" int  NOT NULL,
  CONSTRAINT "address_pk" PRIMARY KEY ("id")
);

-- Table: card_info
CREATE TABLE "card_info" (
  "id" serial  NOT NULL,
  "card_number" varchar(300)  NOT NULL,
  "ccv_number" varchar(300)  NOT NULL,
  "currency_name" varchar(300)  NOT NULL,
  "active" boolean  NOT NULL,
  "person_id" int  NOT NULL,
  CONSTRAINT "card_info_pk" PRIMARY KEY ("id")
);

-- Table: config
CREATE TABLE "config" (
  "id" serial  NOT NULL,
  "company" varchar(300)  NOT NULL,
  "currency_symbol" varchar(300)  NOT NULL,
  "currency_name" varchar(300)  NOT NULL,
  CONSTRAINT "config_pk" PRIMARY KEY ("id")
);

-- Table: order
CREATE TABLE "order" (
  "id" serial  NOT NULL,
  "client_name" varchar(1000)  NOT NULL,
  "client_phone" varchar(300)  NOT NULL,
  "comment" varchar(1000)  NOT NULL,
  "user_id" int  NOT NULL,
  "payment_type_id" int  NOT NULL,
  CONSTRAINT "order_pk" PRIMARY KEY ("id")
);

-- Table: order_address
CREATE TABLE "order_address" (
  "id" serial  NOT NULL,
  "lat" varchar(300)  NULL,
  "lng" varchar(300)  NULL,
  "geohash" varchar(300)  NULL,
  "address" varchar(1000)  NOT NULL,
  "person_id" int  NOT NULL,
  "order_id" int  NOT NULL,
  CONSTRAINT "order_address_pk" PRIMARY KEY ("id")
);

-- Table: order_detail
CREATE TABLE "order_detail" (
  "id" serial  NOT NULL,
  "price" decimal(10,4)  NOT NULL,
  "quantity" int  NOT NULL,
  "comment" varchar(1000)  NOT NULL,
  "order_id" int  NOT NULL,
  "product_id" int  NOT NULL,
  CONSTRAINT "order_detail_pk" PRIMARY KEY ("id")
);

-- Table: payment
CREATE TABLE "payment" (
  "id" serial  NOT NULL,
  "amount" decimal(10,4)  NOT NULL,
  "masked_card" varchar(300)  NOT NULL,
  "currenct_name" varchar(300)  NOT NULL,
  "order_id" int  NOT NULL,
  "payment_type_id" int  NOT NULL,
  CONSTRAINT "payment_pk" PRIMARY KEY ("id")
);

-- Table: payment_type
CREATE TABLE "payment_type" (
  "id" serial  NOT NULL,
  "name" varchar(300)  NOT NULL,
  "active" boolean  NOT NULL,
  CONSTRAINT "payment_type_pk" PRIMARY KEY ("id")
);

-- Table: person
CREATE TABLE "person" (
  "id" serial  NOT NULL,
  "name" varchar(300)  NOT NULL,
  "lastname" varchar(300)  NOT NULL,
  "phone" varchar(300)  NOT NULL,
  CONSTRAINT "person_pk" PRIMARY KEY ("id")
);

-- Table: product
CREATE TABLE "product" (
  "id" serial  NOT NULL,
  "name" varchar(300)  NOT NULL,
  "description" varchar(1000)  NOT NULL,
  "price" decimal(10,4)  NOT NULL,
  "filename" varchar(300)  NOT NULL,
  "product_type_id" int  NOT NULL,
  "active" boolean  NOT NULL,
  CONSTRAINT "product_pk" PRIMARY KEY ("id")
);

-- Table: product_type
CREATE TABLE "product_type" (
  "id" serial  NOT NULL,
  "name" varchar(300)  NOT NULL,
  "active" boolean  NOT NULL,
  CONSTRAINT "product_type_pk" PRIMARY KEY ("id")
);

-- Table: user
CREATE TABLE "user" (
  "id" serial  NOT NULL,
  "username" varchar(300)  NOT NULL,
  "password" varchar(300)  NOT NULL,
  "superuser" boolean  NOT NULL,
  "active" boolean  NOT NULL,
  "person_id" int  NOT NULL,
  CONSTRAINT "user_pk" PRIMARY KEY ("id")
);

-- foreign keys
-- Reference: address_person (table: address)
ALTER TABLE "address" ADD CONSTRAINT "address_person"
FOREIGN KEY ("person_id")
REFERENCES "person" ("id")
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

-- Reference: card_info_person (table: card_info)
ALTER TABLE "card_info" ADD CONSTRAINT "card_info_person"
FOREIGN KEY ("person_id")
REFERENCES "person" ("id")
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

-- Reference: order_address_order (table: order_address)
ALTER TABLE "order_address" ADD CONSTRAINT "order_address_order"
FOREIGN KEY ("order_id")
REFERENCES "order" ("id")
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

-- Reference: order_detail_order (table: order_detail)
ALTER TABLE "order_detail" ADD CONSTRAINT "order_detail_order"
FOREIGN KEY ("order_id")
REFERENCES "order" ("id")
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

-- Reference: order_detail_product (table: order_detail)
ALTER TABLE "order_detail" ADD CONSTRAINT "order_detail_product"
FOREIGN KEY ("product_id")
REFERENCES "product" ("id")
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

-- Reference: order_payment_type (table: order)
ALTER TABLE "order" ADD CONSTRAINT "order_payment_type"
FOREIGN KEY ("payment_type_id")
REFERENCES "payment_type" ("id")
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

-- Reference: order_user (table: order)
ALTER TABLE "order" ADD CONSTRAINT "order_user"
FOREIGN KEY ("user_id")
REFERENCES "user" ("id")
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

-- Reference: payment_order (table: payment)
ALTER TABLE "payment" ADD CONSTRAINT "payment_order"
FOREIGN KEY ("order_id")
REFERENCES "order" ("id")
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

-- Reference: payment_payment_type (table: payment)
ALTER TABLE "payment" ADD CONSTRAINT "payment_payment_type"
FOREIGN KEY ("payment_type_id")
REFERENCES "payment_type" ("id")
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

-- Reference: product_product_type (table: product)
ALTER TABLE "product" ADD CONSTRAINT "product_product_type"
FOREIGN KEY ("product_type_id")
REFERENCES "product_type" ("id")
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

-- Reference: user_person (table: user)
ALTER TABLE "user" ADD CONSTRAINT "user_person"
FOREIGN KEY ("person_id")
REFERENCES "person" ("id")
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

INSERT INTO public.person (id, name, lastname, phone) VALUES (1, 'Armando', 'Cordova', '980415200');
INSERT INTO public.address (id, lat, lng, geohash, address, active, person_id) VALUES (1, 123123123, 1231231231, 'asfasdfasf', 'glgnfdf fgdhdghfdghfdgh', true, 1);
INSERT INTO public."user" (id, username, password, superuser, active, person_id) VALUES (1, 'acordova', 'acordova', true, true, 1);;

-- End of file.

