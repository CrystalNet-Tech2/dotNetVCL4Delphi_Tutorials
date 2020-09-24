program XmlDocument;

{$APPTYPE CONSOLE}

{$R *.res}

uses
{$IF CompilerVersion > 22}System.SysUtils,{$ELSE}SysUtils,{$IFEND}
  CNClrLib.Core,
  CNClrLib.Xml,
  CNClrLib.Enums,
  CNClrLib.Component.XmlDocument;

var
  Console: _Console;


// The following example shows the difference between a deep and shallow clone.
procedure CloneNode;
var
  doc: TCnXmlDocument;
  deep, shallow: _XmlDocument;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    doc.LoadXml('<book genre=''novel'' ISBN=''1-861001-57-5''>' +
                '<title>Pride And Prejudice</title>' +
                '</book>');

    //Create a deep clone.  The cloned node
    //includes the child node.
    deep := CoXmlDocument.Wrap(doc.CloneNode(True));
    WriteLn(IntToStr(deep.ChildNodes.Count));

    //Create a shallow clone.  The cloned node does not
    //include the child node.
    shallow := CoXmlDocument.Wrap(doc.CloneNode(False));
    Console.WriteLine_14(shallow.Name + shallow.OuterXml);
    Console.WriteLine_14(IntToStr(shallow.ChildNodes.Count));
  finally
    doc.Free;
  end;
end;

// The following creates an attribute and adds it to an XML document.
procedure CreateAttribute;
var
  doc: TCnXmlDocument;
  attr: _XmlAttribute;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    doc.LoadXml('<book genre=''novel'' ISBN=''1-861001-57-5''>' +
                '<title>Pride And Prejudice</title>' +
                '</book>');

    //Create an attribute.
    attr := doc.CreateAttribute('publisher');
    attr.Value := 'WorldWide Publishing';

    //Add the new node to the document.
    doc.DocumentElement.SetAttributeNode(attr);

    Console.WriteLine_14('Display the modified XML...');
    doc.Save(Console.Out_);
  finally
    doc.Free;
  end;
end;

// The following example creates a CDATA node and adds it to the document.
procedure CreateCDataSection;
var
  doc: TCnXmlDocument;
  CData: _XmlCDataSection;
  root: _XmlElement;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    doc.LoadXml('<book genre=''novel'' ISBN=''1-861001-57-5''>' +
                '<title>Pride And Prejudice</title>' +
                '</book>');

    //Create an attribute.
    CData := doc.CreateCDataSection('All Jane Austen novels 25% off starting 3/23!');

    //Add the new node to the document.
    root := doc.DocumentElement;
    root.AppendChild(CData.AsXmlCharacterData.AsXmlLinkedNode.AsXmlNode);

    Console.WriteLine_14('Display the modified XML...');
    doc.Save(Console.Out_);
  finally
    doc.Free;
  end;
end;

//The following example creates a comment and adds it to an XML document.
procedure CreateComment;
var
  doc: TCnXmlDocument;
  newComment: _XmlComment;
  root: _XmlElement;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    doc.LoadXml('<book genre=''novel'' ISBN=''1-861001-57-5''>' +
                '<title>Pride And Prejudice</title>' +
                '</book>');

    //Create a comment.
    newComment := doc.CreateComment('Sample XML document');

    //Add the new node to the document.
    root := doc.DocumentElement;
    root.AppendChild(newComment.AsXmlCharacterData.AsXmlLinkedNode.AsXmlNode);

    Console.WriteLine_14('Display the modified XML...');
    doc.Save(Console.Out_);
  finally
    doc.Free;
  end;
end;

//The following example creates a comment and adds it to an XML document.
procedure CreateDocumentFragment;
var
  doc: TCnXmlDocument;
  docFrag: _XmlDocumentFragment;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    doc.LoadXml('<book genre=''novel'' ISBN=''1-861001-57-5''>' +
                '<title>Pride And Prejudice</title>' +
                '</book>');

    //Create a document fragment.
    docFrag := doc.CreateDocumentFragment();

    //Set the contents of the document fragment.
    docFrag.InnerXml := '<item>widget</item>';

    //Add the children of the document fragment to the
    //original document.
    doc.DocumentElement.AppendChild(docFrag.AsXmlNode);

    Console.WriteLine_14('Display the modified XML...');
    doc.Save(Console.Out_);
  finally
    doc.Free;
  end;
end;

