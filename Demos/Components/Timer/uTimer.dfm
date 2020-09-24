object Form14: TForm14
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Set Timer '
  ClientHeight = 361
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 143
    Top = 8
    Width = 484
    Height = 345
    ReadOnly = True
    TabOrder = 0
  end
  object btnStartTimer: TButton
    Left = 8
    Top = 8
    Width = 129
    Height = 41
    Caption = 'Start Timer'
    TabOrder = 1
    OnClick = btnStartTimerClick
  end
  object btnEndTimer: TButton
    Left = 8
    Top = 55
    Width = 129
    Height = 42
    Caption = 'Stop Timer'
    TabOrder = 2
    OnClick = btnEndTimerClick
  end
  object CnTimer1: TCnTimer
    OnTick = CnTimer1Tick
    Left = 64
    Top = 152
  end
end
