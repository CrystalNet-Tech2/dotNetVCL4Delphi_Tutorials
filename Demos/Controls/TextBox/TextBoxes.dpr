program TextBoxes;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uTextBoxes in 'uTextBoxes.pas' {Form27};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm27, Form27);
  Application.Run;
end.
