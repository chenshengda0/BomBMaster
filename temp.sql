DELIMITER $$
CREATE PROCEDURE template_table()
begin
    DROP TABLE IF EXISTS `sp_template_table`;
    CREATE TABLE `sp_template_table` (`id` BIGINT NOT NULL , PRIMARY KEY (`id`)) ENGINE = MyISAM;
    set @current=0;
    while @current < 140000 do
        INSERT INTO `sp_template_table`(`id`) VALUES (@current);
        set @current=@current+1;
    end while;
end;
$$
DELIMITER ;
