unit uPrintPreviewDialog;

interface

//In this example we will create a print document and print using PrintPreviewDialog.
//We will print some text on Print Page event

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Component.PrintDocument, CNClrLib.Control.Base,
  CNClrLib.Component.PrintPreviewDialog;

type
  TForm9 = class(TForm)
    btnPrint: TButton;
    CnPrintPreviewDialog1: TCnPrintPreviewDialog;
    CnPrintDocument1: TCnPrintDocument;
    procedure CnPrintDocument1PrintPage(Sender: TObject;
      E: _PrintPageEventArgs);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

uses CNClrLib.Drawing, CNClrLib.EnumTypes;

procedure TForm9.btnPrintClick(Sender: TObject);
begin
  CnPrintPreviewDialog1.ShowDialog;
end;

procedure TForm9.CnPrintDocument1PrintPage(Sender: TObject;
  E: _PrintPageEventArgs);
var
  text: String;
  printFont: _Font;
  brushes: _Brushes;
begin
  text := 'Header';
  printFont := CoFont.CreateInstance('Tahoma', 40, [TFontStyle.fsBold]);
  brushes := CoBrushes.CreateInstance;
  E.Graphics.DrawString(text, printFont, brushes.Blue, 0, 0);

  text := 'Text';
  printFont := CoFont.CreateInstance('Tahoma', 30, [TFontStyle.fsRegular]);
  E.Graphics.DrawString(text, printFont, Brushes.Black , 0, 100);
end;

end.
