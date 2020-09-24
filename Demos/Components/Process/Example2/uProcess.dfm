object frmProcess: TfrmProcess
  Left = 0
  Top = 0
  Caption = 'Use .Net Process class to start a process in Delphi'
  ClientHeight = 160
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnPrintDoc: TButton
    Left = 96
    Top = 48
    Width = 345
    Height = 25
    Caption = 'Print File using Process.Start method'
    TabOrder = 0
    OnClick = btnPrintDocClick
  end
  object CnProcess1: TCnProcess
    Left = 216
    Top = 88
  end
  object CnOpenFileDialog1: TCnOpenFileDialog
    Filter = 'Doc files (*.doc, *.docx)|*.doc;*.docx|All files (*.*)|*.*'
    Left = 328
    Top = 88
  end
end
