drop table product_details;
drop table customer_details;
drop table purchase;

create table product_details (
id integer unique,
product_id varchar(20) not null,
product_name varchar(30) not null,
product_type varchar(15),
stock_available integer default 0,
price integer default 0,
product_description varchar(50),
manufacture_date date,
warranty varchar(15),
image varchar(40),
entry_created_date DATE,
last_updated_date DATE,
entry_created_by VARCHAR(30),
last_updated_by VARCHAR(30),
primary key (id)
);

create table customer_details (
id integer unique,
customer_id varchar(20) not null,
customer_name varchar(30) not null,
phone_number varchar(10) not null,
email varchar(30),
address varchar(50),
entry_created_date DATE,
last_updated_date DATE,
entry_created_by VARCHAR(30),
last_updated_by VARCHAR(30),
primary key (id)
);

create table purchase (
id integer unique,
product_id integer not null,
customer_id integer not null,
amount integer not null,
qunatity integer not null,
shipping_address varchar(40),
entry_created_date DATE,
last_updated_date DATE,
entry_created_by VARCHAR(30),
last_updated_by VARCHAR(30),
primary key (id),
foreign key (product_id) references product_details (id),
foreign key (customer_id) references customer_details (id)
);


INSERT INTO public.customer_details
(id, customer_id, customer_name, phone_number, email, address, entry_created_date, last_updated_date, entry_created_by, last_updated_by)
VALUES(0, 'C-ID-0', 'bala', '1234567890', 'bala@gmail.com','27e, cbe 641035' ,'2023-01-01', '2023-10-04', 'bala', 'siva');

INSERT INTO public.customer_details
(id, customer_id, customer_name, phone_number, email, address, entry_created_date, last_updated_date, entry_created_by, last_updated_by)
VALUES(1, 'C-ID-1', 'guru', '9234567890', 'guru@gmail.com','100e, cbe 631038' ,'2022-11-21', '2023-12-01', 'siva', 'guru');

INSERT INTO public.product_details
(id, product_id, product_name, product_type, stock_available, price, product_description, manufacture_date, warranty, image, entry_created_date, last_updated_date, entry_created_by, last_updated_by)
VALUES(0, 'P-ID-0', 'iphone', 'electronic', 50, 100000, '12gb ram , black', '2023-12-01', '2 years', '~/img/iphone.jpg','2023-01-01', '2023-10-04', 'bala', 'siva');

INSERT INTO public.product_details
(id, product_id, product_name, product_type, stock_available, price, product_description, manufacture_date, warranty, image, entry_created_date, last_updated_date, entry_created_by, last_updated_by)
VALUES(1, 'P-ID-1', 'macbook', 'electronic', 25, 300000, '16gb ram , fastcharger ', '2023-12-03', '2 years', '~/img/macbook.jpg','2022-11-21', '2023-12-01', 'siva', 'guru');

INSERT INTO public.purchase
(id, product_id, customer_id, amount, qunatity, shipping_address, entry_created_date, last_updated_date, entry_created_by, last_updated_by)
VALUES(0, 0, 0, 100000, 1, 'peelamedu , cbe', '2023-01-01', '2023-10-04', 'bala', 'siva');

INSERT INTO public.purchase
(id, product_id, customer_id, amount, qunatity, shipping_address, entry_created_date, last_updated_date, entry_created_by, last_updated_by)
VALUES(1, 1, 0, 600000, 2, 'ganapathy , cbe', '2023-01-01', '2023-10-04', 'bala', 'siva');

INSERT INTO public.purchase
(id, product_id, customer_id, amount, qunatity, shipping_address, entry_created_date, last_updated_date, entry_created_by, last_updated_by)
VALUES(2, 0, 1, 400000, 4, '27e , peelamedu , cbe', '2023-11-01', '2023-12-04', 'guru', 'siva');



select * from product_details;
select * from customer_details;
select * from purchase;

alter table customer_details 
add gender varchar(1);

alter table customer_details 
alter column gender type varchar(10);

alter table customer_details
rename column gender to customer_gender;

select product_name , customer_name , amount , qunatity 
from purchase as pc
inner join product_details as pd 
on pd.id = pc.product_id 
inner join customer_details as cd
on cd.id = pc.customer_id;

select product_name , customer_name
from purchase as pc
inner join product_details as pd 
on pd.id = pc.product_id 
inner join customer_details as cd
on cd.id = pc.customer_id
where pd.product_name like '%on%';

select product_name
from purchase as pc
left join product_details as pd 
on pd.id = pc.product_id; 

select product_name , count(*) as total_count , sum(amount*qunatity) as total_price   
from purchase as pc
inner join product_details as pd 
on pd.id = pc.product_id 
inner join customer_details as cd
on cd.id = pc.customer_id
group by product_name;

select product_name , count(*) as total_count , sum(amount*qunatity) as total_price   
from purchase as pc
inner join product_details as pd 
on pd.id = pc.product_id 
inner join customer_details as cd
on cd.id = pc.customer_id
group by product_name
having count(*) > 1;

create index product_index
on product_details (product_name);

create unique index customer_index
on customer_details (customer_name , phone_number);

drop index customer_index;


