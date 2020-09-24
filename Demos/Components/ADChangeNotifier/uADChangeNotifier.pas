unit uADChangeNotifier;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.Base, CNClrLib.Component.ADChangeNotifier, CNClrLib.Control.EnumTypes;

type
  TForm12 = class(TForm)
    CnADChangeNotifier1: TCnADChangeNotifier;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure CnADChangeNotifier1ObjectChanged(Sender: TObject;
      E: _ObjectChangedEventArgs);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

uses CNClrLib.Core, CNClrLib.Host;

procedure TForm12.Button1Click(Sender: TObject);
begin
  // Note: The SearchRequests have been speified on the design screen.
  // If you don't want to create the SearchRequests on design time,
  // you can call the RegisterNotifications overload method to register
  // the distinguish name for notification.

  CnADChangeNotifier1.RegisterNotifications;
  Button1.Enabled := False;
  Button2.Enabled := True;
end;

procedure TForm12.Button2Click(Sender: TObject);
begin
  // Cancel all notifications
  CnADChangeNotifier1.AbortNotifications;
  Button1.Enabled := True;
  Button2.Enabled := False;
end;

procedure TForm12.CnADChangeNotifier1ObjectChanged(Sender: TObject;
  E: _ObjectChangedEventArgs);
var
  attributeEnum: _IEnumerator;
  attrName: String;
  values: _ObjectArray;
  I: Integer;
begin
  attributeEnum := E.Result.Attributes.AttributeNames.AsIEnumerable.GetEnumerator;
  Memo1.Lines.Add(E.Result.DistinguishedName);
  while attributeEnum.MoveNext do
  begin
    //For more information about Active Directory Attributes, see http://www.kouti.com/tables/userattributes.htm
    attrName := attributeEnum.Current;

    Memo1.Lines.Add(attrName + 'AD Attribute:');
    if attrName = 'whenCreated' then //Object created
    begin
      Memo1.Lines.Add(chr(9) + 'Object Created');
    end
    else if attrName = 'whenChanged' then  //Object Modified
    begin
      Memo1.Lines.Add(chr(9) + 'Object Modified');
    end
    else if attrName = 'isDeleted' then
    begin
      Memo1.Lines.Add(chr(9) + 'Object is Deleted');
    end;

    values := E.Result.Attributes[attrName].GetValues(TClrAssembly.GetType('System.String'));
    for I := 0 to values.Length - 1 do
    begin
      Memo1.Lines.Add(chr(9) + chr(9) + values[I]);
    end;
  end;
  Memo1.Lines.Add('-------------------------------------------------------');
  Memo1.Lines.Add('');
end;

procedure TForm12.FormShow(Sender: TObject);
begin
  CnADChangeNotifier1.Server := 'example.com';//Specify the LDAP server

  //Add SearchReguest which will be registered and monitored for changes
  with CnADChangeNotifier1.SearchRequests.Add do
  begin
    DistinguishedName := 'cn=madhuka+sn=udantha,ou=users,dc=example,dc=com';
    Filter := '(objectClass=*)';
    Scope := TSearchScope.ssBase;
  end;
end;

end.
