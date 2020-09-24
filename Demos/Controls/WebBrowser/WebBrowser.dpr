program WebBrowser;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uWebBrowser in 'uWebBrowser.pas' {Form23};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm23, Form23);
  Application.Run;
end.
