unit uImagePicker;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs, ComCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Component.OpenFileDialog, CNClrLib.Control.PictureBox,
  CNClrLib.Control.ButtonBase, CNClrLib.Control.Button, Vcl.ExtDlgs;

type
  TfrmClrImageEditor = class(TForm)
    CnPictureBoxImage: TCnPictureBox;
    CnButtonLoad: TCnButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    CnButtonClear: TCnButton;
    CnButtonExit: TCnButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure CnButtonLoadClick(Sender: TObject; E: _EventArgs);
    procedure CnButtonExitClick(Sender: TObject; E: _EventArgs);
    procedure CnButtonClearClick(Sender: TObject; E: _EventArgs);
    procedure FormShow(Sender: TObject);
  private
    procedure SetButtonEnabled;
  end;

var
  frmClrImageEditor: TfrmClrImageEditor;

implementation

uses CNClrLib.Drawing;

{$R *.dfm}

procedure TfrmClrImageEditor.CnButtonExitClick(Sender: TObject;
  E: _EventArgs);
begin
  Close;
end;

procedure TfrmClrImageEditor.CnButtonClearClick(Sender: TObject; E: _EventArgs);
begin
  CnPictureBoxImage.Image := nil;
  SetButtonEnabled;
end;

procedure TfrmClrImageEditor.CnButtonLoadClick(Sender: TObject; E: _EventArgs);
begin
  if OpenPictureDialog1.Execute(Handle) then
    CnPictureBoxImage.Image.LoadFromFile(OpenPictureDialog1.FileName);

  SetButtonEnabled
end;

procedure TfrmClrImageEditor.FormShow(Sender: TObject);
begin
  SetButtonEnabled;
end;

procedure TfrmClrImageEditor.SetButtonEnabled;
begin
  CnButtonClear.Enabled := not CnPictureBoxImage.Image.IsEmpty;
end;

end.
