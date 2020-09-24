unit uTrackBars;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.TrackBar;

type
  TForm25 = class(TForm)
    CnTrackBar1: TCnTrackBar;
    CnTrackBar2: TCnTrackBar;
    CnTrackBar3: TCnTrackBar;
    CnTrackBar4: TCnTrackBar;
    procedure CnTrackBar1ValueChanged(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form25: TForm25;

implementation

{$R *.dfm}

procedure TForm25.CnTrackBar1ValueChanged(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnValueChanged Event');
end;

end.
