unit uListBoxes;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.ListControl, CNClrLib.Control.ListBox;

type
  TForm17 = class(TForm)
    CnListBox1: TCnListBox;
    CnListBox2: TCnListBox;
    procedure CnListBox2Click(Sender: TObject; E: _EventArgs);
    procedure CnListBox2SelectedIndexChanged(Sender: TObject; E: _EventArgs);
    procedure CnListBox2SelectedValueChanged(Sender: TObject; E: _EventArgs);
    procedure CnListBox2MeasureItem(Sender: TObject; E: _MeasureItemEventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

procedure TForm17.CnListBox2Click(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnClick Event')
end;

procedure TForm17.CnListBox2MeasureItem(Sender: TObject;
  E: _MeasureItemEventArgs);
begin
  TClrMessageBox.Show('OnMeasureItem Event')
end;

procedure TForm17.CnListBox2SelectedIndexChanged(Sender: TObject;
  E: _EventArgs);
begin
  TClrMessageBox.Show('OnSelectedIndexChanged Event')
end;

procedure TForm17.CnListBox2SelectedValueChanged(Sender: TObject;
  E: _EventArgs);
begin
  TClrMessageBox.Show('OnSelectedValueChanged Event')
end;

end.
