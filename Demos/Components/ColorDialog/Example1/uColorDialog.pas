unit uColorDialog;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Component.ColorDialog;

type
  TfrmColorDialog = class(TForm)
    btnShowColorDialog: TButton;
    CnColorDialog1: TCnColorDialog;
    chkAllowFullOpen: TCheckBox;
    chkAnyColor: TCheckBox;
    chkSolidColorOnly: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    LabelBackColor: TLabel;
    MemoBackColor: TMemo;
    PanelBackColor: TPanel;
    LabelForeColor: TLabel;
    MemoForeColor: TMemo;
    PanelForeColor: TPanel;
    EditBackColor: TEdit;
    EditForeColor: TEdit;
    procedure btnShowColorDialogClick(Sender: TObject);
    procedure chkAnyColorClick(Sender: TObject);
    procedure chkSolidColorOnlyClick(Sender: TObject);
    procedure chkAllowFullOpenClick(Sender: TObject);
  private
    procedure SetControlsBackColor;
    procedure SetControlsForeColor;
  public
    { Public declarations }
  end;

var
  frmColorDialog: TfrmColorDialog;

implementation

{$R *.dfm}

procedure TfrmColorDialog.btnShowColorDialogClick(Sender: TObject);
begin
  if CnColorDialog1.ShowDialog = TDialogResult.drOK then
  begin
    SetControlsBackColor;
    SetControlsForeColor;
  end;
end;

procedure TfrmColorDialog.chkAllowFullOpenClick(Sender: TObject);
begin
  CnColorDialog1.AllowFullOpen := chkAllowFullOpen.Checked;
end;

procedure TfrmColorDialog.chkAnyColorClick(Sender: TObject);
begin
  CnColorDialog1.AnyColor := chkAnyColor.Checked;
end;

procedure TfrmColorDialog.chkSolidColorOnlyClick(Sender: TObject);
begin
  CnColorDialog1.SolidColorOnly := chkSolidColorOnly.Checked;
end;

procedure TfrmColorDialog.SetControlsBackColor;
var
  backColor: TColor;
begin
  backColor := CnColorDialog1.Color.ToWin32Color;

  LabelBackColor.Color := backColor;
  EditBackColor.Color := backColor;
  MemoBackColor.Color := backColor;
  PanelBackColor.Color := backColor;
end;

procedure TfrmColorDialog.SetControlsForeColor;
var
  foreColor: TColor;
begin
  foreColor := CnColorDialog1.Color.ToWin32Color;

  LabelForeColor.Font.Color := foreColor;
  EditForeColor.Font.Color := foreColor;
  MemoForeColor.Font.Color := foreColor;
  PanelForeColor.Font.Color :=  foreColor;
end;

end.
