unit BackgroundWorker;

{

  The following code example demonstrates the use of the BackgroundWorker class for
  executing a time-consuming operation asynchronously. The following illustration
  shows an example of the output.

  The operation computes the selected Fibonacci number, reports progress updates as
  the calculation proceeds, and permits a pending calculation to be canceled.

}

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,
{$IFEND}
  CNClrLib.Control.Base, CNClrLib.Component.BackgroundWorker, CNClrLib.Control.EnumTypes;

type
  TFibonacciForm = class(TForm)
    startAsyncButton: TButton;
    cancelAsyncButton: TButton;
    progressBar1: TProgressBar;
    EditValue: TEdit;
    resultLabel: TLabel;
    CnBackgroundWorker1: TCnBackgroundWorker;
    procedure CnBackgroundWorker1DoWork(Sender: TObject; E: _DoWorkEventArgs);
    procedure CnBackgroundWorker1ProgressChanged(Sender: TObject;
      E: _ProgressChangedEventArgs);
    procedure CnBackgroundWorker1RunWorkerCompleted(Sender: TObject;
      E: _RunWorkerCompletedEventArgs);
    procedure startAsyncButtonClick(Sender: TObject);
    procedure cancelAsyncButtonClick(Sender: TObject);
  private
    FNumberToCompute: Integer;
    FHighestPercentageReached: Integer;
    function ComputeFibonacci(n: Integer; worker: TCnBackgroundWorker; e: _DoWorkEventArgs): Int64;
  public
    { Public declarations }
  end;

var
  FibonacciForm: TFibonacciForm;

implementation

uses CNClrLib.Host.Helper;

{$R *.dfm}

// This is the method that does the actual work. For this
// example, it computes a Fibonacci number and
// reports progress as it does its work.
function TFibonacciForm.ComputeFibonacci(n: Integer; worker: TCnBackgroundWorker; e: _DoWorkEventArgs): Int64;
var
  percentComplete: Integer;
begin
  // The parameter n must be >= 0 and <= 91.
  // Fib(n), with n > 91, overflows a long.
  if (n < 0) or (n > 91) then
    raise EArgumentException.Create('value [n] must be >= 0 and <= 91');

    Result := 0;

  // Abort the operation if the user has canceled.
  // Note that a call to CancelAsync may have set
  // CancellationPending to true just after the
  // last invocation of this method exits, so this
  // code will not have the opportunity to set the
  // DoWorkEventArgs.Cancel flag to true. This means
  // that RunWorkerCompletedEventArgs.Cancelled will
  // not be set to true in your RunWorkerCompleted
  // event handler. This is a race condition.
  if worker.CancellationPending then
  begin
    e.Cancel := True;
  end
  else
  begin
    if n < 2 then
    begin
      result := 1;
    end
    else
    begin
      Result := ComputeFibonacci(n - 1, worker, e) +
                ComputeFibonacci(n - 2, worker, e);
    end;

    // Report progress as a percentage of the total task.
    percentComplete := TClrConvert.ToInt32((n / FNumberToCompute * 100));
    if percentComplete > FHighestPercentageReached then
    begin
      FHighestPercentageReached := percentComplete;
      worker.ReportProgress(percentComplete);
    end;
  end;
end;


procedure TFibonacciForm.cancelAsyncButtonClick(Sender: TObject);
begin
  // Cancel the asynchronous operation.
  Self.CnBackgroundWorker1.CancelAsync();

  // Disable the Cancel button.
  cancelAsyncButton.Enabled := false;
end;

// This event handler is where the actual,
// potentially time-consuming work is done.
procedure TFibonacciForm.CnBackgroundWorker1DoWork(Sender: TObject;
  E: _DoWorkEventArgs);
var
  worker: TCnBackgroundWorker;
begin
  // Get the BackgroundWorker that raised this event.
  worker := sender as TCnBackgroundWorker;

  // Assign the result of the computation
  // to the Result property of the DoWorkEventArgs
  // object. This is will be available to the
  // RunWorkerCompleted eventhandler.
  E.Result_ := ComputeFibonacci(e.Argument, worker, e);
end;

// This event handler updates the progress bar.
procedure TFibonacciForm.CnBackgroundWorker1ProgressChanged(Sender: TObject;
  E: _ProgressChangedEventArgs);
begin
  progressBar1.Position := E.ProgressPercentage;
end;

// This event handler deals with the results of the
// background operation.
procedure TFibonacciForm.CnBackgroundWorker1RunWorkerCompleted(Sender: TObject;
  E: _RunWorkerCompletedEventArgs);
begin
  // First, handle the case where an exception was thrown.
  if E.Error <> nil then
  begin
    TClrMessageBox.Show(e.Error.Message);
  end
  else if E.Cancelled then
  begin
    // Next, handle the case where the user canceled
    // the operation.
    // Note that due to a race condition in
    // the DoWork event handler, the Cancelled
    // flag may not have been set, even though
    // CancelAsync was called.
    resultLabel.Caption := 'Canceled';
  end
  else
  begin
    // Finally, handle the case where the operation
    // succeeded.
    resultLabel.Caption := E.Result_;
  end;

  // Enable the UpDown control.
  EditValue.Enabled := true;

  // Enable the Start button.
  startAsyncButton.Enabled := true;

  // Disable the Cancel button.
  cancelAsyncButton.Enabled := false;
end;

procedure TFibonacciForm.startAsyncButtonClick(Sender: TObject);
begin
  try
    // Reset the text in the result label.
    resultLabel.Caption := '';

    // Disable the UpDown control until
    // the asynchronous operation is done.
    Self.EditValue.Enabled := false;

    // Disable the Start button until
    // the asynchronous operation is done.
    Self.startAsyncButton.Enabled := false;

    // Enable the Cancel button while
    // the asynchronous operation runs.
    Self.cancelAsyncButton.Enabled := true;

    // Get the value from the UpDown control.
    FNumberToCompute := StrToInt(EditValue.Text);

    // Reset the variable for percentage tracking.
    FHighestPercentageReached := 0;

    // Start the asynchronous operation.
    CnBackgroundWorker1.RunWorkerAsync(FNumberToCompute);
  except
    on E: Exception do
      TClrMessageBox.Show(E.Message, Caption, TMessageBoxButtons.mbbsOK, TMessageBoxIcon.mbiError);
  end;
end;

end.
