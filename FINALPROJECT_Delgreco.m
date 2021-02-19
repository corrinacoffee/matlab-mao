% -------------------------------------------
% Program: MAO
% Program Purpose: Final Project: The Game of Mao
% Created By: Corrina Del Greco
% Section #: 07
%
% Created On: Oct 27, 2017
% Last Modified On: Dec 8, 2017
%
% Credit to:
% By submitting this program with my name,
% I affirm that the creation and modification
% of this program is primarily my own work.
% -------------------------------------------

clear
clc

play = 'y';
while strcmpi(play,'y')
    
    %initialize a shuffled deck
    faceValue = {'Ace','2','3','4','5','6','7','8','9','10','Jack','Queen','King'}';
    suit = {'Hearts','Diamonds','Spades','Clubs'}';
    [faceValue,suit] = ndgrid(faceValue,suit);
    cards = [faceValue(:),suit(:)];
    dealOrder = randperm(52);
    deck = cards(dealOrder,:);
    
    %prompt the user for number of players
    numPlayers = input('Welcome! How many players? (2-6) ','s');
    numPlayers = str2double(numPlayers); %convert
    while isnan(numPlayers) || mod(numPlayers,1)~=0 || numPlayers<2 || numPlayers>6 %validate
        numPlayers = input('Error! How many players? ','s');
        numPlayers = str2double(numPlayers); %convert again
    end
    
    %introduction
    fprintf('\nWelcome to the game of Mao!\n');
    pause(2);
    fprintf('The only rule I can tell you is this one.\n');
    pause(2);
    fprintf('Let the game of Mao commence.\n\n');
    pause(2);
    
    %deal initial cards
    fprintf('You are each dealt 7 cards to start.\n');
    for p = 1:numPlayers
        hands{p} = deck(1:7,:); %each cell in hands contains a different player's cards, rotated each loop cycle so that the first cell is the active player's hand
        deck(1:7,:) = [];
    end
    pause(2);
    
    %circle through players turns until someone is out of cards
    player = 0;
    someoneWon = 0;
    while someoneWon == 0
        
        %player whose turn it is (player to be used for this cycle of code)
        player = player + 1;
        if player > numPlayers
            player = 1;
        end
        fprintf('\n\n*****PLAYER %d''S TURN*****\n',player);
        
        %card to be played upon
        if ~exist('topCard','var') %first turn, top card is a random card from the top of the deck
            topCard = deck(1,:);
            deck(1,:) = [];
        end
        if exist('cardDown','var') %if there has been a successful play of a card, that is the new top card
            topCard = cardDown;
        end %otherwise, the top card remains whatever it was before
        fprintf('\nThe card to be played upon: %s of %s\n\n',topCard{1},topCard{2});
        
        %show player's hand
        fprintf('Your hand:\n');
        for c = 1:size(hands{1},1)
            fprintf('\t%d) %s of %s\n',c,hands{1}{c,1},hands{1}{c,2});
        end
        
        %user selects card
        cardNumChoice = input('Enter the number of the card from your hand you want to play: ','s');
        cardNumChoice = str2double(cardNumChoice);
        while isnan(cardNumChoice) || mod(cardNumChoice,1)~=0 || cardNumChoice<=0 || cardNumChoice>size(hands{1},1)
            cardNumChoice = input('Error! Enter the number to the left of the name of the card you want to play: ','s');
            cardNumChoice = str2double(cardNumChoice);
        end
        cardNameChoice = hands{1}(cardNumChoice,:);
        fprintf('You laid down the %s of %s.\n',cardNameChoice{1},cardNameChoice{2});
        pause(1);
        
        %rule: card laid down must match face value or suit of top card
        if ~strcmp(cardNameChoice(1),topCard(1)) && ~strcmp(cardNameChoice(2),topCard(2))
            fprintf('Bad card. You are given back your card and an additional penalty card is added to your hand.\n');
            hands{1,1}(end+1,1) = deck(1,1);
            hands{1,1}(end,2) = deck(1,2);
            deck(1,:) = [];
            pause(1);
        else
            fprintf('Good job!\n');
            cardDown = cardNameChoice;
            hands{1,1}(cardNumChoice,:) = [];
            deck = [deck;topCard]; %return old top card to the bottom of the deck
            
            pause(1);
            %check rules after sucessful play of card, function penalizes if not followed
            %rule: if playing the card leaves the player with only one card left in their hand, player must say "mao"
            [hands,deck] = ruleOneCard_Delgreco(hands,deck);
            %rule: if the card is of the spade suit, player must call the suit (say the name of the card)
            [hands,deck] = ruleSpade_Delgreco(cardDown,cardNameChoice,hands,deck);
            %rule: if card laid down is a seven, player must say "have a nice day"
            [hands,deck] = rule7_Delgreco(topCard,cardDown,hands,deck);
            %rule: if card laid down is a king, player must say "all hail the chief"
            [hands,deck] = ruleKing_Delgreco(cardDown,hands,deck);
            %rule: if playing the card leaves the player with no cards left in their hand, player must say "game over"
            [someoneWon,hands,deck] = ruleLastCard_Delgreco(hands,deck);
        end
        
        %rotate the hands cell array for the next player to play
        if someoneWon == 0
            hands = [hands(:,2:end),hands(:,1)];
        else
            winner = player;
        end
        
        fprintf('\nPress any key to move on.');
        pause();
    end
    
    fprintf('\n***********************\n   PLAYER %d HAS WON\n***********************\n\n',winner);
    
    %locate what column player 1 is in the rotating hands matrix
    if winner == 1
        wherePlayerNum1 = 1;
    else
        wherePlayerNum1 = length(hands)+1-(winner-1);
    end
    
    %use the above information to print the player's scores (how many cards they had left) in order
    for k = 0:numPlayers-1
        pause(1);
        playerLoc = wherePlayerNum1+k;
        if playerLoc > numPlayers
            playerLoc = playerLoc - numPlayers;
        end
        score = size(hands{playerLoc},1);
        fprintf('Player %d score: %d\n',k+1,-score);
    end
    
    %option to play again
    play = input('\nPlay again? y/n: ','s');
    while ~strcmpi(play,'y') ||  ~strcmpi(play,'n') %validate
        play = input('Error! Enter y or n: ','s');
    end
    
end

fprintf('\nGoodbye!\n');