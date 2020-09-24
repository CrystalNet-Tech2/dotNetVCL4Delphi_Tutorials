program FileSystemWatcher;

uses
{$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uFileSystemWatcher in 'uFileSystemWatcher.pas' {frmFileSystemWatcher};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFileSystemWatcher, frmFileSystemWatcher);
  Application.Run;
end.
