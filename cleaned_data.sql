ALTER USER 'root'@'localhost' IDENTIFIED BY 'Github_NA';
FLUSH PRIVILEGES;
Create database Raw_Data;

Drop database Raw_Data;

Create database Real_Estate_P1;

select *
from Real_Estate_P1.raw_data;

alter table raw_data 
rename column crim to per_capita_crime;

alter table raw_data
rename column zn to rl_twentyfive_k_sqft;

alter table raw_data
rename column indus to nonr_biz_acres;

alter table raw_data
drop column chas;

alter table raw_data
rename column nox to nox_concentration;

alter table raw_data
rename column rm to avg_num_rooms;

alter table raw_data
rename column age to owner_live_built_prefourties;

alter table raw_data
rename column dis to dis_five_employ_center;

alter table raw_data
rename column rad to acces_radial_highways;

select *
from Real_Estate_P1.raw_data;

alter table raw_data
rename column tax to prop_tax_per_ten_k;

alter table raw_data
rename column ptratio to stu_teach_ratio;

alter table raw_data
drop column b;

alter table raw_data
rename column lstat to lower_stat_percent;

alter table raw_data
rename column medv to median_val_owner_occupied_thousands;

alter table raw_data
add column town int auto_increment primary key;

ALTER TABLE `Real_Estate_P1`.`raw_data` 
CHANGE COLUMN `town` `town` INT NOT NULL AUTO_INCREMENT FIRST;

select *
from raw_data
where concat('town','per_capita_crime','rl_twentyfive_k_sqft','nonr_biz_acres','nox_concentration','avg_num_rooms',
'owner_live_built_prefourties','dis_five_employ_center','acces_radial_highways','prop_tax_per_ten_k','stu_teach_ratio
lower_stat_percent','median_val_owner_occupied_thousands') is null;

select *
from raw_data;

alter table raw_data
rename column acces_radial_highways to index_accesibility_hway;
