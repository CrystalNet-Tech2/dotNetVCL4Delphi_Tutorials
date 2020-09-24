object Form20: TForm20
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Use .Net Application class methods in Delphi '
  ClientHeight = 191
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object CnButton1: TCnButton
    Left = 16
    Top = 8
    Width = 329
    Height = 49
    Location.X = 16
    Location.Y = 8
    Size.Width = 329
    Size.Height = 49
    TabOrder = 0
    Text = 'Application.ProcessMessages Alternative (DoEvents method)'
    OnClick = CnButton1Click
  end
  object CnCheckBox1: TCnCheckBox
    Left = 351
    Top = 23
    Width = 146
    Height = 17
    Location.X = 351
    Location.Y = 23
    Size.Width = 146
    Size.Height = 17
    TabOrder = 1
    Text = 'Cancel Loop Operation'
  end
  object CnCheckBox2: TCnCheckBox
    Left = 16
    Top = 72
    Width = 329
    Height = 17
    Location.X = 16
    Location.Y = 72
    Size.Width = 329
    Size.Height = 17
    TabOrder = 2
    Text = 'Enable or Disable Form/Controls VisualStyle'
    OnCheckedChanged = CnCheckBox2CheckedChanged
  end
  object CnButton2: TCnButton
    Left = 16
    Top = 112
    Width = 329
    Height = 49
    Location.X = 16
    Location.Y = 112
    Size.Width = 329
    Size.Height = 49
    TabOrder = 3
    Text = 'Show Application Information using .Net Application class'
    OnClick = CnButton2Click
  end
  object CnLabel1: TCnLabel
    Left = 383
    Top = 81
    Width = 106
    Height = 15
    Location.X = 383
    Location.Y = 81
    Size.Width = 106
    Size.Height = 15
    TabOrder = 4
    ImageIndex = -1
    Text = '0'
    TextAlign = caMiddleLeft
  end
  object CnLabel2: TCnLabel
    Left = 336
    Top = 81
    Width = 49
    Height = 16
    Location.X = 336
    Location.Y = 81
    Size.Width = 49
    Size.Height = 16
    TabOrder = 5
    ImageIndex = -1
    Text = 'Counter:'
  end
end
