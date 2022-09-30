SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
CREATE TABLE `employer` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `employer` (`id`, `name`, `email`, `password`) VALUES
(4, 'VOIS ', 'company@vois.com', '123456'),
(10, 'HTC', 'company@htc.com', '123456'),
(11, 'Apple', 'company@apple.com', '123456'),
(14, 'Wipro', 'company@wipro.com', '123456'),
(15, 'Infosys ', 'company@infosys.com', '123456'),
(16, 'Accenture', 'company@accenture.com', '123456'),
(26, 'Microsoft', 'company@microsoft.com', '123456'),
(27, 'jpmorgan', 'company@jpmorgan.com', '123456'),
(28, 'Facebook', 'company@facebook.com', '123456'),
(29, 'MindTree', 'company@mindtree.com', '123456');
CREATE TABLE `jobsapplied` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `pid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `jobsapplied` (`id`, `date`, `pid`, `sid`, `status`) VALUES
(26, '2022-01-26', 5, 35, 'sent'),
(27, '2022-01-26', 4, 35, 'Accepted'),
(28, '2022-01-26', 8, 35, 'sent'),
(29, '2022-01-27', 39, 34, 'sent'),
(35, '2022-01-31', 4, 34, 'sent');
CREATE TABLE `logpost` (
  `lpid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `category` varchar(500) NOT NULL,
  `industry` varchar(500) NOT NULL,
  `role` varchar(100) NOT NULL,
  `employmentType` varchar(500) NOT NULL,
  `status` varchar(500) NOT NULL,
  `action` varchar(500) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `logpost` (`lpid`, `pid`, `eid`, `name`, `category`, `industry`, `role`, `employmentType`, `status`, `action`, `cdate`) VALUES
(7, 40, 4, 'Product Manager', 'Business MindTreeligence Jobs', 'IT-Software , Software Services', 'Lead', 'Permanent', 'Open', 'INSERTED', '2022-02-02 10:46:59'),
(8, 41, 29, 'Graphic Designer', 'Graphic Designer Jobs', 'Animation , Gaming', 'Intern', 'Permanent', 'Open', 'INSERTED', '2022-02-02 10:53:40'),
(9, 42, 28, 'Python Developer', 'IT Jobs', 'IT-Software , Software Services', 'Asst. Python Developer ', 'Permanent', 'Open', 'INSERTED', '2022-02-02 11:03:24'),
(10, 6, 14, 'Team Lead (Technical)', 'IT Jobs', 'IT-Software , Software Services', 'Team Lead', 'Permanent', 'open', 'UPDATED', '2022-02-02 11:07:48'),
(11, 8, 16, 'Accounts Manager', 'Accounting Jobs', 'Accounting , Finance', 'Accounts Manager', 'Permanent', 'open', 'UPDATED', '2022-02-02 11:09:58');
CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `eid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category` varchar(500) NOT NULL,
  `minexp` varchar(100) NOT NULL,
  `desc` varchar(5000) NOT NULL,
  `salary` varchar(200) NOT NULL,
  `industry` varchar(500) NOT NULL,
  `role` varchar(500) NOT NULL,
  `employmentType` varchar(500) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `post` (`id`, `date`, `eid`, `name`, `category`, `minexp`, `desc`, `salary`, `industry`, `role`, `employmentType`, `status`) VALUES
