program WebProxy;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  {$IF CompilerVersion > 22}System.SysUtils,{$ELSE}SysUtils,{$IFEND}
  CNClrLib.Core, CNClrLib.Component.WebProxy, CNClrLib.System;

// The following method displays the properties of the
// specified WebProxy instance.
procedure DisplayProxyProperties(proxy: TCnWebProxy);
var
  count, I: Integer;
  bypass: TArray<String>;
begin
  Writeln('Address: %s', proxy.Address);
  Writeln('Bypass on local: %s', proxy.BypassProxyOnLocal);

  count := proxy.BypassAddressList.Count;
  if count = 0 then
  begin
    Writeln('The bypass list is empty.');
  end;

  Writeln('The bypass list contents:');
  for I := 0 to proxy.BypassAddressList.Count - 1 do
    Writeln(proxy.BypassAddressList[i]);
end;

// The following method creates a WebProxy object that uses Internet Explorer's
// detected script if it is found in the registry; otherwise, it
// tries to use Web proxy auto-discovery to set the proxy used for
// the request.
procedure CheckAutoGlobalProxyForRequest(resource: _Uri);
var
  proxy: TCnWebProxy;
  resourceProxy: _Uri;
begin
  proxy := TCnWebProxy.Create(nil);
  try

    //Display the properies of the WebProxy
    DisplayProxyProperties(proxy);

    // See what proxy is used for the resource.
    resourceProxy := proxy.GetProxy(resource);

    // Test to see whether a proxy was selected.
    if resourceProxy.Equals(resource) then
    begin
      Writeln('No proxy for ' + resource.ToString);
    end
    else
    begin
      Writeln('Proxy for %s is %s', resource.OriginalString, resourceProxy.ToString);
    end
  finally
    proxy.Free;
  end;
end;

//The following code example demonstrates calling a constructor that sets this
//property and getting the value of this property.
procedure CreateProxyWithHostAddress(bypassLocal: Boolean);
var
  proxy: TCnWebProxy;
begin
  proxy := TCnWebProxy.Create(nil);
  try
    proxy.Address := 'http://contoso';
    proxy.BypassProxyOnLocal := bypassLocal;
    Writeln('Bypass proxy for local URIs?: ', proxy.BypassProxyOnLocal);
  finally
    proxy.Free;
  end;
end;

var
  m_uri: _Uri;

begin
  try
    CreateProxyWithHostAddress(True);
    CreateProxyWithHostAddress(False);

    m_uri := CoUri.CreateInstance('http://contoso.com');
    CheckAutoGlobalProxyForRequest(m_uri);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
