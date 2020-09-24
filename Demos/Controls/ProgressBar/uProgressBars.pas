unit uProgressBars;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.ButtonBase,
  CNClrLib.Control.CheckBox, CNClrLib.Control.Base, CNClrLib.Control.ProgressBar;

type
  TForm31 = class(TForm)
    CnProgressBar1: TCnProgressBar;
    CnProgressBar2: TCnProgressBar;
    CnProgressBar3: TCnProgressBar;
    CnProgressBar4: TCnProgressBar;
    CnCheckBox1: TCnCheckBox;
    procedure CnCheckBox1CheckedChanged(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form31: TForm31;

implementation

{$R *.dfm}

procedure TForm31.CnCheckBox1CheckedChanged(Sender: TObject; E: _EventArgs);
begin
  if CnCheckBox1.Checked then
    TClrApplication.VisualStyleState := TVisualStyleState.vssNoneEnabled
  else
    TClrApplication.VisualStyleState := TVisualStyleState.vssClientAndNonClientAreasEnabled;
end;

end.
