unit uFileSystemWatcher;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.Base, CNClrLib.Component.FileSystemWatcher,
  CNClrLib.Component.FolderBrowserDialog;

type
  TfrmFileSystemWatcher = class(TForm)
    CnFileSystemWatcher1: TCnFileSystemWatcher;
    btnStart: TButton;
    btnStop: TButton;
    GroupBox1: TGroupBox;
    chkFilename: TCheckBox;
    chkAttributes: TCheckBox;
    chkDirectoryName: TCheckBox;
    chkCreationTime: TCheckBox;
    chkSize: TCheckBox;
    chkLastAccess: TCheckBox;
    chkLastWrite: TCheckBox;
    Label1: TLabel;
    txtPath: TEdit;
    chkIncludeSubDir: TCheckBox;
    Label2: TLabel;
    txtFilter: TEdit;
    btnBrowse: TButton;
    CnFolderBrowserDialog1: TCnFolderBrowserDialog;
    GroupBox2: TGroupBox;
    btnClose: TButton;
    MemoLog: TMemo;
    procedure btnCloseClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure txtPathChange(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure txtFilterChange(Sender: TObject);
    procedure chkIncludeSubDirClick(Sender: TObject);
    procedure chkFilenameClick(Sender: TObject);
    procedure chkDirectoryNameClick(Sender: TObject);
    procedure chkAttributesClick(Sender: TObject);
    procedure chkSizeClick(Sender: TObject);
    procedure chkLastWriteClick(Sender: TObject);
    procedure chkLastAccessClick(Sender: TObject);
    procedure chkCreationTimeClick(Sender: TObject);
    procedure CnFileSystemWatcher1Changed(Sender: TObject;
      E: _FileSystemEventArgs);
    procedure CnFileSystemWatcher1Created(Sender: TObject;
      E: _FileSystemEventArgs);
    procedure CnFileSystemWatcher1Deleted(Sender: TObject;
      E: _FileSystemEventArgs);
    procedure CnFileSystemWatcher1Renamed(Sender: TObject;
      E: _RenamedEventArgs);
  private
    procedure EnableRaisingEvents(AEnable: Boolean);
  public
    { Public declarations }
  end;

var
  frmFileSystemWatcher: TfrmFileSystemWatcher;

implementation

{$R *.dfm}

uses CNClrLib.Enums;

procedure TfrmFileSystemWatcher.btnBrowseClick(Sender: TObject);
begin
  if CnFolderBrowserDialog1.ShowDialog = TDialogResult.drOK then
    txtPath.Text := CnFolderBrowserDialog1.SelectedPath;
end;

procedure TfrmFileSystemWatcher.btnCloseClick(Sender: TObject);
begin
  CnFileSystemWatcher1.EnableRaisingEvents := False;
  Close;
end;

procedure TfrmFileSystemWatcher.btnStartClick(Sender: TObject);
begin
  EnableRaisingEvents(True);
end;

procedure TfrmFileSystemWatcher.btnStopClick(Sender: TObject);
begin
  EnableRaisingEvents(False);
end;

procedure TfrmFileSystemWatcher.chkAttributesClick(Sender: TObject);
begin
  if chkAttributes.Checked then
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter + [TNotifyFilters.nfAttributes]
  else
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter - [TNotifyFilters.nfAttributes];
end;

procedure TfrmFileSystemWatcher.chkCreationTimeClick(Sender: TObject);
begin
  if chkCreationTime.Checked then
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter + [TNotifyFilters.nfCreationTime]
  else
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter - [TNotifyFilters.nfCreationTime];
end;

procedure TfrmFileSystemWatcher.chkDirectoryNameClick(Sender: TObject);
begin
  if chkDirectoryName.Checked then
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter + [TNotifyFilters.nfDirectoryName]
  else
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter - [TNotifyFilters.nfDirectoryName];
end;

procedure TfrmFileSystemWatcher.chkFilenameClick(Sender: TObject);
begin
  if chkFilename.Checked then
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter + [TNotifyFilters.nfFileName]
  else
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter - [TNotifyFilters.nfFileName];
end;

procedure TfrmFileSystemWatcher.chkIncludeSubDirClick(Sender: TObject);
begin
  CnFileSystemWatcher1.IncludeSubdirectories := chkIncludeSubDir.Checked;
end;

procedure TfrmFileSystemWatcher.chkLastAccessClick(Sender: TObject);
begin
  if chkLastAccess.Checked then
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter + [TNotifyFilters.nfLastAccess]
  else
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter - [TNotifyFilters.nfLastAccess];
end;

procedure TfrmFileSystemWatcher.chkLastWriteClick(Sender: TObject);
begin
  if chkLastWrite.Checked then
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter + [TNotifyFilters.nfLastWrite]
  else
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter - [TNotifyFilters.nfLastWrite];
end;

procedure TfrmFileSystemWatcher.chkSizeClick(Sender: TObject);
begin
  if chkSize.Checked then
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter + [TNotifyFilters.nfSize]
  else
    CnFileSystemWatcher1.NotifyFilter := CnFileSystemWatcher1.NotifyFilter - [TNotifyFilters.nfSize];
end;

procedure TfrmFileSystemWatcher.CnFileSystemWatcher1Changed(Sender: TObject;
  E: _FileSystemEventArgs);
var
  strChangeType: String;
begin
  case E.ChangeType of
    WatcherChangeTypes_Created: strChangeType := 'Created';
    WatcherChangeTypes_Deleted: strChangeType := 'Deleted';
    WatcherChangeTypes_Changed: strChangeType := 'Changed';
    WatcherChangeTypes_Renamed: strChangeType := 'Renamed';
  else
    strChangeType := 'Created, Deleted, Changed, Renamed';
  end;

  // Specify what is done when a file is changed, created, or deleted.
  MemoLog.Lines.Add('File: ' +  E.FullPath + ' ' + strChangeType);
  MemoLog.Lines.Add('');
end;

procedure TfrmFileSystemWatcher.CnFileSystemWatcher1Created(Sender: TObject;
  E: _FileSystemEventArgs);
begin
  // Specify what is done when a file is created.
  MemoLog.Lines.Add('File: ' +  E.FullPath + ' has been created)');
  MemoLog.Lines.Add('');
end;

procedure TfrmFileSystemWatcher.CnFileSystemWatcher1Deleted(Sender: TObject;
  E: _FileSystemEventArgs);
begin
  // Specify what is done when a file is deleted.
  MemoLog.Lines.Add('File: ' +  E.FullPath + ' has been deleted)');
  MemoLog.Lines.Add('');
end;

procedure TfrmFileSystemWatcher.CnFileSystemWatcher1Renamed(Sender: TObject;
  E: _RenamedEventArgs);
begin
  // Specify what is done when a file is renamed.
  MemoLog.Lines.Add(Format('File: %s renamed to %s', [E.OldFullPath, E.FullPath]));
end;

procedure TfrmFileSystemWatcher.EnableRaisingEvents(AEnable: Boolean);
begin
  CnFileSystemWatcher1.EnableRaisingEvents := AEnable;
  btnStart.Enabled := not AEnable;
  btnStop.Enabled := AEnable;
  GroupBox1.Enabled := not AEnable;
  btnBrowse.Enabled := not AEnable;
  txtPath.Enabled := not AEnable;
  chkIncludeSubDir.Enabled := not AEnable;
end;

procedure TfrmFileSystemWatcher.txtFilterChange(Sender: TObject);
begin
  CnFileSystemWatcher1.Filter := txtFilter.Text;
end;

procedure TfrmFileSystemWatcher.txtPathChange(Sender: TObject);
begin
  CnFileSystemWatcher1.Path := '';
  if DirectoryExists(txtPath.Text) then
    CnFileSystemWatcher1.Path := txtPath.Text;
end;

end.
