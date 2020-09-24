unit uImageLists;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.Base, CNClrLib.Component.ImageList, CNClrLib.Control.EnumTypes,
  CNClrLib.Control.EventArgs, CNClrLib.Control.LabelA, CNClrLib.Control.ButtonBase,
  CNClrLib.Control.Button, CNClrLib.Control.ListView;

type
  TForm11 = class(TForm)
    CnImageList_x16: TCnImageList;
    CnImageList_x32: TCnImageList;
    CnLabel1: TCnLabel;
    CnLabel2: TCnLabel;
    CnButton1: TCnButton;
    CnButton2: TCnButton;
    CnListView1: TCnListView;
    CnListView2: TCnListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

end.
