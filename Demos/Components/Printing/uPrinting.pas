unit uPrinting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm10 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

// https://docs.microsoft.com/en-us/dotnet/api/system.drawing.printing.printdocument.print?view=netframework-4.7.2
// https://www.c-sharpcorner.com/article/printing-in-C-Sharp/
// https://www.codeproject.com/Tips/453871/Simple-Receipt-Like-Printing-Using-the-Csharp-Prin

{$R *.dfm}

end.
