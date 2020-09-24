unit uDataGridView;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
{$IF CompilerVersion > 22}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Forms, Dialogs, StdCtrls,
{$IFEND}
  CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.DataGridView;

type
  TForm1 = class(TForm)
    ButtonLoadData: TButton;
    CnDataGridView1: TCnDataGridView;
    procedure ButtonLoadDataClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ManuallyAddDataGridViewRows;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses CNClrLib.Windows, CNClrLib.Host;

procedure TForm1.ButtonLoadDataClick(Sender: TObject);
begin
  // Resize the height of the column headers.
  CnDataGridView1.AutoResizeColumnHeadersHeight();

  // Resize all the row heights to fit the contents of all non-header cells.
  CnDataGridView1.AutoResizeRows(TDataGridViewAutoSizeRowsMode.asrmsAllCellsExceptHeaders);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ManuallyAddDataGridViewRows;
end;

procedure TForm1.ManuallyAddDataGridViewRows;
var
  row1, row2, row3, row4, row5, row6: TArray<String>;
  rows: TArray<TArray<String>>;
  rowArray: TArray<String>;
begin
  // Create an unbound DataGridView by declaring a column count.
  CnDataGridView1.ColumnCount := 4;
  CnDataGridView1.ColumnHeadersVisible := true;

  // Set the column header style.
  with CnDataGridView1.ColumnHeadersDefaultCellStyle do
  begin
    BackColor.Name := 'Beige';
    Font.Name := 'Verdana';
    Font.Size := 10;
    Font.Style := [TFontStyle.fsBold];
  end;

  // Set the column header names.
  CnDataGridView1.Columns[0].Name := 'Recipe';
  CnDataGridView1.Columns[1].Name := 'Category';
  CnDataGridView1.Columns[2].Name := 'Main Ingredients';
  CnDataGridView1.Columns[3].Name := 'Rating';

  // Populate the rows.
  SetLength(row1, 4);
  row1[0] := 'Meatloaf';
  row1[1] := 'Main Dish';
  row1[2] := 'ground beef';
  row1[3] := '**';

  SetLength(row2, 4);
  row2[0] := 'Key Lime Pie';
  row2[1] := 'Dessert';
  row2[2] := 'lime juice, evaporated milk';
  row2[3] := '****';

  SetLength(row3, 4);
  row3[0] := 'Orange-Salsa Pork Chops';
  row3[1] := 'Main Dish';
  row3[2] := 'pork chops, salsa, orange juice';
  row3[3] := '****';

  SetLength(row4, 4);
  row4[0] := 'Black Bean and Rice Salad';
  row4[1] := 'Salad';
  row4[2] := 'black beans, brown rice';
  row4[3] := '****';

  SetLength(row5, 4);
  row5[0] := 'Chocolate Cheesecake';
  row5[1] := 'Dessert';
  row5[2] := 'cream cheese';
  row5[3] := '****';

  SetLength(row6, 4);
  row5[0] := 'Black Bean Dip';
  row5[1] := 'Appetizer';
  row5[2] := 'black beans, sour cream';
  row5[3] := '****';

  SetLength(rows, 6);
  rows[0] := row1;
  rows[1] := row2;
  rows[2] := row3;
  rows[3] := row4;
  rows[4] := row5;
  rows[5] := row6;

  for rowArray in rows do
  begin
    CnDataGridView1.Rows.Add_1(TClrArrayHelper.ToObjectArray(rowArray));
  end;
end;

end.
