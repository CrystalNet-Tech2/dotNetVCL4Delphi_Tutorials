unit uMonthCalendars;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.MonthCalendar, CNClrLib.Control.ButtonBase, CNClrLib.Control.CheckBox;

type
  TForm34 = class(TForm)
    CnMonthCalendar1: TCnMonthCalendar;
    CnMonthCalendar2: TCnMonthCalendar;
    CnCheckBox1: TCnCheckBox;
    procedure CnCheckBox1CheckedChanged(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form34: TForm34;

implementation

{$R *.dfm}

procedure TForm34.CnCheckBox1CheckedChanged(Sender: TObject; E: _EventArgs);
begin
  if CnCheckBox1.Checked then
    TClrApplication.VisualStyleState := TVisualStyleState.vssNoneEnabled
  else
    TClrApplication.VisualStyleState := TVisualStyleState.vssClientAndNonClientAreasEnabled;
end;

end.
