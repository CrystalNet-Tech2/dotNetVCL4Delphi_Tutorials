unit uServiceController;

// The following example demonstrates the use of the TCnServiceController Component
// to control the SimpleService service example.

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.TypInfo,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TypInfo,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.Base, CNClrLib.Component.ServiceController,
  CNClrLib.Component.EventLog;

type
  TSimpleServiceCustomCommands = (ccStopWorker = 128, ccRestartWorker, ccCheckWorker);

  TfrmServiceCtrl = class(TForm)
    Button1: TButton;
    CnServiceController1: TCnServiceController;
    Memo1: TMemo;
    CnEventLog1: TCnEventLog;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServiceCtrl: TfrmServiceCtrl;

implementation

{$R *.dfm}

uses Rtti, CNClrLib.Host.Helper;

procedure TfrmServiceCtrl.Button1Click(Sender: TObject);
var
  scServices: _ServiceControllerArray;
  elec: _EventLogEntryCollection;
  I, X: Integer;
{$IF CompilerVersion <= 23}
  argArray: TArray<String>;
{$IFEND}
begin
  scServices := TCnServiceController.GetServices;
  for I := 0 to scServices.Length - 1 do
  begin
    if scServices[I].ServiceName = 'Simple Service' then
    begin
      // Display properties for the Simple Service sample
      // from the ServiceBase example.
      CnServiceController1.ServiceName := 'Simple Service';
  {$IF CompilerVersion > 23}
    Memo1.Lines.Add('Status = ' + TRttiEnumerationType.GetName(CnServiceController1.Status));
  {$ELSE}
    Memo1.Lines.Add('Status = ' + GetEnumName(TypeInfo(TServiceControllerStatus), Ord(CnServiceController1.Status)));
  {$IFEND}
      Memo1.Lines.Add('Can Pause and Continue = ' + BoolToStr(CnServiceController1.CanPauseAndContinue, True));
      Memo1.Lines.Add('Can ShutDown = ' +  BoolToStr(CnServiceController1.CanShutdown, True));
      Memo1.Lines.Add('Can Stop = ' +  BoolToStr(CnServiceController1.CanStop, True));
      if CnServiceController1.Status = TServiceControllerStatus.scsStopped then
      begin
        CnServiceController1.Start;
        while CnServiceController1.Status = TServiceControllerStatus.scsStopped do
        begin
          Sleep(1000);
          CnServiceController1.Refresh;
        end;
      end;
      // Issue custom commands to the service
      // enum TSimpleServiceCustomCommands
      //    (ccStopWorker = 128, ccRestartWorker, ccCheckWorker);
      CnServiceController1.ExecuteCommand(Ord(TSimpleServiceCustomCommands.ccStopWorker));
      CnServiceController1.ExecuteCommand(Ord(TSimpleServiceCustomCommands.ccRestartWorker));
      CnServiceController1.Pause();
      while CnServiceController1.Status <> TServiceControllerStatus.scsPaused do
      begin
        Sleep(1000);
        CnServiceController1.Refresh;
      end;
  {$IF CompilerVersion > 23}
    Memo1.Lines.Add('Status = ' + TRttiEnumerationType.GetName(CnServiceController1.Status));
  {$ELSE}
    Memo1.Lines.Add('Status = ' + GetEnumName(TypeInfo(TServiceControllerStatus), Ord(CnServiceController1.Status)));
  {$IFEND}

      CnServiceController1.Continue();
      while CnServiceController1.Status = TServiceControllerStatus.scsPaused do
      begin
        Sleep(1000);
        CnServiceController1.Refresh;
      end;
  {$IF CompilerVersion > 23}
      Memo1.Lines.Add('Status = ' + TRttiEnumerationType.GetName(CnServiceController1.Status));
  {$ELSE}
      Memo1.Lines.Add('Status = ' + GetEnumName(TypeInfo(TServiceControllerStatus), Ord(CnServiceController1.Status)));
  {$IFEND}

      CnServiceController1.Stop();
      while CnServiceController1.Status <> TServiceControllerStatus.scsStopped do
      begin
        Sleep(1000);
        CnServiceController1.Refresh;
      end;
  {$IF CompilerVersion > 23}
      Memo1.Lines.Add('Status = ' + TRttiEnumerationType.GetName(CnServiceController1.Status));

      CnServiceController1.Start(['ServiceController arg1', 'ServiceController arg2']);
  {$ELSE}
      Memo1.Lines.Add('Status = ' + GetEnumName(TypeInfo(TServiceControllerStatus), Ord(CnServiceController1.Status)));

      SetLength(argArray, 2);
      argArray[0] := 'ServiceController arg1';
      argArray[1] := 'ServiceController arg2';
      CnServiceController1.Start(argArray);
  {$IFEND}
      while CnServiceController1.Status = TServiceControllerStatus.scsStopped do
      begin
        Sleep(1000);
        CnServiceController1.Refresh;
      end;
  {$IF CompilerVersion > 23}
      Memo1.Lines.Add('Status = ' + TRttiEnumerationType.GetName(CnServiceController1.Status));
  {$ELSE}
      Memo1.Lines.Add('Status = ' + GetEnumName(TypeInfo(TServiceControllerStatus), Ord(CnServiceController1.Status)));
  {$IFEND}
      // Display the event log entries for the custom commands
      // and the start arguments.
      CnEventLog1.Log := 'Application';
      elec := CnEventLog1.Entries;
      for X := 0 to elec.Count - 1 do
      begin
        if (TClrStringHelper.IndexOf(elec[X].Source, 'SimpleService.OnCustomCommand') >= 0) or
           (TClrStringHelper.IndexOf(elec[X].Source,'SimpleService.Arguments') >= 0) then
        begin
          Memo1.Lines.Add(elec[X].Message);
        end;
      end;
      Memo1.Lines.Add('==============================================');
      Memo1.Lines.Add('');
    end;
  end;
end;

//Output
//=================================================================
// This sample displays the following output if the Simple Service
// sample is running:
//=================================================================
//Status = Running
//Can Pause and Continue = True
//Can ShutDown = True
//Can Stop = True
//Status = Paused
//Status = Running
//Status = Stopped
//Status = Running
//4:14:49 PM - Custom command received: 128
//4:14:49 PM - Custom command received: 129
//ServiceController arg1
//ServiceController arg2
//=================================================================
//

end.


