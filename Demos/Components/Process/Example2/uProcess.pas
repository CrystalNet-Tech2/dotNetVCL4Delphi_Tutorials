unit uProcess;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Component.OpenFileDialog, CNClrLib.Control.Base, CNClrLib.Control.EnumTypes,
  CNClrLib.Component.Process;

type
  TfrmProcess = class(TForm)
    CnProcess1: TCnProcess;
    CnOpenFileDialog1: TCnOpenFileDialog;
    btnPrintDoc: TButton;
    procedure btnPrintDocClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcess: TfrmProcess;

implementation

uses CNClrLib.Host, CNClrLib.Core, CNClrLib.ComponentModel;

{$R *.dfm}

/// Prints a file
procedure TfrmProcess.btnPrintDocClick(Sender: TObject);
const
// These are the Win32 error code for file not found or access denied.
  ERROR_FILE_NOT_FOUND = 2;
  ERROR_ACCESS_DENIED  = 5;

var
  clrEx: EClrException;
  win32Ex: _Win32Exception;
begin
  if CnOpenFileDialog1.ShowDialog <> TDialogResult.drOK then
  begin
    TClrMessageBox.Show('The operation was canceled by the user.');
    Exit;
  end;

  try
    cnProcess1.StartInfo.FileName := CnOpenFileDialog1.FileName;
    cnProcess1.StartInfo.Verb := 'Print';
    cnProcess1.StartInfo.CreateNoWindow := True;
    cnProcess1.Start;
  except
    clrEx := EClrException.GetLastClrException;
    try
      if clrEx.IsTypeOf('System.ComponentModel.Win32Exception') then
      begin
        win32Ex := CoWin32Exception.Wrap(clrEx.DefaultInterface);
        if win32Ex.NativeErrorCode = ERROR_FILE_NOT_FOUND then
          TClrMessageBox.Show(win32Ex.Message + '. Check the path.')
        else if win32Ex.NativeErrorCode = ERROR_ACCESS_DENIED then
        begin
          // Note that if your word processor might generate exceptions such as this, which are handled first.
          TClrMessageBox.Show(win32Ex.Message + '. You do not have permission to print this file.');
        end;
      end;
    finally
      clrEx.Free;
    end;
  end;
end;

end.
