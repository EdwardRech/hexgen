program hexgen;
uses crt; //required for ClrScr
var ein,zwei,drei,vier,funf,sechs,sieben,acht,neun,zehn,elf,zwolf,success,I:Integer; //Numbers in German - assigned to letters
var odin,dva,tri,chetire,pyat,shest,semj,vosemj,devyat,desyat,odinnatsat,dvenadsat:String; //Numbers in Russian - assigned to randomly generated numbers
var TRone,TRtwo,TRthree,TRfour,TRfive,TRsix,TRseven,TReight,TRnine,TRten,TReleven,TRtwelve,TRthirteen,TRfourteen,TRfifteen,TRsixteen,TRseventeen,TReighteen,TRnineteen,TRtwenty:String; //These strings represent each hexiamond triplet. TR-TRiangle
const combinationnumber=103; //That's the amount of hexiamond combinations we have found so far.
var WordsArray: Array [1..combinationnumber] of String; //Combination array
var U:Integer; //used for array checking, checking the amount of correct combinations
var choice,exportchoice,resultamount:Integer; //user choices
var filename:String; //file name
var combinations:text; //the variable that's assigned to the text file combinations.txt
var exportone,exporttwo,exportthree,exportfour,exportfive:text; //variables assigned to their text files for exporting results.
var count19:Integer; //just like in the name, it means 19 might also be counted
var firststart:Integer; //checks whether the calculation started just now
var conf1,conf2,conf3,conf4,conf5,conf6,conf7,conf8,conf9,conf10:Integer; //Confirms that a branch is correct
var conf1part,conf2part,conf3part,conf4part,conf5part,conf6part,conf7part,conf8part,conf9part,conf10part:Integer; //Used for the integers above in case multiple triplets need to be checked
var conf10part16,conf10part17,conf10part18,conf10part19,conf10part20:Integer; //Used to check the last 5 triplets in a dodecahedron or icosahedron
var error1,error2,error3,error4,error5,error6,error7,error8,error9,error10:Integer; //Error count in a branch
var shape,wrong:string; //shape name; wrong triplet (can't be found in the list)
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
  Assign(combinations, 'combinations.txt');
  ReSet(combinations);
  For I:=1 to combinationnumber do Readln(combinations, WordsArray[I]);
  Close(combinations);
  Assign(exportone, 'export1.txt');
  Assign(exporttwo, 'export2.txt');
  Assign(exportthree, 'export3.txt');
  Assign(exportfour, 'export4.txt');
  Assign(exportfive,'export5.txt');
  FirstStart:=1;
  Repeat
    begin
    writeln('Hexiamond Placement Generator, version 6.0' );
    writeln('');
    writeln('To choose a shape, write the corresponding number.');
    writeln('1) Tetrahedron');
    writeln('2) Octahedron');
    writeln('3) Icosahedron');
    writeln('4) Dodecahedron');
    writeln('5) Circle');
    writeln('');
    write('Number: ');
    readln(choice);
    if (choice <> 1) AND (choice <> 2) AND (choice <> 3) AND (choice <> 4) AND (choice <> 5) then
    begin
    writeln('Please write 1, 2, 3, 4 or 5. Each number represents a shape, just like written above. Press <ENTER> to try again!');
    readln;
    ClrScr;
    end;
  end;
  until (choice = 1) OR (choice = 2) OR (choice = 3) OR (choice = 4) OR (choice = 5);
  if (choice = 3) OR (choice=4) then
  begin
  writeln('The program is having a hard time detecting a solution with 20 correct triplets. If you''re okay with a solution that has 19 correct triplets, write 1 and press <ENTER>. Otherwise, write any other integer.');
  readln(count19);
  end;
  case choice of
    1:begin
    shape:='Shape: Tetrahedron. 4 vertices, 4 triplets.';
    filename:='export1.txt';
    end;
    2:begin
    shape:='Shape: Octahedron. 6 vertices, 8 triplets.';
    filename:='export2.txt';
    end;
    3:begin
    shape:='Shape: Icosahedron. 12 vertices, 20 triplets.';
    filename:='export3.txt';
    end;
    4:begin
    shape:='Shape: Dodecahedron. 12 vertices, 20 triplets.';
    filename:='export4.txt';
    end;
    5:begin
    shape:='Shape: Circle. 12 vertices, 12 triplets.';
    filename:='export5.txt';
    end;
    end;
  writeln('');
  writeln('Would you like to export the solution(s)?');
  writeln('If you''d like to export the solution(s), write 1 and press <ENTER>. Otherwise, write any other integer.');
  readln(exportchoice);
  if exportchoice = 1 then
  begin
  Repeat
  ClrScr;
  writeln('How many solutions would you like to export? (Must be 1 or more!)');
  readln(resultamount);
  if resultamount <= 0 then
  begin
  writeln('The amount of solutions should be 1 or more. Press <ENTER> to try again.');
  readln;
  ClrScr;
  end;
  until resultamount > 0;
  writeln('Exporting ',resultamount,' solutions to ',filename,'.');
  writeln('NOTE: For increased performance, nothing is going to be written on the screen during the calculation process.');
  writeln('Press <ENTER> to continue.');
  readln;
  end
  else if exportchoice <> 1 then
  begin
  ClrScr;
  writeln('NOTE: For increased performance, nothing is going to be written on the screen during the calculation process.');
  writeln('Press <ENTER> to continue.');
  resultamount:=1;
  readln;
  end;
  ClrScr;
  if choice = 1 then
  begin
  Repeat
  if (error2=12) OR (FirstStart=1) then //1
  Repeat
  firststart:=0;
    Repeat
    Conf1:=0;
  ein:=Random(12)+1;
  zwei:=Random(12)+1;
  drei:=Random(12)+1;
  until (ein <> zwei) AND (ein <> drei) AND (zwei <> ein) AND (zwei <> drei) AND (drei <> ein) AND (drei <> zwei);
  letterassign(ein,odin);
  letterassign(zwei,dva);
  letterassign(drei,tri);
  alphabetSort(ein,zwei,drei,odin,dva,tri,TROne);
      for U:=1 to combinationnumber do
    begin
      if (TRone = WordsArray[U]) then
    inc(conf1);
    end;
  vier:=0;
  error2:=0;
  until (Conf1=1);
  if (Conf1 = 1) AND (Error2 < 12) then //2
  Repeat
  conf2part:=0;
  conf2:=0;
  inc(vier);
  if (vier <> ein) AND (vier <> zwei) AND (vier <> drei) AND (vier < 13) then
  begin
  letterassign(vier,chetire);
  alphabetsort(ein,zwei,vier,odin,dva,chetire,TRtwo);
  alphabetsort(ein,drei,vier,odin,tri,chetire,TRthree);
  alphabetsort(zwei,drei,vier,dva,tri,chetire,TRfour);
  for U:=1 to combinationnumber do
  begin
  if (TRtwo = WordsArray[U]) then
  inc(conf2part);
  if (TRthree = WordsArray[U]) then
  inc(conf2part);
  if (TRfour = WordsArray[U]) then
  inc(conf2part);
  end;
  if conf2part=3 then conf2:=1
  else inc(error2);
  end
  else inc(error2);
  until (Conf2 = 1) OR (Error2 = 12);
  if ((Conf1 = 1) AND (Conf2 = 1)) AND (exportchoice=1) then
  begin
  Append(exportone);
  writeln(exportone,odin,', ',dva,', ',tri,', ',chetire,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour);
  Close(exportone);
  inc(success);
  end
  else if ((Conf1 = 1) AND (Conf2 = 1)) AND (exportchoice<>1) then
  success:=resultamount;
  until ((Conf1 = 1) AND (Conf2 = 1)) AND (success>=resultamount);
  if exportchoice <> 1 then
  begin
  writeln(shape);
  writeln('');
  writeln('1 is ',odin);
  writeln('2 is ',dva);
  writeln('3 is ',tri);
  writeln('4 is ',chetire);
  writeln('');
  writeln('Triangles (triplets), resulting from the placement: ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour);
  writeln('');
  writeln('Refer to tetrahedron.png for hexiamond placement (on which number''s location stands each hexiamond).');
  end;
  if exportchoice = 1 then
  begin
  writeln(shape);
  writeln('');
  writeln('Exported ',resultamount,' solutions to ',filename,'.');
  end;
  writeln('Press <ENTER> to exit.');
  readln;
  end
  else if choice = 2 then
  begin
  Repeat
  if (error2=12) OR (FirstStart=1) then    //1
  Repeat
  firststart:=0;
    Repeat
      Conf1:=0;
  ein:=Random(12)+1;
  zwei:=Random(12)+1;
  funf:=Random(12)+1;
  until (ein <> zwei) AND (ein <> funf) AND (zwei <> ein) AND (zwei <> funf) AND (funf <> ein) AND (funf <> zwei);
  letterassign(ein,odin);
  letterassign(zwei,dva);
  letterassign(funf,pyat);
  alphabetSort(ein,zwei,funf,odin,dva,pyat,TROne);
      for U:=1 to combinationnumber do
    begin
      if (TRone = WordsArray[U]) then
    conf1:=conf1+1;
    end;
  vier:=0;
  error2:=0;
  until (Conf1=1);
  if ((Conf1=1) OR (error3=12)) AND (Error2<12) then      //2
  Repeat
  conf2part:=0;
  conf2:=0;
  inc(vier);
  if (vier <> ein) AND (vier <> zwei) AND (vier <> funf) AND (vier<13) then
  begin
  letterassign(vier,chetire);
  alphabetSort(ein,vier,funf,odin,chetire,pyat,TRtwo);
  for U:=1 to combinationnumber do
  begin
  if (TRtwo = WordsArray[U]) then
  conf2:=conf2+1;
  end;
  if conf2<>1 then inc(error2);
  end
  else inc(error2);
  sechs:=0;
  error3:=0;
  until (Conf2=1) OR (Error2=12);
  if ((Conf2=1) OR (error4=12)) AND (Error3<12) then   //3
  Repeat
  conf3:=0;
  conf3part:=0;
  inc(sechs);
  if (sechs <> ein) AND (sechs <> zwei) AND (sechs <> funf) AND (sechs <> vier) AND (sechs<13) then
  begin
  letterassign(sechs,shest);
  alphabetSort(ein,vier,sechs,odin,chetire,shest,TRthree);
  alphabetsort(ein,zwei,sechs,odin,dva,shest,TRfour);
  for U:=1 to combinationnumber do
  begin
  if (TRthree = WordsArray[U]) then
  conf3part:=conf3part+1;
  if (TRfour = WordsArray[U]) then
  conf3part:=conf3part+1;
  end;
  if conf3part = 2 then
  conf3 := 1
  else inc(error3);
  end
  else inc(error3);
  drei:=0;
  error4:=0;
  until (Conf3=1) OR (Error3=12);
  if (Conf3=1) AND (Error4<12) then   //4
  Repeat
  conf4:=0;
  conf4part:=0;
  inc(drei);
  if (drei <> ein) AND (drei <> zwei) AND (drei <> funf) AND (drei <> vier) AND (drei <> sechs) AND (drei<13) then
  begin
  letterassign(drei,tri);
  alphabetSort(zwei,drei,funf,dva,tri,pyat,TRfive);
  alphabetSort(zwei,drei,sechs,dva,tri,shest,TRsix);
  alphabetSort(drei,vier,sechs,tri,chetire,shest,TRseven);
  alphabetSort(drei,vier,funf,tri,chetire,pyat,TReight);
  for U:=1 to combinationnumber do
  begin
  if (TRfive = WordsArray[U]) then
  conf4part:=conf4part+1;
  if (TRsix = WordsArray[U]) then
  conf4part:=conf4part+1;
   if (TRseven = WordsArray[U]) then
  conf4part:=conf4part+1;
  if (TReight = WordsArray[U]) then
  conf4part:=conf4part+1;
  end;
  end;
  if conf4part = 4 then conf4 := 1
  else inc(error4);
    until (Conf4 = 1) OR (Error4 = 12);
  if ((Conf1 =1) AND (conf2=1) AND (conf3=1) AND (conf4=1)) AND (exportchoice=1) then
  begin
  Append(exporttwo);
  writeln(exporttwo,odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight);
  Close(exporttwo);
  inc(success);
  end
  else if ((Conf1 =1) AND (conf2=1) AND (conf3=1) AND (conf4=1)) AND (exportchoice<>1) then
  success:=resultamount;
  until ((Conf1 =1) AND (conf2=1) AND (conf3=1) AND (conf4=1)) AND (success>=resultamount);
  if exportchoice <> 1 then
  begin
  writeln(shape);
  writeln('');
  writeln('1 is ',odin);
  writeln('2 is ',dva);
  writeln('3 is ',tri);
  writeln('4 is ',chetire);
  writeln('5 is ',pyat);
  writeln('6 is ',shest);
  writeln('');
  writeln('Triplets (triangles), resulting from the placement: ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight);
  writeln('');
  writeln('Refer to octahedron.png for hexiamond placement (on which number''s location stands each hexiamond).');
  end;
  if exportchoice = 1 then
  begin
  writeln(shape);
  writeln('');
  writeln('Exported ',resultamount,' solutions to ',filename,'.');
  end;
  writeln('Press <ENTER> to exit.');
  readln;
  end
    else if choice = 3 then
  begin
  Repeat
  if (error2=12) OR (FirstStart=1) then //1
  Repeat
  firststart:=0;
  error2:=0;
    Repeat
    Conf1:=0;
  ein:=Random(12)+1;
  zwei:=Random(12)+1;
  drei:=Random(12)+1;
  until (ein <> zwei) AND (ein <> drei) AND (zwei <> ein) AND (zwei <> drei) AND (drei <> ein) AND (drei <> zwei);
  letterassign(ein,odin);
  letterassign(zwei,dva);
  letterassign(drei,tri);
  alphabetSort(ein,zwei,drei,odin,dva,tri,TROne);
      for U:=1 to combinationnumber do
    begin
      if (TRone = WordsArray[U]) then
    inc(conf1);
    end;
  neun:=0;
  until (Conf1=1);
  if ((Conf1=1) OR (error3=12)) AND (Error2 <12) then //2
  Repeat
  conf2part:=0;
  conf2:=0;
  inc(neun);
  if (neun <> ein) AND (neun <> zwei) AND (neun <> drei) AND (neun<13) then
  begin
  letterassign(neun,devyat);
  alphabetSort(ein,neun,zwei,odin,devyat,dva,TRtwo);
  for U:=1 to combinationnumber do
  begin
  if (TRtwo = WordsArray[U]) then
  inc(conf2);
  end;
  if conf2<>1 then inc(error2);
  end
  else inc(error2);
  sieben:=0; //next variable
  error3:=0; //next error variable
  until (Conf2=1) OR (Error2=12);
    if ((Conf2=1) OR (error4=12)) AND (Error3 <12) then //3
  Repeat
  conf3part:=0;
  conf3:=0;
  inc(sieben);
  if (sieben <> ein) AND (sieben <> zwei) AND (sieben <> drei) AND (sieben <> neun) AND (sieben<13) then
  begin
  letterassign(sieben,semj);
  alphabetSort(ein,neun,sieben,odin,devyat,semj,TRthree);
  for U:=1 to combinationnumber do
  begin
  if (TRthree = WordsArray[U]) then
  inc(conf3);
  end;
  if conf3<>1 then inc(error3);
  end
  else inc(error3);
  sechs:=0; //next variable
  error4:=0; //next error variable
  until (Conf3=1) OR (Error3=12);
      if ((Conf3=1) OR (error5=12)) AND (Error4 <12) then //4
  Repeat
  conf4part:=0;
  conf4:=0;
  inc(sechs);
  if (sechs <> ein) AND (sechs <> zwei) AND (sechs <> drei) AND (sechs <> sieben) AND (sechs <> neun) AND (sechs<13) then
  begin
  letterassign(sechs,shest);
  alphabetSort(ein,sechs,sieben,odin,shest,semj,TRfour);
  alphabetSort(ein,sechs,drei,odin,shest,tri,TRfive);
  for U:=1 to combinationnumber do
  begin
  if (TRfour = WordsArray[U]) then
  inc(conf4part);
  if (TRfive = WordsArray[U]) then
  inc(conf4part);
  end;
  if conf4part=2 then conf4:=1
  else inc(error4);
  end
  else inc(error4);
  funf:=0; //next variable
  error5:=0; //next error variable
  until (Conf4=1) OR (Error4=12);
        if ((Conf4=1) OR (error6=12)) AND (Error5 <12) then //5
  Repeat
  conf5part:=0;
  conf5:=0;
  inc(funf);
  if (funf <> ein) AND (funf <> zwei) AND (funf <> drei) AND (funf <> sechs) AND (funf <> sieben) AND (funf <> neun) AND (funf<13) then
  begin
  letterassign(funf,pyat);
  alphabetSort(funf,sechs,drei,pyat,shest,tri,TRsix);
  for U:=1 to combinationnumber do
  begin
  if (TRsix = WordsArray[U]) then
  inc(conf5);
  end;
  if conf5<>1 then inc(error5);
  end
  else inc(error5);
  vier:=0; //next variable
  error6:=0; //next error variable
  until (Conf5=1) OR (Error5=12);
          if ((Conf5=1) OR (error7=12)) AND (Error6 <12) then //6
  Repeat
  conf6part:=0;
  conf6:=0;
  inc(vier);
  if (vier <> ein) AND (vier <> zwei) AND (vier <> drei) AND (vier <> funf) AND (vier <> sechs) AND (vier <> sieben) AND (vier <> neun) AND (vier<13) then
  begin
  letterassign(vier,chetire);
  alphabetSort(funf,vier,drei,pyat,chetire,tri,TRseven);
  alphabetSort(zwei,drei,vier,dva,tri,chetire,TReight);
  for U:=1 to combinationnumber do
  begin
  if (TRseven = WordsArray[U]) then
  inc(conf6part);
  if (TReight = WordsArray[U]) then
  inc(conf6part);
  end;
  if conf6part=2 then conf6:=1
  else inc(error6);
  end
  else inc(error6);
  zehn:=0; //next variable
  error7:=0; //next error variable
  until (Conf6=1) OR (Error6=12);
            if ((Conf6=1) OR (error8=12)) AND (Error7 <12) then //7
  Repeat
  conf7part:=0;
  conf7:=0;
  inc(zehn);
  if (zehn <> ein) AND (zehn <> zwei) AND (zehn <> drei) AND (zehn <> vier) AND (zehn <> funf) AND (zehn <> sechs) AND (zehn <> sieben) AND (zehn <> neun) AND (zehn<13) then
  begin
  letterassign(zehn,desyat);
  alphabetSort(zwei,zehn,vier,dva,desyat,chetire,TRnine);
  alphabetSort(zwei,neun,zehn,dva,devyat,desyat,TRten);
  for U:=1 to combinationnumber do
  begin
  if (TRnine = WordsArray[U]) then
  inc(conf7part);
  if (TRten = WordsArray[U]) then
  inc(conf7part);
  end;
  if conf7part=2 then conf7:=1
  else inc(error7);
  end
  else inc(error7);
  acht:=0; //next variable
  error8:=0; //next error variable
  until (Conf7=1) OR (Error7=12);
              if ((Conf7=1) OR (error9=12)) AND (Error8 <12) then //8
  Repeat
  conf8part:=0;
  conf8:=0;
  inc(acht);
  if (acht <> ein) AND (acht <> zwei) AND (acht <> drei) AND (acht <> vier) AND (acht <> funf) AND (acht <> sechs) AND (acht <> sieben) AND (acht <> neun) AND (acht <> zehn) AND (acht<13) then
  begin
  letterassign(acht,vosemj);
  alphabetSort(acht,neun,zehn,vosemj,devyat,desyat,TReleven);
  alphabetSort(acht,neun,sieben,vosemj,devyat,semj,TRtwelve);
  for U:=1 to combinationnumber do
  begin
  if (TReleven = WordsArray[U]) then
  inc(conf8part);
  if (TRtwelve = WordsArray[U]) then
  inc(conf8part);
  end;
  if conf8part=2 then conf8:=1
  else inc(error8);
  end
  else inc(error8);
  zwolf:=0; //next variable
  error9:=0; //next error variable
  until (Conf8=1) OR (Error8=12);
                if ((Conf8=1) OR (error10=12)) AND (Error9 <12) then //9
  Repeat
  conf9part:=0;
  conf9:=0;
  inc(zwolf);
  if (zwolf <> ein) AND (zwolf <> zwei) AND (zwolf <> drei) AND (zwolf <> vier) AND (zwolf <> funf) AND (zwolf <> sechs) AND (zwolf <> sieben) AND (zwolf <> acht) AND (zwolf <> neun) AND (zwolf <> zehn) AND (zwolf<13) then
  begin
  letterassign(zwolf,dvenadsat);
  alphabetSort(acht,zwolf,sieben,vosemj,dvenadsat,semj,TRthirteen);
  alphabetSort(sechs,sieben,zwolf,shest,semj,dvenadsat,TRfourteen);
  alphabetSort(sechs,zwolf,funf,shest,dvenadsat,pyat,TRfifteen);
  for U:=1 to combinationnumber do
  begin
  if (TRthirteen = WordsArray[U]) then
  inc(conf9part);
  if (TRfourteen = WordsArray[U]) then
  inc(conf9part);
  if (TRfifteen = WordsArray[U]) then
  inc(conf9part);
  end;
  if conf9part=3 then conf9:=1
  else inc(error9);
  end
  else inc(error9);
  elf:=0; //next variable
  error10:=0; //next error variable
  until (Conf9=1) OR (Error9=12);
                  if (Conf9=1) AND (Error10 <12) then //10
  Repeat
  conf10part:=0;
  conf10part16:=0;
  conf10part17:=0;
  conf10part18:=0;
  conf10part19:=0;
  conf10part20:=0;
  conf10:=0;
  inc(elf);
  if (elf <> ein) AND (elf <> zwei) AND (elf <> drei) AND (elf <> vier) AND (elf <> funf) AND (elf <> sechs) AND (elf <> sieben) AND (elf <> acht) AND (elf <> neun) AND (elf <> zehn) AND (elf<>zwolf) AND (elf<13) then
  begin
  letterassign(elf,odinnatsat);
  alphabetSort(elf,zwolf,funf,odinnatsat,dvenadsat,pyat,TRsixteen);
  alphabetSort(elf,zwolf,acht,odinnatsat,dvenadsat,vosemj,TRseventeen);
  alphabetSort(elf,acht,zehn,odinnatsat,vosemj,desyat,TReighteen);
  alphabetSort(elf,zehn,vier,odinnatsat,desyat,chetire,TRnineteen);
  alphabetSort(elf,vier,funf,odinnatsat,chetire,pyat,TRtwenty);
  for U:=1 to combinationnumber do
  begin
  if conf10part16=0 then
  if (TRsixteen = WordsArray[U]) then
  inc(conf10part16);
  if conf10part17=0 then
  if (TRseventeen = WordsArray[U]) then
  inc(conf10part17);
  if conf10part18=0 then
  if (TReighteen = WordsArray[U]) then
  inc(conf10part18);
  if conf10part19=0 then
  if (TRnineteen = WordsArray[U]) then
  inc(conf10part19);
  if conf10part20=0 then
  if (TRtwenty = WordsArray[U]) then
  inc(conf10part20);
  end;
  conf10part:=conf10part16+conf10part17+conf10part18+conf10part19+conf10part20;
  if conf10part16 = 0 then wrong:=TRsixteen;
  if conf10part17 = 0 then wrong:=TRseventeen;
  if conf10part18 = 0 then wrong:=TReighteen;
  if conf10part19 = 0 then wrong:=TRnineteen;
  if conf10part20 = 0 then wrong:=TRtwenty;
  if count19 = 1 then
begin
if conf10part>=4 then conf10:=1
else inc(error10)
end
else
begin
if conf10part=5 then conf10:=1
else inc(error10);
end;
  end
  else inc(error10);
    until (Conf10 = 1) OR (Error10 = 12);
  if ((Conf1 =1) AND (conf2=1) AND (conf3=1) AND (conf4=1)AND (conf5=1)AND (conf6=1)AND (conf7=1)AND (conf8=1)AND (conf9=1)AND (conf10=1)) AND (exportchoice=1) then
  begin
  if count19 = 1 then
  begin
  Append(exportthree);
  writeln(exportthree,'19 - ',odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,', ',semj,', ',vosemj,', ',devyat,', ',desyat,', ',odinnatsat,', ',dvenadsat,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty,'; wrong - ',wrong);
  Close(exportthree);
  end
  else if count19 <> 1 then
  begin
  Append(exportthree);
  writeln(exportthree,'20 - ',odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,', ',semj,', ',vosemj,', ',devyat,', ',desyat,', ',odinnatsat,', ',dvenadsat,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty);
  Close(exportthree);
  end;
  inc(success);
  end
  else if ((Conf1 =1) AND (conf2=1) AND (conf3=1) AND (conf4=1)AND (conf5=1)AND (conf6=1)AND (conf7=1)AND (conf8=1)AND (conf9=1)AND (conf10=1)) AND (exportchoice<>1) then
  success:=resultamount;
  until ((Conf1 =1) AND (conf2=1) AND (conf3=1) AND (conf4=1)AND (conf5=1)AND (conf6=1)AND (conf7=1)AND (conf8=1)AND (conf9=1)AND (conf10=1)) AND (success>=resultamount);
  if exportchoice <> 1 then
  begin
  writeln(shape);
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
  writeln('Triplets (triangles), resulting from the placement: ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty);
    if count19=1 then writeln('Wrong triplet - ',wrong);
  writeln('');
  writeln('Refer to icosahedron.png for hexiamond placement (on which number''s location stands each hexiamond).');
  end;
  if exportchoice = 1 then
  begin
  writeln(shape);
  writeln('');
  writeln('Exported ',resultamount,' solutions to ',filename,'.');
  end;
  writeln('Press <ENTER> to exit.');
  readln;
  end
    else if choice = 4 then
  begin
  Repeat
  if (error2=12) OR (FirstStart=1) then //1
  Repeat
  firststart:=0;
  error2:=0;
    Repeat
    Conf1:=0;
  ein:=Random(12)+1;
  zwei:=Random(12)+1;
  drei:=Random(12)+1;
  until (ein <> zwei) AND (ein <> drei) AND (zwei <> ein) AND (zwei <> drei) AND (drei <> ein) AND (drei <> zwei);
  letterassign(ein,odin);
  letterassign(zwei,dva);
  letterassign(drei,tri);
  alphabetSort(ein,zwei,drei,odin,dva,tri,TROne);
      for U:=1 to combinationnumber do
    begin
      if (TRone = WordsArray[U]) then
    inc(conf1);
    end;
  sechs:=0;
  until (Conf1=1);
  if ((Conf1=1) OR (error3=12)) AND (Error2 <12) then //2
  Repeat
  conf2part:=0;
  conf2:=0;
  inc(sechs);
  if (sechs <> ein) AND (sechs <> zwei) AND (sechs <> drei) AND (sechs<13) then
  begin
  letterassign(sechs,shest);
  alphabetSort(ein,sechs,zwei,odin,shest,dva,TRtwo);
  for U:=1 to combinationnumber do
  begin
  if (TRtwo = WordsArray[U]) then
  inc(conf2);
  end;
  if conf2<>1 then inc(error2);
  end
  else inc(error2);
  funf:=0; //next variable
  error3:=0; //next error variable
  until (Conf2=1) OR (Error2=12);
    if ((Conf2=1) OR (error4=12)) AND (Error3 <12) then //3
  Repeat
  conf3part:=0;
  conf3:=0;
  inc(funf);
  if (funf <> ein) AND (funf <> zwei) AND (funf <> drei) AND (funf <> sechs) AND (funf<13) then
  begin
  letterassign(funf,pyat);
  alphabetSort(ein,funf,sechs,odin,pyat,shest,TRthree);
  for U:=1 to combinationnumber do
  begin
  if (TRthree = WordsArray[U]) then
  inc(conf3);
  end;
  if conf3<>1 then inc(error3);
  end
  else inc(error3);
  vier:=0; //next variable
  error4:=0; //next error variable
  until (Conf3=1) OR (Error3=12);
      if ((Conf3=1) OR (error5=12)) AND (Error4 <12) then //4
  Repeat
  conf4part:=0;
  conf4:=0;
  inc(vier);
  if (vier <> ein) AND (vier <> zwei) AND (vier <> drei) AND (vier <> funf) AND (vier <> sechs) AND (vier<13) then
  begin
  letterassign(vier,chetire);
  alphabetSort(ein,funf,vier,odin,pyat,chetire,TRfour);
  alphabetSort(ein,drei,vier,odin,tri,chetire,TRfive);
  for U:=1 to combinationnumber do
  begin
  if (TRfour = WordsArray[U]) then
  inc(conf4part);
  if (TRfive = WordsArray[U]) then
  inc(conf4part);
  end;
  if conf4part=2 then conf4:=1
  else inc(error4);
  end
  else inc(error4);
  elf:=0; //next variable
  error5:=0; //next error variable
  until (Conf4=1) OR (Error4=12);
        if ((Conf4=1) OR (error6=12)) AND (Error5 <12) then //5
  Repeat
  conf5part:=0;
  conf5:=0;
  inc(elf);
  if (elf <> ein) AND (elf <> zwei) AND (elf <> drei) AND (elf <> vier) AND (elf <> funf) AND (elf <> sechs) AND (elf<13) then
  begin
  letterassign(elf,odinnatsat);
  alphabetSort(elf,funf,vier,odinnatsat,pyat,chetire,TRsix);
  for U:=1 to combinationnumber do
  begin
  if (TRsix = WordsArray[U]) then
  inc(conf5);
  end;
  if conf5<>1 then inc(error5);
  end
  else inc(error5);
  zehn:=0; //next variable
  error6:=0; //next error variable
  until (Conf5=1) OR (Error5=12);
          if ((Conf5=1) OR (error7=12)) AND (Error6 <12) then //6
  Repeat
  conf6part:=0;
  conf6:=0;
  inc(zehn);
  if (zehn <> ein) AND (zehn <> zwei) AND (zehn <> drei) AND (zehn <> vier) AND (zehn <> funf) AND (zehn <> sechs) AND (zehn <> elf) AND (zehn<13) then
  begin
  letterassign(zehn,desyat);
  alphabetSort(elf,zehn,vier,odinnatsat,desyat,chetire,TRseven);
  alphabetSort(drei,vier,zehn,tri,chetire,desyat,TReight);
  for U:=1 to combinationnumber do
  begin
  if (TRseven = WordsArray[U]) then
  inc(conf6part);
  if (TReight = WordsArray[U]) then
  inc(conf6part);
  end;
  if conf6part=2 then conf6:=1
  else inc(error6);
  end
  else inc(error6);
  neun:=0; //next variable
  error7:=0; //next error variable
  until (Conf6=1) OR (Error6=12);
            if ((Conf6=1) OR (error8=12)) AND (Error7 <12) then //7
  Repeat
  conf7part:=0;
  conf7:=0;
  inc(neun);
  if (neun <> ein) AND (neun <> zwei) AND (neun <> drei) AND (neun <> vier) AND (neun <> funf) AND (neun <> sechs) AND (neun <> zehn) AND (neun <> elf) AND (neun<13) then
  begin
  letterassign(neun,devyat);
  alphabetSort(drei,neun,zehn,tri,devyat,desyat,TRnine);
  alphabetSort(zwei,drei,neun,dva,tri,devyat,TRten);
  for U:=1 to combinationnumber do
  begin
  if (TRnine = WordsArray[U]) then
  inc(conf7part);
  if (TRten = WordsArray[U]) then
  inc(conf7part);
  end;
  if conf7part=2 then conf7:=1
  else inc(error7);
  end
  else inc(error7);
  acht:=0; //next variable
  error8:=0; //next error variable
  until (Conf7=1) OR (Error7=12);
              if ((Conf7=1) OR (error9=12)) AND (Error8 <12) then //8
  Repeat
  conf8part:=0;
  conf8:=0;
  inc(acht);
  if (acht <> ein) AND (acht <> zwei) AND (acht <> drei) AND (acht <> vier) AND (acht <> funf) AND (acht <> sechs) AND (acht <> neun) AND (acht <> zehn) AND (acht <> elf) AND (acht<13) then
  begin
  letterassign(acht,vosemj);
  alphabetSort(zwei,acht,neun,dva,vosemj,devyat,TReleven);
  alphabetSort(zwei,sechs,acht,dva,shest,vosemj,TRtwelve);
  for U:=1 to combinationnumber do
  begin
  if (TReleven = WordsArray[U]) then
  inc(conf8part);
  if (TRtwelve = WordsArray[U]) then
  inc(conf8part);
  end;
  if conf8part=2 then conf8:=1
  else inc(error8);
  end
  else inc(error8);
  sieben:=0; //next variable
  error9:=0; //next error variable
  until (Conf8=1) OR (Error8=12);
                if ((Conf8=1) OR (error10=12)) AND (Error9 <12) then //9
  Repeat
  conf9part:=0;
  conf9:=0;
  inc(sieben);
  if (sieben <> ein) AND (sieben <> zwei) AND (sieben <> drei) AND (sieben <> vier) AND (sieben <> funf) AND (sieben <> sechs) AND (sieben <> acht) AND (sieben <> neun) AND (sieben <> zehn) AND (sieben <> elf) AND (sieben<13) then
  begin
  letterassign(sieben,semj);
  alphabetSort(sieben,sechs,acht,semj,shest,vosemj,TRthirteen);
  alphabetSort(funf,sechs,sieben,pyat,shest,semj,TRfourteen);
  alphabetSort(funf,sieben,elf,pyat,semj,odinnatsat,TRfifteen);
  for U:=1 to combinationnumber do
  begin
  if (TRthirteen = WordsArray[U]) then
  inc(conf9part);
  if (TRfourteen = WordsArray[U]) then
  inc(conf9part);
  if (TRfifteen = WordsArray[U]) then
  inc(conf9part);
  end;
  if conf9part=3 then conf9:=1
  else inc(error9);
  end
  else inc(error9);
  zwolf:=0; //next variable
  error10:=0; //next error variable
  until (Conf9=1) OR (Error9=12);
  if (Conf9=1) AND (Error10 <12) then //10
  Repeat
  conf10part:=0;
  conf10:=0;
  conf10part16:=0;
  conf10part17:=0;
  conf10part18:=0;
  conf10part19:=0;
  conf10part20:=0;
  inc(zwolf);
  if (zwolf <> ein) AND (zwolf <> zwei) AND (zwolf <> drei) AND (zwolf <> vier) AND (zwolf <> funf) AND (zwolf <> sechs) AND (zwolf <> sieben) AND (zwolf <> acht) AND (zwolf <> neun) AND (zwolf <> zehn) AND (zwolf <> elf) AND (zwolf<13) then
  begin
  letterassign(zwolf,dvenadsat);
  alphabetsort(zwolf,zehn,neun,dvenadsat,desyat,devyat,TRsixteen);
  alphabetsort(zwolf,neun,acht,dvenadsat,devyat,vosemj,TRseventeen);
  alphabetsort(zwolf,acht,sieben,dvenadsat,vosemj,semj,TReighteen);
  alphabetsort(zwolf,sieben,elf,dvenadsat,semj,odinnatsat,TRnineteen);
  alphabetsort(zwolf,elf,zehn,dvenadsat,odinnatsat,desyat,TRtwenty);
  for U:=1 to combinationnumber do
  begin
  if conf10part16=0 then
  if (TRsixteen = WordsArray[U]) then
  inc(conf10part16);
  if conf10part17=0 then
  if (TRseventeen = WordsArray[U]) then
  inc(conf10part17);
  if conf10part18=0 then
  if (TReighteen = WordsArray[U]) then
  inc(conf10part18);
  if conf10part19=0 then
  if (TRnineteen = WordsArray[U]) then
  inc(conf10part19);
  if conf10part20=0 then
  if (TRtwenty = WordsArray[U]) then
  inc(conf10part20);
  end;
  conf10part:=conf10part16+conf10part17+conf10part18+conf10part19+conf10part20;
  if conf10part16 = 0 then wrong:=TRsixteen;
  if conf10part17 = 0 then wrong:=TRseventeen;
  if conf10part18 = 0 then wrong:=TReighteen;
  if conf10part19 = 0 then wrong:=TRnineteen;
  if conf10part20 = 0 then wrong:=TRtwenty;
  if count19 = 1 then
begin
if conf10part>=4 then conf10:=1
else inc(error10)
end
else
begin
if conf10part=5 then conf10:=1
else inc(error10);
end;
  end
  else inc(error10);
    until (Conf10 = 1) OR (Error10 = 12);
  if ((Conf1 =1) AND (conf2=1) AND (conf3=1) AND (conf4=1)AND (conf5=1)AND (conf6=1)AND (conf7=1)AND (conf8=1)AND (conf9=1)AND (conf10=1)) AND (exportchoice=1) then
  begin
  if count19 = 1 then
  begin
  Append(exportfour);
  writeln(exportfour,'19 - ',odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,', ',semj,', ',vosemj,', ',devyat,', ',desyat,', ',odinnatsat,', ',dvenadsat,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty,'; wrong - ',wrong);
  Close(exportfour);
  end
  else if count19 <> 1 then
  begin
  Append(exportfour);
  writeln(exportfour,'20 - ',odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,', ',semj,', ',vosemj,', ',devyat,', ',desyat,', ',odinnatsat,', ',dvenadsat,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty);
  Close(exportfour);
  end;
  inc(success);
  end
  else if ((Conf1 =1) AND (conf2=1) AND (conf3=1) AND (conf4=1)AND (conf5=1)AND (conf6=1)AND (conf7=1)AND (conf8=1)AND (conf9=1)AND (conf10=1)) AND (exportchoice<>1) then
  success:=resultamount;
  until ((Conf1 =1) AND (conf2=1) AND (conf3=1) AND (conf4=1)AND (conf5=1)AND (conf6=1)AND (conf7=1)AND (conf8=1)AND (conf9=1)AND (conf10=1)) AND (success>=resultamount);
  if exportchoice <> 1 then
  begin
  writeln(shape);
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
  writeln('Triplets (triangles), resulting from the placement: ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve,', ',TRthirteen,', ',TRfourteen,', ',TRfifteen,', ',TRsixteen,', ',TRseventeen,', ',TReighteen,', ',TRnineteen,', ',TRtwenty);
  if count19=1 then writeln('Wrong triplet - ',wrong);
  writeln('');
  writeln('Refer to dodecahedron.png for hexiamond placement (on which number''s location stands each hexiamond).');
  end;
  if exportchoice = 1 then
  begin
  writeln(shape);
  writeln('');
  writeln('Exported ',resultamount,' solutions to ',filename,'.');
  end;
  writeln('Press <ENTER> to exit.');
  readln;
  end
  else if choice = 5 then
  begin
  Repeat
  if (error2=12) OR (FirstStart=1) then //1
  Repeat
  firststart:=0;
  error2:=0;
    Repeat
      Conf1:=0;
  ein:=Random(12)+1;
  zwei:=Random(12)+1;
  zwolf:=Random(12)+1;
  until (ein <> zwei) AND (ein <> zwolf) AND (zwei <> ein) AND (zwei <> zwolf) AND (zwolf <> ein) AND (zwolf <> zwei);
  letterassign(ein,odin);
  letterassign(zwei,dva);
  letterassign(zwolf,dvenadsat);
  alphabetSort(ein,zwei,zwolf,odin,dva,dvenadsat,TROne);
      for U:=1 to combinationnumber do
    begin
      if (TRone = WordsArray[U]) then
    conf1:=conf1+1;
    end;
  drei:=0;
  until (Conf1=1);
  if ((Conf1=1) OR (error3=12)) AND (Error2 <12) then //2
  Repeat
  conf2part:=0;
  conf2:=0;
  inc(drei);
  if (drei <> ein) AND (drei <> zwei) AND (drei <> zwolf) AND (drei<13) then
  begin
  letterassign(drei,tri);
  alphabetSort(ein,drei,zwei,odin,tri,dva,TRtwo);
  for U:=1 to combinationnumber do
  begin
  if (TRtwo = WordsArray[U]) then
  conf2:=conf2+1;
  end;
  if conf2<>1 then inc(error2);
  end
  else inc(error2);
  vier:=0;
  error3:=0;
  until (Conf2=1) OR (Error2=12);
    if ((Conf2=1) OR (error4=12)) AND (Error3 <12) then //3
  Repeat
  conf3:=0;
  inc(vier);
  if (vier <> ein) AND (vier <> zwei) AND (vier <> zwolf) AND (vier <> drei) AND (vier<13) then
  begin
  letterassign(vier,chetire);
  alphabetSort(vier,drei,zwei,chetire,tri,dva,TRthree);
  for U:=1 to combinationnumber do
  begin
  if (TRthree = WordsArray[U]) then
  conf3:=conf3+1;
  end;
  if conf3<>1 then inc(error3);
  end
  else inc(error3);
  funf:=0;
  error4:=0;
  until (Conf3=1) OR (Error3=12);
      if ((Conf3=1) OR (error5=12)) AND (Error4 <12) then //4
  Repeat
  conf4:=0;
  inc(funf);
  if (funf <> ein) AND (funf <> zwei) AND (funf <> zwolf) AND (funf <> drei) AND (funf <> vier) AND (funf<13) then
  begin
  letterassign(funf,pyat);
  alphabetSort(funf,drei,vier,pyat,tri,chetire,TRfour);
  for U:=1 to combinationnumber do
  begin
  if (TRfour = WordsArray[U]) then
  conf4:=conf4+1;
  end;
  if conf4<>1 then inc(error4);
  end
  else inc(error4);
  sechs:=0;
  error5:=0;
  until (Conf4=1) OR (Error4=12);
      if ((Conf4=1) OR (error6=12))AND (Error5 <12) then //5
  Repeat
  conf5:=0;
  inc(sechs);
  if (sechs <> ein) AND (sechs <> zwei) AND (sechs <> zwolf) AND (sechs <> drei) AND (sechs <> vier) AND (sechs <> funf) AND (sechs<13) then
  begin
  letterassign(sechs,shest);
  alphabetSort(funf,sechs,vier,pyat,shest,chetire,TRfive);
  for U:=1 to combinationnumber do
  begin
  if (TRfive = WordsArray[U]) then
  conf5:=conf5+1;
  end;
  if conf5<>1 then inc(error5);
  end
  else inc(error5);
  sieben:=0;
  error6:=0;
  until (Conf5=1) OR (Error5=12);
        if ((Conf5=1) OR (error7=12)) AND (Error6 <12) then //6
  Repeat
  conf6:=0;
  inc(sieben);
  if (sieben <> ein) AND (sieben <> zwei) AND (sieben <> zwolf) AND (sieben <> drei) AND (sieben <> vier) AND (sieben <> funf) AND (sieben <> sechs) AND (sieben<13) then
  begin
  letterassign(sieben,semj);
  alphabetSort(funf,sechs,sieben,pyat,shest,semj,TRsix);
  for U:=1 to combinationnumber do
  begin
  if (TRsix = WordsArray[U]) then
  conf6:=conf6+1;
  end;
  if conf6<>1 then inc(error6);
  end
  else inc(error6);
  acht:=0;
  error7:=0;
  until (Conf6=1) OR (Error6=12);
          if ((Conf6=1) OR (error8=12)) AND (Error7 <12) then //7
  Repeat
  conf7:=0;
  inc(acht);
  if (acht <> ein) AND (acht <> zwei) AND (acht <> zwolf) AND (acht <> drei) AND (acht <> vier) AND (acht <> funf) AND (acht <> sechs) AND (acht <> sieben) AND (acht<13) then
  begin
  letterassign(acht,vosemj);
  alphabetSort(acht,sechs,sieben,vosemj,shest,semj,TRseven);
  for U:=1 to combinationnumber do
  begin
  if (TRseven = WordsArray[U]) then
  conf7:=conf7+1;
  end;
  if conf7<>1 then inc(error7);
  end
  else inc(error7);
  neun:=0;
  error8:=0;
  until (Conf7=1) OR (Error7=12);
            if ((Conf7=1) OR (error9=12)) AND (Error8 <12) then //8
  Repeat
  conf8:=0;
  inc(neun);
  if (neun <> ein) AND (neun <> zwei) AND (neun <> zwolf) AND (neun <> drei) AND (neun <> vier) AND (neun <> funf) AND (neun <> sechs) AND (neun <> sieben) AND (neun <> acht) AND (neun<13) then
  begin
  letterassign(neun,devyat);
  alphabetSort(acht,neun,sieben,vosemj,devyat,semj,TReight);
  for U:=1 to combinationnumber do
  begin
  if (TReight = WordsArray[U]) then
  conf8:=conf8+1;
  end;
  if conf8<>1 then inc(error8);
  end
  else inc(error8);
  zehn:=0;
  error9:=0;
  until (Conf8=1) OR (Error8=12);
              if ((Conf8=1) OR (error10>=12))AND (Error9 <12) then //9
  Repeat
  conf9:=0;
  inc(zehn);
  if (zehn <> ein) AND (zehn <> zwei) AND (zehn <> zwolf) AND (zehn <> drei) AND (zehn <> vier) AND (zehn <> funf) AND (zehn <> sechs) AND (zehn <> sieben) AND (zehn <> acht) AND (zehn <> neun) AND (zehn<13) then
  begin
  letterassign(zehn,desyat);
  alphabetSort(acht,neun,zehn,vosemj,devyat,desyat,TRnine);
  for U:=1 to combinationnumber do
  begin
  if (TRnine = WordsArray[U]) then
  conf9:=conf9+1;
  end;
  if conf9<>1 then inc(error9);
  end
  else inc(error9);
  elf:=0;
  error10:=0;
  until (Conf9=1) OR (Error9=12);
                if (Conf9=1) AND (Error10 <12) then //10
  Repeat
  conf10:=0;
  conf10part:=0;
  inc(elf);
  if (elf <> ein) AND (elf <> zwei) AND (elf <> zwolf) AND (elf <> drei) AND (elf <> vier) AND (elf <> funf) AND (elf <> sechs) AND (elf <> sieben) AND (elf <> acht) AND (elf <> neun) AND (elf <> zehn) AND (elf<13) then
  begin
  letterassign(elf,odinnatsat);
  alphabetSort(elf,neun,zehn,odinnatsat,devyat,desyat,TRten);
  alphabetSort(zehn,elf,zwolf,desyat,odinnatsat,dvenadsat,TReleven);
  alphabetSort(elf,zwolf,ein,odinnatsat,dvenadsat,odin,TRtwelve);
  for U:=1 to combinationnumber do
  begin
  if (TRten = WordsArray[U]) then
  inc(conf10part);
    if (TReleven = WordsArray[U]) then
  inc(conf10part);
    if (TRtwelve = WordsArray[U]) then
  inc(conf10part);
  end;
  if conf10part = 3 then conf10:=1
  else inc(error10);
  end
  else inc(error10);
  until (Conf10 = 1) OR (Error10 = 12);
if ((Conf1 =1) AND (conf2=1) AND (conf3=1) AND (conf4=1)AND (conf5=1)AND (conf6=1)AND (conf7=1)AND (conf8=1)AND (conf9=1)AND (conf10=1)) AND (exportchoice=1) then
begin
Append(exportfive);
writeln(exportfive,odin,', ',dva,', ',tri,', ',chetire,', ',pyat,', ',shest,', ',semj,', ',vosemj,', ',devyat,', ',desyat,', ',odinnatsat,', ',dvenadsat,' = ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve);
Close(exportfive);
inc(success);
end
else if ((Conf1 =1) AND (conf2=1) AND (conf3=1) AND (conf4=1)AND (conf5=1)AND (conf6=1)AND (conf7=1)AND (conf8=1)AND (conf9=1)AND (conf10=1)) AND (exportchoice<>1) then
success:=resultamount;
until ((Conf1 =1) AND (conf2=1) AND (conf3=1) AND (conf4=1)AND (conf5=1)AND (conf6=1)AND (conf7=1)AND (conf8=1)AND (conf9=1)AND (conf10=1)) AND (success>=resultamount);
if exportchoice <> 1 then
begin
writeln(shape);
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
writeln('Triplets (triangles), resulting from the placement: ',TRone,', ',TRtwo,', ',TRthree,', ',TRfour,', ',TRfive,', ',TRsix,', ',TRseven,', ',TReight,', ',TRnine,', ',TRten,', ',TReleven,', ',TRtwelve);
writeln('');
writeln('Refer to circle.png for hexiamond placement (on which number''s location stands each hexiamond).');
end;
if exportchoice = 1 then
begin
writeln(shape);
writeln('');
writeln('Exported ',resultamount,' solutions to ',filename,'.');
end;
writeln('Press <ENTER> to exit.');
readln;
  end;
end.
