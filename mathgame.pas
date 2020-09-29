program mathgame; { TODO make gui }
{$mode Delphi}
var { Global Variables }
	difficult: boolean;
	diffrand: integer = 10;
procedure IOcheck; { Input output result check }
begin
	if IOresult <> 0 then
	begin
		writeln('Error, i can`t parse your input');
		halt(1);
	end;
end;
procedure BeginOfGame; { Text in the beginning of program }
begin
	writeln('Hi! This game can help you tune your abilities in math.');
	writeln('3.0 version of this game include choise for math operations');
end;
procedure maingame_zeroing(var x, y, ans, rightans: integer; var isrightres: boolean);
begin
	x := 0;
	y := 0;
	ans := 0;
	rightans := 0;
	isrightres := false;
end;
procedure RandNumbPlus(var x, y, rightans: integer); { Randomize numbers math oper: + }
begin
	x := diffrand + random(100) + 51;
	y := diffrand + random(100) - 23;
	rightans := x + y;
end;
procedure RandNumbMinus(var x, y, rightans: integer); { Randomize numbers math oper: - }
begin
	x := diffrand + random(100) + 51;
	y := diffrand + random(100) - 23;
	rightans := x - y;
end;
function isright(ans, rightans: integer): boolean; { Check if answer equal right answer }
begin
	if ans = rightans then
		result := TRUE
	else
		result := FALSE;
end;
procedure diffcheck(difficult: boolean); { Difficult changer }
begin
	if difficult = true then
		diffrand := diffrand + 50  
	else
		diffrand := diffrand - 50;
end;
var { Variables for main game }
	x, y: integer;
	ans: integer;
	rightans: integer;
	isrightres: boolean;

procedure maingame(mathoper: integer);
begin
	maingame_zeroing(x, y, ans, rightans, isrightres);
	case mathoper of
		0:
			begin
				RandNumbPlus(x, y, rightans);
				write('Solve ', x, ' + ', y, ': ');
			end;
		1:
			begin
				RandNumbMinus(x, y, rightans);
				write('Solve ', x, ' - ', y, ': ');
			end;
	end;
	{$I-}
	read(ans);
	IOcheck;
	isrightres := isright(ans, rightans);
	if isrightres then
	begin
		writeln('Nice work!');
		difficult := TRUE;
	end
	else
	begin
		writeln('No, right answer is ', rightans);
		difficult := FALSE;
	end;
	diffcheck(difficult);
end;
var
	i: integer;
	endchoise: char;
	mathoper: integer;
	gamemode: integer;
begin
	randomize;
	BeginOfGame;
	writeln('Enter to continue');
	readln;
	while 0=0 do
	begin
		repeat
			write('Want to play? [Y/n] ');
			readln(endchoise);
		until endchoise in ['Y','y','n','N'];
		if (endchoise = 'N') or (endchoise = 'n') then
		begin
			writeln('See you later...');
			halt(0);
		end;
		for i := 1 to 35 do
		       writeln;
       		writeln('Choose game mode:');
		writeln('2 - random');
		writeln('1 - minus');
		writeln('0 - plus');
		read(gamemode);
		IOcheck;
		case gamemode of
			2:
			begin
				writeln('You choosed random mode');
				mathoper := random(2); { Randomize Mathematic Operation }
			end;
			1:
			begin
				writeln('You choosed minus mode');
				mathoper := 1;
			end;
			0:
			begin
				writeln('You choosed plus mode');
				mathoper := 0;
			end;
		end;
		maingame(mathoper);
		readln;
	end;
end.
