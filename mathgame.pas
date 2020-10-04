program mathgame;
{$mode Delphi}
uses crt, engineapi;
type
	msgarr = array [1..5] of string;
label
	point_chgm;
var { Global Variables }
	CurX, CurY: integer;
	difficult: boolean;
	diffrand: integer = 10;
	wins: integer;
procedure halfscrXY(msg: string);
begin
	CurX := (ScreenWidth - length(msg)) div 2;
	CurY := ScreenHeight div 2;
end;
procedure maingame(mathoper: integer);
var
	x, y: integer;
	ans: integer;
	rightans: integer;
	isrightres: boolean;
	locmsg: string = 'Aaaaaaaaaaaaaaaaa';
	locint: integer;
begin
	maingame_zeroing(x, y, ans, rightans, isrightres);
	smartclr(false);
	case mathoper of
		0:
			begin
				RandNumbPlus(x, y, rightans);
				halfscrXY(locmsg);
				GotoXY(CurX, CurY);
				write('Solve ', x, ' + ', y, ': ');
			end;
		1:
			begin
				RandNumbMinus(x, y, rightans);
				halfscrXY(locmsg);
				GotoXY(CurX, CurY);
				write('Solve ', x, ' - ', y, ': ');
			end;
	end;
	{$I-}
	read(ans);
	IOcheck;
	isrightres := isright(ans, rightans);
	if isrightres then
	begin
		smartclr(isrightres);
		locmsg := 'Nice work!';
		halfscrXY(locmsg);
		GotoXY(CurX, CurY);
		write(locmsg);
		difficult := TRUE;
		delay(2000);
	end
	else
	begin
		clrscr;
		mathgamelogo;
		locmsg := 'aaaaaaaaaaaaaaaaaaaaa';
		halfscrXY(locmsg);
		GotoXY(CurX, CurY);
		write('No, right answer is ', rightans);
		difficult := FALSE;
		delay(2000);
	end;
	diffcheck(difficult);
end;
var
	i, n: integer;
	endchoise: char;
	mathoper: integer;
	gamemode: char;
	msg: msgarr;
	locmsg: string;
	locint: integer;
begin
	randomize;
	clrscr;
	BeginOfGame;
	locmsg := 'Enter to continue';
	halfscrXY(locmsg);
	GotoXY(CurX, CurY);
	write(locmsg);
	readln;
	clrscr;
	while true do
	begin
		repeat
			smartclr(false);
			locmsg := 'Want to play? [Y/n] ';
			halfscrXY(locmsg);
			GotoXY(CurX, CurY);
			write(locmsg);
			endchoise := Readkey;
		until endchoise in ['Y','y','n','N'];
		smartclr(false);
		if (endchoise = 'N') or (endchoise = 'n') then
		begin
			locmsg := 'See you later...';
			halfscrXY(locmsg);
			GotoXY(CurX, CurY);
			write(locmsg);
			delay(1000);
			clrscr;
			halt(0);
		end;
		msg[1] := 'Choose game mode:';
		msg[2] := '2 - random';
		msg[3] := '1 - minus';
		msg[4] := '0 - plus';
		for n := 1 to 4 do
		begin
			if n = 1 then
			begin
				locint := length(msg[1]);
				goto point_chgm;
			end;
			locint := length(msg[2]);
		point_chgm:
			CurX := (ScreenWidth - locint) div 2;
			CurY := CurY + 1;
			GotoXY(CurX, CurY);
			for i := 1 to length(msg[n]) do
			begin
				delay(15);
				write(msg[n][i]);
			end;
		end;
		repeat
			gamemode := Readkey;
		until gamemode in ['1', '2', '0'];
		smartclr(false);
		IOcheck;
		case gamemode of
			'2':
			begin
				locmsg := 'You choosed random mode';
				CurX := (ScreenWidth - length(locmsg)) div 2;
				CurY := (ScreenHeight div 2) - 5;
				GotoXY(CurX, CurY);
				write(locmsg);
				mathoper := random(2); { Randomize Mathematic Operation }
			end;
			'1':
			begin
				locmsg := 'You choosed minus mode';
				CurX := (ScreenWidth - length(locmsg)) div 2;
				CurY := (ScreenHeight div 2) - 5;
				GotoXY(CurX, CurY);
				write(locmsg);
				mathoper := 1;
			end;
			'0':
			begin
				locmsg := 'You choosed plus mode';
				CurX := (ScreenWidth - length(locmsg)) div 2;
				CurY := (ScreenHeight div 2) - 5;
				GotoXY(CurX, CurY);
				write(locmsg);
				mathoper := 0;
			end;
		end;
		maingame(mathoper);
		readln;
	end;
end.
