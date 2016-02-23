program hexgen;
uses crt; //required for ClrScr
var ein,zwei,drei,vier,funf,sechs,sieben,acht,neun,zehn,elf,zwolf,success,nn,I:Integer; //Numbers in German - assigned to letters
var odin,dva,tri,chetire,pyat,shest,semj,vosemj,devyat,desyat,odinnatsat,dvenadsat:String; //Numbers in Russian - assigned to randomly generated numbers
var TRone,TRtwo,TRthree,TRfour,TRfive,TRsix,TRseven,TReight,TRnine,TRten,TReleven,TRtwelve,TRthirteen,TRfourteen,TRfifteen,TRsixteen,TRseventeen,TReighteen,TRnineteen,TRtwenty:String; //Those represent each hexiamond triplet. TR-TRiangle
const combinationnumber=103; //That's the amount of hexiamond combinations we have found so far.
var WordsArray: Array [1..combinationnumber] of String; //Combination array
var u,correct:Integer; //used for array checking, checking the amount of correct combinations
var choice,exportchoice,resultamount:Integer; //user choices
var expo:String; //file name
var delaynumber,q,w,e,r,t,y,uu,ii,o,p,a,s,d,f,g,h,j,k,l,z:Integer; //combination result counter
var combinations:text; //the variable that's assigned to the text file combinations.txt
var exportone,exporttwo,exportthree,exportfour,exportfive:text; //variables assigned to their text files for exporting results.
var count18andor19:Integer; //just like in the name, it means 18 and 19 might also be counted
begin
  Randomize;
  q:=0;w:=0;e:=0;r:=0;t:=0;y:=0;uu:=0;ii:=0;o:=0;p:=0;a:=0;s:=0;d:=0;f:=0;g:=0;h:=0;j:=0;k:=0;l:=0;z:=0;success:=0;
  delaynumber:=5;
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
  writeln('Hexiamond Placement Generator, version 5.1' );
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
  1:expo:='export1.txt';
  2:expo:='export2.txt';
  3:expo:='export3.txt';
  4:expo:='export4.txt';
  5:expo:='export5.txt';
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
  writeln('OK, exporting ',resultamount,' solutions to ',expo,'!');
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
  case ein of
  1:odin:='A';
  2:odin:='C';
  3:odin:='H';
  4:odin:='I';
  5:odin:='J';
  6:odin:='M';
  7:odin:='O';
  8:odin:='P';
  9:odin:='S';
  10:odin:='V';
  11:odin:='X';
  12:odin:='Y';
  end;
  case zwei of
  1:dva:='A';
  2:dva:='C';
  3:dva:='H';
  4:dva:='I';
  5:dva:='J';
  6:dva:='M';
  7:dva:='O';
  8:dva:='P';
  9:dva:='S';
  10:dva:='V';
  11:dva:='X';
  12:dva:='Y';
  end;
  case drei of
    1:tri:='A';
  2:tri:='C';
  3:tri:='H';
  4:tri:='I';
  5:tri:='J';
  6:tri:='M';
  7:tri:='O';
  8:tri:='P';
  9:tri:='S';
  10:tri:='V';
  11:tri:='X';
  12:tri:='Y';
  end;
  case vier of
    1:chetire:='A';
  2:chetire:='C';
  3:chetire:='H';
  4:chetire:='I';
  5:chetire:='J';
  6:chetire:='M';
  7:chetire:='O';
  8:chetire:='P';
  9:chetire:='S';
  10:chetire:='V';
  11:chetire:='X';
  12:chetire:='Y';
  end;
  if (choice > 1) then
  begin
  case funf of
    1:pyat:='A';
  2:pyat:='C';
  3:pyat:='H';
  4:pyat:='I';
  5:pyat:='J';
  6:pyat:='M';
  7:pyat:='O';
  8:pyat:='P';
  9:pyat:='S';
  10:pyat:='V';
  11:pyat:='X';
  12:pyat:='Y';
  end;
  case sechs of
    1:shest:='A';
  2:shest:='C';
  3:shest:='H';
  4:shest:='I';
  5:shest:='J';
  6:shest:='M';
  7:shest:='O';
  8:shest:='P';
  9:shest:='S';
  10:shest:='V';
  11:shest:='X';
  12:shest:='Y';
  end;
  if (choice > 2) then
    case sieben of
    1:semj:='A';
  2:semj:='C';
  3:semj:='H';
  4:semj:='I';
  5:semj:='J';
  6:semj:='M';
  7:semj:='O';
  8:semj:='P';
  9:semj:='S';
  10:semj:='V';
  11:semj:='X';
  12:semj:='Y';
  end;
    case acht of
    1:vosemj:='A';
  2:vosemj:='C';
  3:vosemj:='H';
  4:vosemj:='I';
  5:vosemj:='J';
  6:vosemj:='M';
  7:vosemj:='O';
  8:vosemj:='P';
  9:vosemj:='S';
  10:vosemj:='V';
  11:vosemj:='X';
  12:vosemj:='Y';
  end;
      case neun of
    1:devyat:='A';
  2:devyat:='C';
  3:devyat:='H';
  4:devyat:='I';
  5:devyat:='J';
  6:devyat:='M';
  7:devyat:='O';
  8:devyat:='P';
  9:devyat:='S';
  10:devyat:='V';
  11:devyat:='X';
  12:devyat:='Y';
  end;
     case zehn of
    1:desyat:='A';
  2:desyat:='C';
  3:desyat:='H';
  4:desyat:='I';
  5:desyat:='J';
  6:desyat:='M';
  7:desyat:='O';
  8:desyat:='P';
  9:desyat:='S';
  10:desyat:='V';
  11:desyat:='X';
  12:desyat:='Y';
  end;
       case elf of
    1:odinnatsat:='A';
  2:odinnatsat:='C';
  3:odinnatsat:='H';
  4:odinnatsat:='I';
  5:odinnatsat:='J';
  6:odinnatsat:='M';
  7:odinnatsat:='O';
  8:odinnatsat:='P';
  9:odinnatsat:='S';
  10:odinnatsat:='V';
  11:odinnatsat:='X';
  12:odinnatsat:='Y';
  end;
       case zwolf of
         1:dvenadsat:='A';
       2:dvenadsat:='C';
       3:dvenadsat:='H';
       4:dvenadsat:='I';
       5:dvenadsat:='J';
       6:dvenadsat:='M';
       7:dvenadsat:='O';
       8:dvenadsat:='P';
       9:dvenadsat:='S';
       10:dvenadsat:='V';
       11:dvenadsat:='X';
       12:dvenadsat:='Y';
       end;
  end;
  if choice = 1 then                       //alphabet sort
  begin
  if (ein < zwei) AND (zwei < drei) then
  TRone:=(odin+dva+tri)
  else if (ein < drei) AND (drei < zwei) then
  TRone:=(odin+tri+dva)
  else if (zwei < ein) AND (ein < drei) then
  TRone:=(dva+odin+tri)
  else if (zwei < drei) AND (drei < ein) then
  TRone:=(dva+tri+odin)
  else if (drei < zwei) AND (zwei < ein) then
  TRone:=(tri+dva+odin)
  else if (drei < ein) AND (ein < zwei) then
  TRone:=(tri+odin+dva);
    if (ein < zwei) AND (zwei < vier) then
  TRtwo:=(odin+dva+chetire)
  else if (ein < vier) AND (vier < zwei) then
  TRtwo:=(odin+chetire+dva)
  else if (zwei < ein) AND (ein < vier) then
  TRtwo:=(dva+odin+chetire)
  else if (zwei < vier) AND (vier < ein) then
  TRtwo:=(dva+chetire+odin)
  else if (vier < zwei) AND (zwei < ein) then
  TRtwo:=(chetire+dva+odin)
  else if (vier < ein) AND (ein < zwei) then
  TRtwo:=(chetire+odin+dva);
      if (ein < drei) AND (drei < vier) then
  TRthree:=(odin+tri+chetire)
  else if (ein < vier) AND (vier < drei) then
  TRthree:=(odin+chetire+tri)
  else if (drei < ein) AND (ein < vier) then
  TRthree:=(tri+odin+chetire)
  else if (drei < vier) AND (vier < ein) then
  TRthree:=(tri+chetire+odin)
  else if (vier < drei) AND (drei < ein) then
  TRthree:=(chetire+tri+odin)
  else if (vier < ein) AND (ein < drei) then
  TRthree:=(chetire+odin+tri);
        if (zwei < drei) AND (drei < vier) then
  TRfour:=(dva+tri+chetire)
  else if (zwei < vier) AND (vier < drei) then
  TRfour:=(dva+chetire+tri)
  else if (drei < zwei) AND (zwei < vier) then
  TRfour:=(tri+dva+chetire)
  else if (drei < vier) AND (vier < zwei) then
  TRfour:=(tri+chetire+dva)
  else if (vier < drei) AND (drei < zwei) then
  TRfour:=(chetire+tri+dva)
  else if (vier < zwei) AND (zwei < drei) then
  TRfour:=(chetire+dva+tri);
  end
  else if (choice = 2) then
  begin
  if (ein<zwei) AND (zwei<funf) then
  TRone:=(odin+dva+pyat)
  else if (ein < funf) AND (funf < zwei) then
  TRone:=(odin+pyat+dva)
  else if (zwei < ein) AND (ein < funf) then
  TRone:=(dva+odin+pyat)
  else if (zwei < funf) AND (funf < ein) then
  TRone:=(dva+pyat+odin)
  else if (funf < ein) AND (ein < zwei) then
  TRone:=(pyat+odin+dva)
  else if (funf < zwei) AND (zwei < ein) then
  TRone:=(pyat+dva+odin);
     if (ein<vier) AND (vier<funf) then
  TRtwo:=(odin+chetire+pyat)
  else if (ein < funf) AND (funf < vier) then
  TRtwo:=(odin+pyat+chetire)
  else if (vier < ein) AND (ein < funf) then
  TRtwo:=(chetire+odin+pyat)
  else if (vier < funf) AND (funf < ein) then
  TRtwo:=(chetire+pyat+odin)
  else if (funf < ein) AND (ein < vier) then
  TRtwo:=(pyat+odin+chetire)
  else if (funf < vier) AND (vier < ein) then
  TRtwo:=(pyat+chetire+odin);
    if (ein<vier) AND (vier<sechs) then
  TRthree:=(odin+chetire+shest)
  else if (ein < sechs) AND (sechs < vier) then
  TRthree:=(odin+shest+chetire)
  else if (vier < ein) AND (ein < sechs) then
  TRthree:=(chetire+odin+shest)
  else if (vier < sechs) AND (sechs < ein) then
  TRthree:=(chetire+shest+odin)
  else if (sechs < ein) AND (ein < vier) then
  TRthree:=(shest+odin+chetire)
  else if (sechs < vier) AND (vier < ein) then
  TRthree:=(shest+chetire+odin);
  if (ein<zwei) AND (zwei<sechs) then
  TRfour:=(odin+dva+shest)
  else if (ein < sechs) AND (sechs < zwei) then
  TRfour:=(odin+shest+dva)
  else if (zwei < ein) AND (ein < sechs) then
  TRfour:=(dva+odin+shest)
  else if (zwei < sechs) AND (sechs < ein) then
  TRfour:=(dva+shest+odin)
  else if (sechs < ein) AND (ein < zwei) then
  TRfour:=(shest+odin+dva)
  else if (sechs < zwei) AND (zwei < ein) then
  TRfour:=(shest+dva+odin);
    if (drei<zwei) AND (zwei<funf) then
  TRfive:=(tri+dva+pyat)
  else if (drei < funf) AND (funf < zwei) then
  TRfive:=(tri+pyat+dva)
  else if (zwei < drei) AND (drei < funf) then
  TRfive:=(dva+tri+pyat)
  else if (zwei < funf) AND (funf < drei) then
  TRfive:=(dva+pyat+tri)
  else if (funf < drei) AND (drei < zwei) then
  TRfive:=(pyat+tri+dva)
  else if (funf < zwei) AND (zwei < drei) then
  TRfive:=(pyat+dva+tri);
     if (drei<vier) AND (vier<funf) then
  TRsix:=(tri+chetire+pyat)
  else if (drei < funf) AND (funf < vier) then
  TRsix:=(tri+pyat+chetire)
  else if (vier < drei) AND (drei < funf) then
  TRsix:=(chetire+tri+pyat)
  else if (vier < funf) AND (funf < drei) then
  TRsix:=(chetire+pyat+tri)
  else if (funf < drei) AND (drei < vier) then
  TRsix:=(pyat+tri+chetire)
  else if (funf < vier) AND (vier < drei) then
  TRsix:=(pyat+chetire+tri);
    if (drei<vier) AND (vier<sechs) then
  TRseven:=(tri+chetire+shest)
  else if (drei < sechs) AND (sechs < vier) then
  TRseven:=(tri+shest+chetire)
  else if (vier < drei) AND (drei < sechs) then
  TRseven:=(chetire+tri+shest)
  else if (vier < sechs) AND (sechs < drei) then
  TRseven:=(chetire+shest+tri)
  else if (sechs < drei) AND (drei < vier) then
  TRseven:=(shest+tri+chetire)
  else if (sechs < vier) AND (vier < drei) then
  TRseven:=(shest+chetire+tri);
    if (drei<zwei) AND (zwei<sechs) then
  TReight:=(tri+dva+shest)
  else if (drei < sechs) AND (sechs < zwei) then
  TReight:=(tri+shest+dva)
  else if (zwei < drei) AND (drei < sechs) then
  TReight:=(dva+tri+shest)
  else if (zwei < sechs) AND (sechs < drei) then
  TReight:=(dva+shest+tri)
  else if (sechs < drei) AND (drei < zwei) then
  TReight:=(shest+tri+dva)
  else if (sechs < zwei) AND (zwei < drei) then
  TReight:=(shest+dva+tri);
  end
    else if choice = 3 then
  begin
  if (ein < zwei) AND (zwei < drei) then
  TRone:=(odin+dva+tri)
  else if (ein < drei) AND (drei < zwei) then
  TRone:=(odin+tri+dva)
  else if (zwei < ein) AND (ein < drei) then
  TRone:=(dva+odin+tri)
  else if (zwei < drei) AND (drei < ein) then
  TRone:=(dva+tri+odin)
  else if (drei < zwei) AND (zwei < ein) then
  TRone:=(tri+dva+odin)
  else if (drei < ein) AND (ein < zwei) then
  TRone:=(tri+odin+dva);
    if (ein < zwei) AND (zwei < neun) then
  TRtwo:=(odin+dva+devyat)
  else if (ein < neun) AND (neun < zwei) then
  TRtwo:=(odin+devyat+dva)
  else if (zwei < ein) AND (ein < neun) then
  TRtwo:=(dva+odin+devyat)
  else if (zwei < neun) AND (neun < ein) then
  TRtwo:=(dva+devyat+odin)
  else if (neun < zwei) AND (zwei < ein) then
  TRtwo:=(devyat+dva+odin)
  else if (neun < ein) AND (ein < zwei) then
  TRtwo:=(devyat+odin+dva);
    if (ein < sieben) AND (sieben < neun) then
  TRthree:=(odin+semj+devyat)
  else if (ein < neun) AND (neun < sieben) then
  TRthree:=(odin+devyat+semj)
  else if (sieben < ein) AND (ein < neun) then
  TRthree:=(semj+odin+devyat)
  else if (sieben < neun) AND (neun < ein) then
  TRthree:=(semj+devyat+odin)
  else if (neun < sieben) AND (sieben < ein) then
  TRthree:=(devyat+semj+odin)
  else if (neun < ein) AND (ein < sieben) then
  TRthree:=(devyat+odin+semj);
      if (ein < sieben) AND (sieben < sechs) then
  TRfour:=(odin+semj+shest)
  else if (ein < sechs) AND (sechs < sieben) then
  TRfour:=(odin+shest+semj)
  else if (sieben < ein) AND (ein < sechs) then
  TRfour:=(semj+odin+shest)
  else if (sieben < sechs) AND (sechs < ein) then
  TRfour:=(semj+shest+odin)
  else if (sechs < sieben) AND (sieben < ein) then
  TRfour:=(shest+semj+odin)
  else if (sechs < ein) AND (ein < sieben) then
  TRfour:=(shest+odin+semj);
      if (ein < drei) AND (drei < sechs) then
  TRfive:=(odin+tri+shest)
  else if (ein < sechs) AND (sechs < drei) then
  TRfive:=(odin+shest+tri)
  else if (drei < ein) AND (ein < sechs) then
  TRfive:=(tri+odin+shest)
  else if (drei < sechs) AND (sechs < ein) then
  TRfive:=(tri+shest+odin)
  else if (sechs < drei) AND (drei < ein) then
  TRfive:=(shest+tri+odin)
  else if (sechs < ein) AND (ein < drei) then
  TRfive:=(shest+odin+tri);
      if (funf < drei) AND (drei < sechs) then
  TRsix:=(pyat+tri+shest)
  else if (funf < sechs) AND (sechs < drei) then
  TRsix:=(pyat+shest+tri)
  else if (drei < funf) AND (funf < sechs) then
  TRsix:=(tri+pyat+shest)
  else if (drei < sechs) AND (sechs < funf) then
  TRsix:=(tri+shest+pyat)
  else if (sechs < drei) AND (drei < funf) then
  TRsix:=(shest+tri+pyat)
  else if (sechs < funf) AND (funf < drei) then
  TRsix:=(shest+pyat+tri);
      if (funf < zwolf) AND (zwolf < sechs) then
  TRseven:=(pyat+dvenadsat+shest)
  else if (funf < sechs) AND (sechs < zwolf) then
  TRseven:=(pyat+shest+dvenadsat)
  else if (zwolf < funf) AND (funf < sechs) then
  TRseven:=(dvenadsat+pyat+shest)
  else if (zwolf < sechs) AND (sechs < funf) then
  TRseven:=(dvenadsat+shest+pyat)
  else if (sechs < zwolf) AND (zwolf < funf) then
  TRseven:=(shest+dvenadsat+pyat)
  else if (sechs < funf) AND (funf < zwolf) then
  TRseven:=(shest+pyat+dvenadsat);
      if (sieben < zwolf) AND (zwolf < sechs) then
  TReight:=(semj+dvenadsat+shest)
  else if (sieben < sechs) AND (sechs < zwolf) then
  TReight:=(semj+shest+dvenadsat)
  else if (zwolf < sieben) AND (sieben < sechs) then
  TReight:=(dvenadsat+semj+shest)
  else if (zwolf < sechs) AND (sechs < sieben) then
  TReight:=(dvenadsat+shest+semj)
  else if (sechs < zwolf) AND (zwolf < sieben) then
  TReight:=(shest+dvenadsat+semj)
  else if (sechs < sieben) AND (sieben < zwolf) then
  TReight:=(shest+semj+dvenadsat);
          if (sieben < zwolf) AND (zwolf < acht) then
  TRnine:=(semj+dvenadsat+vosemj)
  else if (sieben < acht) AND (acht < zwolf) then
  TRnine:=(semj+vosemj+dvenadsat)
  else if (zwolf < sieben) AND (sieben < acht) then
  TRnine:=(dvenadsat+semj+vosemj)
  else if (zwolf < acht) AND (acht < sieben) then
  TRnine:=(dvenadsat+vosemj+semj)
  else if (acht < zwolf) AND (zwolf < sieben) then
  TRnine:=(vosemj+dvenadsat+semj)
  else if (acht < sieben) AND (sieben < zwolf) then
  TRnine:=(vosemj+semj+dvenadsat);
          if (sieben < neun) AND (neun < acht) then
  TRten:=(semj+devyat+vosemj)
  else if (sieben < acht) AND (acht < neun) then
  TRten:=(semj+vosemj+devyat)
  else if (neun < sieben) AND (sieben < acht) then
  TRten:=(devyat+semj+vosemj)
  else if (neun < acht) AND (acht < sieben) then
  TRten:=(devyat+vosemj+semj)
  else if (acht < neun) AND (neun < sieben) then
  TRten:=(vosemj+devyat+semj)
  else if (acht < sieben) AND (sieben < neun) then
  TRten:=(vosemj+semj+devyat);
          if (zehn < neun) AND (neun < acht) then
  TReleven:=(desyat+devyat+vosemj)
  else if (zehn < acht) AND (acht < neun) then
  TReleven:=(desyat+vosemj+devyat)
  else if (neun < zehn) AND (zehn < acht) then
  TReleven:=(devyat+desyat+vosemj)
  else if (neun < acht) AND (acht < zehn) then
  TReleven:=(devyat+vosemj+desyat)
  else if (acht < neun) AND (neun < zehn) then
  TReleven:=(vosemj+devyat+desyat)
  else if (acht < zehn) AND (zehn < neun) then
  TReleven:=(vosemj+desyat+devyat);
          if (zehn < neun) AND (neun < zwei) then
  TRtwelve:=(desyat+devyat+dva)
  else if (zehn < zwei) AND (zwei < neun) then
  TRtwelve:=(desyat+dva+devyat)
  else if (neun < zehn) AND (zehn < zwei) then
  TRtwelve:=(devyat+desyat+dva)
  else if (neun < zwei) AND (zwei < zehn) then
  TRtwelve:=(devyat+dva+desyat)
  else if (zwei < neun) AND (neun < zehn) then
  TRtwelve:=(dva+devyat+desyat)
  else if (zwei < zehn) AND (zehn < neun) then
  TRtwelve:=(dva+desyat+devyat);
          if (zehn < vier) AND (vier < zwei) then
  TRthirteen:=(desyat+chetire+dva)
  else if (zehn < zwei) AND (zwei < vier) then
  TRthirteen:=(desyat+dva+chetire)
  else if (vier < zehn) AND (zehn < zwei) then
  TRthirteen:=(chetire+desyat+dva)
  else if (vier < zwei) AND (zwei < zehn) then
  TRthirteen:=(chetire+dva+desyat)
  else if (zwei < vier) AND (vier < zehn) then
  TRthirteen:=(dva+chetire+desyat)
  else if (zwei < zehn) AND (zehn < vier) then
  TRthirteen:=(dva+desyat+chetire);
          if (zehn < vier) AND (vier < elf) then
  TRfourteen:=(desyat+chetire+odinnatsat)
  else if (zehn < elf) AND (elf < vier) then
  TRfourteen:=(desyat+odinnatsat+chetire)
  else if (vier < zehn) AND (zehn < elf) then
  TRfourteen:=(chetire+desyat+odinnatsat)
  else if (vier < elf) AND (elf < zehn) then
  TRfourteen:=(chetire+odinnatsat+desyat)
  else if (elf < vier) AND (vier < zehn) then
  TRfourteen:=(odinnatsat+chetire+desyat)
  else if (elf < zehn) AND (zehn < vier) then
  TRfourteen:=(odinnatsat+desyat+chetire);
          if (zehn < acht) AND (acht < elf) then
  TRfifteen:=(desyat+vosemj+odinnatsat)
  else if (zehn < elf) AND (elf < acht) then
  TRfifteen:=(desyat+odinnatsat+vosemj)
  else if (acht < zehn) AND (zehn < elf) then
  TRfifteen:=(vosemj+desyat+odinnatsat)
  else if (acht < elf) AND (elf < zehn) then
  TRfifteen:=(vosemj+odinnatsat+desyat)
  else if (elf < acht) AND (acht < zehn) then
  TRfifteen:=(odinnatsat+vosemj+desyat)
  else if (elf < zehn) AND (zehn < acht) then
  TRfifteen:=(odinnatsat+desyat+vosemj);
            if (zwolf < acht) AND (acht < elf) then
  TRsixteen:=(dvenadsat+vosemj+odinnatsat)
  else if (zwolf < elf) AND (elf < acht) then
  TRsixteen:=(dvenadsat+odinnatsat+vosemj)
  else if (acht < zwolf) AND (zwolf < elf) then
  TRsixteen:=(vosemj+dvenadsat+odinnatsat)
  else if (acht < elf) AND (elf < zwolf) then
  TRsixteen:=(vosemj+odinnatsat+dvenadsat)
  else if (elf < acht) AND (acht < zwolf) then
  TRsixteen:=(odinnatsat+vosemj+dvenadsat)
  else if (elf < zwolf) AND (zwolf < acht) then
  TRsixteen:=(odinnatsat+dvenadsat+vosemj);
            if (zwolf < funf) AND (funf < elf) then
  TRseventeen:=(dvenadsat+pyat+odinnatsat)
  else if (zwolf < elf) AND (elf < funf) then
  TRseventeen:=(dvenadsat+odinnatsat+pyat)
  else if (funf < zwolf) AND (zwolf < elf) then
  TRseventeen:=(pyat+dvenadsat+odinnatsat)
  else if (funf < elf) AND (elf < zwolf) then
  TRseventeen:=(pyat+odinnatsat+dvenadsat)
  else if (elf < funf) AND (funf < zwolf) then
  TRseventeen:=(odinnatsat+pyat+dvenadsat)
  else if (elf < zwolf) AND (zwolf < funf) then
  TRseventeen:=(odinnatsat+dvenadsat+pyat);
            if (vier < funf) AND (funf < elf) then
  TReighteen:=(chetire+pyat+odinnatsat)
  else if (vier < elf) AND (elf < funf) then
  TReighteen:=(chetire+odinnatsat+pyat)
  else if (funf < vier) AND (vier < elf) then
  TReighteen:=(pyat+chetire+odinnatsat)
  else if (funf < elf) AND (elf < vier) then
  TReighteen:=(pyat+odinnatsat+chetire)
  else if (elf < funf) AND (funf < vier) then
  TReighteen:=(odinnatsat+pyat+chetire)
  else if (elf < vier) AND (vier < funf) then
  TReighteen:=(odinnatsat+chetire+pyat);
            if (vier < funf) AND (funf < drei) then
  TRnineteen:=(chetire+pyat+tri)
  else if (vier < drei) AND (drei < funf) then
  TRnineteen:=(chetire+tri+pyat)
  else if (funf < vier) AND (vier < drei) then
  TRnineteen:=(pyat+chetire+tri)
  else if (funf < drei) AND (drei < vier) then
  TRnineteen:=(pyat+tri+chetire)
  else if (drei < funf) AND (funf < vier) then
  TRnineteen:=(tri+pyat+chetire)
  else if (drei < vier) AND (vier < funf) then
  TRnineteen:=(tri+chetire+pyat);
            if (vier < zwei) AND (zwei < drei) then
  TRtwenty:=(chetire+dva+tri)
  else if (vier < drei) AND (drei < zwei) then
  TRtwenty:=(chetire+tri+dva)
  else if (zwei < vier) AND (vier < drei) then
  TRtwenty:=(dva+chetire+tri)
  else if (zwei < drei) AND (drei < vier) then
  TRtwenty:=(dva+tri+chetire)
  else if (drei < zwei) AND (zwei < vier) then
  TRtwenty:=(tri+dva+chetire)
  else if (drei < vier) AND (vier < zwei) then
  TRtwenty:=(tri+chetire+dva);
  end
  else if choice = 4 then
  begin
  if (ein < zwei) AND (zwei < drei) then
  TRone:=(odin+dva+tri)
  else if (ein < drei) AND (drei < zwei) then
  TRone:=(odin+tri+dva)
  else if (zwei < ein) AND (ein < drei) then
  TRone:=(dva+odin+tri)
  else if (zwei < drei) AND (drei < ein) then
  TRone:=(dva+tri+odin)
  else if (drei < zwei) AND (zwei < ein) then
  TRone:=(tri+dva+odin)
  else if (drei < ein) AND (ein < zwei) then
  TRone:=(tri+odin+dva);
    if (ein < zwei) AND (zwei < sechs) then
  TRtwo:=(odin+dva+shest)
  else if (ein < sechs) AND (sechs < zwei) then
  TRtwo:=(odin+shest+dva)
  else if (zwei < ein) AND (ein < sechs) then
  TRtwo:=(dva+odin+shest)
  else if (zwei < sechs) AND (sechs < ein) then
  TRtwo:=(dva+shest+odin)
  else if (sechs < zwei) AND (zwei < ein) then
  TRtwo:=(shest+dva+odin)
  else if (sechs < ein) AND (ein < zwei) then
  TRtwo:=(shest+odin+dva);
    if (ein < funf) AND (funf < sechs) then
  TRthree:=(odin+pyat+shest)
  else if (ein < sechs) AND (sechs < funf) then
  TRthree:=(odin+shest+pyat)
  else if (funf < ein) AND (ein < sechs) then
  TRthree:=(pyat+odin+shest)
  else if (funf < sechs) AND (sechs < ein) then
  TRthree:=(pyat+shest+odin)
  else if (sechs < funf) AND (funf < ein) then
  TRthree:=(shest+pyat+odin)
  else if (sechs < ein) AND (ein < funf) then
  TRthree:=(shest+odin+pyat);
    if (ein < funf) AND (funf < vier) then
  TRfour:=(odin+pyat+chetire)
  else if (ein < vier) AND (vier < funf) then
  TRfour:=(odin+chetire+pyat)
  else if (funf < ein) AND (ein < vier) then
  TRfour:=(pyat+odin+chetire)
  else if (funf < vier) AND (vier < ein) then
  TRfour:=(pyat+chetire+odin)
  else if (vier < funf) AND (funf < ein) then
  TRfour:=(chetire+pyat+odin)
  else if (vier < ein) AND (ein < funf) then
  TRfour:=(chetire+odin+pyat);
    if (ein < drei) AND (drei < vier) then
  TRfive:=(odin+tri+chetire)
  else if (ein < vier) AND (vier < drei) then
  TRfive:=(odin+chetire+tri)
  else if (drei < ein) AND (ein < vier) then
  TRfive:=(tri+odin+chetire)
  else if (drei < vier) AND (vier < ein) then
  TRfive:=(tri+chetire+odin)
  else if (vier < drei) AND (drei < ein) then
  TRfive:=(chetire+tri+odin)
  else if (vier < ein) AND (ein < drei) then
  TRfive:=(chetire+odin+tri);
    if (zwolf < neun) AND (neun < zehn) then
  TRsix:=(dvenadsat+devyat+desyat)
  else if (zwolf < zehn) AND (zehn < neun) then
  TRsix:=(dvenadsat+desyat+devyat)
  else if (neun < zwolf) AND (zwolf < zehn) then
  TRsix:=(devyat+dvenadsat+desyat)
  else if (neun < zehn) AND (zehn < zwolf) then
  TRsix:=(devyat+desyat+dvenadsat)
  else if (zehn < neun) AND (neun < zwolf) then
  TRsix:=(desyat+devyat+dvenadsat)
  else if (zehn < zwolf) AND (zwolf < neun) then
  TRsix:=(desyat+dvenadsat+devyat);
    if (zwolf < elf) AND (elf < zehn) then
  TRseven:=(dvenadsat+odinnatsat+desyat)
  else if (zwolf < zehn) AND (zehn < elf) then
  TRseven:=(dvenadsat+desyat+odinnatsat)
  else if (elf < zwolf) AND (zwolf < zehn) then
  TRseven:=(odinnatsat+dvenadsat+desyat)
  else if (elf < zehn) AND (zehn < zwolf) then
  TRseven:=(odinnatsat+desyat+dvenadsat)
  else if (zehn < elf) AND (elf < zwolf) then
  TRseven:=(desyat+odinnatsat+dvenadsat)
  else if (zehn < zwolf) AND (zwolf < elf) then
  TRseven:=(desyat+dvenadsat+odinnatsat);
    if (zwolf < elf) AND (elf < sieben) then
  TReight:=(dvenadsat+odinnatsat+semj)
  else if (zwolf < sieben) AND (sieben < elf) then
  TReight:=(dvenadsat+semj+odinnatsat)
  else if (elf < zwolf) AND (zwolf < sieben) then
  TReight:=(odinnatsat+dvenadsat+semj)
  else if (elf < sieben) AND (sieben < zwolf) then
  TReight:=(odinnatsat+semj+dvenadsat)
  else if (sieben < elf) AND (elf < zwolf) then
  TReight:=(semj+odinnatsat+dvenadsat)
  else if (sieben < zwolf) AND (zwolf < elf) then
  TReight:=(semj+dvenadsat+odinnatsat);
    if (zwolf < acht) AND (acht < sieben) then
  TRnine:=(dvenadsat+vosemj+semj)
  else if (zwolf < sieben) AND (sieben < acht) then
  TRnine:=(dvenadsat+semj+vosemj)
  else if (acht < zwolf) AND (zwolf < sieben) then
  TRnine:=(vosemj+dvenadsat+semj)
  else if (acht < sieben) AND (sieben < zwolf) then
  TRnine:=(vosemj+semj+dvenadsat)
  else if (sieben < acht) AND (acht < zwolf) then
  TRnine:=(semj+vosemj+dvenadsat)
  else if (sieben < zwolf) AND (zwolf < acht) then
  TRnine:=(semj+dvenadsat+vosemj);
    if (zwolf < acht) AND (acht < neun) then
  TRten:=(dvenadsat+vosemj+devyat)
  else if (zwolf < neun) AND (neun < acht) then
  TRten:=(dvenadsat+devyat+vosemj)
  else if (acht < zwolf) AND (zwolf < neun) then
  TRten:=(vosemj+dvenadsat+devyat)
  else if (acht < neun) AND (neun < zwolf) then
  TRten:=(vosemj+devyat+dvenadsat)
  else if (neun < acht) AND (acht < zwolf) then
  TRten:=(devyat+vosemj+dvenadsat)
  else if (neun < zwolf) AND (zwolf < acht) then
  TRten:=(devyat+dvenadsat+vosemj);
      if (zwei < acht) AND (acht < neun) then
  TReleven:=(dva+vosemj+devyat)
  else if (zwei < neun) AND (neun < acht) then
  TReleven:=(dva+devyat+vosemj)
  else if (acht < zwei) AND (zwei < neun) then
  TReleven:=(vosemj+dva+devyat)
  else if (acht < neun) AND (neun < zwei) then
  TReleven:=(vosemj+devyat+dva)
  else if (neun < acht) AND (acht < zwei) then
  TReleven:=(devyat+vosemj+dva)
  else if (neun < zwei) AND (zwei < acht) then
  TReleven:=(devyat+dva+vosemj);
      if (zwei < drei) AND (drei < neun) then
  TRtwelve:=(dva+tri+devyat)
  else if (zwei < neun) AND (neun < drei) then
  TRtwelve:=(dva+devyat+tri)
  else if (drei < zwei) AND (zwei < neun) then
  TRtwelve:=(tri+dva+devyat)
  else if (drei < neun) AND (neun < zwei) then
  TRtwelve:=(tri+devyat+dva)
  else if (neun < drei) AND (drei < zwei) then
  TRtwelve:=(devyat+tri+dva)
  else if (neun < zwei) AND (zwei < drei) then
  TRtwelve:=(devyat+dva+tri);
      if (zehn < drei) AND (drei < neun) then
  TRthirteen:=(desyat+tri+devyat)
  else if (zehn < neun) AND (neun < drei) then
  TRthirteen:=(desyat+devyat+tri)
  else if (drei < zehn) AND (zehn < neun) then
  TRthirteen:=(tri+desyat+devyat)
  else if (drei < neun) AND (neun < zehn) then
  TRthirteen:=(tri+devyat+desyat)
  else if (neun < drei) AND (drei < zehn) then
  TRthirteen:=(devyat+tri+desyat)
  else if (neun < zehn) AND (zehn < drei) then
  TRthirteen:=(devyat+desyat+tri);
      if (zehn < drei) AND (drei < vier) then
  TRfourteen:=(desyat+tri+chetire)
  else if (zehn < vier) AND (vier < drei) then
  TRfourteen:=(desyat+chetire+tri)
  else if (drei < zehn) AND (zehn < vier) then
  TRfourteen:=(tri+desyat+chetire)
  else if (drei < vier) AND (vier < zehn) then
  TRfourteen:=(tri+chetire+desyat)
  else if (vier < drei) AND (drei < zehn) then
  TRfourteen:=(chetire+tri+desyat)
  else if (vier < zehn) AND (zehn < drei) then
  TRfourteen:=(chetire+desyat+tri);
      if (zehn < elf) AND (elf < vier) then
  TRfifteen:=(desyat+odinnatsat+chetire)
  else if (zehn < vier) AND (vier < elf) then
  TRfifteen:=(desyat+chetire+odinnatsat)
  else if (elf < zehn) AND (zehn < vier) then
  TRfifteen:=(odinnatsat+desyat+chetire)
  else if (elf < vier) AND (vier < zehn) then
  TRfifteen:=(odinnatsat+chetire+desyat)
  else if (vier < elf) AND (elf < zehn) then
  TRfifteen:=(chetire+odinnatsat+desyat)
  else if (vier < zehn) AND (zehn < elf) then
  TRfifteen:=(chetire+desyat+odinnatsat);
      if (funf < elf) AND (elf < vier) then
  TRsixteen:=(pyat+odinnatsat+chetire)
  else if (funf < vier) AND (vier < elf) then
  TRsixteen:=(pyat+chetire+odinnatsat)
  else if (elf < funf) AND (funf < vier) then
  TRsixteen:=(odinnatsat+pyat+chetire)
  else if (elf < vier) AND (vier < funf) then
  TRsixteen:=(odinnatsat+chetire+pyat)
  else if (vier < elf) AND (elf < funf) then
  TRsixteen:=(chetire+odinnatsat+pyat)
  else if (vier < funf) AND (funf < elf) then
  TRsixteen:=(chetire+pyat+odinnatsat);
      if (funf < elf) AND (elf < sieben) then
  TRseventeen:=(pyat+odinnatsat+semj)
  else if (funf < sieben) AND (sieben < elf) then
  TRseventeen:=(pyat+semj+odinnatsat)
  else if (elf < funf) AND (funf < sieben) then
  TRseventeen:=(odinnatsat+pyat+semj)
  else if (elf < sieben) AND (sieben < funf) then
  TRseventeen:=(odinnatsat+semj+pyat)
  else if (sieben < elf) AND (elf < funf) then
  TRseventeen:=(semj+odinnatsat+pyat)
  else if (sieben < funf) AND (funf < elf) then
  TRseventeen:=(semj+pyat+odinnatsat);
      if (funf < sechs) AND (sechs < sieben) then
  TReighteen:=(pyat+shest+semj)
  else if (funf < sieben) AND (sieben < sechs) then
  TReighteen:=(pyat+semj+shest)
  else if (sechs < funf) AND (funf < sieben) then
  TReighteen:=(shest+pyat+semj)
  else if (sechs < sieben) AND (sieben < funf) then
  TReighteen:=(shest+semj+pyat)
  else if (sieben < sechs) AND (sechs < funf) then
  TReighteen:=(semj+shest+pyat)
  else if (sieben < funf) AND (funf < sechs) then
  TReighteen:=(semj+pyat+shest);
      if (acht < sechs) AND (sechs < sieben) then
  TRnineteen:=(vosemj+shest+semj)
  else if (acht < sieben) AND (sieben < sechs) then
  TRnineteen:=(vosemj+semj+shest)
  else if (sechs < acht) AND (acht < sieben) then
  TRnineteen:=(shest+vosemj+semj)
  else if (sechs < sieben) AND (sieben < acht) then
  TRnineteen:=(shest+semj+vosemj)
  else if (sieben < sechs) AND (sechs < acht) then
  TRnineteen:=(semj+shest+vosemj)
  else if (sieben < acht) AND (acht < sechs) then
  TRnineteen:=(semj+vosemj+shest);
      if (acht < sechs) AND (sechs < zwei) then
  TRtwenty:=(vosemj+shest+dva)
  else if (acht < zwei) AND (zwei < sechs) then
  TRtwenty:=(vosemj+dva+shest)
  else if (sechs < acht) AND (acht < zwei) then
  TRtwenty:=(shest+vosemj+dva)
  else if (sechs < zwei) AND (zwei < acht) then
  TRtwenty:=(shest+dva+vosemj)
  else if (zwei < sechs) AND (sechs < acht) then
  TRtwenty:=(dva+shest+vosemj)
  else if (zwei < acht) AND (acht < sechs) then
  TRtwenty:=(dva+vosemj+shest);
  end
  else if choice = 5 then
  begin
     if (ein < zwei) AND (zwei < zwolf) then
  TRone:=(odin+dva+dvenadsat)
  else if (ein < zwolf) AND (zwolf < zwei) then
  TRone:=(odin+dvenadsat+dva)
  else if (zwei < ein) AND (ein < zwolf) then
  TRone:=(dva+odin+dvenadsat)
  else if (zwei < zwolf) AND (zwolf < ein) then
  TRone:=(dva+dvenadsat+odin)
  else if (zwolf < zwei) AND (zwei < ein) then
  TRone:=(dvenadsat+dva+odin)
  else if (zwolf < ein) AND (ein < zwei) then
  TRone:=(dvenadsat+odin+dva);
  if (ein < zwei) AND (zwei < drei) then
  TRtwo:=(odin+dva+tri)
  else if (ein < drei) AND (drei < zwei) then
  TRtwo:=(odin+tri+dva)
  else if (zwei < ein) AND (ein < drei) then
  TRtwo:=(dva+odin+tri)
  else if (zwei < drei) AND (drei < ein) then
  TRtwo:=(dva+tri+odin)
  else if (drei < zwei) AND (zwei < ein) then
  TRtwo:=(tri+dva+odin)
  else if (drei < ein) AND (ein < zwei) then
  TRtwo:=(tri+odin+dva);
    if (vier < zwei) AND (zwei < drei) then
  TRthree:=(chetire+dva+tri)
  else if (vier < drei) AND (drei < zwei) then
  TRthree:=(chetire+tri+dva)
  else if (zwei < vier) AND (vier < drei) then
  TRthree:=(dva+chetire+tri)
  else if (zwei < drei) AND (drei < vier) then
  TRthree:=(dva+tri+chetire)
  else if (drei < zwei) AND (zwei < vier) then
  TRthree:=(tri+dva+chetire)
  else if (drei < vier) AND (vier < zwei) then
  TRthree:=(tri+chetire+dva);
    if (vier < funf) AND (funf < drei) then
  TRfour:=(chetire+pyat+tri)
  else if (vier < drei) AND (drei < funf) then
  TRfour:=(chetire+tri+pyat)
  else if (funf < vier) AND (vier < drei) then
  TRfour:=(pyat+chetire+tri)
  else if (funf < drei) AND (drei < vier) then
  TRfour:=(pyat+tri+chetire)
  else if (drei < funf) AND (funf < vier) then
  TRfour:=(tri+pyat+chetire)
  else if (drei < vier) AND (vier < funf) then
  TRfour:=(tri+chetire+pyat);
    if (vier < funf) AND (funf < sechs) then
  TRfive:=(chetire+pyat+shest)
  else if (vier < sechs) AND (sechs < funf) then
  TRfive:=(chetire+shest+pyat)
  else if (funf < vier) AND (vier < sechs) then
  TRfive:=(pyat+chetire+shest)
  else if (funf < sechs) AND (sechs < vier) then
  TRfive:=(pyat+shest+chetire)
  else if (sechs < funf) AND (funf < vier) then
  TRfive:=(shest+pyat+chetire)
  else if (sechs < vier) AND (vier < funf) then
  TRfive:=(shest+chetire+pyat);
    if (sieben < funf) AND (funf < sechs) then
  TRsix:=(semj+pyat+shest)
  else if (sieben < sechs) AND (sechs < funf) then
  TRsix:=(semj+shest+pyat)
  else if (funf < sieben) AND (sieben < sechs) then
  TRsix:=(pyat+semj+shest)
  else if (funf < sechs) AND (sechs < sieben) then
  TRsix:=(pyat+shest+semj)
  else if (sechs < funf) AND (funf < sieben) then
  TRsix:=(shest+pyat+semj)
  else if (sechs < sieben) AND (sieben < funf) then
  TRsix:=(shest+semj+pyat);
    if (sieben < acht) AND (acht < sechs) then
  TRseven:=(semj+vosemj+shest)
  else if (sieben < sechs) AND (sechs < acht) then
  TRseven:=(semj+shest+vosemj)
  else if (acht < sieben) AND (sieben < sechs) then
  TRseven:=(vosemj+semj+shest)
  else if (acht < sechs) AND (sechs < sieben) then
  TRseven:=(vosemj+shest+semj)
  else if (sechs < acht) AND (acht < sieben) then
  TRseven:=(shest+vosemj+semj)
  else if (sechs < sieben) AND (sieben < acht) then
  TRseven:=(shest+semj+vosemj);
    if (sieben < acht) AND (acht < neun) then
  TReight:=(semj+vosemj+devyat)
  else if (sieben < neun) AND (neun < acht) then
  TReight:=(semj+devyat+vosemj)
  else if (acht < sieben) AND (sieben < neun) then
  TReight:=(vosemj+semj+devyat)
  else if (acht < neun) AND (neun < sieben) then
  TReight:=(vosemj+devyat+semj)
  else if (neun < acht) AND (acht < sieben) then
  TReight:=(devyat+vosemj+semj)
  else if (neun < sieben) AND (sieben < acht) then
  TReight:=(devyat+semj+vosemj);
    if (zehn < acht) AND (acht < neun) then
  TRnine:=(desyat+vosemj+devyat)
  else if (zehn < neun) AND (neun < acht) then
  TRnine:=(desyat+devyat+vosemj)
  else if (acht < zehn) AND (zehn < neun) then
  TRnine:=(vosemj+desyat+devyat)
  else if (acht < neun) AND (neun < zehn) then
  TRnine:=(vosemj+devyat+desyat)
  else if (neun < acht) AND (acht < zehn) then
  TRnine:=(devyat+vosemj+desyat)
  else if (neun < zehn) AND (zehn < acht) then
  TRnine:=(devyat+desyat+vosemj);
    if (zehn < elf) AND (elf < neun) then
  TRten:=(desyat+odinnatsat+devyat)
  else if (zehn < neun) AND (neun < elf) then
  TRten:=(desyat+devyat+odinnatsat)
  else if (elf < zehn) AND (zehn < neun) then
  TRten:=(odinnatsat+desyat+devyat)
  else if (elf < neun) AND (neun < zehn) then
  TRten:=(odinnatsat+devyat+desyat)
  else if (neun < elf) AND (elf < zehn) then
  TRten:=(devyat+odinnatsat+desyat)
  else if (neun < zehn) AND (zehn < elf) then
  TRten:=(devyat+desyat+odinnatsat);
    if (zehn < elf) AND (elf < zwolf) then
  TReleven:=(desyat+odinnatsat+dvenadsat)
  else if (zehn < zwolf) AND (zwolf < elf) then
  TReleven:=(desyat+dvenadsat+odinnatsat)
  else if (elf < zehn) AND (zehn < zwolf) then
  TReleven:=(odinnatsat+desyat+dvenadsat)
  else if (elf < zwolf) AND (zwolf < zehn) then
  TReleven:=(odinnatsat+dvenadsat+desyat)
  else if (zwolf < elf) AND (elf < zehn) then
  TReleven:=(dvenadsat+odinnatsat+desyat)
  else if (zwolf < zehn) AND (zehn < elf) then
  TReleven:=(dvenadsat+desyat+odinnatsat);
    if (ein < elf) AND (elf < zwolf) then
  TRtwelve:=(odin+odinnatsat+dvenadsat)
  else if (ein < zwolf) AND (zwolf < elf) then
  TRtwelve:=(odin+dvenadsat+odinnatsat)
  else if (elf < ein) AND (ein < zwolf) then
  TRtwelve:=(odinnatsat+odin+dvenadsat)
  else if (elf < zwolf) AND (zwolf < ein) then
  TRtwelve:=(odinnatsat+dvenadsat+odin)
  else if (zwolf < elf) AND (elf < ein) then
  TRtwelve:=(dvenadsat+odinnatsat+odin)
  else if (zwolf < ein) AND (ein < elf) then
  TRtwelve:=(dvenadsat+odin+odinnatsat);
  end;
  U:=0;
  correct:=0;
  if (choice = 1) then
  begin
  Repeat
    for U:=1 to combinationnumber do
      begin
      if (TRone = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
   if (TRtwo = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
    if (TRthree = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
     if (TRfour = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
         end;
    nn:=1;
  until nn=1;
  end
  else if (choice = 2) then
  begin
  Repeat
    for U:=1 to combinationnumber do
      begin
      if (TRone = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
   if (TRtwo = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
    if (TRthree = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
     if (TRfour = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
      if (TRfive = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
       if (TRsix = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
        if (TRseven = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
         if (TReight = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
    end;
    nn:=1;
  until nn=1;
  end
  else if (choice = 3) then
  begin
  Repeat
    for U:=1 to combinationnumber do
      begin
      if (TRone = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
   if (TRtwo = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
    if (TRthree = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
     if (TRfour = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
      if (TRfive = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
       if (TRsix = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
        if (TRseven = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
         if (TReight = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
           if (TRnine = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
           if (TRten = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TReleven = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRtwelve = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRthirteen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRfourteen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRfifteen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRsixteen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRseventeen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TReighteen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRnineteen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRtwenty = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
    end;
    nn:=1;
  until nn=1;
  end
    else if (choice = 4) then
  begin
  Repeat
    for U:=1 to combinationnumber do
      begin
      if (TRone = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
   if (TRtwo = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
    if (TRthree = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
     if (TRfour = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
      if (TRfive = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
       if (TRsix = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
        if (TRseven = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
         if (TReight = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
           if (TRnine = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
           if (TRten = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TReleven = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRtwelve = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRthirteen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRfourteen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRfifteen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRsixteen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRseventeen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TReighteen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRnineteen = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRtwenty = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
    end;
    nn:=1;
  until nn=1;
  end
    else if (choice = 5) then
  begin
  Repeat
    for U:=1 to combinationnumber do
      begin
      if (TRone = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
   if (TRtwo = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
    if (TRthree = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
     if (TRfour = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
      if (TRfive = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
       if (TRsix = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
        if (TRseven = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
         if (TReight = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
           if (TRnine = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
           if (TRten = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TReleven = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
  if (TRtwelve = WordsArray[U]) then
  begin
    correct:=correct+1;
  end;
    end;
    nn:=1;
  until nn=1;
  end;
if correct = 1 then
  q:=q+1;
  if correct = 2 then
  w:=w+1;
  if correct = 3 then
  e:=e+1;
  if correct = 4 then
  r:=r+1;
  if choice > 1 then
  begin
  if correct = 5 then
  t:=t+1;
  if correct = 6 then
  y:=y+1;
  if correct = 7 then
  uu:=uu+1;
  if correct = 8 then
  ii:=ii+1;
  end;
  if choice >2 then
  begin
  if correct = 9 then
  o:=o+1;
  if correct = 10 then
  p:=p+1;
  if correct = 11 then
  a:=a+1;
  if correct = 12 then
  s:=s+1;
  end;
  if (choice = 3) OR (choice = 4) then
  begin
  if correct = 13 then
  d:=d+1;
  if correct = 14 then
  f:=f+1;
  if correct = 15 then
  g:=g+1;
  if correct = 16 then
  h:=h+1;
  if correct = 17 then
  j:=j+1;
  if correct = 18 then
  k:=k+1;
  if correct = 19 then
  l:=l+1;
  if correct = 20 then
  z:=z+1;
  end;
  if delaynumber mod 5 = 0 then
  begin
  ClrScr;
  writeln('Correct triangles (triplets): Amount of combinations checked by the program that results in such a number');
  if choice = 1 then
  writeln('1:',q,', ','2:',w,', ','3:',e,', ','4:',r)
  else if choice = 2 then
  writeln('1:',q,', ','2:',w,', ','3:',e,', ','4:',r,', ','5:',t,', ','6:',y,', ','7:',uu,', ','8:',ii)
  else if choice = 3 then
  writeln('1:',q,', ','2:',w,', ','3:',e,', ','4:',r,', ','5:',t,', ','6:',y,', ','7:',uu,', ','8:',ii,', ','9:',o,', ','10:',p,', ','11:',a,', ','12:',s,', ','13:',d,', ','14:',f,', ','15:',g,', ','16:',h,', ','17:',j,', ','18:',k,', ','19:',l,', ','20:',z)
  else if choice = 4 then
  writeln('1:',q,', ','2:',w,', ','3:',e,', ','4:',r,', ','5:',t,', ','6:',y,', ','7:',uu,', ','8:',ii,', ','9:',o,', ','10:',p,', ','11:',a,', ','12:',s,', ','13:',d,', ','14:',f,', ','15:',g,', ','16:',h,', ','17:',j,', ','18:',k,', ','19:',l,', ','20:',z)
  else if choice = 5 then
  writeln('1:',q,', ','2:',w,', ','3:',e,', ','4:',r,', ','5:',t,', ','6:',y,', ','7:',uu,', ','8:',ii,', ','9:',o,', ','10:',p,', ','11:',a,', ','12:',s);
  writeln('OVERALL: ',q+w+e+r+t+y+uu+ii+o+p+a+s+d+f+g+h+j+k+l+z);
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
  {writeln('     ',odin);
  writeln('    /|\');
  writeln('   / | \');
  writeln('  /__',chetire,'__\');
  writeln(' ',dva,'/_____\',tri);}
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
  {writeln('     ',dva,'         ',dva,'         ',dva,'         ',dva,'         ',shest,'         ',shest);
writeln('    / \       / \       / \       / \       / \       / \ ');
writeln('   / | \     / | \     / | \     / | \     / | \     / | \  ');
writeln('  ',pyat,'__',odin,'__',shest,'   ',odin,'__',shest,'__',tri,'   ',shest,'__',tri,'__',pyat,'   ',tri,'__',pyat,'__',odin,'   ',tri,'__',dva,'__',odin,'   ',odin,'__',chetire,'__',tri);
writeln('   \ | /     \ | /     \ | /     \ | /     \ | /     \ | /');
writeln('    \ /       \ /       \ /       \ /       \ /       \ /');
writeln('     ',chetire,'         ',chetire,'         ',chetire,'         ',chetire,'         ',pyat,'         ',pyat);}
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
