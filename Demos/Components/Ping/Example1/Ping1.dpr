program Ping1;

uses
{$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uPing in 'uPing.pas' {frmPing};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPing, frmPing);
  Application.Run;
end.
