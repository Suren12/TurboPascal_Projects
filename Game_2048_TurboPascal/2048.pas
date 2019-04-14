uses crt,graph;
var i,j,n,l:byte; a,b,score:integer; x:array[1..4,1..4] of integer; c,cn:char;
s,r:string; t,tp,th:boolean;
procedure nerkum(x0,a0,b0:integer);
  procedure miaguyn(l1,a1,b1:integer);
    begin setfillstyle(1,l1); bar(b1,a1,b1+90,a1+80) end;
  procedure havasar(l2,l22,a2,b2:integer);
   var i2,j2:byte;
   begin
    for i2:=0 to 80 do
    for j2:=0 to 90 do
     if j2 mod 2=0 then putpixel(b2+j2,a2+i2,l2)
     else putpixel(b2+j2,a2+i2,l22)
   end;
  procedure anhavasar(l3,l33,a3,b3:integer);
   var i3,j3:byte;
   begin
    for i3:=0 to 80 do
    for j3:=0 to 90 do
    if j3 mod 3=0 then putpixel(b3+j3,a3+i3,l33)else
    putpixel(b3+j3,a3+i3,l3)
   end;
BEGIN
 case x0 of
 2: miaguyn(15,a0,b0);
 4: anhavasar(15,14,a0,b0);
 8: havasar(15,14,a0,b0);
 16:anhavasar(14,15,a0,b0);
 32:miaguyn(14,a0,b0);
 64:anhavasar(14,6,a0,b0);
 128: havasar(6,14,a0,b0);
 256: anhavasar(6,14,a0,b0);
 512: miaguyn(6,a0,b0);
 1024:anhavasar(6,4,a0,b0);
 2048:havasar(4,6,a0,b0);
 4096:anhavasar(4,6,a0,b0);
 8192:miaguyn(4,a0,b0);
 end
END;

procedure game;
begin
randomize; l:=0;
initgraph(a,b,' ');
setfillstyle(1,15); bar(0,0,640,480);
setfillstyle(1,8); bar(125,65,515,415);
setfillstyle(1,7);
for i:=1 to 4 do
for j:=1 to 4 do
 begin
 a:=86*(i-1)+71;
 b:=131+96*(j-1);
 bar(b,a,b+90,a+80);
 end;
for i:=1 to 4 do
for j:=1 to 4 do x[i,j]:=0;
{x[3,1]:=2; x[4,1]:=2;} settextstyle(0,0,2);setcolor(0);
score:=0;
settextstyle(0,0,3);
outtextxy(200,10,'SCORE:');

REPEAT
t:=false;
 str(score,r);
 settextstyle(0,0,3);
 setcolor(black);
 outtextxy(400,10,r);
 for i:=1 to 4 do
 for j:=1 to 4 do if x[i,j]=0 then begin t:=true; break end;
 if t=true then
  begin
   repeat
   a:=random(4)+1; b:=random(4)+1;
   until x[a,b]=0;
  i:=random(10);
  if i=9 then x[a,b]:=4 else x[a,b]:=2
  end;
 for i:=1 to 4 do
 for j:=1 to 4 do
 if x[i,j]>0 then
 begin
  setfillstyle(1,15);
  a:=86*(i-1)+71;
  b:=131+96*(j-1);
  nerkum(x[i,j],a,b);
  a:=105+(i-1)*86;
  b:=135+(j-1)*96;
  str(x[i,j],s);
  outtextxy(b+25,a,s)
 end else
 begin
  setfillstyle(1,7);
  a:=86*(i-1)+71;
  b:=131+96*(j-1);
  bar(b,a,b+90,a+80);
 end;

for i:=1 to 4 do
for j:=1 to 4 do
if x[i,j]=8192 then begin th:=true; break end;
tp:=true;
for i:=1 to 4 do
for j:=1 to 4 do
if x[i,j]=0 then begin tp:=false; break end;
if tp=true then
 for i:=2 to 3 do
 for j:=2 to 3 do
  begin
   if l>1 then begin tp:=false; break end;
   l:=0;
   for a:=i-1 to i+1 do
   for b:=j-1 to j+1 do
    if x[a,b]=x[i,j] then l:=l+1;
  end;

c:=readkey;if ord(c)=27 then begin setgraphmode(getgraphmode);break;end;
if keypressed then while keypressed do cn:=readkey;
c:=cn;
case ord(c) of
72:for j:=1 to 4 do
   BEGIN
    t:=false; for i:=2 to 4 do if x[i,j]>0 then begin t:=true;break end;
    if t=true then
     BeGiN
      for i:=1 to 3 do
       Begin
        t:=true;
         while(x[i,j]=0)and(t=true) do
          Begin
           t:=false;
           for a:=i to 3 do
           x[a,j]:=x[a+1,j]; x[4,j]:=0;
           for a:=i+1 to 4 do if x[a,j]>0 then begin t:=true; break end
          End;
       End;
      for i:=1 to 3 do
      if x[i,j]=x[i+1,j] then
      Begin
       x[i,j]:=2*x[i,j];
       settextstyle(0,0,3);
 setcolor(white);
 outtextxy(400,10,r);
       score:=score+x[i,j];   {SCORE}
       for a:=i+1 to 3 do
       x[a,j]:=x[a+1,j];
       x[4,j]:=0;
      end;
     EnD
   END;
