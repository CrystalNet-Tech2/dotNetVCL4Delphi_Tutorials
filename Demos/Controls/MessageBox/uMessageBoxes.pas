unit uMessageBoxes;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.ButtonBase, CNClrLib.Control.Button;

type
  TForm22 = class(TForm)
    CnButton1: TCnButton;
    CnButton2: TCnButton;
    CnButton3: TCnButton;
    CnButton4: TCnButton;
    CnButton5: TCnButton;
    CnButton6: TCnButton;
    procedure CnButton1Click(Sender: TObject; E: _EventArgs);
    procedure CnButton2Click(Sender: TObject; E: _EventArgs);
    procedure CnButton3Click(Sender: TObject; E: _EventArgs);
    procedure CnButton6Click(Sender: TObject; E: _EventArgs);
    procedure CnButton5Click(Sender: TObject; E: _EventArgs);
    procedure CnButton4Click(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

{$R *.dfm}

procedure TForm22.CnButton1Click(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('CrystalNet .Net Controls in Delphi is awesome.', '.Net MessageBox');
end;

procedure TForm22.CnButton2Click(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('CrystalNet .Net Controls in Delphi is awesome.');
end;

procedure TForm22.CnButton3Click(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show(Self, 'CrystalNet .Net Controls in Delphi is awesome.',  '.Net MessageBox');
end;

procedure TForm22.CnButton4Click(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show('Error detected in the problem.', 'Error', TMessageBoxButtons.mbbsOK, TMessageBoxIcon.mbiError);
end;

procedure TForm22.CnButton5Click(Sender: TObject; E: _EventArgs);
var
  m_dialogResult: TDialogResult;
begin
  m_dialogResult := TClrMessageBox.Show('Is CrystalNet .Net Controls in Delphi awesome?',
    'Important Query', TMessageBoxButtons.mbbsYesNoCancel, TMessageBoxIcon.mbiQuestion);

  if m_dialogResult = TDialogResult.drYes then
  begin
    TClrMessageBox.Show('You answered yes.');
  end
  else if m_dialogResult = TDialogResult.drCancel then
  begin
    TClrMessageBox.Show('You cancelled the query.');
  end
  else
  begin
    TClrMessageBox.Show('You answered no.');
  end;
end;

procedure TForm22.CnButton6Click(Sender: TObject; E: _EventArgs);
var
  m_dialogResult: TDialogResult;
begin
  m_dialogResult := TClrMessageBox.Show('Is CrystalNet .Net Controls in Delphi awesome?',
    'Important Question', TMessageBoxButtons.mbbsYesNo);

  if m_dialogResult = TDialogResult.drYes then
  begin
    TClrMessageBox.Show('You answered yes.');
  end
  else
  begin
    TClrMessageBox.Show('You answered no.');
  end;
end;

end.
