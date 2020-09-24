object Form17: TForm17
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '.Net ListBoxes in Delphi'
  ClientHeight = 271
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CnListBox1: TCnListBox
    Left = 16
    Top = 16
    Width = 145
    Height = 225
    Location.X = 16
    Location.Y = 16
    Size.Width = 145
    Size.Height = 225
    TabOrder = 0
    ColumnWidth = 50
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '11'
      '12'
      '14'
      '15'
      '16'
      '17'
      '18')
    SelectionMode = smMultiExtended
  end
  object CnListBox2: TCnListBox
    Left = 167
    Top = 16
    Width = 145
    Height = 132
    Location.X = 167
    Location.Y = 16
    Size.Width = 145
    Size.Height = 132
    TabOrder = 1
    BackColor.HexCode = 'MediumSeaGreen'
    BackColor.Name = 'MediumSeaGreen'
    ColumnWidth = 50
    Font.Name = 'Tahoma'
    Font.Size = 9.750000000000000000
    Font.Style = [fsBold]
    ForeColor.HexCode = 'Maroon'
    ForeColor.Name = 'Maroon'
    ItemHeight = 16
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '11'
      '12'
      '14'
      '15'
      '16'
      '17'
      '18')
    MultiColumn = True
    SelectionMode = smMultiExtended
    Sorted = True
    OnClick = CnListBox2Click
    OnMeasureItem = CnListBox2MeasureItem
    OnSelectedIndexChanged = CnListBox2SelectedIndexChanged
    OnSelectedValueChanged = CnListBox2SelectedValueChanged
  end
end
