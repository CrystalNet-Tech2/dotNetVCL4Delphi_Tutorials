object Form12: TForm12
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Active Directory Change Notifications'
  ClientHeight = 336
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    626
    336)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 152
    Top = 8
    Width = 465
    Height = 320
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object Button1: TButton
    Left = 40
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Stop'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object CnADChangeNotifier1: TCnADChangeNotifier
    AuthType = autNegotiate
    SearchRequests = <
      item
        DistinguishedName = 'cn=madhuka+sn=udantha,ou=users,dc=example,dc=com'
      end>
    OnObjectChanged = CnADChangeNotifier1ObjectChanged
    Left = 64
    Top = 120
  end
end
