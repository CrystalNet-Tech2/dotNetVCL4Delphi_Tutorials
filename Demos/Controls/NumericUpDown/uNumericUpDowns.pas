unit uNumericUpDowns;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.ScrollableControl, CNClrLib.Control.ContainerControl,
  CNClrLib.Control.UpDownBase, CNClrLib.Control.NumericUpDown;

type
  TForm33 = class(TForm)
    CnNumericUpDown1: TCnNumericUpDown;
    CnNumericUpDown2: TCnNumericUpDown;
    CnNumericUpDown3: TCnNumericUpDown;
    CnNumericUpDown4: TCnNumericUpDown;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form33: TForm33;

implementation

{$R *.dfm}

end.
