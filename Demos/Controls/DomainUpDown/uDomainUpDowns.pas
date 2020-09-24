unit uDomainUpDowns;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.ScrollableControl, CNClrLib.Control.ContainerControl,
  CNClrLib.Control.UpDownBase, CNClrLib.Control.DomainUpDown;

type
  TForm10 = class(TForm)
    CnDomainUpDown1: TCnDomainUpDown;
    CnDomainUpDown2: TCnDomainUpDown;
    CnDomainUpDown3: TCnDomainUpDown;
    procedure CnDomainUpDown1DoubleClick(Sender: TObject; E: _EventArgs);
    procedure CnDomainUpDown1SelectedItemChanged(Sender: TObject;
      E: _EventArgs);
    procedure CnDomainUpDown1TextChanged(Sender: TObject; E: _EventArgs);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

procedure TForm10.CnDomainUpDown1DoubleClick(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnDoubleClick Event')
end;

procedure TForm10.CnDomainUpDown1SelectedItemChanged(Sender: TObject;
  E: _EventArgs);
begin
  TClrMessageBox.Show('OnSelectedItemChanged Event')
end;

procedure TForm10.CnDomainUpDown1TextChanged(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnTextChanged Event')
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
  TClrApplication.VisualStyleState := TVisualStyleState.vssClientAndNonClientAreasEnabled;
end;

end.
