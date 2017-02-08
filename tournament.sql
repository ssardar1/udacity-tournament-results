-- Table definitions for the tournament project.
-- Import using PostgreSQL

CREATE DATABASE tournament

\c tournament


CREATE TABLE players(
    badge SERIAL PRIMARY KEY,
    name TEXT
)

CREATE TABLE matches(
    match_id SERIAL PRIMARY KEY,
    winner INTEGER REFERENCES players(badge),
    loser INTEGER REFERENCES players(badge)
)

--ADD TEST PLAYERS
--INSERT INTO players(name) values('Harpo')
--INSERT INTO players(name) values('Chris')
--INSERT INTO players(name) values('Jessica')
--INSERT INTO players(name) values('Kenny')
--INSERT INTO players(name) values('Jesus')
--INSERT INTO players(name) values('Monica')
--INSERT INTO players(name) values('Batman')
--INSERT INTO players(name) values('Dr. Octopus')

--ADD TEST MATCHES
--INSERT INTO matches(winner, loser) values(1, 2)
--INSERT INTO matches(winner, loser) values(3, 4)
--INSERT INTO matches(winner, loser) values(5, 6)
--INSERT INTO matches(winner, loser) values(7, 8)
--INSERT INTO matches(winner, loser) values(2, 1)
--INSERT INTO matches(winner, loser) values(4, 3)
--INSERT INTO matches(winner, loser) values(6, 5)
--INSERT INTO matches(winner, loser) values(8, 7)
--INSERT INTO matches(winner, loser) values(1, 3)
--INSERT INTO matches(winner, loser) values(5, 8)
--INSERT INTO matches(winner, loser) values(4, 6)
--INSERT INTO matches(winner, loser) values(2, 7)

-- Create the "Wins" view
CREATE MATERIALIZED VIEW view_wins AS
    SELECT players.badge AS player, count(matches.winner) AS wins
    FROM players LEFT JOIN matches
    ON players.badge = matches.winner
    GROUP BY players.badge, matches.winner
    ORDER BY players.badge

-- Create the "Losses" view
CREATE MATERIALIZED VIEW view_losses AS
    SELECT players.badge AS player, count(matches.loser) AS losses
    FROM players LEFT JOIN matches
    ON players.badge = matches.loser
    GROUP BY players.badge, matches.loser
    ORDER BY players.badge

-- Create the "Rounds" view
CREATE MATERIALIZED VIEW view_matches AS
    SELECT players.badge AS player, count(matches) AS matches
    FROM players LEFT JOIN matches
    ON(players.badge=matches.winner) OR(players.badge=matches.loser)
    GROUP BY players.badge
    ORDER BY players.badge ASC
