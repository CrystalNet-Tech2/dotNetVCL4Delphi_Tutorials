object frmPrintDocument: TfrmPrintDocument
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Print Document'
  ClientHeight = 368
  ClientWidth = 290
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
    Left = 207
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 0
    OnClick = btnPrintClick
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 16
    Width = 273
    Height = 313
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'The CnPrintDocument '
      'component allows users to '
      'send an output to a printer.')
    ParentFont = False
    TabOrder = 1
  end
  object CnPrintDocument1: TCnPrintDocument
    OnPrintPage = CnPrintDocument1PrintPage
    Left = 80
    Top = 144
  end
  object CnPrintDialog1: TCnPrintDialog
    Document = CnPrintDocument1
    PrinterSettings = CnPrinterSettings1
    Left = 80
    Top = 208
  end
  object CnPrinterSettings1: TCnPrinterSettings
    Left = 176
    Top = 160
  end
end
