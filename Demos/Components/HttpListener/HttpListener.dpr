program HttpListener;

{$APPTYPE CONSOLE}

{$R *.res}

//The following code example demonstrates using a TCnHttpListener.

uses
  {$IF CompilerVersion > 22}System.SysUtils,{$ELSE}SysUtils,{$IFEND}
  CNClrLib.Core,
  CNCLrLib.Component.HttpListener;

var
  Console: _Console;

// This example requires the System and System.Net namespaces.
procedure SimpleListenerExample(prefixes: TArray<String>);
var
  listener: TCnHttpListener;
  context: _HttpListenerContext;
  request: _HttpListenerRequest;
  response: _HttpListenerResponse;
  responseString, pfx: String;
  buffer: _ByteArray;
  output: _Stream;
begin
  if not TCnHttpListener.IsSupported then
  begin
    Console.WriteLine_14('Windows XP SP2 or Server 2003 is required to use the TCnHttpListener component.');
    Exit;
  end;

  // URI prefixes are required,
  // for example 'http://contoso.com:8080/index/'.
  if Length(prefixes) = 0 then
    raise Exception.Create('prefixes has not been specified.');

  // Create a listener.
  listener := TCnHttpListener.Create(nil);
  try
    // Add the prefixes.
    for pfx in prefixes do
      listener.Prefixes.Add(pfx);

    listener.Start();
    Console.WriteLine_14('Listening...');
    // Note: The GetContext method blocks while waiting for a request.
    context := listener.GetContext();
    request := context.Request;
    // Obtain a response object.
    response := context.Response;
    // Construct a response.
    responseString := '<HTML><BODY> Hello world!</BODY></HTML>';
    buffer := CoEncodingHelper.CreateInstance.UTF8.GetBytes_3(responseString);
    // Get a response stream and write the response to it.
    response.ContentLength64 := buffer.Length;
    output := response.OutputStream;
    output.Write(buffer,0,buffer.Length);
    // You must close the output stream.
    output.Close();
    listener.Stop();
  finally
    listener.Free;
  end;

end;

var
  prefixes: TArray<String>;
begin
  Console := CoConsole.CreateInstance;
  try
    SetLength(prefixes, 1);
    prefixes[0] := 'http://contoso.com:8080/index/';
    SimpleListenerExample(prefixes)
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
