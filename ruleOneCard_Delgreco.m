function [hands,deck] = ruleOneCard_Delgreco(hands,deck)
%function for if the card laid down is a king
%rule: if playing the card leaves the player with only one card left in their hand, player must say "mao"
%[hands,deck] = ruleOneCard_Delgreco(hands,deck)

% -------------------------------------------
% Program: MAO One Card Rule
% Program Purpose: (for Final Project: The Game of Mao) function for if the
% card laid down leaves the player with only one card left
% Created By: Corrina Del Greco
% Section #: 07
%
% Created On: Nov 17, 2017
% Last Modified On: Dec 8, 2017
%
% Credit to:
% By submitting this program with my name,
% I affirm that the creation and modification
% of this program is primarily my own work.
% -------------------------------------------

if size(hands{1},1) == 1
    userInput = input('Have anything else to say? ','s');
    if strcmpi(userInput,'mao')
        fprintf('Good job!\n');
    else
        fprintf('Failure to say "Mao". A penalty card is added to your hand.\n');
        hands{1,1}(end+1,1) = deck(1,1);
        hands{1,1}(end,2) = deck(1,2);
        deck(1,:) = [];
    end
end

end