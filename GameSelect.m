%%
%GameSelect.m;
%V1.0.0 December 12-2020
%Selects Random Game from Steam Library
%Recommended to use included .bat code as means of populating games list
%(add resulting batch file as shortcut to 'Send To' folder in Windows)

%V1.0.1 December 15-2020
%Added Quiz to select from Author's To-Play List if random isn't selected

%V1.0.2 February 09-2021
%Added Minimal Quality of Life Comments for posting to Voidstar Lab Discord

%%
%Clear everything
clc;
clf;
close all;
clear;

%%
%Batch code
%%DirList.bat:

% @echo off
% set dirpath=%1
% dir /b %dirpath% /-p /o:gn > "%dirpath%\DirContents.txt"
% exit

%%
%Game Selection
row = 0;
%store file path for list of games from batch script
gamePath = 'D:\Games\Steam\SteamApps\common\DirContents.txt';
%open/read the list of games from batch script
games = fopen(gamePath,'r');
%iterate through list of games, populate local matrix of strings with
%contents
while ~feof(games)
    row = row + 1;
    list{row} = fscanf(games,'%s',1);
end
%close the list of games file
fclose(games);
%prepare a string for getting user input
prep = 'Random or Quiz? (r v q): ';
%get user input on whether game should be selected randomly or via quiz
K = input(prep,'s');
if(K == 'r')    %choose randomly is selected
    choose = randi([1 length(list)-1]); %randomly pick a game from the matrix
    game = list(choose); %assign that game's title to a string
    disp(game); %display the game to user
    error('Random Game Selected.'); %end program
end
index = 1;
%define the quiz w/ questions for binary user input commands
quiz =    ["Sci-Fi or Fantasy? (0 or 1): "
           "Real-Time or Turn-based? (0 or 1): "
           "RPG-like? (0 or 1): "
           "New or Familiar? (0 or 1): "
           "Shorter or Longer? (0 or 1): "
           "Solo or Multiplayer? (0 or 1): "
           "3D or 2D? (0 or 1): "
           "AAA or Indie? (0 or 1): "
            ];
%iterate through the quiz and get the user's answers
for i= 1:length(quiz)
    display(quiz(i));  %question
    index = index + input(quiz(i))*2^(i-1); %store response
end
%guarantee no overflows when selecting a game based off of answers
if(index > length(list))
    index = index - (index-length(list));
end

disp(index);
while index >= 1
    if(index == 213)
        disp("Blasphemous");    %display game at index
        error("Quiz Complete.");    %end program
    end
    if(index == 149)
        disp("Bloodstained: Ritual of the Night");
        error("Quiz Complete.");
    end
    if(index == 99)
        disp("Crypt of the Necrodancer");
        error("Quiz Complete.");
    end
    if(index == 82)
        disp("Danganronpa: Trigger Happy Havoc");
        error("Quiz Complete.");
    end    
    if(index == 61)
        disp("Dark Souls");
        error("Quiz Complete.");
    end
    if(index == 20)
        disp("Fallout 4");
        error("Quiz Complete.");
    end
    if(index == 131)
        disp("Hand of Fate");
        error("Quiz Complete.");
    end
    if(index == 197)
        disp("Hollow Knight");
        error("Quiz Complete.");
    end
    if(index == 28)
        disp("NieR: Automata");
        error("Quiz Complete.");
    end
    if(index == 23)
        disp("Octopath Traveler");
        error("Quiz Complete.");
    end    
    if(index == 30)
        disp("Persona 4: Golden");
        error("Quiz Complete.");
    end
    if(index == 1)
        disp("Portal");
        error("Quiz Complete.");
    end
    if(index == 32)
        disp("Portal 2");
        error("Quiz Complete.");
    end
    if(index == 16)
        disp("Resident Evil 2");
        error("Quiz Complete.");
    end
    if(index == 4)
        disp("Rise of the Tomb Raider");
        error("Quiz Complete.");
    end
    if(index == 160)
        disp("Risk of Rain 2");
        error("Quiz Complete.");
    end    
    if(index == 232)
        disp("River City Ransom Underground");
        error("Quiz Complete.");
    end
    if(index == 224)
        disp("A Robot Named Fight!");
        error("Quiz Complete.");
    end
    if(index == 240)
        disp("Starbound");
        error("Quiz Complete.");
    end
    if(index == 228)
        disp("Streets of Rogue");
        error("Quiz Complete.");
    end
    if(index == 119)
        disp("Temtem");
        error("Quiz Complete.");
    end
    if(index == 241)
        disp("Terraria");
        error("Quiz Complete.");
    end    
    if(index == 118)
        disp("Total War: Shogun 2");
        error("Quiz Complete.");
    end
    if(index == 229)
        disp("Unepic");
        error("Quiz Complete.");
    end
    if(index == 22)
        disp("Valkyria Chronicles");
        error("Quiz Complete.");
    end
    if(index == 21)
        disp("The Witcher 3: Wild Hunt");
        error("Quiz Complete.");
    end
    index = index - 1;  %decrement index as game selected didn't match options
end