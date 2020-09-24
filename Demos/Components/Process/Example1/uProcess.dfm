object frmProcess: TfrmProcess
  Left = 0
  Top = 0
  Caption = 'How to use .Net Process.Start method in Delphi'
  ClientHeight = 231
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    616
    231)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOpenCalc: TButton
    Left = 24
    Top = 32
    Width = 193
    Height = 25
    Caption = 'Click here to open Calculator'
    TabOrder = 0
    OnClick = btnOpenCalcClick
  end
  object btnOpenNotepad: TButton
    Left = 24
    Top = 64
    Width = 193
    Height = 25
    Caption = 'Click here to open Notepad'
    TabOrder = 1
    OnClick = btnOpenNotepadClick
  end
  object btnOpenCrystalNetWebSite: TButton
    Left = 24
    Top = 96
    Width = 193
    Height = 25
    Caption = 'Click here to open CrystalNet Website'
    TabOrder = 2
    OnClick = btnOpenCrystalNetWebSiteClick
  end
  object Button1: TButton
    Left = 24
    Top = 128
    Width = 193
    Height = 25
    Caption = 'Open any file'
    TabOrder = 3
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 264
    Top = 32
    Width = 345
    Height = 135
    Caption = 'Search it on google'
    TabOrder = 4
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 71
      Height = 13
      Caption = 'Text to Search'
    end
    object txtText2Search: TEdit
      Left = 101
      Top = 20
      Width = 220
      Height = 21
      TabOrder = 0
    end
    object Button2: TButton
      Left = 104
      Top = 56
      Width = 217
      Height = 25
      Caption = 'Search on GOOGLE'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Button3: TButton
    Left = 533
    Top = 189
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 5
    OnClick = Button3Click
    ExplicitTop = 379
  end
  object btnOpenNoWindowFile: TButton
    Left = 24
    Top = 160
    Width = 193
    Height = 25
    Caption = 'Open File without Showing Window'
    TabOrder = 6
    OnClick = btnOpenNoWindowFileClick
  end
  object CnProcess1: TCnProcess
    EnableRaisingEvents = True
    Left = 384
    Top = 184
  end
  object CnOpenFileDialog1: TCnOpenFileDialog
    Filter = 'txt files (*.txt)|*.txt|All files (*.*)|*.*'
    FilterIndex = 2
    Left = 272
    Top = 184
  end
end
