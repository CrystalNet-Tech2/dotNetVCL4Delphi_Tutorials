program BackgroundWorker2;

uses
{$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  BackgroundWorker in 'BackgroundWorker.pas' {FibonacciForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFibonacciForm, FibonacciForm);
  Application.Run;
end.
