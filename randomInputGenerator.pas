program Random2DArrayTwoRows;

uses
  SysUtils;

var
  cols, i, j: Integer;
  arr: array of array of Integer;
  outFile: Text;  { Variable for file output }
begin
  Randomize;  { Initialize the random number generator }

  { Create a 2D array with 2 rows }
  SetLength(arr, 2);
  cols := Random(20) + 1;  { Random number of columns between 1 and 20 }

  { Allocate each row with the determined number of columns }
  for i := Low(arr) to High(arr) do
    SetLength(arr[i], cols);

  { Fill the array with random integers from 0 to 256 }
  for i := Low(arr) to High(arr) do
    for j := Low(arr[i]) to High(arr[i]) do
      arr[i][j] := Random(257);

  { Open (or create) the output file }
  Assign(outFile, 'output.txt');
  Rewrite(outFile);

  { Write the array dimensions and contents to the file }
  WriteLn(outFile, 'Array dimensions: 2 x ', cols);
  for i := Low(arr) to High(arr) do
  begin
    for j := Low(arr[i]) to High(arr[i]) do
      Write(outFile, arr[i][j]:4);
    WriteLn(outFile);
  end;

  { Close the file to ensure all data is saved }
  Close(outFile);

  WriteLn('Output has been saved to output.txt');
  ReadLn;  { Wait for user input before closing }
end.
