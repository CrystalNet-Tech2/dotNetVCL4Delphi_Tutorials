unit uDateTimePickers;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.DateTimePicker, CNClrLib.Control.ButtonBase, CNClrLib.Control.CheckBox;

type
  TForm9 = class(TForm)
    CnDateTimePicker1: TCnDateTimePicker;
    CnDateTimePicker2: TCnDateTimePicker;
    CnDateTimePicker3: TCnDateTimePicker;
    CnDateTimePicker4: TCnDateTimePicker;
    CnCheckBox1: TCnCheckBox;
    procedure CnCheckBox1CheckedChanged(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.CnCheckBox1CheckedChanged(Sender: TObject; E: _EventArgs);
begin
  if CnCheckBox1.Checked then
    TClrApplication.VisualStyleState := TVisualStyleState.vssNoneEnabled
  else
    TClrApplication.VisualStyleState := TVisualStyleState.vssClientAndNonClientAreasEnabled
end;

end.