//The following example creates a new element and adds it to the document.
procedure CreateElement;
var
  doc: TCnXmlDocument;
  docFrag: _XmlDocumentFragment;
  elem: _XmlElement;
  text: _XmlText;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    doc.LoadXml('<book genre=''novel'' ISBN=''1-861001-57-5''>' +
                '<title>Pride And Prejudice</title>' +
                '</book>');

    //Create a new node and add it to the document.
    //The text node is the content of the price element.
    elem := doc.CreateElement('price');
    text := doc.CreateTextNode('19.95');
    doc.DocumentElement.AppendChild(elem.AsXmlLinkedNode.AsXmlNode);
    doc.DocumentElement.LastChild.AppendChild(text.AsXmlCharacterData.AsXmlLinkedNode.AsXmlNode);

    Console.WriteLine_14('Display the modified XML...');
    doc.Save(Console.Out_);
  finally
    doc.Free;
  end;
end;

//The following example creates a new element and inserts it into the document.
procedure CreateNode;
var
  doc: TCnXmlDocument;
  docFrag: _XmlDocumentFragment;
  newElem: _XmlNode;
  root: _XmlElement;
  text: _XmlText;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    doc.LoadXml('<book>' +
                '  <title>Oberon''s Legacy</title>' +
                '  <price>5.95</price>' +
                '</book>');

    // Create a new element node.
    newElem := doc.CreateNode('element', 'pages', '');
    newElem.InnerText := '290';

    Console.WriteLine_14('Add the new element to the document...');
    root := doc.DocumentElement;
    root.AppendChild(newElem);

    Console.WriteLine_14('Display the modified XML...');
    doc.Save(Console.Out_);
  finally
    doc.Free;
  end;
end;

//The following example creates an XML declaration and adds it to the document.
procedure CreateXmlDeclaration;
var
  doc: TCnXmlDocument;
  docFrag: _XmlDocumentFragment;
  xmldecl: _XmlDeclaration;
  root: _XmlElement;
  text: _XmlText;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    doc.LoadXml('<book genre=''novel'' ISBN=''1-861001-57-5''>' +
                '<title>Pride And Prejudice</title>' +
                '</book>');

    //Create an XML declaration.
    xmldecl := doc.CreateXmlDeclaration('1.0', '', '');

    //Add the new node to the document.
    root := doc.DocumentElement;
    doc.InsertBefore(xmldecl.AsXmlLinkedNode.AsXmlNode, root.AsXmlLinkedNode.AsXmlNode);

    Console.WriteLine_14('Display the modified XML...');
    doc.Save(Console.Out_);
  finally
    doc.Free;
  end;
end;

//The following example uses the GetElementById method.
procedure GetElementById;
var
  doc: TCnXmlDocument;
  elem : _XmlElement;
  text: _XmlText;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    doc.Load('ids.xml');

    //Get the first element with an attribute of type ID and value of A111.
    //This displays the node <Person SSN="A111" Name="Fred"/>.
    elem := doc.GetElementById('A111');
    Console.WriteLine_14(elem.OuterXml);

    //Get the first element with an attribute of type ID and value of A222.
    //This displays the node <Person SSN="A222" Name="Tom"/>.
    elem := doc.GetElementById('A222');
    Console.WriteLine_14(elem.OuterXml);
  finally
    doc.Free;
  end;

