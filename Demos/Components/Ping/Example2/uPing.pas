unit uPing;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.TypInfo,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TypInfo,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.Base, CNClrLib.Component.Ping;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Memo1: TMemo;
    CnPing1: TCnPing;
    procedure CnPing1PingCompleted(sender: TObject; e: _PingCompletedEventArgs);   // When the PingCompleted event is raised, the PingCompletedCallback method is called.
    procedure Button2Click(Sender: TObject);
  private
    procedure DisplayReply(reply: _PingReply);
    procedure PingHostAsync(Host: String);
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses
{$IF CompilerVersion > 22}
  Winapi.ActiveX, System.Rtti,
{$ELSE}
  ActiveX, Rtti,
{$IFEND}
  CNClrlib.Core, CNClrlib.Host.Utils, CNClrlib.EnumArrays, CNClrlib.Host;

{$R *.dfm}

function GetStatus(AStatus: TOleEnum): TIPStatus;
begin
  Result := TIPStatus(OleEnumToOrd(IPStatusValues, AStatus));
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
  PingHostAsync(Edit1.Text);
end;

procedure TForm8.CnPing1PingCompleted(sender: TObject;
  e: _PingCompletedEventArgs);
var
  AutoResetEvent: _AutoResetEvent;
  reply: IPingReply;
begin
  AutoResetEvent := nil;
  // If the operation was canceled, display a message to the user.
  if e.Cancelled then
  begin
    Memo1.Lines.Add('Ping canceled.');

    // Let the main thread resume.
    // UserToken is the AutoResetEvent object that the main thread
    // is waiting for.
    AutoResetEvent := CoAutoResetEvent.Wrap(e.UserState);
    AutoResetEvent.Set_;
  end;

  // If an error occurred, display the exception to the user.
  if e.Error <> nil then
  begin
    Memo1.Lines.Add('Ping failed:');
    Memo1.Lines.Add(e.Error.ToString);

    // Let the main thread resume.
    AutoResetEvent := CoAutoResetEvent.Wrap(e.UserState);
    AutoResetEvent.Set_;
  end;

  DisplayReply(e.Reply);

  // Let the main thread resume.
  if AutoResetEvent = nil then
  begin
    AutoResetEvent := CoAutoResetEvent.Wrap(e.UserState);
    AutoResetEvent.Set_;
  end;
end;

procedure TForm8.DisplayReply(reply: _PingReply);
var
  status: TIPStatus;
begin
  if reply = nil then
    Exit;

  status := GetStatus(reply.Status);
  {$IF CompilerVersion > 23}
    Memo1.Lines.Add(Format('ping status: %s', [TRttiEnumerationType.GetName(status)]));
  {$ELSE}
    Memo1.Lines.Add(Format('ping status: %s', [GetEnumName(TypeInfo(TIPStatus), Ord(status))]));
  {$IFEND}
  if status = TIPStatus.ipsSuccess then
  begin
    Memo1.Lines.Add(Format('Address: %s', [reply.Address.ToString]));
    Memo1.Lines.Add(Format('RoundTrip time: %s', [IntToStr(reply.RoundtripTime)]));
    Memo1.Lines.Add(Format('Time to live: %s', [IntToStr(reply.Options.Ttl)]));
    Memo1.Lines.Add(Format('Don''t fragment: %s', [BoolToStr(reply.Options.DontFragment, True)]));
    Memo1.Lines.Add(Format('Buffer size: %s', [IntToStr(reply.Buffer.Length)]));
  end;
end;

procedure TForm8.PingHostAsync(Host: String);
var
  waiter: _AutoResetEvent;
  buffer: _ByteArray;
  data: String;
  timeout: Integer;
  options: _PingOptions;
begin
  if Host = '' then
    raise EClrArgumentNullException.Create('Host');

  waiter := CoAutoResetEvent.CreateInstance(false);

  // Create a buffer of 32 bytes of data to be transmitted.
  data := 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
  buffer := CoEncodingHelper.CreateInstance.ASCII.GetBytes_3(data);

  // Wait 12 seconds for a reply.
  timeout := 12000;

  // Set options for transmission:
  // The data can go through 64 gateways or routers
  // before it is destroyed, and the data packet
  // cannot be fragmented.
  options := TPingOptionsActivator.CreateInstance(64, true);

  Memo1.Lines.Add(Format('Time to live: %s', [IntToStr(options.Ttl)]));
  Memo1.Lines.Add(Format('Don''t fragment: %s', [boolToStr(options.DontFragment, True)]));

  // Send the ping asynchronously.
  // Use the waiter as the user token.
  // When the callback completes, it can wake up this thread.
  cnPing1.SendAsync(Host, timeout, buffer, options, waiter);

  // Prevent this example application from ending.
  // A real application should do something useful
  // when possible.
  waiter.WaitOne_2;
  Memo1.Lines.Add('Ping example completed.');
  Memo1.Lines.Add('==========================================');
  Memo1.Lines.Add('');
end;

end.
