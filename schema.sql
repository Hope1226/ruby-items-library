/* Database schema analogical to the structure of the classes in our app. */

-- Create book table




-- Create label table




-- Create music album table



-- Create genre table 



-- Create game table 
CREATE TABLE game (
    id              INT GENERATED ALWAYS AS IDENTITY,
    multiplayer     BOOLEAN,
    last_played_at  DATE,
    publish_date    DATE,
    genre_id        INT,
    author_id       INT,
    label_id        INT,
    archived        BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY(genre_id) REFERENCES genre(id),
    FOREIGN KEY(author_id) REFERENCES author(id),
    FOREIGN KEY(label_id) REFERENCES label(id)
);

-- Create author table
CREATE TABLE author (
    id          INT GENERATED ALWAYS AS IDENTITY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100),
    PRIMARY KEY(id)
);