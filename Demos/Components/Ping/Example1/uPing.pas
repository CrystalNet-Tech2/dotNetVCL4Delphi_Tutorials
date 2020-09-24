unit uPing;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.TypInfo,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  TypInfo,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.Base, CNClrLib.Component.Ping;

type
  TfrmPing = class(TForm)
    CnPing1: TCnPing;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    function PingHost(host: string): String;
    function PingHostAsync(host: string): String;
  public
    { Public declarations }
  end;

var
  frmPing: TfrmPing;

implementation

{$R *.dfm}

// Note: Example in C#; https://stephenhaunts.com/2014/06/20/code-example-pinging-a-remote-computer/

uses CNClrLib.Host, CNClrLib.Net, Rtti;

function GetIpFromHost(host: string): _IPAddress;
begin
  Result := CoDns.CreateInstance.GetHostEntry(host).AddressList[0];
end;


procedure TfrmPing.Button1Click(Sender: TObject);
var
  reply: String;
begin
  reply := PingHost(Edit1.Text);
  TClrMessageBox.Show(reply, 'Ping Example');
end;

function TfrmPing.PingHostAsync(host: string): String;
var
  address: _IPAddress;
  tasks: _GenericTask;
  pingReply: _PingReply;
begin
  if host = '' then
    raise EClrArgumentNullException.Create('host');

  //IPAddress instance for holding the returned host
  address := GetIpFromHost(host);

  // Send a ping.
  tasks := cnPing1.SendPingAsync(address);
  tasks.Wait;

  pingReply := CoPingReply.Wrap(tasks.Result_);

  Result := Format('Reply from %s: time=%sms', [pingReply.Address.ToString, IntToStr(pingReply.RoundtripTime)]);
end;

procedure TfrmPing.Button2Click(Sender: TObject);
var
  reply: String;
begin
  reply := PingHostAsync(Edit1.Text);
  TClrMessageBox.Show(reply, 'Ping Example');
end;

function TfrmPing.PingHost(host: string): String;
var
  address: _IPAddress;
  pingOptions: _PingOptions;
  buffer: TArray<Byte>;
  clrEx: EClrException;
  pingReply: IPingReply;
  I: Integer;
begin
  if host = '' then
    raise EClrArgumentNullException.Create('host');

  Result := EmptyStr;
  try
    //IPAddress instance for holding the returned host
    address := GetIpFromHost(host);

    //set the ping options, TTL 128
    pingOptions := CoPingOptions.CreateInstance(128, True);

    //32 byte buffer (create empty)
    SetLength(buffer, 32);

    //Since a normal ping (from a Windows based computer) send 4 pings we will do the same.
    //We will do this in a for loop, each time calling Send and checking the PingReply status.
    //When doing this we will be checking the IPStatus returned from our Ping.
    for I := 0 to 3 do
    begin
      try
        //send the ping 4 times to the host and record the returned data.
        //The Send() method expects 4 items:
        //1) The IPAddress we are pinging
        //2) The timeout value
        //3) A buffer (our byte array)
        //4) PingOptions
        pingReply := cnPing1.Send(address, 5000, buffer, pingOptions);

        //make sure we dont have a null reply
        if pingReply <> nil then
        begin
          case pingReply.Status of
            TIPStatus.ipsSuccess:
              begin
                Result := Result + Format('Reply from %s: bytes=%s time=%sms TTL=%s' + #13#10,
                  [pingReply.Address.ToString, IntToStr(Length(pingReply.Buffer)), IntToStr(pingReply.RoundtripTime),
                   IntToStr(pingReply.Options.Ttl)]);
              end;
            TIPStatus.ipsTimedOut:
              begin
                Result := 'Connection has timed out...';
              end;
          else
          {$IF CompilerVersion > 23}
              Result := Format('Ping failed: %s', [TRttiEnumerationType.GetName(pingReply.Status)]);
          {$ELSE}
              Result := Format('Ping failed: %s', [GetEnumName(TypeInfo(TIPStatus), Ord(pingReply.Status))]);
          {$IFEND}
          end;
        end
        else
        begin
          Result := 'Connection failed for an unknown reason...';
        end;
      except
        //Get the last exception thrown in the runtime library.
        clrEx := EClrException.GetLastClrException;
        try
          if clrEx.IsTypeOf('System.Net.NetworkInformation.PingException') then
          begin
            Result := Format('Connection Error: %s', [clrEx.Message]);
            Break;
          end
          else if clrEx.IsTypeOf('System.Net.Sockets.SocketException') then
          begin
            Result := Format('Connection Error: %s', [clrEx.Message]);
            Break;
          end
        finally
          clrEx.Free;
        end;
      end;
    end;
  except
    raise Exception.Create('Connection failed for an unknown reason...');
  end;
end;

end.
