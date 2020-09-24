unit uTextBoxes;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.TextBoxBase, CNClrLib.Control.TextBox;

type
  TForm27 = class(TForm)
    CnTextBox1: TCnTextBox;
    CnTextBox2: TCnTextBox;
    CnTextBox3: TCnTextBox;
    CnTextBox4: TCnTextBox;
    CnTextBox5: TCnTextBox;
    CnTextBox6: TCnTextBox;
    procedure CnTextBox2TextChanged(Sender: TObject; E: _EventArgs);
    procedure CnTextBox2TabIndexChanged(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form27: TForm27;

implementation

{$R *.dfm}

procedure TForm27.CnTextBox2TabIndexChanged(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnTabIndexChanged Event');
end;

procedure TForm27.CnTextBox2TextChanged(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnTextChanged Event');
end;

end.
