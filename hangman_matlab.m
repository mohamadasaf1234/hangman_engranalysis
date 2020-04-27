% Welcome to Hangman
% Choose your letters carefully or you'll lose quickly!

% Authors:
% Mohamad Asaf
% Daniel  Bici
% Dalton  Hamilton
% Brian   O'Connell



function Hangman
% This is the main function to run the program

fprintf("Welcome to hangman\n");
fprintf("Guess the right word and you win! You have 6 tries. Good luck\n");
fprintf("\n");

% Call the noose function to draw it
%
DrawNoose()

% Define some variables
%
Wrong_Letters = [];

% Randomly generate a word to pick based upon a test case
%
generate_case = randi(5);

% chooses a word to play with
%
switch generate_case
    case 1
        word = 'matrices';
    case 2
        word = 'eigenvector';
    case 3
        word = 'identity';
    case 4
        word = 'transpose';
    case 5
        word = 'determinant';
end

TheWordToBeGuessed = lower(word); %Converts to lowercase
MainString = string(TheWordToBeGuessed); % Converts to string
Length = length(TheWordToBeGuessed); %Finds the length of the string

AmountOfLetters = isletter(TheWordToBeGuessed);

%Print underscores for all unknown letters
%
for i=1:Length
    
 String1= fprintf('_ ');

end

%Format Neatly
fprintf("\n");

% Go into a loop as long as you can guess a letter
%
counter = 0;

% This portion of the code checks if the letter provided matches the word
% That has been randomly generated
% letter_a : the letter provided by the user
% word_a: the word generated

used_letters = "";
AmountWrong = 0;

% check if the letter is in the word
%

if AmountWrong < 6
    if isempty(strfind(word, letter_guessed))
        used_letters = append(used_letters, letter_guessed);
        
        AmountWrong = AmountWrong + 1;
    
        % call the hangman bodypart function
        %
        DrawHangingMan(AmountWrong)
        fprintf("used_letters: %s ", used_letters)
        
    else
            % CALL THE FUNCTION THAT DISPLAYS YOU GOT THE LETTER!
    %!!!!
    %guessed
    fprintf("Nice, you got one\n");
        
    end
        
elseif AmountWrong == 6
    quit;

end
    


while 1
    counter  = counter+1;
    % Print the wrong letters each time one guesses
    fprintf("Letters tested: ")
    for i=1:length(Wrong_Letters)
        fprintf("%s ", Wrong_Letters(i))
    end

    % format neatly
    fprintf("\n");

    % take the user's input from the command window
    %s
    letter_guessed = input("Input a Letter:", 's');
    
    % call the word_checker function
    %
    word_checker(TheWordToBeGuessed, letter_guessed)
    
    if counter == 2
        break;
    end
end


end



% call the noose function to draw the noose
%
function DrawNoose()

rectangle('Position', [5 5 5 5],'linewidth',5,'edgecolor','k');

S1= line([9,9],[9,5]);
S1.Color = 'k'; 
S1.LineWidth = 4;

S2= line([7.5,9],[9,9]);
S2.Color = 'k'; 
S2.LineWidth = 4;

S2= line([7.5,7.5],[8,9]);
S2.Color = 'k'; 
S2.LineWidth = 4;

end



function DrawHangingMan(AmountWrong)

hold on

if (AmountWrong == 1)
hold on
%Draws head
x=7.5;
y=7.75;
r=0.25;
theta = 0:pi/100:2*pi;
a= r*cos(theta)+x;
b=r*sin(theta)+y;
Head = plot(a,b);
Head.LineWidth = 4;
Head.Color = 'b';
end

if (AmountWrong == 2)

%Draws Body
hold on
Body= line([7.5,7.5],[7.5,6]);
Body.Color = 'b'; 
Body.LineWidth = 4;
end

if (AmountWrong == 3)
%Draws Left Leg
hold on
LeftLeg = line([7.5,7],[6,5.5]);
LeftLeg.Color = 'b'; 
LeftLeg.LineWidth = 4;
end

if (AmountWrong == 4)
%Draws Right Leg
hold on
LeftLeg = line([7.5,8],[6,5.5]);
LeftLeg.Color = 'b'; 
LeftLeg.LineWidth = 4;
end

if (AmountWrong == 5)
%Draws Right Arm
hold on
RightArm = line([7.5,7],[7,7.5]);
RightArm.Color = 'b'; 
RightArm.LineWidth = 4;
end

if (AmountWrong == 6)
%Draws Left Arm
hold on
LeftArm = line([7.5,8],[7,7.5]);
LeftArm.Color = 'b'; 
LeftArm.LineWidth = 4;

