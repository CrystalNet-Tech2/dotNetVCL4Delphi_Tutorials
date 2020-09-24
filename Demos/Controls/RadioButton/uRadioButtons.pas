unit uRadioButtons;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.ButtonBase, CNClrLib.Control.RadioButton;

type
  TForm29 = class(TForm)
    CnRadioButton1: TCnRadioButton;
    CnRadioButton2: TCnRadioButton;
    CnRadioButton3: TCnRadioButton;
    CnRadioButton4: TCnRadioButton;
    CnRadioButton5: TCnRadioButton;
    CnRadioButton6: TCnRadioButton;
    procedure CnRadioButton2Click(Sender: TObject; E: _EventArgs);
    procedure CnRadioButton3CheckedChanged(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form29: TForm29;

implementation

{$R *.dfm}

procedure TForm29.CnRadioButton2Click(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnClick Event')
end;

procedure TForm29.CnRadioButton3CheckedChanged(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnCheckedChanged Event')
end;

end.
