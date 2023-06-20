-- Active: 1687191343544@@127.0.0.1@3306

CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    nickname TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

INSERT INTO users (id, nickname, email, password, role)
VALUES
-- tipo NORMAL e senha = Rafael123@
('u001', 'Rafael', 'rafael@email.com', '$2a$12$NL5qvTKiizSpCbgF8.avmed9IT8IpjR0aDl6vr2Yh.XtJLVI5RJwq', 'USER'),

-- tipo NORMAL e senha = Lana123@
('u002', 'Lana', 'lana@email.com', '$2a$12$c9Q.C0NSwZ28XhBLWrR8tuBHi44d7PP.Gp0lNBHtIju/MXDAN0932', 'USER'),

-- tipo Admin e senha = Gabriel123@
('u003', 'Gabriel', 'gabriel@email.com', '$2a$12$U4W.sWgFqTRrDR67FnLIHOoFXI7edCj7VDroTjaA2IOQqPmf6SUbu', 'ADMIN');

SELECT * from users;


CREATE TABLE posts(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT (0) NOT NULL,
    dislikes INTEGER DEFAULT (0) NOT NULL,
    comments_post INTEGER DEFAULT (0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

INSERT INTO posts (id, creator_id, content)
VALUES
('p001', 'u001', 'A vida é bela!'),
('p002', 'u002', 'Palmeiras não tem mundial' );

SELECT * FROM posts;
 

CREATE TABLE likes_dislikes_posts(
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

INSERT INTO likes_dislikes_posts (user_id, post_id, like)
VALUES
('U002', 'p001', 1),
('U003', 'p001', 1),
('u001', 'p002', 1),
('u003', 'p002', 0);



UPDATE posts
SET likes = 2, dislikes = 0
WHERE id = 'p001';

UPDATE posts
SET likes = 1, dislikes = 1
WHERE id = 'p002';

SELECT * FROM likes_dislikes_posts;


CREATE TABLE comments(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT (0) NOT NULL,
    dislikes INTEGER DEFAULT (0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

SELECT * FROM comments;


CREATE TABLE likes_dislikes_comments(
    user_id TEXT NOT NULL,
    comments_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (comments_id) REFERENCES comments(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);




-- Queries de deleção

DROP TABLE likes_dislikes_comments;


DROP TABLE likes_dislikes_posts;

DROP TABLE comments;

DROP TABLE posts;
DROP TABLE users;
