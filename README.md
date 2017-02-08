<<<<<<< HEAD
# udacity-tournament-results

Coordinate and track results for Swiss-style game tournaments using Python 2 and a PostgreSQL database.

## Initialization
Log into your web server via SSH and be sure to have **Python 2** and **PostgreSQL** installed.

To initialize the required tables, run:

```
$ psql
```
```
$ \i tournament.sql
```

To run a suite of unit tests, quit **PostgreSQL** with `\q` and then:

```
$ python tournament_test.py
```

## Tables available

**PLAYERS**

Includes the player's name and ID number.

**MATCHES**

ALL match results are recorded here with a match ID numer and the resulting winner or loser.

**VIEW_WINS** _(view)_

Keeps track of the number of wins for each player.

**VIEW_LOSSES** _(view)_

Keeps track of the number of losses for each player.

**VIEW_MATCHES** _(view)_

Keeps track of the count of matches each player has played.

## Running a tournament

Use the available Python functions, in this recommended order, to coordinate a game:

METHOD | ACCEPTS | PURPOSE
--- | --- | ---
registerPlayer(name) | _name as string_ | Adds a player to the database to be calculated in pairings and standings.
countPlayers() | _(no input)_ | Counts all registered players.
swissPairings() | _(no input)_ | Returns a list of players grouped into pairs, arranged according to their current standings. Players are paired with those with about the same number of wins.
reportMatch(winner, loser) | _winner as string_, _loser as string_ | Records the result of any given match. 
playerStandings() | _(no input)_ | Returns the number of wins from all players. 

=======
# udacity-tournament-results
>>>>>>> ba073d4ba784795d4f99b5b7bc5d67b1b13815ff
