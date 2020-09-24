program UdpClient;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  {$IF CompilerVersion > 22}System.SysUtils,{$ELSE}SysUtils,{$IFEND}
  CNClrlib.Core,
  CNClrlib.Net,
  CNClrLib.Component.UdpClient;

var
  Console: _Console;

//The following example uses an IPEndPoint to establish a default remote host.
procedure Connect2RemoteHost;
var
  udpClient: TCnUdpClient;
  ipAddress: _IPAddress;
  dns: _Dns;
  ipEndPoint: _IPEndPoint;
begin
  //Uses a remote endpoint to establish a socket connection.
  udpClient := TCnUdpClient.Create(nil);
  try
    dns := CoDns.CreateInstance;
    ipAddress := dns.GetHostAddresses('www.contoso.com')[0];
    ipEndPoint := CoIPEndPoint.CreateInstance(ipAddress, 11004);
    udpClient.Connect(ipEndPoint);
  finally
    udpClient.Free;
  end;
end;


//The following example establishes a UdpClient connection using the host name
//www.contoso.com on port 11000. A small string message is sent to two separate
//remote host machines. The Receive method blocks execution until a message is received.
//Using the IPEndPoint passed to Receive, the identity of the responding host is revealed.
procedure SendAndReceiveUDPDatagram2Host;
var
  udpClient: TCnUdpClient;
  udpClientB: TCnUdpClient;
  sendBytes, receiveBytes: _ByteArray;
  RemoteIpEndPoint: _IPEndPoint;
  returnData: String;
begin
  udpClientB := nil;
  udpClient := TCnUdpClient.Create(nil);
  try
    // Sends a message to the host to which you have connected.
    sendBytes := CoEncodingHelper.CreateInstance.ASCII.GetBytes_3('Is anybody there');
    udpClient.Send(sendBytes, sendBytes.Length, 'www.contoso.com', 11000);

    // Sends a message to a different host using optional hostname and port parameters.
    udpClientB:= TCnUdpClient.Create(nil);
    udpClientB.Send(sendBytes, sendBytes.Length, 'AlternateHostMachineName', 11000);

    //Creates an IPEndPoint to record the IP Address and port number of the sender.
    // The IPEndPoint will allow you to read datagrams sent from any source.
    RemoteIpEndPoint := CoIPEndPoint.CreateInstance(CoIPAddressHelper.CreateInstance.Any, 0);

    // Blocks until a message returns on this socket from a remote host.
    receiveBytes := udpClient.Receive(RemoteIpEndPoint);

    returnData := CoEncodingHelper.CreateInstance.ASCII.GetString(receiveBytes);

    Console.WriteLine_14('This is the message you received '+ returnData);
    Console.WriteLine_14('This message was sent from ' +
                                 RemoteIpEndPoint.Address.ToString +
                                 ' on their port number ' +
                                 IntToStr(RemoteIpEndPoint.Port));
  finally
    udpClient.Free;
    if udpClientB <> nil then
      udpClientB.Free;
  end;
end;

begin
  Console := CoConsole.CreateInstance;
  try
    Connect2RemoteHost;
    SendAndReceiveUDPDatagram2Host;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
