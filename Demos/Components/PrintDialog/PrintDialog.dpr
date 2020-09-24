program PrintDialog;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uPrintDialog in 'uPrintDialog.pas' {frmPrintDocument};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrintDocument, frmPrintDocument);
  Application.Run;
end.
