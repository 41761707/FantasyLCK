# FantasyLCK
Choose your favourite players, create dream team and fight against your friends in well known "Fantasy" format!

## What's Fantasy?
Fantasy LCK is a game in which all participants act as owners of an unique virtual team. The users select their rosters consiting of 5 players, 2 substitutional players (subs) and a team banner (In this version of Fantasy all killed or destroyed map objectives are counted as a team effort, not individual, hence teams also get points!) by participating in a draft or by choosing their roster, limited by salary-cap.\
After creating a team, the player is able to join a private league with his friends (up to 8 players) or play only in public one. In the public league your score is evaluated as a sum of all points collected by your team. Best player is determined by having the highest score after the regular season ends.\
In private league, you can choose another option of playing, the "round-robin", which works exactly like in traditional football (or soccer, call it whatever you want) leagues.\
Every round players are paired and play against each other. The user with higher score in given round is awarded 3 points. Beaten player gets 0 points (We don't really expect and draws, but in case it happens, players are awarded 1 point each). At the end of reguar season, the player with highest points wins.

## How to run
Clone this repository, type 
```
python3 run.py
```
and head into the address that will be prompted on your terminal.
## Already implemented
- Database (all necessary tables and triggers)
- Base.html functionality
- Schedule.html functionality
- Login.html style
- Players.html functionality
- Table.html functionality
- How to play funtionality
## TO-DO's
- Perform successful login and register operations
- Restore password using json tokens
- Create your own leagues and add other players
- Create global league with non-draft setting
- Create your own team in private league using draft setting
- Transfers (after all league realted stuffs)
- More TO-DO's upcoming in the future (I guess)

