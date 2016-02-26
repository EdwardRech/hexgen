program hexgen;
uses crt; //required for ClrScr
var ein,zwei,drei,vier,funf,sechs,sieben,acht,neun,zehn,elf,zwolf,success,nn,I:Integer; //Numbers in German - assigned to letters
var odin,dva,tri,chetire,pyat,shest,semj,vosemj,devyat,desyat,odinnatsat,dvenadsat:String; //Numbers in Russian - assigned to randomly generated numbers
var TRone,TRtwo,TRthree,TRfour,TRfive,TRsix,TRseven,TReight,TRnine,TRten,TReleven,TRtwelve,TRthirteen,TRfourteen,TRfifteen,TRsixteen,TRseventeen,TReighteen,TRnineteen,TRtwenty:String; //Those represent each hexiamond triplet. TR-TRiangle
const combinationnumber=103; //That's the amount of hexiamond combinations we have found so far.
var WordsArray: Array [1..combinationnumber] of String; //Combination array
var u,correct:Integer; //used for array checking, checking the amount of correct combinations
var choice,exportchoice,resultamount:Integer; //user choices
var filename:String; //file name
var delaynumber,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,csum:Integer; //combination result counter
var combinations:text; //the variable that's assigned to the text file combinations.txt
var exportone,exporttwo,exportthree,exportfour,exportfive:text; //variables assigned to their text files for exporting results.
var count18andor19:Integer; //just like in the name, it means 18 and 19 might also be counted
procedure letterAssign(var int:Integer; var str:String); //Assigns the letters depending on the number
begin
  case int of
  1:str:='A';
  2:str:='C';
  3:str:='H';
  4:str:='I';
  5:str:='J';
  6:str:='M';
  7:str:='O';
  8:str:='P';
  9:str:='S';
  10:str:='V';
  11:str:='X';
  12:str:='Y';
