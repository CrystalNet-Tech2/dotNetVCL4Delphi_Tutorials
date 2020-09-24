unit uLinkLabels;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.LabelA, CNClrLib.Control.LinkLabel;

type
  TForm16 = class(TForm)
    CnLinkLabel1: TCnLinkLabel;
    CnLinkLabel4: TCnLinkLabel;
    CnLinkLabel2: TCnLinkLabel;
    CnLinkLabel3: TCnLinkLabel;
    CnLinkLabel5: TCnLinkLabel;
    procedure CnLinkLabel1LinkClicked(Sender: TObject;
      E: _LinkLabelLinkClickedEventArgs);
    procedure CnLinkLabel4Click(Sender: TObject; E: _EventArgs);
    procedure CnLinkLabel2DoubleClick(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

procedure TForm16.CnLinkLabel1LinkClicked(Sender: TObject;
  E: _LinkLabelLinkClickedEventArgs);
begin
  TClrMessageBox.Show('OnLinkClicked Event');
end;

procedure TForm16.CnLinkLabel2DoubleClick(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnDoubleClick Event');
end;

procedure TForm16.CnLinkLabel4Click(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnClick Event');
end;

end.
