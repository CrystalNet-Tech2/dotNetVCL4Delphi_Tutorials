unit uWebBrowser;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs, ExtCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Component.ImageList, CNClrLib.Control.ButtonBase, CNClrLib.Control.Button,
  CNClrLib.Control.ListControl, CNClrLib.Control.ComboBox, CNClrLib.Control.TextBoxBase,
  CNClrLib.Control.TextBox, CNClrLib.Control.LabelA, CNClrLib.Control.ProgressBar,
  CNClrLib.Control.WebBrowser;

type
  TForm23 = class(TForm)
    Panel1: TPanel;
    btnBack: TCnButton;
    btnHome: TCnButton;
    btnForward: TCnButton;
    CnImageList1: TCnImageList;
    btnPrint: TCnButton;
    btnRefresh: TCnButton;
    btnGo: TCnButton;
    txtAddress: TCnTextBox;
    CnWebBrowser1: TCnWebBrowser;
    Panel2: TPanel;
    pbProgressStatus: TCnProgressBar;
    lblStatus: TCnLabel;
    procedure btnPrintClick(Sender: TObject; E: _EventArgs);
    procedure btnRefreshClick(Sender: TObject; E: _EventArgs);
    procedure btnGoClick(Sender: TObject; E: _EventArgs);
    procedure btnForwardClick(Sender: TObject; E: _EventArgs);
    procedure btnHomeClick(Sender: TObject; E: _EventArgs);
    procedure btnBackClick(Sender: TObject; E: _EventArgs);
    procedure CnWebBrowser1ProgressChanged(Sender: TObject;
      E: _WebBrowserProgressChangedEventArgs);
    procedure CnWebBrowser1DocumentTitleChanged(Sender: TObject; E: _EventArgs);
    procedure CnWebBrowser1DocumentCompleted(Sender: TObject;
      E: _WebBrowserDocumentCompletedEventArgs);
    procedure CnWebBrowser1StatusTextChanged(Sender: TObject; E: _EventArgs);
    procedure CnWebBrowser1Navigated(Sender: TObject;
      E: _WebBrowserNavigatedEventArgs);
    procedure FormShow(Sender: TObject);
  private
    procedure DoInitialiseWebBrowser;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form23: TForm23;

implementation

{$R *.dfm}

procedure TForm23.DoInitialiseWebBrowser;
begin
  CnWebBrowser1.Navigate(txtAddress.Text);

  btnBack.Enabled := False;
  btnForward.Enabled := False;
end;

procedure TForm23.FormShow(Sender: TObject);
begin
  DoInitialiseWebBrowser;
end;

procedure TForm23.btnBackClick(Sender: TObject; E: _EventArgs);
begin
  CnWebBrowser1.GoBack;
end;

procedure TForm23.btnHomeClick(Sender: TObject; E: _EventArgs);
begin
  CnWebBrowser1.GoHome;
end;

procedure TForm23.btnForwardClick(Sender: TObject; E: _EventArgs);
begin
  CnWebBrowser1.GoForward;
end;

procedure TForm23.btnPrintClick(Sender: TObject; E: _EventArgs);
begin
  CnWebBrowser1.ShowPrintPreviewDialog;
end;

procedure TForm23.btnRefreshClick(Sender: TObject; E: _EventArgs);
begin
  CnWebBrowser1.Refresh;
end;

procedure TForm23.btnGoClick(Sender: TObject; E: _EventArgs);
begin
  CnWebBrowser1.Navigate(txtAddress.Text);
end;

procedure TForm23.CnWebBrowser1DocumentCompleted(Sender: TObject;
  E: _WebBrowserDocumentCompletedEventArgs);
begin
  btnBack.Enabled := CnWebBrowser1.CanGoBack;
  btnForward.Enabled := CnWebBrowser1.CanGoForward;
  lblStatus.Text := 'Done';
end;

procedure TForm23.CnWebBrowser1DocumentTitleChanged(Sender: TObject;
  E: _EventArgs);
begin
  Caption := CnWebBrowser1.DocumentTitle;
end;

procedure TForm23.CnWebBrowser1Navigated(Sender: TObject;
  E: _WebBrowserNavigatedEventArgs);
begin
  txtAddress.Text := CnWebBrowser1.Url.ToString();
end;

procedure TForm23.CnWebBrowser1ProgressChanged(Sender: TObject;
  E: _WebBrowserProgressChangedEventArgs);
begin
  pbProgressStatus.Maximum := E.MaximumProgress;
  if (E.CurrentProgress < 0) or (E.MaximumProgress < E.CurrentProgress) then
    pbProgressStatus.Value := E.MaximumProgress
  else
    pbProgressStatus.Value := E.CurrentProgress;
end;

procedure TForm23.CnWebBrowser1StatusTextChanged(Sender: TObject;
  E: _EventArgs);
begin
  lblStatus.Text := CnWebBrowser1.StatusText;
end;

end.
