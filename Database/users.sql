-- Drop existing users if they already exist
DROP USER IF EXISTS 'journalist_user'@'%';
DROP USER IF EXISTS 'engager_user'@'%';
DROP USER IF EXISTS 'moderator_user'@'%';
DROP USER IF EXISTS 'admin'@'localhost';

-- Create database users and assign privileges
CREATE USER 'journalist_user'@'%' IDENTIFIED BY 'Journ2025lib#';
CREATE USER 'engager_user'@'%' IDENTIFIED BY 'Engager2025lib#';
CREATE USER 'moderator_user'@'%' IDENTIFIED BY 'Moderator2025lib#';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'Admin2025lib#';


-- __________________________________________________
--                   JOURNALIST USER
-- __________________________________________________
-- Tables
GRANT INSERT ON libertaliadb.journalist TO 'journalist_user'@'%';
GRANT SELECT ON libertaliadb.follow TO 'journalist_user'@'%';
GRANT SELECT ON libertaliadb.`comment` TO 'journalist_user'@'%';
GRANT SELECT ON libertaliadb.reaction TO 'journalist_user'@'%';
GRANT SELECT ON libertaliadb.donation TO 'journalist_user'@'%';
GRANT INSERT, SELECT, DELETE ON libertaliadb.post TO 'journalist_user'@'%';
GRANT SELECT ON libertaliadb.post_reports TO 'journalist_user'@'%';
GRANT INSERT, SELECT ON libertaliadb.hashtag TO 'journalist_user'@'%';
GRANT INSERT, SELECT ON libertaliadb.`reference` TO 'journalist_user'@'%';
GRANT INSERT, UPDATE, SELECT, DELETE ON libertaliadb.journalist_interest TO 'journalist_user'@'%';
GRANT INSERT, SELECT ON libertaliadb.journalist_license TO 'journalist_user'@'%';

-- Views
GRANT SELECT ON libertaliadb.followers_per_journalist TO 'journalist_user'@'%';
GRANT SELECT ON libertaliadb.comments_per_post TO 'journalist_user'@'%';
GRANT SELECT ON libertaliadb.likes_per_post  TO 'journalist_user'@'%';
GRANT SELECT ON libertaliadb.dislikes_per_post  TO 'journalist_user'@'%';

-- Views for security
GRANT SELECT, UPDATE ON libertaliadb.journalist_self_view TO 'journalist_user'@'%'; 
GRANT SELECT ON libertaliadb.journalist_no_password TO 'journalist_user'@'%'; 
-- __________________________________________________



-- __________________________________________________
-- 						ENGAGER USER
-- __________________________________________________
-- Tables
GRANT INSERT ON libertaliadb.engager TO 'engager_user'@'%';
GRANT INSERT, UPDATE, SELECT, DELETE ON libertaliadb.follow TO 'engager_user'@'%';
GRANT INSERT, UPDATE, SELECT, DELETE ON libertaliadb.`comment` TO 'engager_user'@'%';
GRANT INSERT, UPDATE, SELECT, DELETE ON libertaliadb.reaction TO 'engager_user'@'%';
GRANT INSERT, SELECT ON libertaliadb.donation TO 'engager_user'@'%';
GRANT SELECT ON libertaliadb.post TO 'engager_user'@'%';
GRANT SELECT ON libertaliadb.engager_reports TO 'engager_user'@'%';
GRANT INSERT, SELECT ON libertaliadb.hashtag TO 'engager_user'@'%';
GRANT SELECT ON libertaliadb.`reference` TO 'engager_user'@'%';
GRANT INSERT, UPDATE, SELECT, DELETE ON libertaliadb.engager_interests TO 'engager_user'@'%';

-- Views
GRANT SELECT ON libertaliadb.followers_per_journalist TO 'engager_user'@'%';
GRANT SELECT ON libertaliadb.comments_per_post TO 'engager_user'@'%';
GRANT SELECT ON libertaliadb.common_fields  TO 'engager_user'@'%';
GRANT SELECT ON libertaliadb.likes_per_post  TO 'engager_user'@'%';
GRANT SELECT ON libertaliadb.dislikes_per_post  TO 'engager_user'@'%';

-- Views for security
GRANT SELECT, UPDATE ON libertaliadb.engager_self_view TO 'engager_user'@'%'; 
GRANT SELECT ON libertaliadb.engager_no_password TO 'engager_user'@'%'; 
-- __________________________________________________




-- __________________________________________________
--                  MODERATOR USER
-- __________________________________________________
-- Tables
GRANT INSERT, SELECT ON libertaliadb.moderator TO 'moderator_user'@'%';
GRANT INSERT, UPDATE ON libertaliadb.moderator_identity TO 'moderator_user'@'%';
GRANT SELECT ON libertaliadb.`comment` TO 'moderator_user'@'%';
GRANT SELECT ON libertaliadb.post TO 'moderator_user'@'%';
GRANT INSERT, SELECT ON libertaliadb.post_reports TO 'moderator_user'@'%';
GRANT INSERT, SELECT ON libertaliadb.engager_reports TO 'moderator_user'@'%';
GRANT SELECT ON libertaliadb.hashtag TO 'moderator_user'@'%';
GRANT SELECT ON libertaliadb.`reference` TO 'moderator_user'@'%';


-- Views
GRANT SELECT ON libertaliadb.followers_per_journalist TO 'moderator_user'@'%';
GRANT SELECT ON libertaliadb.comments_per_post TO 'moderator_user'@'%';
GRANT SELECT ON libertaliadb.common_fields  TO 'moderator_user'@'%';
GRANT SELECT ON libertaliadb.likes_per_post  TO 'moderator_user'@'%';
GRANT SELECT ON libertaliadb.dislikes_per_post  TO 'moderator_user'@'%';

-- Views for security
GRANT SELECT, UPDATE ON libertaliadb.moderator_self_view TO 'engager_user'@'%'; 
-- __________________________________________________




-- __________________________________________________
-- 						ADMIN
-- __________________________________________________
-- Tables
GRANT SELECT, DELETE ON libertaliadb.journalist TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.engager TO 'admin'@'localhost';
GRANT SELECT, UPDATE, DELETE ON libertaliadb.moderator TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.moderator_identity TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.follow TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.`comment` TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.reaction TO 'admin'@'localhost';
GRANT SELECT ON libertaliadb.donation TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.post TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.post_reports TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.engager_reports TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.hashtag TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.`reference` TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.engager_interests TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.journalist_interest TO 'admin'@'localhost';
GRANT SELECT, DELETE ON libertaliadb.journalist_license TO 'admin'@'localhost';


GRANT SELECT ON libertaliadb.followers_per_journalist  TO 'admin'@'localhost';
GRANT SELECT ON libertaliadb.comments_per_post   TO 'admin'@'localhost';
GRANT SELECT ON libertaliadb.common_fields   TO 'admin'@'localhost';
GRANT SELECT ON libertaliadb.likes_per_post   TO 'admin'@'localhost';
GRANT SELECT ON libertaliadb.dislikes_per_post   TO 'admin'@'localhost';
GRANT SELECT ON libertaliadb.num_engager_reports    TO 'admin'@'localhost';
-- __________________________________________________



-- Flush privileges to apply changes
FLUSH PRIVILEGES;

