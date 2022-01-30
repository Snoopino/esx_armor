INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('bulletproof', 'Bulletproof Vest', 1, 0, 1),
	('bulletproof2', 'Bulletproof Vest', 1, 0, 0),
    ('bulletproofpolice', 'Bulletproof Vest', 1, 0, 1)
;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('noarmor', 'Bulletproof Vest', 1, 0, 0),
    ('noarmor2', 'Bulletproof Vest', 1, 0, 1),
	('noarmorpolice', 'Bulletproof Vest', 1, 0, 0)
;

ALTER TABLE `users` ADD `armour` TINYINT UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `users` ADD `health` TINYINT UNSIGNED NOT NULL DEFAULT '200';