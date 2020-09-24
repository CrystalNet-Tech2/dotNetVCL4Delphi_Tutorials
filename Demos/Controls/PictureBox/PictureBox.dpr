program PictureBox;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uImagePicker in 'uImagePicker.pas' {frmClrImageEditor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmClrImageEditor, frmClrImageEditor);
  Application.Run;
end.
