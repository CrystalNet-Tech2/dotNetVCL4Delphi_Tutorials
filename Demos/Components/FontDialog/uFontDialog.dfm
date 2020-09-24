object frmFontDialog: TfrmFontDialog
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Show .Net Font Dialog in Delphi'
  ClientHeight = 301
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnShowFontDialog: TButton
    Left = 99
    Top = 22
    Width = 138
    Height = 30
    Caption = 'Show Font Dialog'
    TabOrder = 0
    OnClick = btnShowFontDialogClick
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 79
    Width = 505
    Height = 202
    Caption = 'Change Fonts'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object LabelFont: TLabel
      Left = 24
      Top = 24
      Width = 209
      Height = 49
      Alignment = taCenter
      AutoSize = False
      Caption = 'Delphi Label Control'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object MemoFont: TMemo
      Left = 24
      Top = 88
      Width = 209
      Height = 89
      Lines.Strings = (
        'Delphi Memo Control')
      TabOrder = 0
    end
    object PanelFont: TPanel
      Left = 264
      Top = 88
      Width = 209
      Height = 89
      Caption = 'Delphi Panel Control'
      TabOrder = 1
    end
    object EditFont: TEdit
      Left = 264
      Top = 24
      Width = 209
      Height = 44
      AutoSize = False
      TabOrder = 2
      Text = 'Delphi EditBox Control'
    end
  end
  object Button1: TButton
    Left = 243
    Top = 22
    Width = 190
    Height = 30
    Caption = 'Show Font Dialog with Apply Event'
    TabOrder = 2
    OnClick = Button1Click
  end
  object CnFontDialog1: TCnFontDialog
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Left = 24
    Top = 8
  end
  object CnFontDialog2: TCnFontDialog
    ShowApply = True
    OnApply = CnFontDialog2Apply
    Left = 456
    Top = 24
  end
end
