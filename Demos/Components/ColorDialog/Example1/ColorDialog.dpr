program ColorDialog;

uses
{$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uColorDialog in 'uColorDialog.pas' {frmColorDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmColorDialog, frmColorDialog);
  Application.Run;
end.
