program SmtpClient;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uSendEmail in 'uSendEmail.pas' {frmSendEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSendEmail, frmSendEmail);
  Application.Run;
end.
