object Form18: TForm18
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Open File Dialog'
  ClientHeight = 254
  ClientWidth = 273
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
    Left = 56
    Top = 80
    Width = 153
    Height = 81
    Caption = 'Show Open File Dialog'
    TabOrder = 0
    OnClick = Button1Click
  end
  object CnOpenFileDialog1: TCnOpenFileDialog
    Left = 128
    Top = 192
  end
end