end

end



% Updated code%

function Hangman()
clear all
close all
clc

fprintf("Welcome to hangman\n");
fprintf("\n");

DrawNoose();

Used_letters = [];

generate_case = randi(10);

% chooses a word to play with
%
switch generate_case
    case 1
        word = 'matrices';
    case 2
        word = 'eigenvector';
    case 3
        word = 'identity';
    case 4
        word = 'transpose';
    case 5
        word = 'determinant';
    case 6
        word = 'algebra';
    case 7
        word = 'calculus';
    case 8
        word = 'geometry';
    case 9
        word = 'matlab';
    case 10
        word = 'corona';
end

AmountWrong = 0; % Counts the amount of wrong guesses
if (AmountWrong == 6)
    fprintf("You've lost\n");
end




TheWordToBeGuessed = lower(word); %Converts to lowercase
MainString = string(TheWordToBeGuessed); % Converts to string
Length = length(TheWordToBeGuessed); %Finds the length of the string

AmountOfLetters = isletter(TheWordToBeGuessed);
String1=[];

for i=1:Length
    String1 = [String1 '_ '];
end
String1
AmountWrong = 0; % Counts the amount of wrong guesses



LettersCorrect = 0;

while 1
%Takes input from player    
    LetterInput = input('Guess a letter: ','s');
    TheInputString = string(LetterInput);
    LowercaseInput = lower(TheInputString);
    StringFindInput= strfind(MainString,LowercaseInput);
    InputLengthCorrect = length(StringFindInput);
    LettersCorrect = LettersCorrect+length(StringFindInput);
    
    %Check Input Correct or Incorrect
    if InputLengthCorrect >= 1
        for i = 1:length(StringFindInput)
        clc
        fprintf('Correct Letter guessed\n')
        String1(StringFindInput(i))=LowercaseInput; %plug letter in correct position
        end
        fprintf('"%s"\n',String1)
        if Length == LettersCorrect
            endgame(Length,LettersCorrect,word) %Endgame
        break
        end
    else
    clc
    fprintf('Wrong letter\n')
    fprintf('"%s"\n',String1)
    AmountWrong= AmountWrong + 1;
    DrawHangingMan(AmountWrong)
    if (AmountWrong == 6)
        endgame(Length,LettersCorrect,word)  %Endgame
        break
    end
    end

end




end
%_________________________________________________________________________________________________________________
function DrawNoose()

hold on 
rectangle('Position', [5 5 5 5],'linewidth',5,'edgecolor','k');

S1= line([9,9],[9,5]);
S1.Color = 'k'; 
S1.LineWidth = 4;

S2= line([7.5,9],[9,9]);
S2.Color = 'k'; 
S2.LineWidth = 4;

S2= line([7.5,7.5],[8,9]);
S2.Color = 'k'; 
S2.LineWidth = 4;

end


function DrawHangingMan(AmountWrong)

hold on

if (AmountWrong == 1)
hold on
%Draws head
x=7.5;
y=7.75;
r=0.25;
theta = 0:pi/100:2*pi;
a= r*cos(theta)+x;
b=r*sin(theta)+y;
Head = plot(a,b);
Head.LineWidth = 4;
Head.Color = 'b';
end

if (AmountWrong == 2)

%Draws Body
hold on
Body= line([7.5,7.5],[7.5,6]);
Body.Color = 'b'; 
Body.LineWidth = 4;
end

if (AmountWrong == 3)
%Draws Left Leg
hold on
LeftLeg = line([7.5,7],[6,5.5]);
LeftLeg.Color = 'b'; 
LeftLeg.LineWidth = 4;
end

if (AmountWrong == 4)
%Draws Right Leg
hold on
LeftLeg = line([7.5,8],[6,5.5]);
LeftLeg.Color = 'b'; 
LeftLeg.LineWidth = 4;
end

if (AmountWrong == 5)
%Draws Right Arm
hold on
RightArm = line([7.5,7],[7,7.5]);
RightArm.Color = 'b'; 
RightArm.LineWidth = 4;
end

if (AmountWrong == 6)
%Draws Left Arm
hold on
LeftArm = line([7.5,8],[7,7.5]);
LeftArm.Color = 'b'; 
LeftArm.LineWidth = 4;

end

end

function endgame(Length,LettersCorrect,word)
if Length==LettersCorrect
    fprintf("You've won!!\n");
else
    fprintf("You've lost\n");
    fprintf('"%s"\n',word);
end
end

              

