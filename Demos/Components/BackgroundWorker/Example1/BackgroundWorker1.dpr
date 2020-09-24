program BackgroundWorker1;

uses
{$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  BackgroundWorker in 'BackgroundWorker.pas' {Form12};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm12, Form12);
  Application.Run;
end.
