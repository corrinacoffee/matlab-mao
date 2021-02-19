function [hands,deck] = rule7_Delgreco(topCard,cardDown,hands,deck)
%function for if the card laid down has a face value of 7
%rule: if card laid down is a seven, player must say "have a nice day"
%[hands,deck] = rule7_Delgreco(topCard,cardDown,hands,deck)

% -------------------------------------------
% Program: MAO 7 rule
% Program Purpose: (for Final Project: The Game of Mao) function for if the card laid down has a face value of 7
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

if strcmp(cardDown{1},'7')
    userInput = input('Have anything else to say? ','s');
    if strcmp(cardDown{1},topCard{1}) %if the last card was also a 7
        if strcmpi(userInput,'have a very nice day')
            fprintf('Good job!\n');
        else
            fprintf('Failure to say "have a very nice day". A penalty card is added to your hand.\n');
            hands{1,1}(end+1,1) = deck(1,1);
            hands{1,1}(end,2) = deck(1,2);
            deck(1,:) = [];
        end
    else %the last card was not a 7
        if strcmpi(userInput,'have a nice day')
            fprintf('Good job!\n');
        else
            fprintf('Failure to say "have a nice day". A penalty card is added to your hand.\n');
            hands{1,1}(end+1,1) = deck(1,1);
            hands{1,1}(end,2) = deck(1,2);
            deck(1,:) = [];
        end
    end
end

end