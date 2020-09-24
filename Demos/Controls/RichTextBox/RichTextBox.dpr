program RichTextBox;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uRichTextBoxes in 'uRichTextBoxes.pas' {Form28};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm28, Form28);
  Application.Run;
end.
