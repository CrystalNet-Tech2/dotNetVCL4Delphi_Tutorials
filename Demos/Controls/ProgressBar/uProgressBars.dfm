object Form31: TForm31
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '.Net ProgressBar control in Delphi'
  ClientHeight = 264
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CnProgressBar1: TCnProgressBar
    Left = 80
    Top = 48
    Width = 177
    Height = 25
    Location.X = 80
    Location.Y = 48
    Size.Width = 177
    Size.Height = 25
    TabOrder = 0
    BackColor.HexCode = 'HotPink'
    BackColor.Name = 'HotPink'
    Style = pbsMarquee
  end
  object CnProgressBar2: TCnProgressBar
    Left = 80
    Top = 88
    Width = 177
    Height = 25
    Location.X = 80
    Location.Y = 88
    Size.Width = 177
    Size.Height = 25
    TabOrder = 1
    Style = pbsContinuous
  end
  object CnProgressBar3: TCnProgressBar
    Left = 80
    Top = 128
    Width = 177
    Height = 25
    Location.X = 80
    Location.Y = 128
    Size.Width = 177
    Size.Height = 25
    TabOrder = 2
    Style = pbsMarquee
  end
  object CnProgressBar4: TCnProgressBar
    Left = 80
    Top = 176
    Width = 177
    Height = 25
    Location.X = 80
    Location.Y = 176
    Size.Width = 177
    Size.Height = 25
    TabOrder = 3
  end
  object CnCheckBox1: TCnCheckBox
    Left = 24
    Top = 8
    Width = 337
    Height = 17
    Location.X = 24
    Location.Y = 8
    Size.Width = 337
    Size.Height = 17
    TabOrder = 4
    Text = 'Disable VisualStyle to apply ProgressBar Fonts and Colors'
    OnCheckedChanged = CnCheckBox1CheckedChanged
  end
end
