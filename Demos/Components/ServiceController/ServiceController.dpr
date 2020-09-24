program ServiceController;

uses
{$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uServiceController in 'uServiceController.pas' {frmServiceCtrl};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmServiceCtrl, frmServiceCtrl);
  Application.Run;
end.
