object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Load DataSet Interface into DataGridView'
  ClientHeight = 409
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    550
    409)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 257
    Top = 383
    Width = 53
    Height = 13
    Caption = 'TableName'
  end
  object ButtonLoadData: TButton
    Left = 467
    Top = 377
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Load Data'
    TabOrder = 0
    OnClick = ButtonLoadDataClick
  end
  object cboTableName: TComboBox
    Left = 316
    Top = 379
    Width = 145
    Height = 21
    Style = csDropDownList
    Anchors = [akRight, akBottom]
    TabOrder = 1
  end
  object CnDataGridView1: TCnDataGridView
    Left = 0
    Top = 27
    Width = 550
    Height = 347
    Anchors = [akLeft, akTop, akRight, akBottom]
    Location.Y = 27
    Size.Width = 550
    Size.Height = 347
    TabOrder = 2
    AlternatingRowsDefaultCellStyle.BackColor.HexCode = 'LightGoldenrodYellow'
    AlternatingRowsDefaultCellStyle.BackColor.Name = 'LightGoldenrodYellow'
    AlternatingRowsDefaultCellStyle.NullValue = ''
    ColumnHeadersHeight = 23
    BindingSource = CnBindingSource1
  end
  object CnBindingNavigator1: TCnBindingNavigator
    Left = 0
    Top = 0
    Width = 550
    Height = 27
    Align = alTop
    CnDock = dsTop
    Size.Width = 550
    Size.Height = 27
    TabOrder = 3
    Text = 'CnBindingNavigator1'
    BindingSource = CnBindingSource1
    CountItemFormat = 'of {0}'
  end
  object CnBindingSource1: TCnBindingSource
    Left = 184
    Top = 184
  end
end
