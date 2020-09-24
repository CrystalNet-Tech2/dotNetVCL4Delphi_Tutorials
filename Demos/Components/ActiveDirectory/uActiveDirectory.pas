unit uActiveDirectory;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.Base,
  CNClrLib.Component.DirectorySearcher, CNClrLib.Component.DirectoryEntry;

type
  TfrmAD = class(TForm)
    grpForm: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    txtUsername: TEdit;
    txtPassword: TEdit;
    Label2: TLabel;
    txtAddress: TEdit;
    Label3: TLabel;
    txtSearchUser: TEdit;
    Label4: TLabel;
    btnSearchUserName: TButton;
    lblUsernameDisplay: TLabel;
    lblFirstname: TLabel;
    lblCity: TLabel;
    lblMiddleName: TLabel;
    lblLastName: TLabel;
    lblCompany: TLabel;
    lblTitle: TLabel;
    lblEmailId: TLabel;
    lblState: TLabel;
    lblCountry: TLabel;
    lblPostal: TLabel;
    lblTelephone: TLabel;
    pnlBlock: TPanel;
    CnDirectorySearcher1: TCnDirectorySearcher;
    CnDirectoryEntry1: TCnDirectoryEntry;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    txtFirstName: TEdit;
    txtMiddleName: TEdit;
    txtLastName: TEdit;
    btnCommitChanges: TButton;
    btnClearValues: TButton;
    procedure btnSearchUserNameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnClearValuesClick(Sender: TObject);
    procedure btnCommitChangesClick(Sender: TObject);
  private
    FModifySearchResult: _SearchResult;
    function GetSystemDomain: String;
    procedure GetUserInformation(UserName, Password, Domain: String);
    procedure ShowUserInformation(SearchResult: _SearchResult);
    procedure DoInitialiseDirectorySearch(UserName, Password, Domain: String);
    function SearchUserByUserName(UserName: String): _SearchResult;
    function SearchUserByEmail(Email: String): _SearchResult;
    procedure SetUpdateUserInfoValues(SearchResult: _SearchResult);
    procedure SetEnabledUpdateUserInfoCtrls(AEnabled: Boolean);
  public
    { Public declarations }
  end;

var
  frmAD: TfrmAD;

implementation

{$R *.dfm}

uses CNClrLib.Host, CNClrLib.DirectoryServices;

procedure TfrmAD.btnClearValuesClick(Sender: TObject);
begin
  lblUsernameDisplay.Caption := '';
  lblFirstname.Caption := '';
  lblMiddleName.Caption := '';
  lblLastName.Caption := '';
  lblEmailId.Caption := '';
  lblTitle.Caption := '';
  lblCompany.Caption := '';
  lblCity.Caption := '';
  lblState.Caption := '';
  lblCountry.Caption := '';
  lblPostal.Caption := '';
  lblTelephone.Caption := '';
  SetUpdateUserInfoValues(nil);
end;

procedure TfrmAD.btnCommitChangesClick(Sender: TObject);
var
  directoryEntryIntf: _DirectoryEntry;
begin
  if FModifySearchResult <> nil then
  begin
    directoryEntryIntf := FModifySearchResult.GetDirectoryEntry();
    directoryEntryIntf.Properties['givenName'].Value := txtFirstName.Text;
    directoryEntryIntf.Properties['initials'].Value := txtMiddleName.Text;
    directoryEntryIntf.Properties['sn'].Value := txtLastName.Text;
    directoryEntryIntf.CommitChanges;
  end;
end;

procedure TfrmAD.btnSearchUserNameClick(Sender: TObject);
begin
  if (Trim(txtAddress.Text) <> '') and (Trim(txtSearchUser.Text) <> '') then
  begin
    GetUserInformation(Trim(txtUsername.Text), Trim(txtPassword.Text), Trim(txtAddress.Text));
  end
  else
  begin
    TClrMessageBox.Show('Please specify both the domain and search entries.', 'Missing Information', TMessageBoxButtons.mbbsOK, TMessageBoxIcon.mbiInformation);
  end;
end;

procedure TfrmAD.DoInitialiseDirectorySearch(UserName, Password,
  Domain: String);
begin
  CnDirectoryEntry1.Path := 'LDAP://' + domain;
  CnDirectoryEntry1.Username := txtUsername.Text;
  CnDirectoryEntry1.Password := txtPassword.Text;
  CnDirectorySearcher1.SearchRoot := CnDirectoryEntry1;
end;

procedure TfrmAD.FormShow(Sender: TObject);
begin
  txtUsername.SetFocus;
  btnSearchUserName.SetFocus;
  txtAddress.Text := GetSystemDomain();
end;

function TfrmAD.GetSystemDomain: String;
begin
  try
    Result := LowerCase(CoDomainHelper.CreateInstance.GetComputerDomain.ToString);
  except
    Result := '';
  end;
end;

procedure TfrmAD.GetUserInformation(UserName, Password, Domain: String);
var
  rs: _SearchResult;
