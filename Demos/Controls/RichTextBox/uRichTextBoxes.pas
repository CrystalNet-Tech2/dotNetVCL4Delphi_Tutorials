unit uRichTextBoxes;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.TextBoxBase, CNClrLib.Control.RichTextBox;

type
  TForm28 = class(TForm)
    CnRichTextBox1: TCnRichTextBox;
    procedure CnRichTextBox1LinkClicked(Sender: TObject;
      E: _LinkClickedEventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form28: TForm28;

implementation

{$R *.dfm}

procedure TForm28.CnRichTextBox1LinkClicked(Sender: TObject;
  E: _LinkClickedEventArgs);
begin
  TClrMessageBox.Show(E.LinkText);
end;

end.
