object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Load DataSet Interface int DataGridView'
  ClientHeight = 409
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    550
    409)
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonLoadData: TButton
    Left = 8
    Top = 380
    Width = 190
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Resize ColumnHeaders and Rows'
    TabOrder = 0
    OnClick = ButtonLoadDataClick
  end
  object CnDataGridView1: TCnDataGridView
    Left = 0
    Top = 0
    Width = 550
    Height = 374
    Anchors = [akLeft, akTop, akRight, akBottom]
    Size.Width = 550
    Size.Height = 374
    TabOrder = 1
    ColumnHeadersHeight = 23
  end
end
