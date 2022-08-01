CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" varchar(70) NOT NULL,
	"password" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"address" TEXT NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" varchar(40) NOT NULL,
	"price" DECIMAL NOT NULL,
	"size" varchar(1) NOT NULL,
	"imageUrl" TEXT NOT NULL,
	"secImageUrl" TEXT,
	"categoryId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productsCategory" (
	"id" serial NOT NULL,
	"name" varchar(40) NOT NULL UNIQUE,
	CONSTRAINT "productsCategory_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.buyedProducts" (
	"userId" integer NOT NULL,
	"productId" integer NOT NULL,
	"productQtd" integer NOT NULL DEFAULT '1',
	"buyedDate" TIMESTAMP NOT NULL DEFAULT 'NOW()',
	"customerAddress" TEXT NOT NULL,
	"orderState" varchar(9) NOT NULL
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "productsCategory"("id");


ALTER TABLE "buyedProducts" ADD CONSTRAINT "buyedProducts_fk0" FOREIGN KEY ("userId") REFERENCES "customers"("id");
ALTER TABLE "buyedProducts" ADD CONSTRAINT "buyedProducts_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");





