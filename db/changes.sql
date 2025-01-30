ALTER TABLE `account` ADD `account_status` INT NULL DEFAULT '0' COMMENT '0=NotDefined, 1=Green, 2= Yellow, 3=Red' AFTER `is_active`;

/*Babu On 09-08-2022*/
CREATE TABLE `order_status2` ( `order_status_id` INT NOT NULL AUTO_INCREMENT , `status` VARCHAR(255) NULL , PRIMARY KEY (`order_status_id`));
ALTER TABLE `new_order` ADD `order_status2_id` INT NULL DEFAULT '0'  AFTER `order_status_id`;

/*Vipul 10-Aug-2022*/
ALTER TABLE `new_order` CHANGE `order_status2_id` `order_status2_id` INT(11) NULL DEFAULT '1';
