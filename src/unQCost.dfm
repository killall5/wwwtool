object fmQCost: TfmQCost
  Left = 245
  Top = 197
  BorderStyle = bsDialog
  Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1074#1086#1087#1088#1086#1089#1072
  ClientHeight = 170
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lb0: TLabel
    Left = 8
    Top = 36
    Width = 71
    Height = 13
    Caption = #1042#1077#1088#1085#1099#1081' '#1086#1090#1074#1077#1090
  end
  object lb1: TLabel
    Left = 8
    Top = 68
    Width = 84
    Height = 13
    Caption = #1053#1077#1074#1077#1088#1085#1099#1081' '#1086#1090#1074#1077#1090
  end
  object lb2: TLabel
    Left = 8
    Top = 100
    Width = 99
    Height = 13
    Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1080#1077' '#1086#1090#1074#1077#1090#1072
  end
  object lbDescription: TLabel
    Left = 8
    Top = 4
    Width = 241
    Height = 29
    AutoSize = False
    WordWrap = True
  end
  object se0: TSpinEdit
    Left = 145
    Top = 32
    Width = 105
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 1
    OnChange = se0Change
    OnKeyDown = se0KeyDown
  end
  object btOk: TButton
    Left = 97
    Top = 128
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btCancel: TButton
    Left = 177
    Top = 128
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
  object se1: TSpinEdit
    Left = 145
    Top = 64
    Width = 105
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 0
    OnKeyDown = se0KeyDown
  end
  object se2: TSpinEdit
    Left = 145
    Top = 96
    Width = 105
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
    OnKeyDown = se0KeyDown
  end
  object btStandard: TButton
    Left = 8
    Top = 128
    Width = 75
    Height = 25
    Caption = #1057#1090#1072#1085#1076#1072#1088#1090
    ModalResult = 3
    TabOrder = 5
  end
end
