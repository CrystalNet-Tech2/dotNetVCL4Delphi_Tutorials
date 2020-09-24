unit uTimer;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.Base, CNClrLib.Component.Timer;

type
  TForm14 = class(TForm)
    Memo1: TMemo;
    btnStartTimer: TButton;
    btnEndTimer: TButton;
    CnTimer1: TCnTimer;
    procedure btnStartTimerClick(Sender: TObject);
    procedure btnEndTimerClick(Sender: TObject);
    procedure CnTimer1Tick(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

procedure TForm14.btnEndTimerClick(Sender: TObject);
begin
  CnTimer1.Stop;
end;

procedure TForm14.btnStartTimerClick(Sender: TObject);
begin
  // Create a timer with a two second interval.
  CnTimer1.Interval := 2000;
  CnTimer1.Start;
end;

procedure TForm14.CnTimer1Tick(Sender: TObject; E: _EventArgs);
begin
  Memo1.Lines.Add('The Elapsed event was raised at '+ DateTimeToStr(Now));
end;

end.
