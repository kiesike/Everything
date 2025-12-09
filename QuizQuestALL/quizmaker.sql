-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2025 at 04:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizmaker`
--

-- --------------------------------------------------------

--
-- Table structure for table `choices`
--

CREATE TABLE `choices` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `choice_label` char(1) NOT NULL,
  `choice_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `choices`
--

INSERT INTO `choices` (`id`, `question_id`, `choice_label`, `choice_text`) VALUES
(49, 41, 'A', 'berna'),
(50, 41, 'B', 'bernadette'),
(51, 41, 'C', 'regir'),
(52, 41, 'D', 'my bebe'),
(53, 50, 'A', 'Suzuka Nakamoto'),
(54, 50, 'B', 'Moa Kikuchi'),
(55, 50, 'C', 'Yui MIzuno'),
(56, 50, 'D', 'Momo Okazaki'),
(57, 51, 'A', 'Suzuka Nakamoto'),
(58, 51, 'B', 'Moa Kikuchi'),
(59, 51, 'C', 'Yui Mizuno'),
(60, 51, 'D', 'Momo Okazaki');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `class_code` varchar(7) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `teacher_id`, `title`, `section`, `class_code`, `created_at`) VALUES
(4, 14, 'anime', '123', '276F025', '2025-12-08 14:40:24'),
(5, 16, 'English', 'AI-11', '49B79C2', '2025-12-08 18:16:40'),
(6, 16, 'Science', 'AI-21', '793DDEC', '2025-12-08 18:51:05'),
(7, 16, 'BABYMETAL', 'AI-31', 'FB402BD', '2025-12-08 19:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `question_type` enum('multiple','identification','truefalse') NOT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `quiz_id`, `question_text`, `question_type`, `correct_answer`, `position`) VALUES
(41, 22, 'mahal kita', 'multiple', 'B', 0),
(42, 23, 'i love bernadette', 'truefalse', 'True', 0),
(43, 24, '1 + 1?', 'identification', 'Extrafraligicoius coillystuffy damn bro , shii', 0),
(44, 24, 'this sis trueeeee', 'truefalse', 'False', 0),
(45, 25, 'testing', 'identification', 'testing', 0),
(46, 26, 'hopefully bruh', 'identification', 'we shall seeeeee', 0),
(47, 27, 'HELL YEAHH RUHH', 'identification', 'GAWD DAYUMM BRUHH', 0),
(48, 28, 'testingggg', 'identification', 'tingggtesss', 0),
(49, 29, 'fuckk yuuuhhh', 'identification', 'it dussssss', 0),
(50, 30, 'Who is the main Vocalist of Babymetal?', 'multiple', 'A', 0),
(51, 30, 'Who left Babymetal?', 'multiple', 'B', 0),
(52, 30, 'Who is the Main death Growler of Babymetal?', 'identification', 'MomoOkazaki', 0);

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `class_code` varchar(50) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `teacher_id`, `title`, `class_code`, `subject_id`, `created_at`, `class_id`) VALUES
(22, 14, 'quiz 1', '276F025', NULL, '2025-12-08 07:45:58', 4),
(23, 14, 'quiz 2', '276F025', NULL, '2025-12-08 07:46:35', 4),
(24, 16, 'English test', '49B79C2', NULL, '2025-12-08 10:18:29', 5),
(25, 16, 'testing', '49B79C2', NULL, '2025-12-08 10:29:09', 5),
(26, 16, 'Can i make twoo?', '49B79C2', NULL, '2025-12-08 10:45:18', 5),
(27, 16, 'IT WORKS BBRUHHHH', '49B79C2', NULL, '2025-12-08 10:45:37', 5),
(28, 16, 'Science tessst', '793DDEC', NULL, '2025-12-08 10:51:28', 6),
(29, 16, 'does it workkk', '793DDEC', NULL, '2025-12-08 10:51:43', 6),
(30, 16, 'Babymetal Test', 'FB402BD', NULL, '2025-12-08 11:40:10', 7);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `section_name` varchar(100) NOT NULL,
  `grade_level` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_classes`
--

CREATE TABLE `student_classes` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_code` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_classes`
--

INSERT INTO `student_classes` (`id`, `student_id`, `class_code`, `title`) VALUES
(12, 16, 'FB402BD', ''),
(13, 16, '793DDEC', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_exp`
--

CREATE TABLE `student_exp` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_code` varchar(255) NOT NULL,
  `exp` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) NOT NULL DEFAULT 'newbie',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_exp`
