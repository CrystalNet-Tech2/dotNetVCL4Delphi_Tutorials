program SerialPort;

uses
{$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uSerialPort in 'uSerialPort.pas' {frmSerialPort};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSerialPort, frmSerialPort);
  Application.Run;
end.
