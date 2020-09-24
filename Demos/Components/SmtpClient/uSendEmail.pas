unit uSendEmail;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.Base,
  CNClrLib.Component.OpenFileDialog, CNClrLib.Component.SmtpClient;

type
  TfrmSendEmail = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnSendEmail: TButton;
    txtFrom: TEdit;
    txtTo: TEdit;
    txtSubject: TEdit;
    rtxtMailBody: TRichEdit;
    txtAttachment: TEdit;
    btnBrowse: TButton;
    txtHost: TEdit;
    txtUser: TEdit;
    txtPassword: TEdit;
    CnOpenFileDialog1: TCnOpenFileDialog;
    CnSmtpClient1: TCnSmtpClient;
    txtPort: TEdit;
    Label9: TLabel;
    chkEnableSSL: TCheckBox;
    procedure btnBrowseClick(Sender: TObject);
    procedure btnSendEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSendEmail: TfrmSendEmail;

implementation

{$R *.dfm}


procedure TfrmSendEmail.btnBrowseClick(Sender: TObject);
begin
  CnOpenFileDialog1.FileName := txtAttachment.Text;
  if CnOpenFileDialog1.ShowDialog = TDialogResult.drOK then
    txtAttachment.Text := CnOpenFileDialog1.FileName;
end;

procedure TfrmSendEmail.btnSendEmailClick(Sender: TObject);
var
  mmessage: _MailMessage;
begin
  try
    // Init the smtp client and setting the network credentials
    CnSmtpClient1.Host := txtHost.Text;
    CnSmtpClient1.Port := StrToIntDef(txtPort.Text, 0);
    CnSmtpClient1.UserName := txtUser.Text;
    CnSmtpClient1.Password := txtPassword.Text;
    CnSmtpClient1.EnableSsl := chkEnableSSL.Checked;

    // Create MailMessage
    mmessage := TMailMessageActivator.CreateInstance(txtFrom.Text, txtTo.Text);
    mmessage.Subject := txtSubject.Text;
    mmessage.Body := rtxtMailBody.Text;

    if FileExists(txtAttachment.Text) then
    begin
      mmessage.Attachments.Add(TAttachmentActivator.CreateInstance(txtAttachment.Text));
    end;

    CnSmtpClient1.Send(mmessage);        
    TClrMessageBox.Show('The email is sent.', Caption, TMessageBoxButtons.mbbsOK, TMessageBoxIcon.mbiInformation);
  except 
    on E: Exception do
    begin  
      TClrMessageBox.Show(E.Message, Caption, TMessageBoxButtons.mbbsOK, TMessageBoxIcon.mbiError);
    end;
  end;
end;

end.
