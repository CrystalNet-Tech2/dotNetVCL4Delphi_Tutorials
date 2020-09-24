program ActiveDirectory;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uActiveDirectory in 'uActiveDirectory.pas' {frmAD};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAD, frmAD);
  Application.Run;
end.
