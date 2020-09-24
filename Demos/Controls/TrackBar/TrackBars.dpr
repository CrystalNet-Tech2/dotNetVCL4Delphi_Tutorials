program TrackBars;

uses
  {$IF CompilerVersion > 22}Vcl.Forms,{$ELSE}Forms,{$IFEND}
  uTrackBars in 'uTrackBars.pas' {Form25};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm25, Form25);
  Application.Run;
end.
