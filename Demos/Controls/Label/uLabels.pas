unit uLabels;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.LabelA, CNClrLib.Component.ImageList;

type
  TForm15 = class(TForm)
    CnLabel1: TCnLabel;
    CnLabel2: TCnLabel;
    CnLabel3: TCnLabel;
    CnImageList1: TCnImageList;
    procedure CnLabel2MouseHover(Sender: TObject; E: _EventArgs);
    procedure CnLabel2MouseLeave(Sender: TObject; E: _EventArgs);
    procedure CnLabel1Click(Sender: TObject; E: _EventArgs);
    procedure CnLabel2DoubleClick(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

procedure TForm15.CnLabel1Click(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnClick Event');
end;

procedure TForm15.CnLabel2DoubleClick(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnDoubleClick Event');
end;

procedure TForm15.CnLabel2MouseHover(Sender: TObject; E: _EventArgs);
begin
  CnLabel2.ForeColor.SetColor(clRed);
end;

procedure TForm15.CnLabel2MouseLeave(Sender: TObject; E: _EventArgs);
begin
  CnLabel2.ForeColor.SetColor(clBlack);
end;

end.
