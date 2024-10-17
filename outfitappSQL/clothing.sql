use outfit;

create table clothing(
	id int not null auto_increment,
    user_id int,
    clothing_type varchar(20),
    occasion varchar(20),
    is_jacket bool,
    is_dress bool,
    primary key (id),
    foreign key (user_id) references users(id)
);

alter table clothing
add image longblob;

select * from clothing;

insert into clothing(user_id, clothing_type, occasion, is_jacket, is_dress, image)
values
(1, "bottoms", "party", false, false, load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_images/black_layers.jpg")),
(1, "top", "party", false, false, load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_images/black_sparkles.jpg")),
(1, "bottoms", "party", false, false, load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_images/colorful.jpg")),
(1, "top", "party", false, false, load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_images/gold_top.jpg")),
(1, "top", "party", false, false, load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_images/pink_rose_top.jpg")),
(1, "bottoms", "party", false, false, load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_images/pink-party-skirt.jpg")),
(1, "top", "party", false, false, load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_images/puffy_red.jpg")),
(1, "top", "party", false, false, load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_images/purple_blouse.jpg")),
(1, "top", "party", false, false, load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_images/red_sparkles.jpg")),
(1, "bottoms", "party", false, false, load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_images/shiny_skirt.jpg")),
(1, "top", "party", false, false, load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_images/sparkly_purple_blouse.jpg")),
(1, "bottoms", "party", false, false, load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_images/white_tulle_skirt.jpg"));

select id, occasion, clothing_type
from clothing
where user_id = 1 and occasion = 'party' and clothing_type = 'top';

alter table clothing drop column is_jacket;
alter table clothing drop column is_dress;

update clothing set clothing_type = "shoes" where id = 7;

select image_url from clothing;

alter table clothing drop column image_url;
alter table clothing add column image_url varchar(100);

update clothing set image_url = "C:\\Users\\Pravi\\Desktop\\DollyWardrobe\\black_layers.jpg" where id = 1;
update clothing set image_url = "C:\\Users\\Pravi\\Desktop\\DollyWardrobe\\black_sparkles.jpg" where id = 2;
update clothing set image_url = "C:\\Users\\Pravi\\Desktop\\DollyWardrobe\\colorful.jpg" where id = 3;
update clothing set image_url = "C:\\Users\\Pravi\\Desktop\\DollyWardrobe\\gold_top.jpg" where id = 4;
update clothing set image_url = "C:\\Users\\Pravi\\Desktop\\DollyWardrobe\\pink_rose_top.jpg" where id = 5;
update clothing set image_url = "C:\\Users\\Pravi\\Desktop\\DollyWardrobe\\flower_skirt.jpg" where id = 6;
update clothing set image_url = "C:\\Users\\Pravi\\Desktop\\DollyWardrobe\\platforms.jpg" where id = 7;
update clothing set image_url = "C:\\Users\\Pravi\\Desktop\\DollyWardrobe\\puffy_red.jpg" where id = 8;
update clothing set image_url = "C:\\Users\\Pravi\\Desktop\\DollyWardrobe\\purple_blouse.jpg" where id = 9;
update clothing set image_url = "C:\\Users\\Pravi\\Desktop\\DollyWardrobe\\shiny_skirt.jpg" where id = 10;
update clothing set image_url = "C:\\Users\\Pravi\\Desktop\\DollyWardrobe\\sparkly_purple_blouse.jpg" where id = 11;
update clothing set image_url = "C:\\Users\\Pravi\\Desktop\\DollyWardrobe\\white_tull_skirt.jpg" where id = 12;




