object Form14: TForm14
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '.Net CheckedListBox in Delphi'
  ClientHeight = 195
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CnCheckedListBox1: TCnCheckedListBox
    Left = 3
    Top = 3
    Width = 134
    Height = 110
    Location.X = 3
    Location.Y = 3
    Size.Width = 134
    Size.Height = 110
    TabOrder = 0
    Font.Name = 'Tahoma'
    Font.Size = 9.750000000000000000
    ItemHeight = 18
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
      '0')
    OnSelectedIndexChanged = CnCheckedListBox1SelectedIndexChanged
    OnSelectedValueChanged = CnCheckedListBox1SelectedValueChanged
    CheckOnClick = True
    ThreeDCheckBoxes = True
  end
  object CnCheckedListBox2: TCnCheckedListBox
    Left = 143
    Top = 3
    Width = 134
    Height = 104
    Location.X = 143
    Location.Y = 3
    Size.Width = 134
    Size.Height = 104
    TabOrder = 1
    BackColor.HexCode = 'PowderBlue'
    BackColor.Name = 'PowderBlue'
    ColumnWidth = 40
    Font.Name = 'Tahoma'
    Font.Size = 9.000000000000000000
    Font.Style = [fsBold, fsItalic]
    ItemHeight = 17
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
      '0')
    MultiColumn = True
    Sorted = True
    CheckOnClick = True
    ThreeDCheckBoxes = True
  end
  object CnCheckedListBox3: TCnCheckedListBox
    Left = 3
    Top = 119
    Width = 274
    Height = 62
    Location.X = 3
    Location.Y = 119
    Size.Width = 274
    Size.Height = 62
    TabOrder = 2
    ItemHeight = 15
    MultiColumn = True
    ThreeDCheckBoxes = True
  end
end
