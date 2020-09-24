object frmServiceCtrl: TfrmServiceCtrl
  Left = 0
  Top = 0
  Caption = 'Service Controller'
  ClientHeight = 349
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 32
    Width = 169
    Height = 33
    Caption = 'Control '#39'SimpleService'#39' Service'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 216
    Top = 8
    Width = 399
    Height = 333
    TabOrder = 1
  end
  object CnServiceController1: TCnServiceController
    MachineName = '.'
    Left = 320
    Top = 104
  end
  object CnEventLog1: TCnEventLog
    MachineName = '.'
    Left = 312
    Top = 176
  end
end
