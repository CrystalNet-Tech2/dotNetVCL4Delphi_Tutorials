unit uEventLog;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.Base, CNClrLib.Component.EventLog;

type
  TfrmEventLog = class(TForm)
    btnCreateEventSource: TButton;
    CnEventLog1: TCnEventLog;
    btnRaiseOnEntryWrittenEvent: TButton;
    CnEventLog2: TCnEventLog;
    btnWriteEntry: TButton;
    btnStopEvent: TButton;
    procedure btnCreateEventSourceClick(Sender: TObject);
    procedure CnEventLog2EntryWritten(Sender: TObject;
      E: _EntryWrittenEventArgs);
    procedure btnRaiseOnEntryWrittenEventClick(Sender: TObject);
    procedure btnStopEventClick(Sender: TObject);
    procedure btnWriteEntryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEventLog: TfrmEventLog;

implementation

{$R *.dfm}

// The following example creates the event source MySource if it doesn't already
// exist, and writes an entry to the event log MyNewLog.
procedure TfrmEventLog.btnCreateEventSourceClick(Sender: TObject);
begin
  // Create the source, if it does not already exist.
  if not TCnEventLog.SourceExists('MySource') then
  begin
    //An event log source should not be created and immediately used.
    //There is a latency time to enable the source, it should be created
    //prior to executing the application that uses the source.
    //Execute this sample a second time to use the new source.
    TCnEventLog.CreateEventSource('MySource', 'MyNewLog');
    TClrMessageBox.Show('Exiting, execute the application a second time to use the source.', 'CreatedEventSource');

    // The source is created.  Exit the application to allow it to be registered.
    Exit;
  end;

  // Assign a source to the instance of TCnEventLog.
  CnEventLog1.Source := 'MySource';

  // Write an informational entry to the event log.
  CnEventLog1.WriteEntry('Writing to event log.');
  TClrMessageBox.Show('Informational entry has been written to the event log');
end;
//====

// The following example handles an EntryWritten event.
procedure TfrmEventLog.btnRaiseOnEntryWrittenEventClick(Sender: TObject);
begin
  CnEventLog2.EnableRaisingEvents := True;
  btnWriteEntry.Enabled := True;
  btnStopEvent.Enabled := True;
  btnRaiseOnEntryWrittenEvent.Enabled := False;
end;
//====

procedure TfrmEventLog.btnStopEventClick(Sender: TObject);
begin
  CnEventLog2.EnableRaisingEvents := False;
  btnWriteEntry.Enabled := False;
  btnStopEvent.Enabled := False;
  btnRaiseOnEntryWrittenEvent.Enabled := True;
end;

procedure TfrmEventLog.btnWriteEntryClick(Sender: TObject);
begin
  CnEventLog1.WriteEntry('Writing to event log.');
end;

procedure TfrmEventLog.CnEventLog2EntryWritten(Sender: TObject;
  E: _EntryWrittenEventArgs);
begin
  TClrMessageBox.Show('Written: '+ E.Entry.Message);
end;

end.
