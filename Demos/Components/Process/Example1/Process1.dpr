program Process1;

uses
{$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uProcess in 'uProcess.pas' {frmProcess};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmProcess, frmProcess);
  Application.Run;
end.
