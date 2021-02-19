## MATLAB Mao
One of the first programs I've ever written, for freshman year EGR115 at Embry-Riddle Aeronautical University in 2017. A card game called Mao, GUI-less, in MATLAB. Makes perfect sense.

### Original README:
THE GAME OF MAO

FOR UNDERSTANDING THE GAMEPLAY:
It's like the popular card game uno, except there are extra rules that you must follow when laying down certain cards.
No, my program does not tell the user these rules, which may be confusing for first time players, but that is the point of Mao.
Not preforming a rule properly results in a hint and a penalty card added to your hand, so users must figure out what they are supposed to do through trial and error.

FOR UNDERSTANDING THE CODE:
The code is mostly explained in its comments, but I will clarify one large concept here.
The cards are handled through two main matrices, deck and hands.
Deck is a list of cards in a random order, the first column being their face value and the second being the suit.
Cards in the program always consist of these two seperate but paired values.
Card values are "pulled" from the top of the deck as needed and replaced at the bottom when they are no longer in use.
Hands is a cell array which each cell contains the hand (a collection of card values) specific to a player. There is no identifier for which cell belongs to who.
A while loop creates "turns" for each of the players by dealing with only one cell of card values in hands, the first cell.
Each time it loops, hands is rotated so the first cell is a different player's cards.

-Corrina Del Greco, 2017