80:for j:=1 to 4 do
   BEGIN
    t:=false;for i:=3 downto 1 do if x[i,j]>0 then begin t:=true; break end;
    if t=true then
     BeGiN
      for i:=4 downto 2 do
       Begin
        t:=true;
         while (x[i,j]=0)and(t=true) do
          Begin
           t:=false;
           for a:=i downto 2 do x[a,j]:=x[a-1,j]; x[1,j]:=0;
           for a:=i-1 downto 1 do
           if x[a,j]>0 then begin t:=true;break end
          End;
       End;
      for i:=4 downto 2 do
      if x[i,j]=x[i-1,j] then
      Begin
       x[i,j]:=2*x[i,j];
       settextstyle(0,0,3);
 setcolor(white);
 outtextxy(400,10,r);
       score:=score+x[i,j];    {SCORE}
       for a:=i-1 downto 2 do
        x[a,j]:=x[a-1,j]; x[1,j]:=0;
      End;
     EnD
   END;
77:for i:=1 to 4 do
   BEGIN
    t:=false;for j:=3 downto 1 do if x[i,j]>0 then begin t:=true; break end;
    if t=true then
     BeGiN
      for j:=4 downto 2 do
       Begin
        t:=true;
         while (x[i,j]=0)and(t=true) do
          Begin
           t:=false;
           for a:=j downto 2 do x[i,a]:=x[i,a-1]; x[i,1]:=0;
           for a:=j-1 downto 1 do
           if x[i,a]>0 then begin t:=true;break end
          End;
       End;
      for j:=4 downto 2 do
      if x[i,j]=x[i,j-1] then
      Begin
       x[i,j]:=2*x[i,j];
       settextstyle(0,0,3);
 setcolor(white);
 outtextxy(400,10,r);
       score:=score+x[i,j];  {SCORE}
       for a:=j-1 downto 2 do
       x[i,a]:=x[i,a-1]; x[i,1]:=0;
      End;
     EnD
   END;
75:for i:=1 to 4 do
   BEGIN
    t:=false; for j:=2 to 4 do if x[i,j]>0 then begin t:=true;break end;
    if t=true then
     BeGiN
      for j:=1 to 3 do
       Begin
        t:=true;
         while(x[i,j]=0)and(t=true) do
          Begin
           t:=false;
           for a:=j to 3 do
           x[i,a]:=x[i,a+1]; x[i,4]:=0;
           for a:=j+1 to 4 do if x[i,a]>0 then begin t:=true; break end
          End;
       End;
      for j:=1 to 3 do
      if x[i,j]=x[i,j+1] then
      Begin
       x[i,j]:=2*x[i,j];
       settextstyle(0,0,3);
 setcolor(white);
 outtextxy(400,10,r);
       score:=score+x[i,j];     {SCORE}
       for a:=j+1 to 3 do
       x[i,a]:=x[i,a+1];
       x[i,4]:=0;
      end;
     EnD
   END;
end;
UNTIL (ord(c)=27)or(th=true)or(tp=true);
setcolor(green);
if th=true then s:='YOU WIN' else if tp=true then s:='GAME OVER' else
s:='Exit';
settextstyle(0,0,6);
outtextxy(220,200,s);
readkey;restorecrtmode;setgraphmode(getgraphmode);exit;
end;

procedure menu;
var x,y,x1,y1,e:integer; p:char;
begin
x:=trunc(getmaxx/2);y:=trunc(getmaxy/2);
setfillstyle(1,BLUE);
bar(x-50,y-50,x+89,y-20);
bar(x-50,y-15,x+89,y+15);
bar(x-50,y+50,x+89,y+20);
settextstyle(0,0,2);
outtextxy(x-25,y-45,'Task');
outtextxy(x-25,y-10,'Start');
outtextxy(x-25,y+25,'Exit');
e:=1;
setfillstyle(1,red);
repeat
bar(x-45,y-45,x-40,y-40);
p:=readkey;
if (p=#80) and(y-40<250) then
begin
y:=y+35;        e:=e+1;
setfillstyle(1,BLUE);
bar(x-45,y-45-35,x-40,y-40-35);
setfillstyle(1,red);
bar(x-45,y-45,x-40,y-40);
end;
if (p=#72) and (y-40>200) then
begin
y:=y-35;e:=e-1;
setfillstyle(1,BLUE);
bar(x-45,y-45+35,x-40,y-40+35);
setfillstyle(1,red);
bar(x-45,y-45,x-40,y-40);
end;
until p=#13;
IF E=1 THEN BEGIN
setgraphmode(getgraphmode);
settextstyle(0,0,1);
outtextxy(10,20,'Xndri npatakn e stexcel 2048 xaxy TurboPascal cragravorman lezvov');

 P:=READKEY;
restorecrtmode;
  IF P=#13 THEN
   SETGRAPHMODE(GETGRAPHMODE);menu;  END;
IF E=2 THEN
 BEGIN
   SETGRAPHMODE(GETGRAPHMODE); game;
    end;
if e=3 then exit;
end;

begin {main}
initgraph(a,b,'');
menu;
end.