(6, '2018-10-04 18:30:00', 14, 'Team Lead (Technical)', 'IT Jobs', '8', 'Aid a group of programmers.', '100000-150000', 'IT-Software , Software Services', 'Team Lead', 'Permanent', 'open'),
(8, '2018-10-04 18:30:00', 16, 'Accounts Manager', 'Accounting Jobs', '6', 'Experience with accounting software. General Math skills.', '70000-80000', 'Accounting , Finance', 'Accounts Manager', 'Permanent', 'open'),
(40, '2022-02-01 18:30:00', 4, 'Product Manager', 'Business MindTreeligence Jobs', '3', 'Communication Skills, Technical Knowledge', '40000-60000', 'IT-Software , Software Services', 'Lead', 'Permanent', 'Open'),
(41, '2022-02-01 18:30:00', 29, 'Graphic Designer', 'Graphic Designer Jobs', '3', '3D Animation, Adobe products.', '30000-50000', 'Animation , Gaming', 'Intern', 'Permanent', 'Open'),
(42, '2022-02-01 18:30:00', 28, 'Python Developer', 'IT Jobs', '2', 'Proficiency in Python, Test software components', '40000-60000', 'IT-Software , Software Services', 'Asst. Python Developer ', 'Permanent', 'Open');
DELIMITER $$
CREATE TRIGGER `Existing Row Deleted` AFTER DELETE ON `post` FOR EACH ROW INSERT INTO logpost VALUES(null, OLD.id, OLD.eid, OLD.name, OLD.category, OLD.industry, OLD.role, OLD.employmentType, OLD.status, 'DELETED', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Existing Row Updated` AFTER UPDATE ON `post` FOR EACH ROW INSERT INTO logpost VALUES(null, NEW.id, NEW.eid, NEW.name, NEW.category, NEW.industry, NEW.role, NEW.employmentType, NEW.status, 'UPDATED', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `New Row Inserted` AFTER INSERT ON `post` FOR EACH ROW INSERT INTO logpost VALUES(null, NEW.id, NEW.eid, NEW.name, NEW.category, NEW.industry, NEW.role, NEW.employmentType, NEW.status, 'INSERTED', NOW())
$$
DELIMITER ;
CREATE TABLE `seeker` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `qualification` varchar(500) NOT NULL,
  `dob` date NOT NULL,
  `skills` varchar(2000) NOT NULL,
  `resume` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `seeker` (`id`, `name`, `email`, `password`, `qualification`, `dob`, `skills`, `resume`) VALUES
(34, 'Sumedh Patil', 'sumedh.patil@somaiya.edu', '123456', 'B.Tech', '2002-09-06', 'HTML, CSS, PHP, Python', ''),
(35, 'Vedant P', 'vedant.p@somaiya.edu', '123456', 'B.Tech', '2001-1-1', 'JAVA, C++, HTML,CSS', ''),
(36, 'atharva Wagh', 'a.wagh@somaiya.edu', '123456', 'B.Tech', '2002-05-15', 'C++', ''),
(37, 'Harshal D', 'harshal@somaiya.edu', '123456', 'B.Tech', '2002-06-02', 'html', ''),
(38, 'Parth Paitl', 'parth@somaiya.edu', '123456', 'B.Tech', '2001-08-07', 'PHP', ''),
(39, 'Samyak Patil', 'samyak@somaiya.edu', '123456', 'B.Tech', '2002-08-08', 'C++', ''),
(40, 'Vikrant Singh', 'vikrant@somaiya.edu', '123456', 'B.Tech', '1995-07-1', 'Python', ''),
(41, 'Anushka P', 'anushka@somaiya.edu', '123456', 'B.Tech', '1995-11-25', 'PHP', ''),
(42, 'Radhika Wagh', 'radhika@somaiya.edu', '123456', 'B.Tech', '1991-08-16', 'CSS', ''),
(43, 'Jonny', 'jonny@somaiya.edu', '123456', 'B.Tech', '1998-03-07', 'JAVA', '');
CREATE TABLE `totalactiveusers` (
`TotalActiveUsers` decimal(42,0)
);
CREATE TABLE `totalposts` (
`AllPosts` bigint(21)
);
CREATE TABLE `users` (
`SeekersAndEmployers` bigint(21)
);
DROP TABLE IF EXISTS `totalactiveusers`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `totalactiveusers`  AS SELECT sum(`users`.`SeekersAndEmployers`) AS `TotalActiveUsers` FROM `users` ;
DROP TABLE IF EXISTS `totalposts`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `totalposts`  AS SELECT count(`post`.`id`) AS `AllPosts` FROM `post` ;
DROP TABLE IF EXISTS `users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `users`  AS SELECT count(`seeker`.`id`) AS `SeekersAndEmployers` FROM `seeker` ;
ALTER TABLE `employer`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `jobsapplied`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobapplied_seekerFK` (`sid`),
  ADD KEY `pid` (`pid`);
ALTER TABLE `logpost`
  ADD PRIMARY KEY (`lpid`);
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `employer_postFK` (`eid`);
ALTER TABLE `seeker`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `employer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
ALTER TABLE `jobsapplied`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
ALTER TABLE `logpost`
  MODIFY `lpid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
ALTER TABLE `seeker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
ALTER TABLE `jobsapplied`
  ADD CONSTRAINT `jobapplied_seekerFK` FOREIGN KEY (`sid`) REFERENCES `seeker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `post`
  ADD CONSTRAINT `employer_postFK` FOREIGN KEY (`eid`) REFERENCES `employer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
