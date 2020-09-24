object Form25: TForm25
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '.Net TrackBar in Delphi'
  ClientHeight = 193
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CnTrackBar1: TCnTrackBar
    Left = 25
    Top = 16
    Width = 289
    Height = 45
    Location.X = 25
    Location.Y = 16
    Size.Width = 289
    TabOrder = 0
    BackColor.HexCode = 'DarkCyan'
    BackColor.Name = 'DarkCyan'
    TickStyle = tsBoth
    OnValueChanged = CnTrackBar1ValueChanged
  end
  object CnTrackBar2: TCnTrackBar
    Left = 88
    Top = 67
    Width = 226
    Height = 45
    Location.X = 88
    Location.Y = 67
    Size.Width = 226
    TabOrder = 1
  end
  object CnTrackBar3: TCnTrackBar
    Left = 25
    Top = 67
    Width = 45
    Height = 96
    Location.X = 25
    Location.Y = 67
    Size.Width = 45
    Size.Height = 96
    TabOrder = 2
    Orientation = otVertical
  end
  object CnTrackBar4: TCnTrackBar
    Left = 88
    Top = 118
    Width = 226
    Height = 45
    Location.X = 88
    Location.Y = 118
    Size.Width = 226
    TabOrder = 3
    TickStyle = tsTopLeft
  end
end
