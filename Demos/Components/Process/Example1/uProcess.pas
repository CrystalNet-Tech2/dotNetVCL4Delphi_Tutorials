unit uProcess;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.Base, CNClrLib.Component.Process,
  CNClrLib.Component.OpenFileDialog;

type
  TfrmProcess = class(TForm)
    CnProcess1: TCnProcess;
    btnOpenCalc: TButton;
    btnOpenNotepad: TButton;
    btnOpenCrystalNetWebSite: TButton;
    Button1: TButton;
    CnOpenFileDialog1: TCnOpenFileDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtText2Search: TEdit;
    Button2: TButton;
    Button3: TButton;
    btnOpenNoWindowFile: TButton;
    procedure btnOpenCalcClick(Sender: TObject);
    procedure btnOpenNotepadClick(Sender: TObject);
    procedure btnOpenCrystalNetWebSiteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnOpenNoWindowFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcess: TfrmProcess;

implementation

{$R *.dfm}

procedure TfrmProcess.btnOpenCalcClick(Sender: TObject);
begin
  CnProcess1.Start('calc.exe');
end;

procedure TfrmProcess.btnOpenCrystalNetWebSiteClick(Sender: TObject);
begin
  CnProcess1.Start('http://www.crystalnet-tech.com');
end;

procedure TfrmProcess.btnOpenNotepadClick(Sender: TObject);
begin
  CnProcess1.Start('notepad.exe');
end;

procedure TfrmProcess.btnOpenNoWindowFileClick(Sender: TObject);
begin
  try
    cnProcess1.StartInfo.UseShellExecute := false;
    // You can start any process, HelloWorld is a do-nothing example.
    cnProcess1.StartInfo.FileName := 'C:\\HelloWorld.exe';
    cnProcess1.StartInfo.CreateNoWindow := true;
    cnProcess1.Start();
    // This code assumes the process you are starting will terminate itself.
    // Given that is is started without a window so you cannot terminate it
    // on the desktop, it must terminate itself or you can do it programmatically
    // from this application using the Kill method.
  except
    on E: Exception do
      TClrMessageBox.Show(E.Message);
  end;
end;

procedure TfrmProcess.Button1Click(Sender: TObject);
begin
  if CnOpenFileDialog1.ShowDialog = TDialogResult.drOK then
    CnProcess1.Start(CnOpenFileDialog1.FileName);
end;

procedure TfrmProcess.Button2Click(Sender: TObject);
begin
  CnProcess1.Start('http://google.com/search?q=' + txtText2Search.Text);
end;

procedure TfrmProcess.Button3Click(Sender: TObject);
begin
  Close;
end;

end.
