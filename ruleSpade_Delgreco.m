function [hands,deck] = ruleSpade_Delgreco(cardDown,cardNameChoice,hands,deck)
%function for if the card laid down is a spade
%rule: if a spade card is laid down, player must call the suit
%[hands,deck] = ruleSpade_Delgreco(cardDown,cardNameChoice,hands,deck)

% -------------------------------------------
% Program: MAO Spade rule
% Program Purpose: (for Final Project: The Game of Mao) function for if the
% card laid down is of the spade suit
% Created By: Corrina Del Greco
% Section #: 07
%
% Created On: Nov 10, 2017
% Last Modified On: Nov 15, 2017
%
% Credit to:
% By submitting this program with my name,
% I affirm that the creation and modification
% of this program is primarily my own work.
% -------------------------------------------

if strcmp(cardDown{2},'Spades')
    spadeCardName = sprintf('%s of %s',cardNameChoice{1},cardNameChoice{2});
    userInput = input('Have anything else to say? ','s');
    if strcmpi(userInput,spadeCardName)
        fprintf('Good job!\n');
    else
        fprintf('Failure to call the suit. A penalty card is added to your hand.\n');
        hands{1,1}(end+1,1) = deck(1,1);
        hands{1,1}(end,2) = deck(1,2);
        deck(1,:) = [];
    end
end

end