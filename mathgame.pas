program mathgame;
{$mode Delphi}
var
	difficult: boolean;
	diffrand: integer = 10;
procedure IOcheck;
begin
	if IOresult <> 0 then
	begin
		writeln('Error, i can`t parse your input');
		halt(1);
	end;
end;
procedure BeginOfGame; {Text in the beginning of program}
begin
	writeln('Hi! This game can help you tune your abilities in math.');
	writeln('2.0 version of this game include 2 math opetation that can be randomize');
end;
procedure RandNumbPlus(var x, y, rightans: integer);
begin
	x := diffrand * random(100) + 53;
	y := diffrand * random(100) + 23;
	rightans := x + y;
end;
procedure RandNumbMinus(var x, y, rightans: integer);
begin
	x := diffrand * random(100) + 53;
	y := diffrand * random(100) + 23;
	rightans := x - y;
end;
function isright(ans, rightans: integer): boolean;
begin
	if ans = rightans then
		result := TRUE
	else
		result := FALSE;
end;
procedure diffcheck(difficult: boolean);
begin
	if difficult then
		diffrand := diffrand * 10 
	else
		diffrand := diffrand - 100;
end;
{Variables}
var
	x, y: integer;
	ans: integer;
	rightans: integer;
	isrightres: boolean;

procedure maingame(mathoper: integer);
begin
	x := 0;
	y := 0;
	ans := 0;
	rightans := 0;
	isrightres := false;
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
		mathoper := random(2); { Randomize Mathematic Operation }
		maingame(mathoper);
		readln;
	end;
end.
