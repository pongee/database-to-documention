create table if not exists `user` (
  `id` int(10) unsigned not null,
  `email` varchar(64) collate latin1_general_ci not null,
  `password` varchar(32) collate latin1_general_ci not null,
  `nick` varchar(16) collate latin1_general_ci default null,
  `status` enum('enabled', 'disabled') collate latin1_general_ci default null,
  `admin` bit null,
  `geom` geometry not null,
  `created_at` datetime null,
  `updated_at` datetime null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  primary key (`id`),
  index `i_password` (`password`),
  index `ih_password` (`password`) using hash,
  index `ib_password` (`password`) using btree,
  fulltext key `if_email_password` (`email`,`password`),
  unique key `iu_email_password` (`nick`),
  unique key `iuh_email_password` (`nick`) using hash,
  unique key `iub_email_password` (`nick`) using btree
) engine=InnoDB default charset=latin1 collate=latin1_general_ci;
