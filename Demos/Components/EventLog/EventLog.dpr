program EventLog;

uses
{$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uEventLog in 'uEventLog.pas' {frmEventLog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEventLog, frmEventLog);
  Application.Run;
end.
