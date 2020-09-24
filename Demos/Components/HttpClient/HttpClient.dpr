program HttpClient;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  {$IF CompilerVersion > 22}System.SysUtils,{$ELSE}SysUtils,{$IFEND}
  CNClrLib.Host,
  CNClrLib.Core,
  CNClrLib.Component.HttpClient;

var
  Console: _Console;

//Here is a simple program written to demonstrate the use of HttpClient:
procedure CreateHttpClientAndGetAsync;
var
  client: TCnHttpClient;
  responseTask: _GenericTask;
  response: _HttpResponseMessage;
  responseBodyTask: _GenericTask;
  responseBody: String;
begin
  // Create a New HttpClient object.
  client := TCnHttpClient.Create(nil);
  try
    // Call asynchronous network methods in a try/catch block to handle exceptions
    try
      responseTask := client.GetAsync('http://www.contoso.com/');

      response := THttpResponseMessageActivitor.Wrap(responseTask.Result_);
      response.EnsureSuccessStatusCode();

      responseBodyTask := response.Content.ReadAsStringAsync();
      responseBody := responseBodyTask.Result_;

      Console.WriteLine_14(responseBody);
    except
      on E: Exception do
      begin
        if EClrException.IsTypeOf(E, 'System.Net.Http.HttpRequestException') then
        begin
          Console.WriteLine_14(#13#10+'Exception Caught!');
          Console.WriteLine_15('Message :{0} ', E.Message);
        end;
      end;
    end;
  finally
    client.Free;
  end;
end;

//This method is similar and simple to the above CreateHttpClientAndGetAsync method.
//Here is a simple program written to demonstrate the use of HttpClient:
procedure CreateHttpClientAndReadAsStringAsync;
var
  client: TCnHttpClient;
  responseBodyTask: _GenericTask;
  responseBody: String;
begin
  // Create a New HttpClient object.
  client := TCnHttpClient.Create(nil);
  try
    // Call asynchronous network methods in a try/catch block to handle exceptions
    try
      // Above five lines can be replaced with new helper method below
      responseBodyTask := client.GetStringAsync('http://www.contoso.com/');
      responseBody := responseBodyTask.Result_;

      Console.WriteLine_14(responseBody);
    except
      on E: Exception do
      begin
        if EClrException.IsTypeOf(E, 'System.Net.Http.HttpRequestException') then
        begin
          Console.WriteLine_14(#13#10+'Exception Caught!');
          Console.WriteLine_15('Message :{0} ', E.Message);
        end;
      end;
    end;
  finally
    client.Free;
  end;
end;

begin
  Console := CoConsole.CreateInstance;
  try
    CreateHttpClientAndGetAsync;
    CreateHttpClientAndReadAsStringAsync;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
