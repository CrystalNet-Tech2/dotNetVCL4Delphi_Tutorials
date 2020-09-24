object frmColorDialog: TfrmColorDialog
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Show .Net Color Dialog in Delphi'
  ClientHeight = 562
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnShowColorDialog: TButton
    Left = 187
    Top = 22
    Width = 138
    Height = 30
    Caption = 'Show Color Dialog'
    TabOrder = 0
    OnClick = btnShowColorDialogClick
  end
  object chkAllowFullOpen: TCheckBox
    Left = 8
    Top = 8
    Width = 137
    Height = 17
    Caption = 'Allow Full Dialog Open'
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = chkAllowFullOpenClick
  end
  object chkAnyColor: TCheckBox
    Left = 8
    Top = 28
    Width = 137
    Height = 17
    Caption = 'Any Color'
    TabOrder = 2
    OnClick = chkAnyColorClick
  end
  object chkSolidColorOnly: TCheckBox
    Left = 8
    Top = 48
    Width = 137
    Height = 17
    Caption = 'Solid Color Only'
    TabOrder = 3
    OnClick = chkSolidColorOnlyClick
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 77
    Width = 240
    Height = 477
    Caption = 'Backcolor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object LabelBackColor: TLabel
      Left = 16
      Top = 24
      Width = 185
      Height = 49
      Alignment = taCenter
      AutoSize = False
      Caption = 'Delphi Label Control'
      Color = clBtnFace
      ParentColor = False
      Transparent = False
      Layout = tlCenter
    end
    object MemoBackColor: TMemo
      Left = 16
      Top = 152
      Width = 185
      Height = 89
      Lines.Strings = (
        'Delphi Memo Control')
      TabOrder = 0
    end
    object PanelBackColor: TPanel
      Left = 16
      Top = 256
      Width = 185
      Height = 89
      Caption = 'Delphi Panel Control'
      ParentBackground = False
      TabOrder = 1
    end
    object EditBackColor: TEdit
      Left = 16
      Top = 93
      Width = 185
      Height = 44
      AutoSize = False
      TabOrder = 2
      Text = 'Delphi EditBox Control'
    end
  end
  object GroupBox2: TGroupBox
    Left = 255
    Top = 77
    Width = 240
    Height = 477
    Caption = 'Forecolor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object LabelForeColor: TLabel
      Left = 24
      Top = 24
      Width = 185
      Height = 49
      Alignment = taCenter
      AutoSize = False
      Caption = 'Delphi Label Control'
      Layout = tlCenter
    end
    object MemoForeColor: TMemo
      Left = 24
      Top = 152
      Width = 185
      Height = 89
      Lines.Strings = (
        'Delphi Memo Control')
      TabOrder = 0
    end
    object PanelForeColor: TPanel
      Left = 24
      Top = 256
      Width = 185
      Height = 89
      Caption = 'Delphi Panel Control'
      TabOrder = 1
    end
    object EditForeColor: TEdit
      Left = 24
      Top = 93
      Width = 185
      Height = 44
      AutoSize = False
      TabOrder = 2
      Text = 'Delphi EditBox Control'
    end
  end
  object CnColorDialog1: TCnColorDialog
    Left = 144
    Top = 32
  end
end
