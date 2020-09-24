program PrintDocument;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uPrintDocument in 'uPrintDocument.pas' {frmPrintDocument};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrintDocument, frmPrintDocument);
  Application.Run;
end.
