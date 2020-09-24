program PrintPreviewDialog;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uPrintPreviewDialog in 'uPrintPreviewDialog.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
