program RadioButtons;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uRadioButtons in 'uRadioButtons.pas' {Form29};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm29, Form29);
  Application.Run;
end.
