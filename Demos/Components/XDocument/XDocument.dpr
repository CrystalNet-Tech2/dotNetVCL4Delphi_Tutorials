program XDocument;

{$APPTYPE CONSOLE}

{$R *.res}

uses
{$IF CompilerVersion > 22}System.SysUtils,{$ELSE}SysUtils,{$IFEND}
  CNClrLib.Core,
  CNClrLib.Xml,
  CNClrLib.Component.XDocument;

var
  Console: _Console;

//The following example creates a document, and then adds a comment and an element to it.
//It then composes another document using the results of a query.
procedure CreateXDocument;
var
  srcTree: TCnXDocument;
  srcComment: _XComment;
  srcRoot: _XElement;
begin
  srcTree := TCnXDocument.Create(nil);
  try
    srcComment := CoXComment.CreateInstance('This is a comment');
    srcTree.Add(srcComment);

    srcRoot := CoXElement.CreateInstance(CoXName.Wrap('Root'));
    srcRoot.Add(CoXElement.CreateInstance(CoXName.Wrap('Child1'), CoXName.Wrap('data1')));
    srcRoot.Add(CoXElement.CreateInstance(CoXName.Wrap('Child2'), CoXName.Wrap('data2')));
    srcRoot.Add(CoXElement.CreateInstance(CoXName.Wrap('Child3'), CoXName.Wrap('data3')));
    srcRoot.Add(CoXElement.CreateInstance(CoXName.Wrap('Child2'), CoXName.Wrap('data4')));
    srcRoot.Add(CoXElement.CreateInstance(CoXName.Wrap('Info5'), CoXName.Wrap('info5')));
    srcRoot.Add(CoXElement.CreateInstance(CoXName.Wrap('Info6'), CoXName.Wrap('info6')));
    srcRoot.Add(CoXElement.CreateInstance(CoXName.Wrap('Info7'), CoXName.Wrap('info7')));
    srcRoot.Add(CoXElement.CreateInstance(CoXName.Wrap('Info8'), CoXName.Wrap('Info8')));
    srcTree.Add(srcRoot);

    Console.WriteLine_12(srcTree.Document);
  finally
    srcTree.Free;
  end;

//This example produces the following output:
{
  <!--This is a comment-->
  <Root>
    <Child1>data1</Child1>
    <Child2>data2</Child2>
    <Child3>data3</Child3>
    <Child2>data4</Child2>
    <Child2>info5</Child2>
    <Child2>info6</Child2>
    <Child2>info7</Child2>
    <Child2>Info8</Child2>
  </Root>
}
end;

//Creates a new XDocument from a file specified by a URI, from an TextReader, or from an XmlReader.
procedure LoadXml;
var
  xDoc: TCnXDocument;
  xmlData: String;
  strReader: _StringReader;
begin
  xDoc := TCnXDocument.Create(nil);
  try
    xmlData := '<Root>Content</Root>';
    //Load from String
    xDoc.Load(xmlData);
    Console.WriteLine_13(xDoc.Document.AsClrObject);

    //Load from StringReader
    strReader := CoStringReader.CreateInstance(xmlData);
    xDoc.Load(strReader.AsTextReader);
    Console.WriteLine_13(xDoc.Document.AsClrObject);

    //Load from Xml File
    strReader := CoStringReader.CreateInstance(xmlData);
    xDoc.Load('PurchaseOrder.xml');
    Console.WriteLine_13(xDoc.Document.AsClrObject);
  finally
    xDoc.Free;
  end;

// The Load from Xml File produces the following output:
{
   <PurchaseOrder PurchaseOrderNumber="99503" OrderDate="1999-10-20">
    <Address Type="Shipping">
      <Name>Ellen Adams</Name>
      <Street>123 Maple Street</Street>
      <City>Mill Valley</City>
      <State>CA</State>
      <Zip>10999</Zip>
      <Country>USA</Country>
    </Address>
    <Address Type="Billing">
      <Name>Tai Yee</Name>
      <Street>8 Oak Avenue</Street>
      <City>Old Town</City>
      <State>PA</State>
      <Zip>95819</Zip>
      <Country>USA</Country>
    </Address>
    <DeliveryNotes>Please leave packages in shed by driveway.</DeliveryNotes>
    <Items>
      <Item PartNumber="872-AA">
        <ProductName>Lawnmower</ProductName>
        <Quantity>1</Quantity>
        <USPrice>148.95</USPrice>
        <Comment>Confirm this is electric</Comment>
      </Item>
      <Item PartNumber="926-AA">
        <ProductName>Baby Monitor</ProductName>
        <Quantity>2</Quantity>
        <USPrice>39.98</USPrice>
        <ShipDate>1999-05-21</ShipDate>
      </Item>
    </Items>
  </PurchaseOrder>
}
end;

begin
  Console := CoConsole.CreateInstance;
  try
    CreateXDocument();
    LoadXML();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
