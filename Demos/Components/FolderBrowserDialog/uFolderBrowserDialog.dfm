object Form19: TForm19
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Browse For Folder'
  ClientHeight = 150
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnBrowseFolder: TButton
    Left = 346
    Top = 56
    Width = 99
    Height = 25
    Caption = 'Browse Folder'
    TabOrder = 0
    OnClick = btnBrowseFolderClick
  end
  object Edit1: TEdit
    Left = 18
    Top = 58
    Width = 322
    Height = 21
    TabOrder = 1
  end
  object CnFolderBrowserDialog1: TCnFolderBrowserDialog
    Left = 280
    Top = 96
  end
end
