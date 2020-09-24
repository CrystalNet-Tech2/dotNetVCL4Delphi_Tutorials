unit uMaskedTextBoxes;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.TextBoxBase, CNClrLib.Control.MaskedTextBox;

type
  TForm19 = class(TForm)
    CnMaskedTextBox1: TCnMaskedTextBox;
    CnMaskedTextBox2: TCnMaskedTextBox;
    CnMaskedTextBox3: TCnMaskedTextBox;
    CnMaskedTextBox4: TCnMaskedTextBox;
    CnMaskedTextBox5: TCnMaskedTextBox;
    CnMaskedTextBox6: TCnMaskedTextBox;
    CnMaskedTextBox7: TCnMaskedTextBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

{$R *.dfm}

end.
