function [hands,deck] = ruleKing_Delgreco(cardDown,hands,deck)
%function for if the card laid down is a king
%rule: if card laid down is a king, player must say "all hail the chief"
%[hands,deck] = ruleKing_Delgreco(cardDown,hands,deck)

% -------------------------------------------
% Program: MAO King rule
% Program Purpose: (for Final Project: The Game of Mao) function for if the card laid down is a king
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

if strcmp(cardDown{1},'King')
    userInput = input('Have anything else to say? ','s');
    if strcmpi(userInput,'all hail the chief')
        fprintf('Good job!\n');
    else
        fprintf('Failure to say "all hail the chief". A penalty card is added to your hand.\n');
        hands{1,1}(end+1,1) = deck(1,1);
        hands{1,1}(end,2) = deck(1,2);
        deck(1,:) = [];
    end
end

end