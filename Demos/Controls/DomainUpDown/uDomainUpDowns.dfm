object Form10: TForm10
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '.Net DomainUpDown in Delphi'
  ClientHeight = 253
  ClientWidth = 295
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
  object CnDomainUpDown1: TCnDomainUpDown
    Left = 88
    Top = 72
    Width = 105
    Height = 20
    Location.X = 88
    Location.Y = 72
    Size.Width = 105
    TabOrder = 0
    OnDoubleClick = CnDomainUpDown1DoubleClick
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
      '13'
      '14'
      '15'
      '16')
    Text = '1'
    OnSelectedItemChanged = CnDomainUpDown1SelectedItemChanged
    OnTextChanged = CnDomainUpDown1TextChanged
  end
  object CnDomainUpDown2: TCnDomainUpDown
    Left = 88
    Top = 106
    Width = 105
    Height = 20
    Location.X = 88
    Location.Y = 106
    Size.Width = 105
    TabOrder = 1
    TextAlign = haCenter
    UpDownAlign = lraLeft
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
      '13'
      '14'
      '15'
      '16')
    Text = '1'
  end
  object CnDomainUpDown3: TCnDomainUpDown
    Left = 88
    Top = 144
    Width = 105
    Height = 20
    Location.X = 88
    Location.Y = 144
    Size.Width = 105
    TabOrder = 2
    BackColor.HexCode = 'DarkTurquoise'
    BackColor.Name = 'DarkTurquoise'
    Font.Style = [fsRegular, fsBold]
    ForeColor.HexCode = 'Maroon'
    ForeColor.Name = 'Maroon'
    Items.Strings = (
      '.Net'
      'Delphi'
      'C#'
      'Java'
      'C++'
      '')
    Text = '.Net'
  end
end