--

INSERT INTO `student_exp` (`id`, `student_id`, `class_code`, `exp`, `title`, `updated_at`) VALUES
(8, 15, '276F025', 20, 'newbie', '2025-12-08 07:47:00'),
(9, 17, 'FB402BD', 10, 'newbie', '2025-12-08 11:42:10'),
(10, 18, 'FB402BD', 30, 'newbie', '2025-12-08 11:44:05'),
(11, 18, '793DDEC', 0, 'newbie', '2025-12-08 12:08:16'),
(12, 18, '49B79C2', 0, 'newbie', '2025-12-08 12:11:37');

-- --------------------------------------------------------

--
-- Table structure for table `student_quizzes`
--

CREATE TABLE `student_quizzes` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `taken_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_quizzes`
--

INSERT INTO `student_quizzes` (`id`, `student_id`, `quiz_id`, `score`, `taken_at`) VALUES
(4, 15, 23, 1, '2025-12-08 07:46:55'),
(5, 15, 22, 1, '2025-12-08 07:47:00'),
(6, 17, 30, 1, '2025-12-08 11:42:10'),
(7, 18, 30, 3, '2025-12-08 11:44:05'),
(8, 18, 29, 0, '2025-12-08 12:08:16'),
(9, 18, 27, 0, '2025-12-08 12:11:37'),
(10, 18, 28, 0, '2025-12-08 14:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `student_sections`
--

CREATE TABLE `student_sections` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','teacher') NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_image` varchar(255) DEFAULT NULL,
  `school_affiliation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `full_name`, `email`, `created_at`, `profile_image`, `school_affiliation`) VALUES
(14, 'newteach', '$2y$10$SmugHVFZwmkidIpAku4nwecplQAKKgkJpnqaQH6h.M2Bc6BMuZoRy', 'teacher', 'newteach', 'newteach', '2025-12-08 06:38:35', NULL, 'newteach'),
(15, 'newstu', '$2y$10$VXk25t9pZ08tLv1qTWlbXesHY6zNlTRyWsnVAKhrInL50OMN.gMzK', 'student', 'newstu', 'newstu@gmail.com', '2025-12-08 06:54:52', 'assets/uploads/prof_69368e44dc3f86.79995523.jpg', ''),
(16, 'killerkidz098', '$2y$10$5vk6z0b5FluFgo7mEKYFOOxYpC304VGKUtcO899MAbD3tBhsponxy', 'teacher', 'Shan Riczen Daga', 'shanriczendaga@gmail.com', '2025-12-08 10:16:14', 'assets/uploads/prof_6936b7ab546730.80406143.jpg', 'Leyte Normal University'),
(17, 'shan', '$2y$10$rWrv2mc/BAnvnuf3OPI9p.F/YlRFVnBbE7qSmbSSlE6wgRbJ5C.Su', 'student', 'Shan', 'shandaga@gmai.com', '2025-12-08 11:41:01', NULL, ''),
(18, 'kiesike', '$2y$10$ecMQQsNTVNr/R0CHkN1kr.puIc6eD/1zl6KYhZit8.YFLLbbICtbW', 'student', 'kiesike', 'kiesike@gmail.com', '2025-12-08 11:43:18', 'assets/uploads/prof_6936e5fa456da5.02959563.jpg', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `choices`
--
ALTER TABLE `choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_code` (`class_code`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_classes`
--
ALTER TABLE `student_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_exp`
--
ALTER TABLE `student_exp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_student_class` (`student_id`,`class_code`);

--
-- Indexes for table `student_quizzes`
--
ALTER TABLE `student_quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `student_sections`
--
ALTER TABLE `student_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `choices`
--
ALTER TABLE `choices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_classes`
--
ALTER TABLE `student_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `student_exp`
--
ALTER TABLE `student_exp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `student_quizzes`
--
ALTER TABLE `student_quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student_sections`
--
ALTER TABLE `student_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `choices`
--
ALTER TABLE `choices`
  ADD CONSTRAINT `choices_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `quizzes_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_classes`
--
ALTER TABLE `student_classes`
  ADD CONSTRAINT `student_classes_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_quizzes`
--
ALTER TABLE `student_quizzes`
  ADD CONSTRAINT `student_quizzes_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_quizzes_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_sections`
--
ALTER TABLE `student_sections`
  ADD CONSTRAINT `student_sections_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_sections_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
