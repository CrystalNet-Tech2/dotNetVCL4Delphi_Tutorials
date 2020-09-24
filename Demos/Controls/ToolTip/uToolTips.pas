unit uToolTips;

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Component.ToolTip, CNClrLib.Control.LinkLabel, CNClrLib.Control.LabelA,
  CNClrLib.Control.DateTimePicker, CNClrLib.Control.ComboBox,
  CNClrLib.Control.ListControl, CNClrLib.Control.ListBox,
  CNClrLib.Control.CheckedListBox, CNClrLib.Control.CheckBox,
  CNClrLib.Control.ButtonBase, CNClrLib.Control.Button,
  CNClrLib.Control.ListView, CNClrLib.Control.MonthCalendar,
  CNClrLib.Control.TextBoxBase, CNClrLib.Control.TextBox,
  CNClrLib.Control.ScrollableControl, CNClrLib.Control.ContainerControl,
  CNClrLib.Control.UpDownBase, CNClrLib.Control.NumericUpDown;

type
  TForm26 = class(TForm)
    CnButton5: TCnButton;
    CnCheckBox5: TCnCheckBox;
    CnCheckedListBox2: TCnCheckedListBox;
    CnComboBox5: TCnComboBox;
    CnDateTimePicker5: TCnDateTimePicker;
    CnLabel4: TCnLabel;
    CnCheckBox7: TCnCheckBox;
    CnLinkLabel3: TCnLinkLabel;
    CnToolTip1: TCnToolTip;
    CnMonthCalendar1: TCnMonthCalendar;
    CnListView1: TCnListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form26: TForm26;

implementation

{$R *.dfm}

end.
