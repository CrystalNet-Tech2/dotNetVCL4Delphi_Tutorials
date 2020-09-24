object Form9: TForm9
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '.Net DateTimePicker in Delphi'
  ClientHeight = 242
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CnDateTimePicker1: TCnDateTimePicker
    Left = 72
    Top = 72
    Width = 180
    Height = 20
    Location.X = 72
    Location.Y = 72
    Size.Width = 180
    TabOrder = 0
    CalendarForeColor.HexCode = 'GreenYellow'
    CalendarForeColor.Name = 'GreenYellow'
    CalendarMonthBackground.HexCode = 'DeepSkyBlue'
    CalendarMonthBackground.Name = 'DeepSkyBlue'
    CalendarTitleForeColor.HexCode = 'Maroon'
    CalendarTitleForeColor.Name = 'Maroon'
    CalendarTrailingForeColor.HexCode = 'SlateBlue'
    CalendarTrailingForeColor.Name = 'SlateBlue'
    CustomFormat = 'dd/MM/yyyy hh:mm:ss'
    Format = dtpCustom
    Value = 43423.609077303240000000
  end
  object CnDateTimePicker2: TCnDateTimePicker
    Left = 72
    Top = 108
    Width = 180
    Height = 20
    Location.X = 72
    Location.Y = 108
    Size.Width = 180
    TabOrder = 1
    DropDownAlign = lraRight
    Value = 43423.609977777780000000
  end
  object CnDateTimePicker3: TCnDateTimePicker
    Left = 72
    Top = 143
    Width = 180
    Height = 20
    Location.X = 72
    Location.Y = 143
    Size.Width = 180
    TabOrder = 2
    ShowCheckBox = True
    ShowUpDown = True
    Value = 43423.609922789350000000
  end
  object CnDateTimePicker4: TCnDateTimePicker
    Left = 72
    Top = 184
    Width = 180
    Height = 20
    Location.X = 72
    Location.Y = 184
    Size.Width = 180
    TabOrder = 3
    Format = dtpTime
    Value = 43423.613039907410000000
  end
  object CnCheckBox1: TCnCheckBox
    Left = 72
    Top = 17
    Width = 193
    Height = 40
    Location.X = 72
    Location.Y = 17
    Size.Width = 193
    Size.Height = 40
    TabOrder = 4
    Text = 'Enable/Disable VisualStyles to apply Calendar Fonts And Colors'
    OnCheckedChanged = CnCheckBox1CheckedChanged
  end
end
