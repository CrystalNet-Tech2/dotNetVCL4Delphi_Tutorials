unit BackgroundWorker;

{

  The following code example demonstrates the basics of the BackgroundWorker class
  for executing a time-consuming operation asynchronously. The following illustration
  shows an example of the output.

}

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.Base, CNClrLib.Component.BackgroundWorker;

type
  TForm12 = class(TForm)
    startAsyncButton: TButton;
    cancelAsyncButton: TButton;
    resultLabel: TLabel;
    CnBackgroundWorker1: TCnBackgroundWorker;
    procedure startAsyncButtonClick(Sender: TObject);
    procedure cancelAsyncButtonClick(Sender: TObject);
    procedure CnBackgroundWorker1DoWork(Sender: TObject; E: _DoWorkEventArgs);
    procedure CnBackgroundWorker1ProgressChanged(Sender: TObject;
      E: _ProgressChangedEventArgs);
    procedure CnBackgroundWorker1RunWorkerCompleted(Sender: TObject;
      E: _RunWorkerCompletedEventArgs);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

procedure TForm12.cancelAsyncButtonClick(Sender: TObject);
begin
  if CnBackgroundWorker1.WorkerSupportsCancellation then
  begin
    // Cancel the asynchronous operation.
    CnBackgroundWorker1.CancelAsync();
  end;
end;

procedure TForm12.CnBackgroundWorker1DoWork(Sender: TObject;
  E: _DoWorkEventArgs);
var
  worker: TCnBackgroundWorker;
  I: Integer;
begin
  worker := Sender as TCnBackgroundWorker;

  for I := 0 to 10 do
  begin
    if worker.CancellationPending then
    begin
      E.Cancel := True;
      Break;
    end
    else
    begin
      // Perform a time consuming operation and report progress.
      Sleep(500);
      worker.ReportProgress(I * 10);
    end;
  end;
end;

procedure TForm12.CnBackgroundWorker1ProgressChanged(Sender: TObject;
  E: _ProgressChangedEventArgs);
begin
 resultLabel.Caption := (IntToStr(E.ProgressPercentage) + '%');
end;

procedure TForm12.CnBackgroundWorker1RunWorkerCompleted(Sender: TObject;
  E: _RunWorkerCompletedEventArgs);
begin
  if e.Cancelled then
    resultLabel.Caption := 'Canceled!'
  else if e.Error <> nil then
    resultLabel.Caption := 'Error: ' + e.Error.Message
  else
    resultLabel.Caption := 'Done!';
end;

procedure TForm12.FormCreate(Sender: TObject);
begin
  CnBackgroundWorker1.WorkerReportsProgress := true;
  CnBackgroundWorker1.WorkerSupportsCancellation := true;
end;

procedure TForm12.startAsyncButtonClick(Sender: TObject);
begin
  if not CnBackgroundWorker1.IsBusy then
  begin
    // Start the asynchronous operation.
    CnBackgroundWorker1.RunWorkerAsync();
  end;
end;

end.
