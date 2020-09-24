object Form34: TForm34
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '.Net MonthCalendar control in Delphi'
  ClientHeight = 564
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CnMonthCalendar1: TCnMonthCalendar
    Left = 24
    Top = 48
    Width = 227
    Height = 162
    Location.X = 24
    Location.Y = 48
    Size.Width = 227
    Size.Height = 162
    TabOrder = 0
    BackColor.HexCode = 'Cornsilk'
    BackColor.Name = 'Cornsilk'
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ForeColor.HexCode = 'DarkRed'
    ForeColor.Name = 'DarkRed'
    TodayDate = 43423.000000000000000000
  end
  object CnMonthCalendar2: TCnMonthCalendar
    Left = 16
    Top = 216
    Width = 454
    Height = 324
    Location.X = 16
    Location.Y = 216
    Size.Width = 454
    Size.Height = 324
    TabOrder = 1
    CalendarDimensions.Width = 2
    CalendarDimensions.Height = 2
    TodayDate = 43424.000000000000000000
  end
  object CnCheckBox1: TCnCheckBox
    Left = 24
    Top = 25
    Width = 337
    Height = 17
    Location.X = 24
    Location.Y = 25
    Size.Width = 337
    Size.Height = 17
    TabOrder = 2
    Text = 'Disable VisualStyle to apply Calendar Fonts and Colors'
    OnCheckedChanged = CnCheckBox1CheckedChanged
  end
end
