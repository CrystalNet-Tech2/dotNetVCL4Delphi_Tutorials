unit uFolderBrowserDialog;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.Base, CNClrLib.Component.FolderBrowserDialog;

type
  TForm19 = class(TForm)
    btnBrowseFolder: TButton;
    Edit1: TEdit;
    CnFolderBrowserDialog1: TCnFolderBrowserDialog;
    procedure btnBrowseFolderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

{$R *.dfm}

procedure TForm19.btnBrowseFolderClick(Sender: TObject);
begin
  // folderBrowserDialog will open
  if CnFolderBrowserDialog1.ShowDialog() = TDialogResult.drOK then
  begin
    //selected pathe in folderBrowserDialog will show in textbox
    Edit1.Text := CnFolderBrowserDialog1.SelectedPath;
  end;
end;

end.