end;
end;
procedure alphabetSort(var int1,int2,int3:Integer; var str1,str2,str3,strSUM:String); //Sorts the letters alphabetically, make a combination with that order
begin
if (int1 < int2) AND (int2 < int3) then
strSUM:=(str1+str2+str3)
else if (int1 < int3) AND (int3 < int2) then
strSUM:=(str1+str3+str2)
else if (int2 < int1) AND (int1 < int3) then
strSUM:=(str2+str1+str3)
else if (int2 < int3) AND (int3 < int1) then
strSUM:=(str2+str3+str1)
else if (int3 < int2) AND (int2 < int1) then
strSUM:=(str3+str2+str1)
else if (int3 < int1) AND (int1 < int2) then
strSUM:=(str3+str1+str2);
end;
begin
  Randomize;
  c1:=0;c2:=0;c3:=0;c4:=0;c5:=0;c6:=0;c7:=0;c8:=0;c9:=0;c10:=0;c11:=0;c12:=0;c13:=0;c14:=0;c15:=0;c16:=0;c17:=0;c18:=0;c19:=0;c20:=0;success:=0;
  delaynumber:=10;
  Assign(combinations, 'combinations.txt');
  ReSet(combinations);
  For I:=1 to combinationnumber do Readln(combinations, WordsArray[I]);
  Close(combinations);
  Assign(exportone, 'export1.txt');
  Assign(exporttwo, 'export2.txt');
  Assign(exportthree, 'export3.txt');
  Assign(exportfour, 'export4.txt');
  Assign(exportfive,'export5.txt');
  Repeat
  begin
  writeln('Hexiamond Placement Generator, version 5.2' );
  writeln('');
  writeln('To choose a shape, write the corresponding number.');
  writeln('1) Tetrahedron (4 vertices & 4 faces)');
  writeln('2) Octahedron (6 vertices & 8 faces)');
  writeln('3) Icosahedron (12 vertices & 20 faces)');
  writeln('4) Dodecahedron (12 faces - each face will be used like a vertex in the upper three)');
  writeln('5) Circle. Three nearby located hexiamonds should be able to make a triplet from the list.');
  writeln('');
  write('Number: ');
  readln(choice);
  if (choice <> 1) AND (choice <> 2) AND (choice <> 3) AND (choice <> 4) AND (choice <> 5) then
  begin
  writeln('Please write 1, 2, 3 or 4. Each number represents a shape, just like written above. Press <ENTER> to try again!');
  readln;
  ClrScr;
  end;
  end;
  until (choice = 1) OR (choice = 2) OR (choice = 3) OR (choice = 4) OR (choice = 5);
  case choice of
  1:filename:='export1.txt';
  2:filename:='export2.txt';
  3:filename:='export3.txt';
  4:filename:='export4.txt';
  5:filename:='export5.txt';
  end;
  ClrScr;
  write('Shape name: ');
  if choice = 1 then writeln('Tetrahedron.')
  else if choice = 2 then writeln('Octahedron.')
  else if choice = 3 then writeln('Icosahedron.')
  else if choice = 4 then writeln('Dodecahedron.')
  else if choice = 5 then writeln('Circle.');
  writeln('');
  writeln('Would you like to export the results?');
  writeln('NOTE: The program doesn''t check which results have already been written to the file, so you might require the usage of a service that removes duplicate lines.');
  writeln('The feature hasn''t been implemented due to heavily reduced performance resulting from it.');
  writeln('');
  writeln('If you''d like to export the results, please write 1 (just the number). If uninterested, write any other INTEGER.');
  readln(exportchoice);
  if exportchoice = 1 then
  begin
  writeln('OK, how many results would you like? (NOTE: must be 1 or more!)');
  Repeat
  readln(resultamount);
  until resultamount > 0;
  if (choice >2) AND (choice <5) then
  begin
  writeln('NOTE: As there are difficulties in finding the solution with 20 out of 20 triangles (triplets) being correct for this shape, some less correct solutions can also be exported.');
  writeln('To export 18 and 19 in addition 20, write 1. To export only 19 and 20, write 2. Otherwise, write any other integer (If you do that, only 20 will count).');
  readln(count18andor19);
  end;
  writeln('OK, exporting ',resultamount,' solutions to ',filename,'!');
  writeln('Press <ENTER> to continue!');
  readln;
  end
  else
  begin
  if (choice >2) AND (choice <5) then
  begin
  writeln('NOTE: As there are difficulties in finding the solution with 20 out of 20 triangles (triplets) being correct for this shape, some less correct solutions can also be exported.');
  writeln('To have 18 and 19 count in addition 20, write 1. To have only 19 and 20 count, write 2. Otherwise, write any other integer (If you do that, only 20 will count).');
  readln(count18andor19);
  end;
  writeln('OK, not exporting any results. Showing one solution once found. Press <ENTER> to continue.');readln;
  resultamount:=1;
  end;
  Repeat
  if choice = 1 then
  begin
  Repeat
  ein:=Random(12)+1;
  zwei:=Random(12)+1;
  drei:=Random(12)+1;
  vier:=Random(12)+1;
  until (ein <> zwei) AND (ein <> drei) AND (ein <> vier) AND (zwei <> ein) AND (zwei <> drei) AND (zwei <> vier) AND (drei <> ein) AND (drei <> zwei) AND (drei <> vier) AND (vier <> ein) AND (vier <> zwei) AND (vier <> drei);
  end
  else if choice = 2 then
  begin
  Repeat
  ein:=Random(12)+1;
  zwei:=Random(12)+1;
  drei:=Random(12)+1;
  vier:=Random(12)+1;
  funf:=Random(12)+1;
  sechs:=Random(12)+1;
  until (ein <> zwei) AND (ein <> drei) AND (ein <> vier) AND (ein <> funf) AND (ein <> sechs) AND (zwei <> ein) AND (zwei <> drei) AND (zwei <> vier) AND (zwei <> funf) AND (zwei <> sechs) AND (drei <> ein) AND (drei <> zwei) AND (drei <> vier) AND (drei <> funf) AND (drei <> sechs) AND (vier <> ein) AND (vier <> zwei) AND (vier <> drei) AND (vier <> funf) AND (vier <> sechs) AND (funf <> ein) AND (funf <> zwei) AND (funf <> drei) AND (funf <> vier) AND (funf <> sechs) AND (sechs <> ein) AND (sechs <> zwei) AND (sechs <> drei) AND (sechs <> vier) AND (sechs <> funf);
  end
    else if choice >= 3 then
  begin
  Repeat
  ein:=Random(12)+1;
  zwei:=Random(12)+1;
  drei:=Random(12)+1;
  vier:=Random(12)+1;
  funf:=Random(12)+1;
  sechs:=Random(12)+1;
  sieben:=Random(12)+1;
  acht:=Random(12)+1;
  neun:=Random(12)+1;
  zehn:=Random(12)+1;
  elf:=Random(12)+1;
  zwolf:=Random(12)+1;
  until (ein <> zwei) AND (ein <> drei) AND (ein <> vier) AND (ein <> funf) AND (ein <> sechs) AND (ein <> sieben) AND (ein <> acht) AND (ein <> neun) AND (ein <> zehn) AND (ein <> elf) AND (ein <> zwolf) AND (zwei <> ein) AND (zwei <> drei) AND (zwei <> vier) AND (zwei <> funf) AND (zwei <> sechs) AND (zwei <> sieben) AND (zwei <> acht) AND (zwei <> neun) AND (zwei <> zehn) AND (zwei <> elf) AND (zwei <> zwolf) AND (drei <> zwei) AND (drei <> ein) AND (drei <> vier) AND (drei <> funf) AND (drei <> sechs) AND (drei <> sieben) AND (drei <> acht) AND (drei <> neun) AND (drei <> zehn) AND (drei <> elf) AND (drei <> zwolf) AND (vier <> zwei) AND (vier <> drei) AND (vier <> ein) AND (vier <> funf) AND (vier <> sechs) AND (vier <> sieben) AND (vier <> acht) AND (vier <> neun) AND (vier <> zehn) AND (vier <> elf) AND (vier <> zwolf) AND (funf <> zwei) AND (funf <> drei) AND (funf <> vier) AND (funf <> ein) AND (funf <> sechs) AND (funf <> sieben) AND (funf <> acht) AND (funf <> neun) AND (funf <> zehn) AND (funf <> elf) AND (funf <> zwolf) AND (sechs <> zwei) AND (sechs <> drei) AND (sechs <> vier) AND (sechs <> funf) AND (sechs <> ein) AND (sechs <> sieben) AND (sechs <> acht) AND (sechs <> neun) AND (sechs <> zehn) AND (sechs <> elf) AND (sechs <> zwolf) AND (sieben <> zwei) AND (sieben <> drei) AND (sieben <> vier) AND (sieben <> funf) AND (sieben <> sechs) AND (sieben <> ein) AND (sieben <> acht) AND (sieben <> neun) AND (sieben <> zehn) AND (sieben <> elf) AND (sieben <> zwolf) AND (acht <> zwei) AND (acht <> drei) AND (acht <> vier) AND (acht <> funf) AND (acht <> sechs) AND (acht <> sieben) AND (acht <> ein) AND (acht <> neun) AND (acht <> zehn) AND (acht <> elf) AND (acht <> zwolf) AND (neun <> zwei) AND (neun <> drei) AND (neun <> vier) AND (neun <> funf) AND (neun <> sechs) AND (neun <> sieben) AND (neun <> acht) AND (neun <> ein) AND (neun <> zehn) AND (neun <> elf) AND (neun <> zwolf) AND (zehn <> zwei) AND (zehn <> drei) AND (zehn <> vier) AND (zehn <> funf) AND (zehn <> sechs) AND (zehn <> sieben) AND (zehn <> acht) AND (zehn <> neun) AND (zehn <> ein) AND (zehn <> elf) AND (zehn <> zwolf) AND (elf <> zwei) AND (elf <> drei) AND (elf <> vier) AND (elf <> funf) AND (elf <> sechs) AND (elf <> sieben) AND (elf <> acht) AND (elf <> neun) AND (elf <> zehn) AND (elf <> ein) AND (elf <> zwolf) AND (zwolf <> zwei) AND (zwolf <> drei) AND (zwolf <> vier) AND (zwolf <> funf) AND (zwolf <> sechs) AND (zwolf <> sieben) AND (zwolf <> acht) AND (zwolf <> neun) AND (zwolf <> zehn) AND (zwolf <> elf) AND (zwolf <> ein)
  end;
  letterAssign(ein,odin);
  letterAssign(zwei,dva);
  letterAssign(drei,tri);
  letterAssign(vier,chetire);
  if (choice > 1) then
  begin
  letterAssign(funf,pyat);
  letterAssign(sechs,shest);
  if (choice > 2) then
  letterAssign(sieben,semj);
  letterAssign(acht,vosemj);
  letterAssign(neun,devyat);
  letterAssign(zehn,desyat);
  letterAssign(elf,odinnatsat);
  letterAssign(zwolf,dvenadsat);
  end;
  if choice = 1 then                       //alphabet sort
  begin
  alphabetSort(ein,zwei,drei,odin,dva,tri,TRone);
  alphabetSort(ein,zwei,vier,odin,dva,chetire,TRtwo);
  alphabetSort(ein,drei,vier,odin,tri,chetire,TRthree);
  alphabetSort(zwei,drei,vier,dva,tri,chetire,TRfour);
  end
  else if (choice = 2) then
  begin
  alphabetSort(ein,zwei,funf,odin,dva,pyat,TRone);
  alphabetSort(ein,vier,funf,odin,chetire,pyat,TRtwo);
  alphabetSort(ein,vier,sechs,odin,chetire,shest,TRthree);
  alphabetSort(ein,zwei,sechs,odin,dva,shest,TRfour);
  alphabetSort(drei,zwei,funf,tri,dva,pyat,TRfive);
  alphabetSort(drei,vier,funf,tri,chetire,pyat,TRsix);
  alphabetSort(drei,vier,sechs,tri,chetire,shest,TRseven);
  alphabetSort(drei,zwei,sechs,tri,dva,shest,TReight);
  end
    else if choice = 3 then
  begin
  alphabetSort(ein,zwei,drei,odin,dva,tri,TRone);
  alphabetSort(ein,zwei,neun,odin,dva,devyat,TRtwo);
  alphabetSort(ein,sieben,neun,odin,semj,devyat,TRthree);
  alphabetSort(ein,sieben,sechs,odin,semj,shest,TRfour);
  alphabetSort(ein,drei,sechs,odin,tri,shest,TRfive);
  alphabetSort(funf,drei,sechs,pyat,tri,shest,TRsix);
  alphabetSort(funf,zwolf,sechs,pyat,dvenadsat,shest,TRseven);
  alphabetSort(sieben,zwolf,sechs,semj,dvenadsat,shest,TReight);
  alphabetSort(sieben,zwolf,acht,semj,dvenadsat,vosemj,TRnine);
  alphabetSort(sieben,neun,acht,semj,devyat,vosemj,TRten);
  alphabetSort(zehn,neun,acht,desyat,devyat,vosemj,TReleven);
  alphabetSort(zehn,neun,zwei,desyat,devyat,dva,TRtwelve);
  alphabetSort(zehn,vier,zwei,desyat,chetire,dva,TRthirteen);
  alphabetSort(zehn,vier,elf,desyat,chetire,odinnatsat,TRfourteen);
  alphabetSort(zehn,acht,elf,desyat,vosemj,odinnatsat,TRfifteen);
  alphabetSort(zwolf,acht,elf,dvenadsat,vosemj,odinnatsat,TRsixteen);
  alphabetSort(zwolf,funf,elf,dvenadsat,pyat,odinnatsat,TRseventeen);
  alphabetSort(vier,funf,elf,chetire,pyat,odinnatsat,TReighteen);
  alphabetSort(vier,funf,drei,chetire,pyat,tri,TRnineteen);
  alphabetSort(vier,zwei,drei,chetire,dva,tri,TRtwenty);
  end
  else if choice = 4 then
  begin
  alphabetSort(ein,zwei,drei,odin,dva,tri,TRone);
  alphabetSort(ein,zwei,sechs,odin,dva,shest,TRtwo);
  alphabetSort(ein,funf,sechs,odin,pyat,shest,TRthree);
  alphabetSort(ein,funf,vier,odin,pyat,chetire,TRfour);
  alphabetSort(ein,drei,vier,odin,tri,chetire,TRfive);
  alphabetSort(zwolf,neun,zehn,dvenadsat,devyat,desyat,TRsix);
  alphabetSort(zwolf,elf,zehn,dvenadsat,odinnatsat,desyat,TRseven);
  alphabetSort(zwolf,elf,sieben,dvenadsat,odinnatsat,semj,TReight);
  alphabetSort(zwolf,acht,sieben,dvenadsat,vosemj,semj,TRnine);
  alphabetSort(zwolf,acht,neun,dvenadsat,vosemj,devyat,TRten);
  alphabetSort(zwei,acht,neun,dva,vosemj,devyat,TReleven);
  alphabetSort(zwei,drei,neun,dva,tri,devyat,TRtwelve);
  alphabetSort(zehn,drei,neun,desyat,tri,devyat,TRthirteen);
  alphabetSort(zehn,drei,vier,desyat,tri,chetire,TRfourteen);
  alphabetSort(zehn,elf,vier,desyat,odinnatsat,chetire,TRfifteen);
  alphabetSort(funf,elf,vier,pyat,odinnatsat,chetire,TRsixteen);
  alphabetSort(funf,elf,sieben,pyat,odinnatsat,semj,TRseventeen);
  alphabetSort(funf,sechs,sieben,pyat,shest,semj,TReighteen);
  alphabetSort(acht,sechs,sieben,vosemj,shest,semj,TRnineteen);
  alphabetSort(acht,sechs,zwei,vosemj,shest,dva,TRtwenty);
  end
  else if choice = 5 then
  begin
  alphabetSort(ein,zwei,zwolf,odin,dva,dvenadsat,TRone);
  alphabetSort(ein,zwei,drei,odin,dva,tri,TRtwo);
  alphabetSort(vier,zwei,drei,chetire,dva,tri,TRthree);
  alphabetSort(vier,funf,drei,chetire,pyat,tri,TRfour);
  alphabetSort(vier,funf,sechs,chetire,pyat,shest,TRfive);
  alphabetSort(sieben,funf,sechs,semj,pyat,shest,TRsix);
  alphabetSort(sieben,acht,sechs,semj,vosemj,shest,TRseven);
  alphabetSort(sieben,acht,neun,semj,vosemj,devyat,TReight);
  alphabetSort(zehn,acht,neun,desyat,vosemj,devyat,TRnine);
  alphabetSort(zehn,elf,neun,desyat,odinnatsat,devyat,TRten);
  alphabetSort(zehn,elf,zwolf,desyat,odinnatsat,dvenadsat,TReleven);
  alphabetSort(ein,elf,zwolf,odin,odinnatsat,dvenadsat,TRtwelve);
  end;
  U:=0;
  correct:=0;
  if (choice = 1) then
    for U:=1 to combinationnumber do
    begin
      if (TRone = WordsArray[U]) then
    correct:=correct+1;
   if (TRtwo = WordsArray[U]) then
    correct:=correct+1;
   if (TRthree = WordsArray[U]) then
    correct:=correct+1;
   if (TRfour = WordsArray[U]) then
    correct:=correct+1;
    end
  else if (choice = 2) then
    for U:=1 to combinationnumber do
    begin
      if (TRone = WordsArray[U]) then
    correct:=correct+1;
   if (TRtwo = WordsArray[U]) then
    correct:=correct+1;
    if (TRthree = WordsArray[U]) then
    correct:=correct+1;
     if (TRfour = WordsArray[U]) then
    correct:=correct+1;
      if (TRfive = WordsArray[U]) then
    correct:=correct+1;
       if (TRsix = WordsArray[U]) then
    correct:=correct+1;
        if (TRseven = WordsArray[U]) then
    correct:=correct+1;
         if (TReight = WordsArray[U]) then
    correct:=correct+1;
    end
  else if (choice = 3) then
    for U:=1 to combinationnumber do
    begin
  if (TRone = WordsArray[U]) then
    correct:=correct+1;
  if (TRtwo = WordsArray[U]) then
    correct:=correct+1;
  if (TRthree = WordsArray[U]) then
    correct:=correct+1;
  if (TRfour = WordsArray[U]) then
    correct:=correct+1;
  if (TRfive = WordsArray[U]) then
    correct:=correct+1;
  if (TRsix = WordsArray[U]) then
    correct:=correct+1;
  if (TRseven = WordsArray[U]) then
    correct:=correct+1;
  if (TReight = WordsArray[U]) then
    correct:=correct+1;
  if (TRnine = WordsArray[U]) then
    correct:=correct+1;
  if (TRten = WordsArray[U]) then
    correct:=correct+1;
  if (TReleven = WordsArray[U]) then
    correct:=correct+1;
  if (TRtwelve = WordsArray[U]) then
    correct:=correct+1;
  if (TRthirteen = WordsArray[U]) then
    correct:=correct+1;
  if (TRfourteen = WordsArray[U]) then
    correct:=correct+1;
  if (TRfifteen = WordsArray[U]) then
    correct:=correct+1;
  if (TRsixteen = WordsArray[U]) then
    correct:=correct+1;
  if (TRseventeen = WordsArray[U]) then
    correct:=correct+1;
  if (TReighteen = WordsArray[U]) then
    correct:=correct+1;
  if (TRnineteen = WordsArray[U]) then
    correct:=correct+1;
  if (TRtwenty = WordsArray[U]) then
    correct:=correct+1;
  end
    else if (choice = 4) then
    for U:=1 to combinationnumber do
    begin
    if (TRone = WordsArray[U]) then
    correct:=correct+1;
    if (TRtwo = WordsArray[U]) then
    correct:=correct+1;
    if (TRthree = WordsArray[U]) then
    correct:=correct+1;
    if (TRfour = WordsArray[U]) then
    correct:=correct+1;
    if (TRfive = WordsArray[U]) then
    correct:=correct+1;
    if (TRsix = WordsArray[U]) then
    correct:=correct+1;
    if (TRseven = WordsArray[U]) then
    correct:=correct+1;
    if (TReight = WordsArray[U]) then
    correct:=correct+1;
    if (TRnine = WordsArray[U]) then
    correct:=correct+1;
    if (TRten = WordsArray[U]) then
    correct:=correct+1;
    if (TReleven = WordsArray[U]) then
    correct:=correct+1;
    if (TRtwelve = WordsArray[U]) then
    correct:=correct+1;
    if (TRthirteen = WordsArray[U]) then
    correct:=correct+1;
    if (TRfourteen = WordsArray[U]) then
    correct:=correct+1;
    if (TRfifteen = WordsArray[U]) then
    correct:=correct+1;
    if (TRsixteen = WordsArray[U]) then
    correct:=correct+1;
    if (TRseventeen = WordsArray[U]) then
    correct:=correct+1;
    if (TReighteen = WordsArray[U]) then
    correct:=correct+1;
    if (TRnineteen = WordsArray[U]) then
    correct:=correct+1;
    if (TRtwenty = WordsArray[U]) then
    correct:=correct+1;
  end
    else if (choice = 5) then
    for U:=1 to combinationnumber do
    begin
    if (TRone = WordsArray[U]) then
    correct:=correct+1;
    if (TRtwo = WordsArray[U]) then
    correct:=correct+1;
    if (TRthree = WordsArray[U]) then
    correct:=correct+1;
    if (TRfour = WordsArray[U]) then
    correct:=correct+1;
    if (TRfive = WordsArray[U]) then
    correct:=correct+1;
    if (TRsix = WordsArray[U]) then
    correct:=correct+1;
    if (TRseven = WordsArray[U]) then
    correct:=correct+1;
    if (TReight = WordsArray[U]) then
    correct:=correct+1;
    if (TRnine = WordsArray[U]) then
    correct:=correct+1;
    if (TRten = WordsArray[U]) then
    correct:=correct+1;
    if (TReleven = WordsArray[U]) then
    correct:=correct+1;
    if (TRtwelve = WordsArray[U]) then
    correct:=correct+1;
    end;