begin
  Cursor := crHourGlass;
  try
    DoInitialiseDirectorySearch(UserName, Password, Domain);
    if Pos('@', Trim(txtSearchUser.Text)) > 0 then
      rs := SearchUserByEmail(Trim(txtSearchUser.Text))
    else
      rs := SearchUserByUserName(Trim(txtSearchUser.Text));

    if rs <> nil then
      ShowUserInformation(rs)
    else
      TClrMessageBox.Show('User not found!!!', 'Search Information', TMessageBoxButtons.mbbsOK, TMessageBoxIcon.mbiInformation);

    SetUpdateUserInfoValues(rs);
  finally
    Cursor := crDefault;
  end;
end;

function TfrmAD.SearchUserByEmail(Email: String): _SearchResult;
begin
  CnDirectorySearcher1.Filter := '(&((&(objectCategory=Person)(objectClass=User)))(mail=' + email + '))';
  CnDirectorySearcher1.SearchScope := TSearchScope.ssSubtree;
  CnDirectorySearcher1.ServerTimeLimit := '00:01:30';//90seconds in hh:mm:ss;

  Result := CnDirectorySearcher1.FindOne;
end;

function TfrmAD.SearchUserByUserName(UserName: String): _SearchResult;
begin
  CnDirectorySearcher1.Filter := '(&((&(objectCategory=Person)(objectClass=User)))(samaccountname=' + username + '))';
  CnDirectorySearcher1.SearchScope := TSearchScope.ssSubtree;
  CnDirectorySearcher1.ServerTimeLimit := '00:01:30';//90seconds in hh:mm:ss;

  Result := CnDirectorySearcher1.FindOne;
end;

procedure TfrmAD.SetEnabledUpdateUserInfoCtrls(AEnabled: Boolean);
begin
  txtFirstName.Enabled := AEnabled;
  txtMiddleName.Enabled := AEnabled;
  txtLastName.Enabled := AEnabled;
end;

procedure TfrmAD.SetUpdateUserInfoValues(SearchResult: _SearchResult);
var
  directoryEntryIntf: _DirectoryEntry;
begin
  txtFirstName.Text := '';
  txtMiddleName.Text := '';
  txtLastName.Text := '';

  FModifySearchResult := SearchResult;
  if FModifySearchResult <> nil then
  begin
    directoryEntryIntf := FModifySearchResult.GetDirectoryEntry();
    if directoryEntryIntf.Properties['givenName'].Value <> null then
      txtFirstName.Text := directoryEntryIntf.Properties['givenName'].Value;
    if (directoryEntryIntf.Properties['initials'].Value <> null) then
      txtMiddleName.Text := directoryEntryIntf.Properties['initials'].Value;
    if (directoryEntryIntf.Properties['sn'].Value <> null) then
      txtLastName.Text := directoryEntryIntf.Properties['sn'].Value;
  end;
  SetEnabledUpdateUserInfoCtrls(FModifySearchResult <> nil);
end;

procedure TfrmAD.ShowUserInformation(SearchResult: _SearchResult);
var
  directoryEntryIntf: _DirectoryEntry;
begin
  directoryEntryIntf := SearchResult.GetDirectoryEntry();

  if (directoryEntryIntf.Properties['samaccountname'].Value <> null) then
    lblUsernameDisplay.Caption := 'Username : ' + directoryEntryIntf.Properties['samaccountname'].Value;

  if (directoryEntryIntf.Properties['givenName'].Value <> null) then
    lblFirstname.Caption := 'First Name : ' + directoryEntryIntf.Properties['givenName'].Value;

  if (directoryEntryIntf.Properties['initials'].Value <> null) then
    lblMiddleName.Caption := 'Middle Name : ' + directoryEntryIntf.Properties['initials'].Value;

  if (directoryEntryIntf.Properties['sn'].Value <> null) then
    lblLastName.Caption := 'Last Name : ' + directoryEntryIntf.Properties['sn'].Value;

  if (directoryEntryIntf.Properties['mail'].Value <> null) then
    lblEmailId.Caption := 'Email ID : ' + directoryEntryIntf.Properties['mail'].Value;

  if (directoryEntryIntf.Properties['title'].Value <> null) then
    lblTitle.Caption := 'Title : ' + directoryEntryIntf.Properties['title'].Value;

  if (directoryEntryIntf.Properties['company'].Value <> null) then
    lblCompany.Caption := 'Company : ' + directoryEntryIntf.Properties['company'].Value;

  if (directoryEntryIntf.Properties['l'].Value <> null) then
    lblCity.Caption := 'City : ' + directoryEntryIntf.Properties['l'].Value;

  if (directoryEntryIntf.Properties['st'].Value <> null) then
    lblState.Caption := 'State : ' + directoryEntryIntf.Properties['st'].Value;

  if (directoryEntryIntf.Properties['co'].Value <> null) then
    lblCountry.Caption := 'Country : ' + directoryEntryIntf.Properties['co'].Value;

  if (directoryEntryIntf.Properties['postalCode'].Value <> null) then
    lblPostal.Caption := 'Postal Code : ' + directoryEntryIntf.Properties['postalCode'].Value;

  if (directoryEntryIntf.Properties['telephoneNumber'].Value <> null) then
    lblTelephone.Caption := 'Telephone No. : ' + directoryEntryIntf.Properties['telephoneNumber'].Value;
end;

end.
