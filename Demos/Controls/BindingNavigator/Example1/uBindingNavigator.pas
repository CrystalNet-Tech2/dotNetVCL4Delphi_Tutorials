unit uBindingNavigator;

// This form demonstrates using a BindingNavigator to display
// rows from a database query sequentially.

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CNClrLib.Control.EnumTypes,
  CNClrLib.Control.EventArgs, CNClrLib.Control.Base,
  CNClrLib.Control.ScrollableControl, CNClrLib.Control.ToolStrip,
  CNClrLib.Control.BindingNavigator, CNClrLib.Component.BindingSource,
  CNClrLib.Control.TextBoxBase, CNClrLib.Control.TextBox;

type
  TfrmBindingNav = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    customersBindingNavigator : TCnBindingNavigator;
    customersBindingSource: TCnBindingSource;
    companyNameTextBox: TCnTextBox;
  public
    { Public declarations }
  end;

var
  frmBindingNav: TfrmBindingNav;

implementation

{$R *.dfm}

uses CNClrLib.Data, CNClrLib.Windows;

procedure TfrmBindingNav.FormCreate(Sender: TObject);
begin
  // This is the BindingNavigator that allows the user
  // to navigate through the rows in a DataSet.
  customersBindingNavigator := TCnBindingNavigator.Create(Self);

  // This is the BindingSource that provides data for
  // the Textbox control.
  customersBindingSource := TCnBindingSource.Create(Self);

  // This is the TextBox control that displays the CompanyName
  // field from the DataSet.
  companyNameTextBox := TCnTextBox.Create(Self);

  // Set up the BindingSource component.
  customersBindingNavigator.BindingSource := customersBindingSource;
  customersBindingNavigator.Align := alTop;
  customersBindingNavigator.Parent := Self;

  // Set up the TextBox control for displaying company names.
  companyNameTextBox.Align := alBottom;
  companyNameTextBox.Parent := Self;
end;

procedure TfrmBindingNav.FormShow(Sender: TObject);
var
  connectString: String;
  connection: _SqlConnection;
  dataAdapter1: _SqlDataAdapter;
  ds: _DataSet;
begin
  // Open a connection to the database.
  // Replace the value of connectString with a valid
  // connection string to a Northwind database accessible
  // to your system.
  connectString := 'Integrated Security=SSPI;Persist Security Info=False;' +
      'Initial Catalog=Northwind;Data Source=localhost';

  connection := CoSqlConnection.CreateInstance(connectString);
  try
    dataAdapter1 := CoSqlDataAdapter.CreateInstance(CoSqlCommand.CreateInstance('Select * From Customers', connection));

    ds := CoDataSet.CreateInstance('Northwind Customers');
    ds.Tables.Add_1('Customers');
    dataAdapter1.Fill_3(ds.Tables.Item_1['Customers']);

    // Assign the DataSet as the DataSource for the BindingSource.
    customersBindingSource.DataSource := ds.Tables.Item_1['Customers'];

    // Bind the CompanyName field to the TextBox control.
    companyNameTextBox.DataBindings.Add(
        CoBinding.CreateInstance('Text',
          customersBindingSource.BindingSource,//.Unwrap,
          'CompanyName',
          True));
  finally
    connection.Dispose;
  end;
end;

end.
