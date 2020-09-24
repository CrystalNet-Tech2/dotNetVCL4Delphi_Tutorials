object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'ClrContainer Host .Net Control in Delphi'
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
  object ClrContainer1: TClrContainer
    Left = 8
    Top = 8
    Width = 534
    Height = 345
    Anchors = [akLeft, akTop, akRight, akBottom]
    Location.X = 8
    Location.Y = 8
    Size.Width = 534
    Size.Height = 345
    TabOrder = 0
  end
  object ButtonLoadData: TCnButton
    Left = 467
    Top = 376
    Width = 75
    Height = 25
    Location.X = 467
    Location.Y = 376
    Size.Height = 25
    TabOrder = 1
    Text = 'Load Data'
    OnClick = ButtonLoadDataClick
  end
  object cboTableName: TCnComboBox
    Left = 316
    Top = 379
    Width = 145
    Height = 21
    Location.X = 316
    Location.Y = 379
    Size.Width = 145
    TabOrder = 2
    DropDownStyle = cbsDropDownList
    DropDownWidth = 145
    Text = ''
  end
end
