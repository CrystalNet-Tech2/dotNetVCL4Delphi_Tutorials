program FolderBrowserDialog;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uFolderBrowserDialog in 'uFolderBrowserDialog.pas' {Form19};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm19, Form19);
  Application.Run;
end.
