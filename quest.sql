
--よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
SELECT episode_name, view
FROM episodes
ORDER BY view DESC LIMIT 3;

--よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
SELECT p.program_name, s.season_no, e.episode_no, e.episode_name, e.view
FROM episodes AS e
JOIN programs AS p ON e.program_id = p.id
JOIN seasons AS s ON e.season_id = s.id
ORDER BY view DESC LIMIT 3;

--本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。
--本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。
--なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします
SELECT c.channel_name, b.start_time, b.end_time, s.season_no, e.episode_no, e.episode_name, e.episode_detail
FROM channels AS c
JOIN broadcast_times AS b ON b.channel_id = c.id
JOIN episodes AS e ON b.episode_id = e.id
JOIN seasons AS s ON e.season_id = s.id
WHERE DATE(b.start_time) = CURDATE();--本日の日付取得 

--ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。
--ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください

SELECT b.start_time, b.end_time, s.season_no, e.episode_no, e.episode_name, e.episode_detail
FROM channels AS c
JOIN broadcast_times AS b ON b.channel_id = c.id
JOIN episodes AS e ON b.episode_id = e.id
JOIN seasons AS s ON e.season_id = s.id
WHERE c.channel_name = 'Drama_Channel' 
AND DATE(b.start_time) >= CURDATE() --本日の日付以上
AND DATE(b.start_time) <= DATE_ADD(CURDATE(), INTERVAL 1 WEEk); --日付から1週間分

--(advanced) 直近一週間で最も見られた番組が知りたいです。
--直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください

SELECT p.program_name, SUM(e.view) AS total_view
FROM episodes AS e 
JOIN programs AS p ON e.program_id = p.id
JOIN broadcast_times AS b ON b.episode_id = e.id
WHERE DATE(b.start_time) >= (CURDATE() - INTERVAL 1 WEEk) --本日から直近1週間
GROUP BY p.program_name --番組名で集約
ORDER BY total_view DESC LIMIT 2; --視聴数の合計で並び替え


--(advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。
--ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。
SELECT g.genre_name, p.program_name, AVG(e.view)
FROM episodes AS e
JOIN programs AS p ON e.program_id = p.id
JOIN genres AS g ON p.genre_id = g.id
GROUP BY g.genre_name, p.program_name
HAVING AVG(e.view);








