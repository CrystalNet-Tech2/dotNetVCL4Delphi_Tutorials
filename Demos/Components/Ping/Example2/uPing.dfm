object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'How to: Ping a Host'
  ClientHeight = 302
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    634
    302)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 19
    Top = 13
    Width = 22
    Height = 13
    Caption = 'Host'
  end
  object Edit1: TEdit
    Left = 52
    Top = 8
    Width = 165
    Height = 77
    AutoSize = False
    TabOrder = 0
    Text = 'www.google.com'
  end
  object Button2: TButton
    Left = 52
    Top = 91
    Width = 101
    Height = 25
    Caption = 'Ping Async'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 248
    Top = 8
    Width = 378
    Height = 286
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object CnPing1: TCnPing
    OnPingCompleted = CnPing1PingCompleted
    Left = 424
    Top = 192
  end
end
