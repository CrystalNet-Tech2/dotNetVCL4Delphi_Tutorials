object frmPing: TfrmPing
  Left = 0
  Top = 0
  Caption = 'Using .Net Ping.Send method in Delphi'
  ClientHeight = 156
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 22
    Height = 13
    Caption = 'Host'
  end
  object Edit1: TEdit
    Left = 72
    Top = 21
    Width = 297
    Height = 21
    TabOrder = 0
    Text = 'www.google.com'
  end
  object Button1: TButton
    Left = 72
    Top = 64
    Width = 121
    Height = 25
    Caption = 'Ping Host'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 199
    Top = 64
    Width = 114
    Height = 25
    Caption = 'Ping Async'
    TabOrder = 2
    OnClick = Button2Click
  end
  object CnPing1: TCnPing
    Left = 312
    Top = 152
  end
end
