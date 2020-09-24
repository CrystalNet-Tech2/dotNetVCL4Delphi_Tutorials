program DotNetGraphics;

uses
  Vcl.Forms,
  uGraphics in 'uGraphics.pas' {Form35};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm35, Form35);
  Application.Run;
end.
