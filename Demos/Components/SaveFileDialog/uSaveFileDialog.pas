unit uSaveFileDialog;

//The following code example illustrates creating a SaveFileDialog, setting members,
//calling the dialog box using the ShowDialog method, and saving the current file.

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.Base, CNClrLib.Component.SaveFileDialog;

type
  TForm17 = class(TForm)
    Button1: TButton;
    CnSaveFileDialog1: TCnSaveFileDialog;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

uses CNClrLib.Core;

procedure TForm17.Button1Click(Sender: TObject);
var
  myStream: _Stream;
begin
  CnSaveFileDialog1.Filter := 'txt files (*.txt)|*.txt|All files (*.*)|*.*';
  CnSaveFileDialog1.FilterIndex := 2;
  CnSaveFileDialog1.RestoreDirectory := True;

  if CnSaveFileDialog1.ShowDialog = TDialogResult.drOK then
  begin
    myStream := CnSaveFileDialog1.OpenFile;
    if myStream <> nil then
    begin
      // Code to write the stream goes here.
      myStream.Close();
    end;
  end;
end;

end.