if correct = 1 then
  c1:=c1+1;
  if correct = 2 then
  c2:=c2+1;
  if correct = 3 then
  c3:=c3+1;
  if correct = 4 then
  c4:=c4+1;
  if choice > 1 then
  begin
  if correct = 5 then
  c5:=c5+1;
  if correct = 6 then
  c6:=c6+1;
  if correct = 7 then
  c7:=c7+1;
  if correct = 8 then
  c8:=c8+1;
  end;
  if choice >2 then
  begin
  if correct = 9 then
  c9:=c9+1;
  if correct = 10 then
  c10:=c10+1;
  if correct = 11 then
  c11:=c11+1;
  if correct = 12 then
  c12:=c12+1;
  end;
  if (choice = 3) OR (choice = 4) then
  begin
  if correct = 13 then
  c13:=c13+1;
  if correct = 14 then
  c14:=c14+1;
  if correct = 15 then
  c15:=c15+1;
  if correct = 16 then
  c16:=c16+1;
  if correct = 17 then
  c17:=c17+1;
  if correct = 18 then
  c18:=c18+1;
  if correct = 19 then
  c19:=c19+1;
  if correct = 20 then
  c20:=c20+1;
  end;
  if delaynumber mod 10 = 0 then
  begin
  ClrScr;
  writeln('Correct triangles (triplets): Amount of combinations checked by the program that results in such a number');
  if choice = 1 then
  writeln('1:',c1,', ','2:',c2,', ','3:',c3,', ','4:',c4)
  else if choice = 2 then
  writeln('1:',c1,', ','2:',c2,', ','3:',c3,', ','4:',c4,', ','5:',c5,', ','6:',c6,', ','7:',c7,', ','8:',c8)
  else if choice = 3 then
  writeln('1:',c1,', ','2:',c2,', ','3:',c3,', ','4:',c4,', ','5:',c5,', ','6:',c6,', ','7:',c7,', ','8:',c8,', ','9:',c9,', ','10:',c10,', ','11:',c11,', ','12:',c12,', ','13:',c13,', ','14:',c14,', ','15:',c15,', ','16:',c16,', ','17:',c17,', ','18:',c18,', ','19:',c19,', ','20:',c20)
  else if choice = 4 then
  writeln('1:',c1,', ','2:',c2,', ','3:',c3,', ','4:',c4,', ','5:',c5,', ','6:',c6,', ','7:',c7,', ','8:',c8,', ','9:',c9,', ','10:',c10,', ','11:',c11,', ','12:',c12,', ','13:',c13,', ','14:',c14,', ','15:',c15,', ','16:',c16,', ','17:',c17,', ','18:',c18,', ','19:',c19,', ','20:',c20)
  else if choice = 5 then
  writeln('1:',c1,', ','2:',c2,', ','3:',c3,', ','4:',c4,', ','5:',c5,', ','6:',c6,', ','7:',c7,', ','8:',c8,', ','9:',c9,', ','10:',c10,', ','11:',c11,', ','12:',c12);
  csum:=c1+c2+c3+c4+c5+c6+c7+c8+c9+c10+c11+c12+c13+c14+c15+c16+c17+c18+c19+c20;
  writeln('OVERALL: ',csum);
  if choice = 1 then
  writeln('REQUIRED: 4 - Tetrahedron')
  else if choice = 2 then
  writeln('REQUIRED: 8 - Octahedron')
  else if choice =3 then
  writeln('REQUIRED: 20 - Icosahedron (NOTE: MIGHT TAKE AN EXTREMELY LONG TIME!!!)')
  else if choice = 4 then
  writeln('REQUIRED: 20 - Dodecahedron (NOTE: MIGHT TAKE AN EXTREMELY LONG TIME!!!)')
  else if choice = 5 then
  writeln('REQUIRED: 12 - Circle');
  end;
  delaynumber:=delaynumber+1;
  if choice = 1 then
  begin
  if correct = 4 then begin success:=success+1;
  if exportchoice = 1 then begin
      Append(exportone);
  writeln(exportone,odin,', ',dva,', ',tri,', ',chetire,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour);
  Close(exportone);
  end;
  end;
  end
  else if choice = 2 then
  begin
  if correct=8 then begin success:=success+1;
  if exportchoice = 1 then begin
  Append(exporttwo);
  writeln(exporttwo,odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight);
  Close(exporttwo);
  end;
  end;
  end
  else if choice = 3 then
  begin
  if (count18andor19<>1) AND (count18andor19<>2) then
  begin
  if correct = 20 then
  begin
  if exportchoice = 1 then begin
  Append(exportthree);
  writeln(exportthree,correct,' - ',odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,', ',semj,', ',vosemj,', ',devyat,', ',desyat,', ',odinnatsat,', ',dvenadsat,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty);
  Close(exportthree);
  success:=success+1;
  end;
  end;
  end
  else if count18andor19=1 then
  begin
  if correct >=18 then
  begin
  if exportchoice = 1 then
  begin
  Append(exportthree);
  writeln(exportthree,correct,' - ',odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,', ',semj,', ',vosemj,', ',devyat,', ',desyat,', ',odinnatsat,', ',dvenadsat,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty);
  Close(exportthree);
  end;
  success:=success+1;
  end;
  end
  else if count18andor19=2 then
  begin
  if correct >=19 then
  begin
  if exportchoice = 1 then
  begin
  Append(exportthree);
  writeln(exportthree,correct,' - ',odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,', ',semj,', ',vosemj,', ',devyat,', ',desyat,', ',odinnatsat,', ',dvenadsat,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty);
  Close(exportthree);
  end;
  success:=success+1;
  end;
  end;
  end
   else if choice = 4 then
  begin
  if (count18andor19<>1) AND (count18andor19<>2) then
  begin
  if correct = 20 then
  begin
  if exportchoice = 1 then begin
  Append(exportfour);
  writeln(exportfour,correct,' - ',odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,', ',semj,', ',vosemj,', ',devyat,', ',desyat,', ',odinnatsat,', ',dvenadsat,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty);
  Close(exportfour);
  end;
  success:=success+1;
  end;
  end
  else if count18andor19=1 then
  begin
  if correct >=18 then
  begin
  if exportchoice = 1 then
  begin
  Append(exportfour);
  writeln(exportfour,correct,' - ',odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,', ',semj,', ',vosemj,', ',devyat,', ',desyat,', ',odinnatsat,', ',dvenadsat,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty);
  Close(exportfour);
  end;
  success:=success+1;
  end;
  end
  else if count18andor19=2 then
  begin
  if correct >=19 then
  begin
  if exportchoice = 1 then
  begin
  Append(exportfour);
  writeln(exportfour,correct,' - ',odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,', ',semj,', ',vosemj,', ',devyat,', ',desyat,', ',odinnatsat,', ',dvenadsat,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty);
  Close(exportfour);
  success:=success+1;
  end;
  end;
  end;
  end
   else if choice = 5 then
  begin
  if correct=12 then begin success:=success+1;
  if exportchoice = 1 then begin
  Append(exportfive);
  writeln(exportfive,odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,', ',semj,', ',vosemj,', ',devyat,', ',desyat,', ',odinnatsat,', ',dvenadsat,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve);
  Close(exportfive);
  end;
  end;
  end
  until (success=resultamount);
  if exportchoice <> 1 then
  begin
  if choice = 1 then
  begin
  writeln('');
  writeln('__________________________________________________');
  writeln('');
  writeln('');
  writeln('1 is ',odin);
  writeln('2 is ',dva);
  writeln('3 is ',tri);
  writeln('4 is ',chetire);
  writeln('');
  writeln('Triangles (triplets), resulting from the placement: ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour);
  writeln('');
  writeln('Refer to tetrahedron.png for hexiamond placement (on which number''s location stands each hexiamond).');
  end
  else if (choice = 2) then
  begin
  writeln('');
  writeln('__________________________________________________');
  writeln('');
  writeln('');
  writeln('1 is ',odin);
  writeln('2 is ',dva);
  writeln('3 is ',tri);
  writeln('4 is ',chetire);
  writeln('5 is ',pyat);
  writeln('6 is ',shest);
  writeln('');
  writeln('Triangles (triplets), resulting from the placement: ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight);
writeln('');
writeln('Refer to octahedron.png for hexiamond placement (on which number''s location stands each hexiamond).');
end
  else if choice = 3 then
  begin
  writeln('');
  writeln('__________________________________________________');
  writeln('');
  writeln('');
  writeln('1 is ',odin);
  writeln('2 is ',dva);
  writeln('3 is ',tri);
  writeln('4 is ',chetire);
  writeln('5 is ',pyat);
  writeln('6 is ',shest);
  writeln('7 is ',semj);
  writeln('8 is ',vosemj);
  writeln('9 is ',devyat);
  writeln('10 is ',desyat);
  writeln('11 is ',odinnatsat);
  writeln('12 is ',dvenadsat);
  writeln('');
  writeln('Triangles (triplets), resulting from the placement: ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty);
  writeln('');
  writeln('Refer to icosahedron.png for hexiamond placement (on which number''s location stands each hexiamond).');
  end
  else if choice = 4 then
     begin
  writeln('');
  writeln('__________________________________________________');
  writeln('');
  writeln('');
  writeln('1 is ',odin);
  writeln('2 is ',dva);
  writeln('3 is ',tri);
  writeln('4 is ',chetire);
  writeln('5 is ',pyat);
  writeln('6 is ',shest);
  writeln('7 is ',semj);
  writeln('8 is ',vosemj);
  writeln('9 is ',devyat);
  writeln('10 is ',desyat);
  writeln('11 is ',odinnatsat);
  writeln('12 is ',dvenadsat);
  writeln('');
  writeln('Triangles (triplets), resulting from the placement: ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty);
  writeln('');
  writeln('Refer to dodecahedron.png for hexiamond placement (on which number''s location stands each hexiamond).');
  end
  else if choice = 5 then
  begin
    writeln('');
  writeln('__________________________________________________');
  writeln('');
  writeln('');
  writeln('1 is ',odin);
  writeln('2 is ',dva);
  writeln('3 is ',tri);
  writeln('4 is ',chetire);
  writeln('5 is ',pyat);
  writeln('6 is ',shest);
  writeln('7 is ',semj);
  writeln('8 is ',vosemj);
  writeln('9 is ',devyat);
  writeln('10 is ',desyat);
  writeln('11 is ',odinnatsat);
  writeln('12 is ',dvenadsat);
  writeln('');
  writeln('Triangles (triplets), resulting from the placement: ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve);
  writeln('');
  writeln('Refer to circle.png for hexiamond placement (on which number''s location stands each hexiamond).');
  end;
  end
  else if exportchoice=1 then
  begin
  writeln('');
  writeln('__________________________________________________');
  writeln('');
  writeln('');
  writeln('EXPORT SUCCESSFUL. SOLUTIONS EXPORTED: ',resultamount,'.');
  end;
  writeln('');
  writeln('Press <ENTER> to exit the program.');
readln;
end.
