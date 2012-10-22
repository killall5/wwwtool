object fmAddCommand: TfmAddCommand
  Left = 245
  Top = 197
  ActiveControl = cbComName
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1084#1072#1085#1076#1091
  ClientHeight = 162
  ClientWidth = 249
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
    249
    162)
  PixelsPerInch = 96
  TextHeight = 13
  object lbComment: TLabel
    Left = 8
    Top = 56
    Width = 233
    Height = 26
    AutoSize = False
    Caption = 
      'C'#1080#1084#1074#1086#1083#1099' " | " '#1089#1095#1080#1090#1072#1102#1090#1089#1103' '#1089#1083#1091#1078#1077#1073#1085#1099#1084#1080', '#1083#1102#1073#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086#1089#1083#1077' '#1085#1080#1093' '#1080 +
      #1075#1085#1086#1088#1080#1088#1091#1077#1090#1089#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBtnShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lbComName: TLabel
    Left = 8
    Top = 8
    Width = 141
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1084#1072#1085#1076#1099
  end
  object lbDesk: TLabel
    Left = 8
    Top = 92
    Width = 85
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1057#1090#1086#1083#1080#1082' '#1082#1086#1084#1072#1085#1076#1099
  end
  object cbComName: TComboBox
    Left = 16
    Top = 32
    Width = 217
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object seDesk: TSpinEdit
    Left = 128
    Top = 88
    Width = 105
    Height = 22
    Anchors = [akLeft, akBottom]
    MaxValue = 2147483647
    MinValue = 1
    TabOrder = 1
    Value = 1
    OnKeyDown = seDeskKeyDown
  end
  object btOk: TButton
    Left = 80
    Top = 120
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btCancel: TButton
    Left = 160
    Top = 120
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object cbCompetition: TCheckBox
    Left = 8
    Top = 122
    Width = 65
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1042' '#1079#1072#1095#1077#1090
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
end
