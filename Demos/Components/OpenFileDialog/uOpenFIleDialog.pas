unit uOpenFIleDialog;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.Base, CNClrLib.Component.OpenFileDialog;

type
  TForm18 = class(TForm)
    Button1: TButton;
    CnOpenFileDialog1: TCnOpenFileDialog;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

{$R *.dfm}

uses CNClrLib.Core;

procedure TForm18.Button1Click(Sender: TObject);
var
  fileContent,
  filePath: String;
  fileStream: _Stream;
  reader: _StreamReader;
begin
  CnOpenFileDialog1.InitialDirectory := 'c:\\';
  CnOpenFileDialog1.Filter := 'txt files (*.txt)|*.txt|All files (*.*)|*.*';
  CnOpenFileDialog1.FilterIndex := 2;
  CnOpenFileDialog1.RestoreDirectory := True;

  if CnOpenFileDialog1.ShowDialog = TDialogResult.drOK then
  begin
    //Get the path of specified file
    filePath := CnOpenFileDialog1.FileName;

    //Read the contents of the file into a stream
    fileStream := CnOpenFileDialog1.OpenFile();

    reader := CoStreamReader.CreateInstance(fileStream);
    try
      fileContent := reader.ReadToEnd();
    finally
      reader.Close;
      reader.Dispose;
      reader := nil;
    end;

    TClrMessageBox.Show(fileContent, 'File Content at path: ' + filePath, TMessageBoxButtons.mbbsOK);
  end;
end;

end.
