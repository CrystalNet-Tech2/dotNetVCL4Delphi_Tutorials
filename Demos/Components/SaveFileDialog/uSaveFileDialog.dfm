object Form17: TForm17
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Save File Dialog'
  ClientHeight = 212
  ClientWidth = 325
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
    Left = 80
    Top = 64
    Width = 153
    Height = 81
    Caption = 'Show SaveFileDialog'
    TabOrder = 0
    OnClick = Button1Click
  end
  object CnSaveFileDialog1: TCnSaveFileDialog
    Left = 176
    Top = 8
  end
end
