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
  CNClrLib.Windows, CNClrLib.Data, CNClrLib.Control.EnumTypes, CNClrLib.Control.EventArgs,
  CNClrLib.Control.Base, CNClrLib.Component.BindingSource, CNClrLib.Control.ScrollableControl,
  CNClrLib.Control.ToolStrip, CNClrLib.Control.BindingNavigator, CNClrLib.Control.DataGridView;

type
  TForm1 = class(TForm)
    ButtonLoadData: TButton;
    cboTableName: TComboBox;
    Label1: TLabel;
    CnDataGridView1: TCnDataGridView;
    CnBindingNavigator1: TCnBindingNavigator;
    CnBindingSource1: TCnBindingSource;
    procedure FormCreate(Sender: TObject);
    procedure ButtonLoadDataClick(Sender: TObject);
  private
    FDataSet: _DataSet;

    procedure MakeChildTable;
    procedure MakeDataRelation;
    procedure MakeDataTables;
    procedure MakeParentTable;
    procedure AddTableNames;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses CNClrLib.Host, CNClrLib.Enums;

procedure TForm1.MakeParentTable;
var
  table: _DataTable;
  column: _DataColumn;
  row: _DataRow;
  primaryKeyColumns: _DataColumnArray;
  I: Integer;
begin
  // Create a new DataTable.
  table := CoDataTable.CreateInstance('ParentTable');

  // Create new DataColumn, set DataType,
  // ColumnName and add to DataTable.
  column := CoDataColumn.CreateInstance;
  column.DataType := TClrAssembly.GetType('System.Int32');
  column.ColumnName := 'id';
  column.ReadOnly_ := true;
  column.Unique := true;
  // Add the Column to the DataColumnCollection.
  table.Columns.Add(column);

  // Create second column.
  column := CoDataColumn.CreateInstance;
  column.DataType := TClrAssembly.GetType('System.String');
  column.ColumnName := 'ParentItem';
  column.AutoIncrement := false;
  column.Caption := 'ParentItem';
  column.ReadOnly_ := false;
  column.Unique := false;
  // Add the column to the table.
  table.Columns.Add(column);

  // Make the ID column the primary key column.
  primaryKeyColumns := CoDataColumnArray.CreateInstance(1);
  primaryKeyColumns[0] := table.Columns.Item_1['id'];
  table.PrimaryKey := primaryKeyColumns;

  // Instantiate the FDataSet variable.
  FDataSet := CoDataSet.CreateInstance;
  // Add the new DataTable to the FDataSet.
  FDataSet.Tables.Add(table);

  // Create three new DataRow objects and add
  // them to the DataTable
  for I := 0 to 2 do
  begin
    row := table.NewRow;
    row.Item_1['id'] := i;
    row.Item_1['ParentItem'] := 'ParentItem ' + IntToStr(i);
    table.Rows.Add(row);
  end;
end;

procedure TForm1.MakeChildTable;
var
  table: _DataTable;
  column: _DataColumn;
  row: _DataRow;
  I: Integer;
begin
  // Create a new DataTable.
  table := CoDataTable.CreateInstance('childTable');

  // Create first column and add to the DataTable.
  column := CoDataColumn.CreateInstance;
  column.DataType := TClrAssembly.GetType('System.Int32');
  column.ColumnName := 'ChildID';
  column.AutoIncrement := true;
  column.Caption := 'ID';
  column.ReadOnly_ := true;
  column.Unique := true;

  // Add the column to the DataColumnCollection.
  table.Columns.Add(column);

  // Create second column.
  column := CoDataColumn.CreateInstance;
  column.DataType := TClrAssembly.GetType('System.String');
  column.ColumnName := 'ChildItem';
  column.AutoIncrement := false;
  column.Caption := 'ChildItem';
  column.ReadOnly_ := false;
  column.Unique := false;
  table.Columns.Add(column);

  // Create third column.
  column := CoDataColumn.CreateInstance;
  column.DataType := TClrAssembly.GetType('System.Int32');
  column.ColumnName := 'ParentID';
  column.AutoIncrement := false;
  column.Caption := 'ParentID';
  column.ReadOnly_ := false;
  column.Unique := false;
  table.Columns.Add(column);

  FDataSet.Tables.Add(table);

  // Create three sets of DataRow objects,
  // five rows each, and add to DataTable.
  for I := 0 to 4 do
  begin
    row := table.NewRow;
    row.Item_1['childID'] := i;
    row.Item_1['ChildItem'] := 'Item ' + IntToStr(i);
    row.Item_1['ParentID'] := 0;
    table.Rows.Add(row);
  end;

  for I := 0 to 4 do
  begin
    row := table.NewRow;
    row.Item_1['childID'] := i + 5;
    row.Item_1['ChildItem'] := 'Item ' + IntToStr(i);
    row.Item_1['ParentID'] := 1;
    table.Rows.Add(row);
  end;

  for I := 0 to 4 do
  begin
    row := table.NewRow;
    row.Item_1['childID'] := i + 10;
    row.Item_1['ChildItem'] := 'Item ' + IntToStr(i);
    row.Item_1['ParentID'] := 2;
    table.Rows.Add(row);
  end;
end;

procedure TForm1.MakeDataRelation;
var
  parentColumn,
  childColumn: _DataColumn;
  relation: _DataRelation;
begin
  // DataRelation requires two DataColumn
  // (parent and child) and a name.
  parentColumn := FDataSet.Tables.Item_1['ParentTable'].Columns.Item_1['id'];
  childColumn := FDataSet.Tables.Item_1['ChildTable'].Columns.Item_1['ParentID'];
  relation := CoDataRelation.CreateInstance('parent2Child', parentColumn, childColumn);
  FDataSet.Tables.Item_1['ChildTable'].ParentRelations.Add(relation);
end;

procedure TForm1.MakeDataTables;
begin
  MakeParentTable;
  MakeChildTable;
  MakeDataRelation;
  AddTableNames;
end;

procedure TForm1.AddTableNames;
var
  I: Integer;
begin
  for I := 0 to FDataSet.Tables.Count - 1 do
    cboTableName.Items.Add(FDataSet.Tables[i].TableName);

  cboTableName.ItemIndex := 0;
end;

procedure TForm1.ButtonLoadDataClick(Sender: TObject);
begin
  CnBindingSource1.DataSource := FDataSet.Tables[cboTableName.ItemIndex];
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MakeDataTables;
end;

end.
