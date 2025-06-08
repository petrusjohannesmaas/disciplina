-- Levels
CREATE TABLE levels (
  id INTEGER PRIMARY KEY,
  name TEXT
);

-- Checkpoints
CREATE TABLE checkpoints (
  id INTEGER PRIMARY KEY,
  level_id INTEGER,
  task TEXT,
  lore TEXT,
  xp INTEGER,
  FOREIGN KEY (level_id) REFERENCES levels(id)
);

-- Users
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  username TEXT,
  total_xp INTEGER DEFAULT 0
);

-- User Checkpoint Status
CREATE TABLE user_checkpoints (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  checkpoint_id INTEGER,
  status TEXT CHECK(status IN ('incomplete', 'complete')),
  notes TEXT,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (checkpoint_id) REFERENCES checkpoints(id)
);

-- XP Calculation:

-- You’d use a query like this:

SELECT SUM(c.xp)
FROM user_checkpoints uc
JOIN checkpoints c ON uc.checkpoint_id = c.id
WHERE uc.user_id = ? AND uc.status = 'complete';

