unit engineapi;
{$mode Delphi}
interface
procedure IOcheck; { Input output result check }
procedure halfscrXY(msg: string);
procedure BeginOfGame; { Text in the beginning of program }
procedure mathgamelogo;
procedure maingame_zeroing(var x, y, ans, rightans: integer; var isrightres: boolean);
procedure RandNumbPlus(var x, y, rightans: integer); { Randomize numbers math oper: + }
procedure RandNumbMinus(var x, y, rightans: integer); { Randomize numbers math oper: - }
function isright(ans, rightans: integer): boolean; { Check if answer equal right answer }
procedure output_wins(isrightres: boolean);
procedure smartclr(isrightres: boolean);
procedure diffcheck(difficult: boolean); { Difficult changer }
implementation
uses crt;
type
	msgarr = array [1..5] of string;
var { Global Variables }
	CurX, CurY: integer;
	difficult: boolean;
	diffrand: integer = 10;
	wins: integer;
procedure IOcheck; { Input output result check }
var
	locmsg: string = 'Error, i can`t parse your input';
begin
	if IOresult <> 0 then
	begin
		clrscr;
		TextColor(Red);
		CurX := (ScreenWidth - length(locmsg)) div 2;
		CurY := ScreenHeight div 2;
		GotoXY(CurX, CurY);
		write(locmsg);
		halt(1);
	end;
end;
procedure halfscrXY(msg: string);
begin
	CurX := (ScreenWidth - length(msg)) div 2;
	CurY := ScreenHeight div 2;
end;
procedure BeginOfGame; { Text in the beginning of program }
var
	i, n: integer;
	msg: msgarr;
begin
	msg[1] := 'Math Game';
	msg[2] := 'Hi! This game can help you tune your abilities in math.';
	msg[3] := '3.1 version of this game look more pretty >3';

	halfscrXY(msg[1]);
	GotoXY(CurX, CurY);
	for i := 1 to length(msg[1]) do
	begin
		delay(200);
		write(msg[1][i]);
	end;
	delay(1000);
	clrscr;
	halfscrXY(msg[2]);
	for n := 2 to 3 do
	begin
		GotoXY(CurX, CurY);
		for i := 1 to length(msg[n]) do
		begin
			delay(50);
			write(msg[n][i]);
		end;
		CurY := CurY + 1;
	end;
	delay(2000);
	clrscr;
end;
procedure mathgamelogo;
begin
	GotoXY(3, 1);
	write('Math Game');
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
procedure output_wins(isrightres: boolean);
begin
	if isrightres then
		wins := wins + 1;
	CurX := (ScreenWidth - 12) div 2;
	GotoXY(CurX, 1);
	if wins > 0 then
		write('wins: ', wins);
	
end;
procedure smartclr(isrightres: boolean);
begin
	clrscr;
	mathgamelogo;
	output_wins(isrightres);
end;
procedure diffcheck(difficult: boolean); { Difficult changer }
begin
	if difficult = true then
		diffrand := diffrand + 30  
	else
		diffrand := diffrand - 20;
end;
end.
