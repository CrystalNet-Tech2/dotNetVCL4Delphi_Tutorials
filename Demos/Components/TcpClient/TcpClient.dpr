program TcpClient;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  {$IF CompilerVersion > 22}System.SysUtils,{$ELSE}SysUtils,{$IFEND}
  CNClrLib.Host,
  CNClrLib.Net,
  CNClrLib.Core,
  CNClrLib.Component.TcpClient;

var
  Console: _Console;

//The following code example establishes a TcpClient connection.
procedure EstablisheTcpClientConnection();
var
  client: TCnTcpClient;
  port, bytes: Integer;
  data: _ByteArray;
  stream: _NetworkStream;  
  server, message, responseData, exType: String;
begin
  try
    client := TCnTcpClient.Create(nil);
    try
      Console.WriteLine_14('Please enter the Tcp Server to connect: ');
      server := Console.ReadLine();

      Console.WriteLine_14(#13#10+'Please enter the message to send to the server: ');
      message := Console.ReadLine();

      // Create a TcpClient.
      // Note, for this client to work you need to have a TcpServer 
      // connected to the same address as specified by the server, port
      // combination.
      port := 13000;
      client.Connect(server, port);
    
      // Translate the passed message into ASCII and store it as a Byte array.
      data := CoEncodingHelper.CreateInstance.ASCII.GetBytes_3(message);         

      // Get a client stream for reading and writing.
     //  Stream stream = client.GetStream();
    
     stream := client.GetStream();

      // Send the message to the connected TcpServer. 
      stream.Write(data, 0, data.Length);

      Console.WriteLine_15('Sent: {0}', message);         

      // Receive the TcpServer.response.
    
      // Buffer to store the response bytes.
      data := CoByteArray.CreateInstance(256);

      // String to store the response ASCII representation.
      responseData := EmptyStr;

      // Read the first batch of the TcpServer response bytes.
      bytes := stream.Read(data, 0, data.Length);
      responseData := CoEncodingHelper.CreateInstance.ASCII.GetString_1(data, 0, bytes);
      Console.WriteLine_15('Received: {0}', responseData);         

      // Close everything.
      stream.Close_1();         
      client.Close();             
      
    finally
      client.Free;
    end;
  except 
    on E: Exception do
    begin
      exType := EClrException.GetTypeOf(E);
      if exType = 'System.ArgumentNullException' then
      begin      
        Console.WriteLine_15('ArgumentNullException: {0}', e.ToString);
      end
      else if exType = 'System.Net.Sockets.SocketException' then
      begin      
        Console.WriteLine_15('SocketException: {0}', e.ToString);
      end;
    end;
  end;
  Console.WriteLine_14(#13#10+'Press Enter to continue...');
  Console.Read();
end;

//The following code example establishes a TcpClient connection.
procedure ConnectWithRemoteHostUsingIPEndPoint();
var
  tcpClient: TCnTcpClient;
  ipAddress: _IPAddress;
  ipEndPoint: _IPEndPoint;
begin
  tcpClient := TCnTcpClient.Create(nil);
  try
    ipAddress := CoDns.CreateInstance.GetHostEntry('www.contoso.com').AddressList[0];
    ipEndPoint := CoIPEndPoint.CreateInstance(ipAddress, 11004);

    tcpClient.Connect(ipEndPoint);
  finally
    tcpClient.Free;
  end;
end;

begin
  Console := CoConsole.CreateInstance;
  try
    EstablisheTcpClientConnection;
    ConnectWithRemoteHostUsingIPEndPoint;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
