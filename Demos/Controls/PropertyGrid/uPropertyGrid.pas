unit uPropertyGrid;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.ScrollableControl,
  CNClrLib.Control.ContainerControl, CNClrLib.Control.PropertyGrid, CNClrLib.Control.Base,
  CNClrLib.Control.ListControl, CNClrLib.Control.ComboBox, CNClrLib.Control.LinkLabel,
  CNClrLib.Control.LabelA, CNClrLib.Control.DateTimePicker, CNClrLib.Control.CheckBox,
  CNClrLib.Control.ButtonBase, CNClrLib.Control.Button,
  CNClrLib.Control.RadioButton, CNClrLib.Control.TextBoxBase,
  CNClrLib.Control.TextBox, CNClrLib.Control.ProgressBar;

type
  TForm30 = class(TForm)
    CnComboBox1: TCnComboBox;
    CnPropertyGrid1: TCnPropertyGrid;
    CnButton1: TCnButton;
    CnCheckBox1: TCnCheckBox;
    CnDateTimePicker1: TCnDateTimePicker;
    CnLabel1: TCnLabel;
    CnLinkLabel1: TCnLinkLabel;
    GroupBox1: TGroupBox;
    CnComboBox2: TCnComboBox;
    CnProgressBar1: TCnProgressBar;
    CnTextBox1: TCnTextBox;
    CnRadioButton1: TCnRadioButton;
    procedure FormShow(Sender: TObject);
    procedure CnComboBox1SelectedIndexChanged(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form30: TForm30;

implementation

{$R *.dfm}

procedure TForm30.CnComboBox1SelectedIndexChanged(Sender: TObject;
  E: _EventArgs);
var
  control: TControl;
begin
  if CnComboBox1.SelectedIndex > -1 then
  begin
    control := GroupBox1.FindChildControl(CnComboBox1.Text);
    if (control <> nil) and (control is TClrCustomControl) then
      CnPropertyGrid1.SelectedControl := TClrCustomControl(control)
    else
      CnPropertyGrid1.SelectedControl := nil;
  end
  else
  begin
    CnPropertyGrid1.SelectedControl := nil;
  end;
end;

procedure TForm30.FormShow(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to GroupBox1.ControlCount - 1 do
    CnComboBox1.Items.Add(GroupBox1.Controls[I].Name);
end;

end.
