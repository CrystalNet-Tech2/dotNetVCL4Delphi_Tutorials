program SaveFileDialog;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uSaveFileDialog in 'uSaveFileDialog.pas' {Form17};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm17, Form17);
  Application.Run;
end.
