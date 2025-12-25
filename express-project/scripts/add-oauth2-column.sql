-- 添加OAuth2用户ID列到users表
-- 用于关联OAuth2用户中心的用户ID

-- 检查并添加oauth2_id列
ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `oauth2_id` VARCHAR(100) DEFAULT NULL COMMENT 'OAuth2用户中心的用户ID';

-- 添加唯一索引（如果不存在）
-- 注意：MySQL 5.7不支持 IF NOT EXISTS 语法，所以使用存储过程或手动检查
-- 如果索引已存在，以下语句会报错，可以忽略

-- 尝试添加索引（如果已存在会报错，可以忽略）
ALTER TABLE `users` ADD UNIQUE INDEX `uk_oauth2_id` (`oauth2_id`);
ALTER TABLE `users` ADD INDEX `idx_oauth2_id` (`oauth2_id`);

-- 完成
SELECT 'OAuth2列添加完成！' AS message;
