unit uButtons;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.ButtonBase, CNClrLib.Control.Button, CNClrLib.Component.ImageList;

type
  TForm12 = class(TForm)
    CnButton1: TCnButton;
    CnButton2: TCnButton;
    CnButton3: TCnButton;
    CnButton4: TCnButton;
    CnImageList1: TCnImageList;
    CnButton5: TCnButton;
    procedure FormCreate(Sender: TObject);
    procedure CnButton5Click(Sender: TObject; E: _EventArgs);
  private
    FDynamicButton: TCnButton;
    procedure CreateDynamicButton;
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

/// <summary>
/// This method creates a Button control at runtime
/// </summary>
procedure TForm12.CnButton5Click(Sender: TObject; E: _EventArgs);
begin
  TClrMessageBox.Show(CnButton5.Text);
end;

procedure TForm12.CreateDynamicButton;
begin
  // Create a Button object
  FDynamicButton := TCnButton.Create(Self);

  // Set Button properties
  FDynamicButton.Top := 312;
  FDynamicButton.Left := 67;
  FDynamicButton.Height := 40;
  FDynamicButton.Width := 300;
  FDynamicButton.BackColor.Name := 'Red';
//Or
//  FDynamicButton.BackColor.SetColor(clRed);

  FDynamicButton.ForeColor.SetColor(clBlue);
  FDynamicButton.Text := 'I am Dynamic Button';
  FDynamicButton.Name := 'DynamicButton';
  FDynamicButton.Font.Name := 'Georgia';
  FDynamicButton.Font.Size := 16;

  FDynamicButton.ImageList := CnImageList1;
//  FDynamicButton.ImageIndex := 0;
//Or
  FDynamicButton.ImageKey := 'Add_new.png';

  FDynamicButton.Parent := Self;
end;

procedure TForm12.FormCreate(Sender: TObject);
begin
  CreateDynamicButton;
end;

end.
