object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Show Print PreviewDialog '
  ClientHeight = 238
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnPrint: TButton
    Left = 104
    Top = 72
    Width = 153
    Height = 73
    Caption = 'Print'
    TabOrder = 0
    OnClick = btnPrintClick
  end
  object CnPrintPreviewDialog1: TCnPrintPreviewDialog
    Document = CnPrintDocument1
    UseAntiAlias = True
    Left = 224
    Top = 176
  end
  object CnPrintDocument1: TCnPrintDocument
    DocumentName = 'document'
    OnPrintPage = CnPrintDocument1PrintPage
    Left = 64
    Top = 168
  end
end
