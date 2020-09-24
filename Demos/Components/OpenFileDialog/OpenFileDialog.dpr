program OpenFileDialog;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uOpenFIleDialog in 'uOpenFIleDialog.pas' {Form18};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm18, Form18);
  Application.Run;
end.
