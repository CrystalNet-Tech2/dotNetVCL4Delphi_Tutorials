unit uApplication;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.ButtonBase, CNClrLib.Control.Button, CNClrLib.Control.CheckBox,
  CNClrLib.Control.LabelA;

type
  TForm20 = class(TForm)
    CnButton1: TCnButton;
    CnCheckBox1: TCnCheckBox;
    CnCheckBox2: TCnCheckBox;
    CnButton2: TCnButton;
    CnLabel1: TCnLabel;
    CnLabel2: TCnLabel;
    procedure CnButton1Click(Sender: TObject; E: _EventArgs);
    procedure CnCheckBox2CheckedChanged(Sender: TObject; E: _EventArgs);
    procedure CnButton2Click(Sender: TObject; E: _EventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

{$R *.dfm}

procedure TForm20.CnButton1Click(Sender: TObject; E: _EventArgs);
var
  i: Integer;
begin
  i := 0;
  CnCheckBox1.Checked := False;
  while True do
  begin
    Inc(i);
    CnLabel1.Text := IntToStr(i);
    //Application.ProcessMessages; //Extremely slow with the Delphi option.
    TClrApplication.DoEvents;
    if CnCheckBox1.Checked then
      Break;
  end;

  if CnCheckBox1.Checked then
    TClrMessageBox.Show('Cancelled.')
  else
    TClrMessageBox.Show('Done.');
end;

procedure TForm20.CnButton2Click(Sender: TObject; E: _EventArgs);
var
  m_propMessages: String;
begin
  m_propMessages := 'AllowQuit: ' + BoolToStr(TClrApplication.AllowQuit, True) + #13#10;
  m_propMessages := m_propMessages + 'CommonAppDataPath: ' + TClrApplication.CommonAppDataPath + #13#10;
  m_propMessages := m_propMessages + 'CompanyName: ' + TClrApplication.CompanyName + #13#10;
  m_propMessages := m_propMessages + 'CurrentCulture: ' + TClrApplication.CurrentCulture.ToString + #13#10;
  m_propMessages := m_propMessages + 'ExecutablePath: ' + TClrApplication.ExecutablePath + #13#10;
  m_propMessages := m_propMessages + 'LocalUserAppDataPath: ' + TClrApplication.LocalUserAppDataPath + #13#10;
  m_propMessages := m_propMessages + 'MessageLoop: ' + BoolToStr(TClrApplication.MessageLoop, True) + #13#10;
  m_propMessages := m_propMessages + 'ProductName: ' + TClrApplication.ProductName + #13#10;
  m_propMessages := m_propMessages + 'ProductVersion: ' + TClrApplication.ProductVersion + #13#10;
  m_propMessages := m_propMessages + 'RenderWithVisualStyles: ' + BoolToStr(TClrApplication.RenderWithVisualStyles, True) + #13#10;
  m_propMessages := m_propMessages + 'SafeTopLevelCaptionFormat: ' + TClrApplication.SafeTopLevelCaptionFormat + #13#10;
  m_propMessages := m_propMessages + 'StartupPath: ' + TClrApplication.StartupPath + #13#10;
  m_propMessages := m_propMessages + 'UserAppDataPath: ' + TClrApplication.UserAppDataPath + #13#10;
  m_propMessages := m_propMessages + 'UserAppDataRegistry: ' + TClrApplication.UserAppDataRegistry.ToString;

  TClrMessageBox.Show(m_propMessages, '.Net Application properties Info');
end;

procedure TForm20.CnCheckBox2CheckedChanged(Sender: TObject; E: _EventArgs);
begin
  if CnCheckBox2.Checked then
    TClrApplication.VisualStyleState := TVisualStyleState.vssNoneEnabled
  else
    TClrApplication.VisualStyleState := TVisualStyleState.vssClientAndNonClientAreasEnabled;
end;

end.
