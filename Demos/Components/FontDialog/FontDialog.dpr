program FontDialog;

uses
{$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uFontDialog in 'uFontDialog.pas' {frmFontDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFontDialog, frmFontDialog);
  Application.Run;
end.
