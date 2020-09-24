object Form12: TForm12
  Left = 0
  Top = 0
  Caption = 'BackgroundWorker'
  ClientHeight = 131
  ClientWidth = 292
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object resultLabel: TLabel
    Left = 64
    Top = 24
    Width = 17
    Height = 13
    Caption = '0%'
  end
  object startAsyncButton: TButton
    Left = 40
    Top = 72
    Width = 99
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = startAsyncButtonClick
  end
  object cancelAsyncButton: TButton
    Left = 161
    Top = 72
    Width = 104
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = cancelAsyncButtonClick
  end
  object CnBackgroundWorker1: TCnBackgroundWorker
    OnDoWork = CnBackgroundWorker1DoWork
    OnProgressChanged = CnBackgroundWorker1ProgressChanged
    OnRunWorkerCompleted = CnBackgroundWorker1RunWorkerCompleted
    Left = 200
    Top = 16
  end
end
