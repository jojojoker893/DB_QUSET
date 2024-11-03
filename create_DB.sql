--データベース作成手順

-- データベースの作成
CREATE DATABASE abema;

-- 作成したデータベースの使用
USE abema;

-- channelsテーブル
CREATE TABLE channels (
    id INT NOT NULL AUTO_INCREMENT,
    channel_name VARCHAR(255),
    PRIMARY KEY (id)
);

-- genresテーブル
CREATE TABLE genres (
    id INT NOT NULL AUTO_INCREMENT,
    genre_name VARCHAR(255),
    PRIMARY KEY (id)
);

-- programsテーブル
CREATE TABLE programs (
    id INT NOT NULL AUTO_INCREMENT,
    program_name VARCHAR(255),
    program_detail TEXT,
    channel_id INT,
    genre_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES channels(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

-- seriesテーブル
CREATE TABLE series (
    id INT NOT NULL AUTO_INCREMENT,
    series_name VARCHAR(255),
    series_no INT,
    program_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (program_id) REFERENCES programs(id)
);

-- seasonsテーブル
CREATE TABLE seasons (
    id INT NOT NULL AUTO_INCREMENT,
    season_no INT,
    series_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (series_id) REFERENCES series(id)
);

-- episodesテーブル
CREATE TABLE episodes (
    id INT NOT NULL AUTO_INCREMENT,
    episode_name VARCHAR(255),
    episode_no INT,
    episode_detail TEXT,
    video_time TIME,
    release_date DATE,
    view INT,
    program_id INT,
    series_id INT,
    season_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (program_id) REFERENCES programs(id),
    FOREIGN KEY (series_id) REFERENCES series(id),
    FOREIGN KEY (season_id) REFERENCES seasons(id)
);

-- broadcast_timesテーブル
CREATE TABLE broadcast_times (
    id INT NOT NULL AUTO_INCREMENT,
    start_time DATETIME,
    end_time DATETIME,
    channel_id INT,
    program_id INT,
    episode_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES channels(id),
    FOREIGN KEY (program_id) REFERENCES programs(id),
    FOREIGN KEY (episode_id) REFERENCES episodes(id)
);