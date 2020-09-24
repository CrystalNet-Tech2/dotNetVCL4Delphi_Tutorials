unit uCheckedListBox;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.ListControl, CNClrLib.Control.ListBox, CNClrLib.Control.CheckedListBox;

type
  TForm14 = class(TForm)
    CnCheckedListBox1: TCnCheckedListBox;
    CnCheckedListBox2: TCnCheckedListBox;
    CnCheckedListBox3: TCnCheckedListBox;
    procedure CnCheckedListBox1SelectedValueChanged(Sender: TObject;
      E: _EventArgs);
    procedure CnCheckedListBox1SelectedIndexChanged(Sender: TObject;
      E: _EventArgs);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

procedure TForm14.CnCheckedListBox1SelectedIndexChanged(Sender: TObject;
  E: _EventArgs);
begin
  TClrMessageBox.Show('SelectedIndexChanged')
end;

procedure TForm14.CnCheckedListBox1SelectedValueChanged(Sender: TObject;
  E: _EventArgs);
begin
  TClrMessageBox.Show('SelectedValueChanged')
end;

procedure TForm14.FormCreate(Sender: TObject);
begin
  CnCheckedListBox3.Add('.Net', TCheckState.csIndeterminate);
  CnCheckedListBox3.Add('Delphi', TCheckState.csUnchecked);
  CnCheckedListBox3.Add('C#', TCheckState.csIndeterminate);
  CnCheckedListBox3.Add('Java');
  CnCheckedListBox3.Add('VB6');
  CnCheckedListBox3.Add('VB.Net');
  CnCheckedListBox3.Add('Pascal');
end;

end.
