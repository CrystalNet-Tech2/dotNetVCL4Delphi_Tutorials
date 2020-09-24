unit uCheckBoxes;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.ButtonBase, CNClrLib.Control.CheckBox;

type
  TForm13 = class(TForm)
    CnCheckBox6: TCnCheckBox;
    CnCheckBox3: TCnCheckBox;
    CnCheckBox1: TCnCheckBox;
    CnCheckBox2: TCnCheckBox;
    CnCheckBox4: TCnCheckBox;
    CnCheckBox5: TCnCheckBox;
    CnCheckBox7: TCnCheckBox;
    CnCheckBox8: TCnCheckBox;
    CnCheckBox9: TCnCheckBox;
    procedure CnCheckBox5CheckedChanged(Sender: TObject; E: _EventArgs);
    procedure CnCheckBox7CheckStateChanged(Sender: TObject; E: _EventArgs);
    procedure CnCheckBox8Click(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.CnCheckBox5CheckedChanged(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('Checked: '+ BoolToStr(CnCheckBox5.Checked, True));
end;

procedure TForm13.CnCheckBox7CheckStateChanged(Sender: TObject; E: _EventArgs);
begin
  case CnCheckBox7.CheckState of
    TCheckState.csUnchecked: TClrMessageBox.Show('Unchecked');
    TCheckState.csChecked:  TClrMessageBox.Show('Checked');
    TCheckState.csIndeterminate:  TClrMessageBox.Show('Indeterminate');
  end;
end;

procedure TForm13.CnCheckBox8Click(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('CnCheckBox8 clicked');
end;

end.
