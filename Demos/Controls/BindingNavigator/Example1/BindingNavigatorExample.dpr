program BindingNavigatorExample;

uses
  Vcl.Forms,
  uBindingNavigator in 'uBindingNavigator.pas' {frmBindingNav};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBindingNav, frmBindingNav);
  Application.Run;
end.
