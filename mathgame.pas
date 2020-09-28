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
	writeln('First version of this game include only 1 math opetation - sum');
end;
procedure RandNumb(var x, y, rightans: integer);
begin
	x := diffrand * random(100);
	y := diffrand * random(100);
	rightans := x + y;
end;
procedure MathRandomize(var mathoper);
var
	mathoper_choise: integer;
begin
	mathoper_choise := random (2);
	case mathoper_choise of
		mathoper_choise = 0:
			mathoper := -;
		mathoper_choise = 1:
			mathoper := +;
	end;
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
		diffrand := diffrand - 10;
end;
{Variables}
var
	x, y: integer;
	ans: integer;
	rightans: integer;
	isrightres: boolean;

procedure maingame(mathoper: char);
begin
	x := 0;
	y := 0;
	ans := 0;
	rightans := 0;
	isrightres := false;

	RandNumb(x, y, rightans);
	write('Solve ', x, ' + ', y, ': ');
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
	endchoise: char;
	mathoper: char;
begin
	randomize;
	BeginOfGame;
	while 0=0 do
	begin
		repeat
			write('Want to play? [Y/n] ');
			readln(endchoise);
		until endchoise in ['Y','y','n','N'];
		if (endchoise = 'N') or (endchoise = 'n') then
			halt(0);
		mathrandomize(mathoper);
		mathoper_choise := random (2);
		case mathoper_choise of
			mathoper_choise = 0:
				mathoper := -;
			mathoper_choise = 1:
				mathoper := +;
		end;
		maingame(mathoper);
	end;
end.
