program WebClient;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  {$IF CompilerVersion > 22}System.SysUtils,{$ELSE}SysUtils,{$IFEND}
  CNClrLib.Core,
  CNClrLib.Net,
  CNClrLib.COntrol.Base,
  CNClrLib.Component.WebClient;

var
  Console: _Console;

//The following code example downloads and displays the ResponseHeaders returned by a server.
procedure DisplayResponseHeader(myWebClient: TCnWebClient);
var
  myWebHeaderCollection: _WebHeaderCollection;
  I: Integer;
begin
  // Obtain the WebHeaderCollection instance containing the header name/value pair from the response.
   myWebHeaderCollection := myWebClient.ResponseHeaderCollection;
  Console.WriteLine_14(#13#10+'Displaying the response headers'+#13#10);
  // Loop through the ResponseHeaders and display the header name/value pairs.
  for I := 0 to myWebHeaderCollection.Count - 1 do
    Console.WriteLine_14(Chr(9) + myWebHeaderCollection.GetKey(i) + ' = ' + myWebHeaderCollection.Get__1(i));
end;

// The following code example takes the URI of a resource, retrieves it, and displays the response.
procedure RetrieveResourcesFromServer;
var
  client: TCnWebClient;
  data: _Stream;
  reader: _StreamReader;
  Uri: String;
begin
  client := TCnWebClient.Create(nil);
  try
    Console.WriteLine_14('Please enter the URI of the resource to retrieve {for example, http://www.contoso.com} : ');
    Uri := Console.ReadLine();

    // Add a user agent header in case the
    // requested URI contains a query.
    client.Headers.Add('user-agent = Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)');
    //or
    //client.HeaderCollection.Add('user-agent', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)');

    data := client.OpenRead(Uri);
    reader := CoStreamReader.CreateInstance(data);
    Console.WriteLine_14(reader.ReadToEnd());
    data.Close();
    reader.Close();
  finally
    client.Free;
  end;
end;

//The following code example downloads data from an Internet server and displays it on the console.
//It assumes that the server's address (such as http://www.contoso.com) is in hostUri and that the
//path to the resource (such as /default.htm) is in uriSuffix.
procedure DownloadDataFromInternetServer;
var
  myWebClient: TCnWebClient;
  myDatabuffer: _ByteArray;
  download, hostUri, uriSuffix: String;
begin
  myWebClient := TCnWebClient.Create(nil);
  try
    Console.WriteLine_14('Please enter the Host URI {for example, http://www.contoso.com} : ');
    hostUri := Console.ReadLine();

    Console.WriteLine_14(#13#10+'Please enter the Suffix URI to download from : ');
    uriSuffix := Console.ReadLine();

    // Set the BaseAddress of the Web Resource in the WebClient.
    myWebClient.BaseAddress := hostUri;
    Console.WriteLine_14('Downloading from ' + hostUri + '/' + uriSuffix);
    Console.WriteLine_14(#13#10+'Press Enter key to continue');
    Console.ReadLine();

    // Download the target Web Resource into a byte array.
    myDatabuffer := myWebClient.DownloadData(uriSuffix);

    // Display the downloaded data.
    download := CoEncodingHelper.CreateInstance.ASCII.GetString(myDatabuffer);
    Console.WriteLine_14(download);

    Console.WriteLine_14('Download of ' + myWebClient.BaseAddress + uriSuffix + ' was successful.');
    DisplayResponseHeader(myWebClient);
  finally
    myWebClient.Free;
  end;
end;

//The following code example uses the user's system credentials to authenticate a request.
procedure DownloadDataUsingCredentials;
var
  myWebClient: TCnWebClient;
  pageData: _ByteArray;
  pageHtml: String;
begin
  myWebClient := TCnWebClient.Create(nil);
  try
    myWebClient.Credentials := CoCredentialCacheHelper.CreateInstance.DefaultCredentials;
    // Download the target Web Resource into a byte array.
    pageData := myWebClient.DownloadData('http://www.contoso.com');
    pageHtml := CoEncodingHelper.CreateInstance.ASCII.GetString(pageData);
    // Display the downloaded data.
    Console.WriteLine_14(pageHtml);
    DisplayResponseHeader(myWebClient);
  finally
    myWebClient.Free;
  end;
end;

//he following code example demonstrates calling TCnWebClient.UploadString method.
procedure UploadString;
var
  client: TCnWebClient;
  reply, data, address: String;
begin
  client := TCnWebClient.Create(nil);
  try
    Console.WriteLine_14('Please enter the Host address to upload data {for example, http://www.contoso.com} : ');
    address := Console.ReadLine();

    data := 'Time = 12:00am temperature = 50';
    // Optionally specify an encoding for uploading and downloading strings.
    client.Encoding := CoEncodingHelper.CreateInstance.UTF8;
    // Upload the data.
    reply := client.UploadString(address, data);
    // Disply the server's response.
    Console.WriteLine_14 (reply);
  finally
    client.Free;
  end;
end;

//he following code example demonstrates calling TCnWebClient.UploadString method.
procedure UploadStringWithHeaders;
var
  myWebClient: TCnWebClient;
  uriString, postData: String;
  byteArray, responseArray: _ByteArray;
begin
  // Create a new WebClient instance.
  myWebClient := TCnWebClient.Create(nil);
  try
    Console.WriteLine_14('Please enter the URI to post data to {for example, http://www.contoso.com} : ');
    uriString := Console.ReadLine();

    Console.WriteLine_15(#13#10+'Please enter the data to be posted to the URI {0}:',uriString);
    postData := Console.ReadLine();
    myWebClient.HeaderCollection.Add('Content-Type','application/x-www-form-urlencoded');

       // Display the headers in the request
    Console.WriteLine_14('Resulting Request Headers: ');
    Console.WriteLine_14(myWebClient.HeaderCollection.ToString());

    // Apply ASCII Encoding to obtain the string as a byte array.
    byteArray := CoEncodingHelper.CreateInstance.ASCII.GetBytes_3(postData);
    Console.WriteLine_15('Uploading to {0} ...',  uriString);
    // Upload the input string using the HTTP 1.0 POST method.
    responseArray := myWebClient.UploadData(uriString, 'POST', byteArray);

    // Decode and display the response.
    Console.WriteLine_15(#13#10+'Response received was {0}', CoEncodingHelper.CreateInstance.ASCII.GetString(responseArray));
  finally
    myWebClient.Free;
  end;
end;

//The following code example demonstrates calling TCnWebClient.DownloadString method.
procedure DownloadString;
var
  client: TCnWebClient;
  address, reply: String;
begin
  // Create a new WebClient instance.
  client := TCnWebClient.Create(nil);
  try
    address := 'http://www.contoso.com';
    reply := client.DownloadString(address);

    Console.WriteLine_14(reply);
    DisplayResponseHeader(client);
  finally
    client.Free;
  end;
end;

//The following code example reads data from the command line and uses OpenWrite
//to obtain a stream for writing the data. Note that the Stream returned by OpenWrite
//is closed after the data is sent.
procedure UploadData2Server;
var
  myWebClient: TCnWebClient;
  uriString, postData: String;
  postArray: _ByteArray;
  postStream: _Stream;
begin
  // Create a new WebClient instance.
  myWebClient := TCnWebClient.Create(nil);
  try
    Console.WriteLine_14('Please enter the URI to post data to {for example, http://www.contoso.com} : ');
    uriString := Console.ReadLine();

    Console.WriteLine_15(#13#10+'Please enter the data to be posted to the URI {0}:', uriString);
    postData := Console.ReadLine();

    // Apply Ascii Encoding to obtain an array of bytes.
    postArray := CoEncodingHelper.CreateInstance.ASCII.GetBytes_3(postData);

    // postStream implicitly sets HTTP POST as the request method.
    Console.WriteLine_15('Uploading to {0} ...',  uriString);
    postStream := myWebClient.OpenWrite(uriString);

    postStream.Write(postArray,0,postArray.Length);

    // Close the stream and release resources.
    postStream.Close();

    Console.WriteLine_14(#13#10+'Successfully posted the data.');
  finally
    myWebClient.Free;
  end;
end;

//The following code example uploads the specified file to the specified URI using UploadFile.
//Any response returned by the server is displayed on the console.
procedure UploadFile2Server;
var
  myWebClient: TCnWebClient;
  uriString, fileName: String;
  responseArray: _ByteArray;
begin
  // Create a new WebClient instance.
  myWebClient := TCnWebClient.Create(nil);
  try
    Console.WriteLine_14('Please enter the URI to post data to {for example, http://www.contoso.com} : ');
    uriString := Console.ReadLine();

    Console.WriteLine_14(#13#10+'Please enter the fully qualified path of the file to be uploaded to the URI: ');
    fileName := Console.ReadLine();

    Console.WriteLine_17('Uploading {0} to {1} ...',fileName,uriString);

    // Upload the file to the URI.
    // The 'UploadFile(uriString,fileName)' method implicitly uses HTTP POST method.
    responseArray := myWebClient.UploadFile(uriString, fileName);

    // Decode and display the response.
    Console.WriteLine_15(#13#10+'Response Received.The contents of the file uploaded are:'+#13#10+'{0}',
        CoEncodingHelper.CreateInstance.ASCII.GetString(responseArray));
  finally
    myWebClient.Free;
  end;
end;

//The following code example downloads a file from http://www.contoso.com to the local hard drive.
procedure DownloadFilefromServer;
var
  myWebClient: TCnWebClient;
  remoteUri, fileName, myStringWebResource: String;
begin
  // Create a new WebClient instance.
  myWebClient := TCnWebClient.Create(nil);
  try
    remoteUri := 'http://www.contoso.com/library/homepage/images/';
    fileName := 'ms-banner.gif';

    // Concatenate the domain with the Web resource filename.
    myStringWebResource := remoteUri + fileName;
    Console.WriteLine_17('Downloading File {0} from {1} .......'#13#10+#13#10, fileName, myStringWebResource);

    // Download the Web resource and save it into the current filesystem folder.
    myWebClient.DownloadFile(myStringWebResource, fileName);
    Console.WriteLine_17('Successfully Downloaded File {0} from {1}', fileName, myStringWebResource);
    Console.WriteLine_14(#13#10+'Downloaded file saved in the following file system folder:'+#13#10+chr(9) + TClrApplication.StartupPath);
  finally
    myWebClient.Free;
  end;
end;

//The following code example gathers information from the user (name, age, and address)
//and posts the values to the server using UploadValues. Any response from the server is displayed on the console.
procedure UploadValues2Server;
var
  myWebClient: TCnWebClient;
  uriString, postData: String;
  byteArray, responseArray: _ByteArray;
begin
  // Create a new WebClient instance.
  myWebClient := TCnWebClient.Create(nil);
  try
    Console.WriteLine_14('Please enter the URI to post data to {for example, http://www.contoso.com} : ');
    uriString := Console.ReadLine();

    Console.WriteLine_15(#13#10+'Please enter the data to be posted to the URI {0}:',uriString);
    postData := Console.ReadLine();
    myWebClient.HeaderCollection.Add('Content-Type','application/x-www-form-urlencoded');

       // Display the headers in the request
    Console.WriteLine_14('Resulting Request Headers: ');
    Console.WriteLine_14(myWebClient.HeaderCollection.ToString());

    // Apply ASCII Encoding to obtain the string as a byte array.
    byteArray := CoEncodingHelper.CreateInstance.ASCII.GetBytes_3(postData);
    Console.WriteLine_15('Uploading to {0} ...',  uriString);
    // Upload the input string using the HTTP 1.0 POST method.
    responseArray := myWebClient.UploadData(uriString, 'POST', byteArray);

    // Decode and display the response.
    Console.WriteLine_15(#13#10+'Response received was {0}', CoEncodingHelper.CreateInstance.ASCII.GetString(responseArray));
  finally
    myWebClient.Free;
  end;
end;

begin
  Console := CoConsole.CreateInstance;
  try
    RetrieveResourcesFromServer;
    DownloadFilefromServer;
    DownloadString;
    DownloadDataUsingCredentials;
    DownloadDataFromInternetServer;
    UploadString;
    UploadStringWithHeaders;
    UploadFile2Server;
    UploadData2Server;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
