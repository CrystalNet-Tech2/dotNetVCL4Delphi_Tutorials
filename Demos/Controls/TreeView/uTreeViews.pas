unit uTreeViews;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.TreeView, CNClrLib.Component.ImageList;

type
  TForm24 = class(TForm)
    CnImageList1: TCnImageList;
    CnTreeView1: TCnTreeView;
    CnTreeView2: TCnTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form24: TForm24;

implementation

{$R *.dfm}

end.