// The example uses the file, ids.xml, as input.
{
    <!DOCTYPE root [
      <!ELEMENT root ANY>
      <!ELEMENT Person ANY>
      <!ELEMENT Customer EMPTY>
      <!ELEMENT Team EMPTY>
      <!ATTLIST Person SSN ID #REQUIRED>
      <!ATTLIST Customer id IDREF #REQUIRED >
      <!ATTLIST Team members IDREFS #REQUIRED>]>
    <root>
      <Person SSN='A111' Name='Fred'/>
      <Person SSN='A222' Name='Tom'/>
      <Customer id='A222334444'/>
      <Team members='A222334444 A333445555'/>
    </root>
}
end;

//The following example creates a XmlDocument object and uses the GetElementsByTagName method
//and the resulting XmlNodeList object to display all the book titles.
procedure GetElementsByTagName;
var
  doc: TCnXmlDocument;
  elemList : _XmlNodeList;
  I: Integer;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    doc.Load('books.xml');

    //Display all the book titles.
    elemList := doc.GetElementsByTagName('title');
    for I := 0 to elemList.Count - 1 do
      Console.WriteLine_14(elemList[I].InnerXml);
  finally
    doc.Free;
  end;

// The example uses the file, ids.xml, as input.
{
  <?xml version='1.0'?>
  <!-- This file represents a fragment of a book store inventory database -->
  <bookstore>
    <book genre="autobiography" publicationdate="1981" ISBN="1-861003-11-0">
      <title>The Autobiography of Benjamin Franklin</title>
      <author>
        <first-name>Benjamin</first-name>
        <last-name>Franklin</last-name>
      </author>
      <price>8.99</price>
    </book>
    <book genre="novel" publicationdate="1967" ISBN="0-201-63361-2">
      <title>The Confidence Man</title>
      <author>
        <first-name>Herman</first-name>
        <last-name>Melville</last-name>
      </author>
      <price>11.99</price>
    </book>
    <book genre="philosophy" publicationdate="1991" ISBN="1-861001-57-6">
      <title>The Gorgias</title>
      <author>
        <name>Plato</name>
      </author>
      <price>9.99</price>
    </book>
  </bookstore>
}
end;

//The following example uses the GetElementById method.
procedure LoadXmlDocumentFromStringReader;
var
  doc: TCnXmlDocument;
  strReader : _StringReader;
  xmlData: String;
  elem: _XmlElement;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    xmlData := '<book xmlns:bk=''urn:samples''></book>';

    strReader := CoStringReader.CreateInstance(xmlData);

    doc.Load(strReader.AsTextReader);

    // Create a new element and add it to the document.
    elem := doc.CreateElement('bk', 'genre', 'urn:samples');
    elem.InnerText := 'fantasy';
    doc.DocumentElement.AppendChild(elem.AsXmlLinkedNode.AsXmlNode);

    Console.WriteLine_14('Display the modified XML...');
    doc.Save(Console.Out_);
  finally
    doc.Free;
  end;
end;

//The following example loads the last book node of the books.xml file into the XML document.
procedure LoadXmlDocumentFromTextReader;
var
  doc: TCnXmlDocument;
  reader : _XmlTextReader;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    //Load the document with the last book node.
    reader := CoXmlTextReader.CreateInstance('books.xml');
    reader.WhitespaceHandling := WhitespaceHandling_None;
    reader.MoveToContent();
    reader.Read();
    reader.Skip(); //Skip the first book.
    reader.Skip(); //Skip the second book.
    doc.Load(reader.AsXmlReader);

    doc.Save(Console.Out_);
  finally
    doc.Free;
  end;

//The example uses the file, books.xml, as input.
{
    <?xml version='1.0'?>
    <!-- This file represents a fragment of a book store inventory database -->
    <bookstore>
      <book genre="autobiography" publicationdate="1981" ISBN="1-861003-11-0">
        <title>The Autobiography of Benjamin Franklin</title>
        <author>
          <first-name>Benjamin</first-name>
          <last-name>Franklin</last-name>
        </author>
        <price>8.99</price>
      </book>
      <book genre="novel" publicationdate="1967" ISBN="0-201-63361-2">
        <title>The Confidence Man</title>
        <author>
          <first-name>Herman</first-name>
          <last-name>Melville</last-name>
        </author>
        <price>11.99</price>
      </book>
      <book genre="philosophy" publicationdate="1991" ISBN="1-861001-57-6">
        <title>The Gorgias</title>
        <author>
          <name>Plato</name>
        </author>
        <price>9.99</price>
      </book>
    </bookstore>
}
end;

//The following example loads XML into an XmlDocument object, modifies it, and then saves it to a file named data.xml.
procedure SaveXmlDocument;
var
  doc: TCnXmlDocument;
  newElem : _XmlElement;
  I: Integer;
begin
  //Create the XmlDocument.
  doc := TCnXmlDocument.Create(nil);
  try
    doc.LoadXml('<item><name>wrench</name></item>');

    // Add a price element.
    newElem := doc.CreateElement('price');
    newElem.InnerText := '10.95';
    doc.DocumentElement.AppendChild(newElem.AsXmlLinkedNode.AsXmlNode);

    // Save the document to a file. White space is
    // preserved (no white space).
    doc.PreserveWhitespace := true;
    doc.Save('data.xml');
  finally
    doc.Free;
  end;

// The data.xml file will contain the following XML: <item><name>wrench</name><price>10.95</price></item>.
end;

begin
  Console := CoConsole.CreateInstance;
  try
    CloneNode();
    CreateAttribute();
    CreateCDataSection();
    CreateComment();
    CreateDocumentFragment();
    CreateElement();
    CreateNode();
    CreateXmlDeclaration();
    GetElementById();
    GetElementsByTagName();
    LoadXmlDocumentFromStringReader();
    LoadXmlDocumentFromTextReader();
    SaveXmlDocument();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
