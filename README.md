# mask

CREATE TABLE `mask`.`city` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `mask`.`district` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `city_id` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


INSERT INTO `mask`.`city` (`id`, `name`) VALUES ('1', '台北');
INSERT INTO `mask`.`city` (`id`, `name`) VALUES ('2', '新北');
INSERT INTO `mask`.`city` (`id`, `name`) VALUES ('3', '桃園');
INSERT INTO `mask`.`city` (`id`, `name`) VALUES ('4', '花蓮');
INSERT INTO `mask`.`city` (`id`, `name`) VALUES ('5', '台中');
INSERT INTO `mask`.`city` (`id`, `name`) VALUES ('6', '高雄');


INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('1', '大安', '1');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('2', '萬華', '1');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('3', '內湖', '1');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('4', '新莊', '2');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('5', '板橋', '2');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('6', '樹林', '2');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('7', '中壢', '3');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('8', '平鎮', '3');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('9', '龍潭', '3');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('10', '鳳林鎮', '4');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('11', '玉里鎮', '4');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('12', '西屯', '5');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('13', '南屯', '5');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('14', '北屯', '5');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('15', '豐原', '5');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('16', '楠梓', '6');
INSERT INTO `mask`.`district` (`id`, `name`, `city_id`) VALUES ('17', '左營', '6');



