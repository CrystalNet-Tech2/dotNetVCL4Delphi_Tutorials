unit uComboBoxes;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.ListControl, CNClrLib.Control.ComboBox;

type
  TForm8 = class(TForm)
    CnComboBox1: TCnComboBox;
    CnComboBox2: TCnComboBox;
    CnComboBox3: TCnComboBox;
    CnComboBox4: TCnComboBox;
    CnComboBox5: TCnComboBox;
    procedure CnComboBox4DropDown(Sender: TObject; E: _EventArgs);
    procedure CnComboBox4DropDownClosed(Sender: TObject; E: _EventArgs);
    procedure CnComboBox4SelectedIndexChanged(Sender: TObject; E: _EventArgs);
    procedure CnComboBox4SelectedValueChanged(Sender: TObject; E: _EventArgs);
    procedure CnComboBox1TextUpdate(Sender: TObject; E: _EventArgs);
    procedure CnComboBox1TextChanged(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.CnComboBox1TextChanged(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnTextChanged Event')
end;

procedure TForm8.CnComboBox1TextUpdate(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnTextUpdate Event')
end;

procedure TForm8.CnComboBox4DropDown(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnDropDown Event')
end;

procedure TForm8.CnComboBox4DropDownClosed(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('OnDropDownClosed Event')
end;

procedure TForm8.CnComboBox4SelectedIndexChanged(Sender: TObject;
  E: _EventArgs);
begin
  TClrMessageBox.Show('OnSelectedIndexChanged Event')
end;

procedure TForm8.CnComboBox4SelectedValueChanged(Sender: TObject;
  E: _EventArgs);
begin
  TClrMessageBox.Show('OnSelectedValueChanged Event')
end;

end.
