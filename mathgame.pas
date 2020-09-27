program mathgame;
{$mode Delphi}
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
	x := random(100);
	y := random(100);
	rightans := x + y;
end;
function isright(ans, rightans: integer): boolean;
begin
	if ans = rightans then
		result := true
	else
		result := false;
end;
{Variables}
var
	x, y: integer;
	ans: integer;
	rightans: integer;
	isrightres: boolean;

procedure maingame;
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
		writeln('Nice work!')
	else
		writeln('No, right answer is ', rightans);
end;
var
	endchoise: char;
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
		maingame;
	end;
end.
