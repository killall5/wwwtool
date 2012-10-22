object fmPrinter: TfmPrinter
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = #1055#1077#1095#1072#1090#1072#1090#1100
  ClientHeight = 282
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    386
    282)
  PixelsPerInch = 96
  TextHeight = 13
  object lbQCount: TLabel
    Left = 8
    Top = 108
    Width = 47
    Height = 13
    Caption = #1042#1086#1087#1088#1086#1089#1086#1074
  end
  object RealImage: TImage
    Left = 8
    Top = 232
    Width = 300
    Height = 483
    AutoSize = True
    Visible = False
  end
  object PreviewImage: TImage
    Left = 248
    Top = 32
    Width = 129
    Height = 153
    Center = True
    Proportional = True
  end
  object lbComm: TLabel
    Left = 8
    Top = 128
    Width = 233
    Height = 57
    Alignment = taCenter
    AutoSize = False
    Caption = #1050#1086#1084#1072#1085#1076#1072' '#8470'1'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    OnClick = lbCommClick
  end
  object Label1: TLabel
    Left = 8
    Top = 192
    Width = 200
    Height = 13
    Caption = #1041#1083#1072#1085#1082#1086#1074' '#1085#1072' '#1089#1090#1088#1072#1085#1080#1094#1077' ('#1089#1090#1088#1086#1082'*'#1089#1090#1086#1083#1073#1094#1086#1074')'
  end
  object lbMultiply: TLabel
    Left = 120
    Top = 208
    Width = 6
    Height = 13
    Caption = '*'
  end
  object seQCount: TSpinEdit
    Left = 64
    Top = 104
    Width = 41
    Height = 22
    MaxValue = 2147483647
    MinValue = 1
    TabOrder = 1
    Value = 1
    OnKeyDown = seMinKeyDown
  end
  object cbQCoding: TCheckBox
    Left = 112
    Top = 108
    Width = 129
    Height = 17
    Caption = #1042#1086#1087#1088#1086#1089' '#1074' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1077
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object btCancel: TButton
    Left = 297
    Top = 248
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
  object btOk: TButton
    Left = 217
    Top = 248
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object gbCommands: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 89
    Caption = #1050#1086#1084#1072#1085#1076#1099
    TabOrder = 0
    object lbMin: TLabel
      Left = 26
      Top = 20
      Width = 5
      Height = 13
      Caption = #1089
    end
    object lbMax: TLabel
      Left = 118
      Top = 20
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object seMin: TSpinEdit
      Left = 40
      Top = 16
      Width = 57
      Height = 22
      MaxValue = 2147483647
      MinValue = 1
      TabOrder = 0
      Value = 1
      OnKeyDown = seMinKeyDown
    end
    object seMax: TSpinEdit
      Left = 136
      Top = 16
      Width = 57
      Height = 22
      MaxValue = 2147483647
      MinValue = 1
      TabOrder = 1
      Value = 1
      OnKeyDown = seMinKeyDown
    end
    object cbUseR2D: TCheckBox
      Left = 8
      Top = 48
      Width = 193
      Height = 17
      Caption = #1041#1088#1072#1090#1100' '#1089#1090#1086#1083#1080#1082#1080' '#1082#1086#1084#1072#1085#1076' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = cbUseR2DClick
    end
    object cbUseNames: TCheckBox
      Left = 8
      Top = 64
      Width = 193
      Height = 17
      Caption = #1053#1072#1079#1074#1072#1085#1080#1103' '#1082#1086#1084#1072#1085#1076' '#1074#1084#1077#1089#1090#1086' '#1089#1090#1086#1083#1080#1082#1072
      TabOrder = 3
    end
  end
  object cbWithImage: TCheckBox
    Left = 248
    Top = 8
    Width = 97
    Height = 17
    Caption = #1045#1089#1090#1100' '#1082#1072#1088#1090#1080#1085#1082#1072
    TabOrder = 3
    OnClick = cbWithImageClick
  end
  object rgPaperOrientation: TRadioGroup
    Left = 248
    Top = 192
    Width = 129
    Height = 49
    Caption = #1054#1088#1080#1077#1085#1090#1072#1094#1080#1103' '#1073#1091#1084#1072#1075#1080
    ItemIndex = 0
    Items.Strings = (
      #1050#1085#1080#1078#1085#1072#1103
      #1040#1083#1100#1073#1086#1084#1085#1072#1103)
    TabOrder = 6
    OnClick = rgPaperOrientationClick
  end
  object seRowCount: TSpinEdit
    Left = 48
    Top = 208
    Width = 57
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 7
    Value = 4
    OnKeyDown = seMinKeyDown
  end
  object seColCount: TSpinEdit
    Left = 144
    Top = 208
    Width = 57
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 8
    Value = 3
    OnKeyDown = seMinKeyDown
  end
  object FontDialog: TFontDialog
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Device = fdBoth
    Left = 208
    Top = 136
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 
      'All (*.jpg;*.jpeg;*.bmp)|*.jpg;*.jpeg;*.bmp|JPEG Image File (*.j' +
      'pg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp'
    Left = 344
  end
end
