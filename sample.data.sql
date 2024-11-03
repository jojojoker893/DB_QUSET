-- channelsテーブルにサンプルデータを追加
INSERT INTO channels (channel_name) VALUES 
('Drama_Channel'), 
('Comedy_Channel'), 
('Documentary_Channel'),
('Sci-Fi_Channel'),
('Action_Channel');

-- genresテーブルにサンプルデータを追加
INSERT INTO genres (genre_name) VALUES 
('Drama'), 
('Comedy'), 
('Documentary'),
('Sci-Fi'), 
('Action');

-- programsテーブルにサンプルデータを追加
INSERT INTO programs (program_name, program_detail, channel_id, genre_id) VALUES 
('Nature Wonders', 'A documentary on natural wonders of the world.', 1, 3), 
('Funny Moments', 'A comedy show featuring funny moments.', 2, 2),
('Drama Series', 'A dramatic series with intense storytelling.', 3, 1),
('Space Adventure', 'A thrilling sci-fi journey across the stars.', 4, 4),
('Action Packed', 'High energy action sequences.', 5, 5);

-- seriesテーブルにサンプルデータを追加
INSERT INTO series (series_name, series_no, program_id) VALUES 
('Nature Wonders Series', 1, 1), 
('Funny Moments Series', 1, 2),
('Drama Series Special', 1, 3),
('Space Adventure Series', 1, 4),
('Action Packed Series', 1, 5);

-- seasonsテーブルにサンプルデータを追加
INSERT INTO seasons (season_no, series_id) VALUES 
(1, 1), 
(1, 2), 
(2, 2),
(1, 3),
(1, 4),
(1, 5);

-- episodesテーブルにサンプルデータを追加
INSERT INTO episodes (episode_name, episode_no, episode_detail, video_time, release_date, view, program_id, series_id, season_id) VALUES 
('Episode 1: Grand Canyon', 1, 'Exploring the Grand Canyon.', '00:45:00', '2023-01-15', 1000, 1, 1, 1), 
('Episode 2: Amazon Rainforest', 2, 'A look into the Amazon rainforest.', '00:50:00', '2023-01-22', 1500, 1, 1, 1),
('Episode 1: Funniest Home Videos', 1, 'Compilation of funny home videos.', '00:30:00', '2023-02-01', 2000, 2, 2, 2),
('Episode 2: Animal Pranks', 2, 'Animals playing pranks on humans.', '00:25:00', '2023-02-08', 1800, 2, 2, 2),
('Episode 1: Dramatic Opening', 1, 'A dramatic opening to the series.', '01:00:00', '2023-03-05', 2500, 3, 3, 3),
('Episode 2: Rising Tension', 2, 'An episode filled with tension.', '00:55:00', '2023-03-12', 2200, 3, 3, 3),
('Episode 1: Into the Galaxy', 1, 'Exploring the edges of the galaxy.', '01:30:00', '2023-04-01', 3200, 4, 4, 4),
('Episode 2: Alien Encounter', 2, 'A mysterious encounter with aliens.', '01:25:00', '2023-04-08', 2800, 4, 4, 4),
('Episode 1: High Stakes', 1, 'Action-packed episode.', '00:45:00', '2023-05-10', 3000, 5, 5, 5),
('Episode 2: Showdown', 2, 'A thrilling showdown.', '00:50:00', '2023-05-17', 3500, 5, 5, 5);

-- broadcast_timesテーブルにサンプルデータを追加
INSERT INTO broadcast_times (start_time, end_time, channel_id, program_id, episode_id) VALUES 
('2023-01-15 18:00:00', '2023-01-15 18:45:00', 1, 1, 1),
('2023-01-22 18:00:00', '2023-01-22 18:50:00', 1, 1, 2),
('2023-02-01 20:00:00', '2023-02-01 20:30:00', 2, 2, 3),
('2023-02-08 20:00:00', '2023-02-08 20:25:00', 2, 2, 4),
('2023-03-05 21:00:00', '2023-03-05 22:00:00', 3, 3, 5),
('2023-03-12 21:00:00', '2023-03-12 21:55:00', 3, 3, 6),
('2023-04-01 22:00:00', '2023-04-01 23:30:00', 4, 4, 7),
('2023-04-08 22:00:00', '2023-04-08 23:25:00', 4, 4, 8),
('2023-05-10 19:00:00', '2023-05-10 19:45:00', 5, 5, 9),
('2023-05-17 19:00:00', '2023-05-17 19:50:00', 5, 5, 10);