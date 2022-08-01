CREATE TABLE "customers" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(70) NOT NULL,
	"password" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE
);

CREATE TYPE "size" AS ENUM ('PP', 'P', 'M', 'G', 'GG', 'XGG');

CREATE TABLE "products" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(40) NOT NULL,
	"price" DECIMAL NOT NULL,
	type "size" NOT NULL,
	"imageUrl" TEXT NOT NULL,
	"secImageUrl" TEXT,
	"categoryId" integer NOT NULL,
);

CREATE TABLE "productsCategory" (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"name" varchar(40) NOT NULL UNIQUE,
);


CREATE TABLE "buyedProducts" (
	"userId" integer NOT NULL,
	"productId" integer NOT NULL,
	"productQtd" integer NOT NULL DEFAULT 1,
	"buyedDate" TIMESTAMP NOT NULL DEFAULT NOW(),
	"customerAddress" TEXT NOT NULL,
	"orderState" varchar(9) NOT NULL
);

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "productsCategory"("id");
ALTER TABLE "buyedProducts" ADD CONSTRAINT "buyedProducts_fk0" FOREIGN KEY ("userId") REFERENCES "customers"("id");
ALTER TABLE "buyedProducts" ADD CONSTRAINT "buyedProducts_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");

