object Form8: TForm8
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '.Net ComboBoxes in Delphi'
  ClientHeight = 282
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CnComboBox1: TCnComboBox
    Left = 72
    Top = 32
    Width = 146
    Height = 21
    Location.X = 72
    Location.Y = 32
    Size.Width = 146
    TabOrder = 0
    DropDownWidth = 146
    FlatStyle = fsFlat
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
      '10'
      '11'
      '12'
      '14')
    Text = '1'
    OnTextChanged = CnComboBox1TextChanged
    OnTextUpdate = CnComboBox1TextUpdate
  end
  object CnComboBox2: TCnComboBox
    Left = 72
    Top = 76
    Width = 146
    Height = 21
    Location.X = 72
    Location.Y = 76
    Size.Width = 146
    TabOrder = 1
    AutoCompleteMode = acmSuggestAppend
    AutoCompleteSource = acsListItems
    DropDownWidth = 146
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
      '10'
      '11'
      '12'
      '14')
    Text = '10'
  end
  object CnComboBox3: TCnComboBox
    Left = 72
    Top = 121
    Width = 146
    Height = 21
    Location.X = 72
    Location.Y = 121
    Size.Width = 146
    TabOrder = 2
    AutoCompleteMode = acmSuggest
    AutoCompleteSource = acsListItems
    DropDownWidth = 146
    FlatStyle = fsPopup
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
      '10'
      '11'
      '12'
      '14')
    MaxDropDownItems = 10
    Text = '2'
  end
  object CnComboBox4: TCnComboBox
    Left = 72
    Top = 164
    Width = 145
    Height = 21
    Location.X = 72
    Location.Y = 164
    Size.Width = 145
    TabOrder = 3
    DropDownStyle = cbsDropDownList
    DropDownWidth = 145
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
      '10'
      '11'
      '12'
      '14')
    Text = '1'
    OnDropDown = CnComboBox4DropDown
    OnDropDownClosed = CnComboBox4DropDownClosed
    OnSelectedIndexChanged = CnComboBox4SelectedIndexChanged
    OnSelectedValueChanged = CnComboBox4SelectedValueChanged
  end
  object CnComboBox5: TCnComboBox
    Left = 72
    Top = 212
    Width = 145
    Height = 21
    Location.X = 72
    Location.Y = 212
    Size.Width = 145
    TabOrder = 4
    BackColor.HexCode = 'LightSeaGreen'
    BackColor.Name = 'LightSeaGreen'
    DropDownWidth = 145
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
      '10'
      '11'
      '12'
      '14')
    Text = '3'
  end
end
