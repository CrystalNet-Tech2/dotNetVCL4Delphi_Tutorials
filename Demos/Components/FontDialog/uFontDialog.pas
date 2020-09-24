unit uFontDialog;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Component.ColorDialog, CNClrLib.Component.FontDialog;

type
  TfrmFontDialog = class(TForm)
    btnShowFontDialog: TButton;
    GroupBox2: TGroupBox;
    LabelFont: TLabel;
    MemoFont: TMemo;
    PanelFont: TPanel;
    EditFont: TEdit;
    CnFontDialog1: TCnFontDialog;
    Button1: TButton;
    CnFontDialog2: TCnFontDialog;
    procedure btnShowFontDialogClick(Sender: TObject);
    procedure CnFontDialog2Apply(Sender: TObject; E: _EventArgs);
    procedure Button1Click(Sender: TObject);
  private
    procedure SetControlsFont(fontDialog: TCnFontDialog);
  public
    { Public declarations }
  end;

var
  frmFontDialog: TfrmFontDialog;

implementation

{$R *.dfm}

{ TfrmFontDialog }

procedure TfrmFontDialog.btnShowFontDialogClick(Sender: TObject);
begin
  if CnFontDialog1.ShowDialog = TDialogResult.drOK then
  begin
    SetControlsFont(CnFontDialog1);
  end;
end;

procedure TfrmFontDialog.Button1Click(Sender: TObject);
begin
  CnFontDialog2.ShowDialog;
end;

procedure TfrmFontDialog.CnFontDialog2Apply(Sender: TObject; E: _EventArgs);
begin
  SetControlsFont(CnFontDialog2);
end;

procedure TfrmFontDialog.SetControlsFont(fontDialog: TCnFontDialog);
var
  font: TFont;
begin
  font := fontDialog.Font.ToTFont;
  try
    LabelFont.Font.Assign(font);
    MemoFont.Font.Assign(font);
    EditFont.Font.Assign(font);
    PanelFont.Font.Assign(font);
  finally
    font.Free;
  end;
end;

end.
