object Form22: TForm22
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Display .Net MessageBox Screen in Delphi'
  ClientHeight = 217
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CnButton1: TCnButton
    Left = 32
    Top = 32
    Width = 145
    Height = 73
    Location.X = 32
    Location.Y = 32
    Size.Width = 145
    Size.Height = 73
    TabOrder = 0
    Text = 'Show MessageBox with Caption Only'
    OnClick = CnButton1Click
  end
  object CnButton2: TCnButton
    Left = 183
    Top = 32
    Width = 145
    Height = 73
    Location.X = 183
    Location.Y = 32
    Size.Width = 145
    Size.Height = 73
    TabOrder = 1
    Text = 'Show MessageBox without Caption'
    OnClick = CnButton2Click
  end
  object CnButton3: TCnButton
    Left = 333
    Top = 32
    Width = 145
    Height = 73
    Location.X = 333
    Location.Y = 32
    Size.Width = 145
    Size.Height = 73
    TabOrder = 2
    Text = 'Show MessageBox with Form has owner'
    OnClick = CnButton3Click
  end
  object CnButton4: TCnButton
    Left = 333
    Top = 117
    Width = 145
    Height = 73
    Location.X = 333
    Location.Y = 117
    Size.Width = 145
    Size.Height = 73
    TabOrder = 3
    Text = 'Show Error MessageBox'
    OnClick = CnButton4Click
  end
  object CnButton5: TCnButton
    Left = 183
    Top = 117
    Width = 145
    Height = 73
    Location.X = 183
    Location.Y = 117
    Size.Width = 145
    Size.Height = 73
    TabOrder = 4
    Text = 'Ask Question MessageBox with Question Icon'
    OnClick = CnButton5Click
  end
  object CnButton6: TCnButton
    Left = 32
    Top = 117
    Width = 145
    Height = 73
    Location.X = 32
    Location.Y = 117
    Size.Width = 145
    Size.Height = 73
    TabOrder = 5
    Text = 'Ask Question MessageBox'
    OnClick = CnButton6Click
  end
end
