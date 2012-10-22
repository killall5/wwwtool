unit unPrintBlank;
(*
    WWWTool - "What? Where? When?" Tool -
    Инструмент для проведения игр рода "Что? Где? Когда?"
    Copyright (C) 2004-2007, Тамаревская Анна Георгиевна и Тамаревский Алексей

    This file is free software, and not subject to GNU Public License
    restrictions; you can redistribute it and/or modify it in any way
    you see fit. This file is suitable for inclusion in a derivative
    work, regardless of license on the work or availability of source code
    to the work. If you redistribute this file, you must leave this
    header intact.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

    С авторами данной программы можно связаться по адресу mirror@lyceum.nstu.ru.
*)
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, jpeg, ExtCtrls, ExtDlgs;

type
  TfmPrinter = class(TForm)
    btOk: TButton;
    btCancel: TButton;
    lbQCount: TLabel;
    seQCount: TSpinEdit;
    cbQCoding: TCheckBox;
    RealImage: TImage;
    gbCommands: TGroupBox;
    lbMin: TLabel;
    lbMax: TLabel;
    seMin: TSpinEdit;
    seMax: TSpinEdit;
    cbUseR2D: TCheckBox;
    cbUseNames: TCheckBox;
    PreviewImage: TImage;
    cbWithImage: TCheckBox;
    FontDialog: TFontDialog;
    OpenPictureDialog: TOpenPictureDialog;
    lbComm: TLabel;
    rgPaperOrientation: TRadioGroup;
    Label1: TLabel;
    seRowCount: TSpinEdit;
    lbMultiply: TLabel;
    seColCount: TSpinEdit;
    procedure cbUseR2DClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure seMinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbWithImageClick(Sender: TObject);
    procedure lbCommClick(Sender: TObject);
    procedure rgPaperOrientationClick(Sender: TObject);
  private
    OldOrientationItemIndex: integer;
  public
    procedure PrintBlanks;
  end;

var
  fmPrinter: TfmPrinter;

function crc(x, y: integer): integer;

implementation
uses unMain, Printers;

{$R *.dfm}

procedure TfmPrinter.cbUseR2DClick(Sender: TObject);
begin
  cbUseNames.Enabled:= cbUseR2D.Checked;
  if not cbUseNames.Enabled then
    cbUseNames.Checked:= false
end;

procedure TfmPrinter.FormShow(Sender: TObject);
begin
  cbWithImage.Checked:= false;
  cbWithImageClick(nil);

  lbComm.Font.Size:= 14;
  lbComm.Font.Name:= 'Arial';
  FontDialog.Font.Assign(lbComm.Font);

  seRowCount.Value:= 4;
  seColCount.Value:= 3;
  OldOrientationItemIndex:= 0;
  rgPaperOrientation.ItemIndex:= 0;

  btOk.SetFocus
end;

procedure TfmPrinter.seMinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ((Sender as TControl).Parent as TForm).ModalResult:= mrOk
  else
    if Key = VK_ESCAPE then
      ((Sender as TControl).Parent as TForm).ModalResult:= mrCancel
end;

const
  BarArray: array[0..106] of ShortString = (
   '155', '515', '551', '449', '485', '845', '458', '494', '854',
   '548', '584', '944', '056', '416', '452', '065', '425', '461', '560', '506',
   '542', '164', '524', '212', '245', '605', '641', '254', '614', '650', '119',
   '191', '911', '089', '809', '881', '098', '818', '890', '188', '908', '980',
   '01:', '092', '812', '029', '0:1', '821', '221', '182', '902', '128', '1:0',
   '122', '209', '281', ':01', '218', '290', ':10', '230', '5<0', ';00', '04=',
   '0<5', '40=', '4<1', '<05', '<41', '05<', '0=4', '41<', '4=0', '<14', '<50',
   '=40', '50<', '320', '=04', '830', '047', '407', '443', '074', '434', '470',
   '344', '704', '740', '113', '131', '311', '00;', '083', '803', '038', '0;0',
   '308', '380', '023', '032', '203', '302', 'A', 'B', 'C', '@');

//Строка штрих-кода в кодировке Code 128
Function Code128(A: String): String;
var
  BCode: array[0..1023] of byte;
  BInd, i, LenA, CCode: integer;
  ch, ch2, CurMode: char;
begin
  //Собираем строку кодов
  BInd:= 0;
  CurMode:= #0;
  i:= 1;
  LenA:= Length(A);
  while i <= LenA do begin
    //Текущий символ в строке
    ch:= A[i];
    I:= I + 1;
    //Разбираем только символы от 0 до 127
    if ch <= #127 then begin
      //Следующий символ
      if I <= LenA Then
        ch2:= A[i]
      else
        ch2:= #0;

      //Пара цифр - режим С
      if ('0' <= ch) and (ch <= '9') and ('0' <= ch2) and (ch2 <= '9') then begin
        i:= i + 1;
        if BInd = 0 then begin
          //Начало с режима С
          CurMode:= 'C';
          BCode[BInd]:= 105;
          BInd:= BInd + 1
        end else if CurMode <> 'C' then begin
          //Переключиться на режим С
          CurMode:= 'C';
          BCode[BInd]:= 99;
          BInd:= BInd + 1
        end;
        //Добавить символ режима С
        BCode[BInd]:= (Ord(ch) - Ord('0'))*10 + Ord(ch2) - Ord('0');
        BInd:= BInd + 1
      end else begin
        if BInd = 0 then
          if ch < ' ' then begin
            //Начало с режима A
            CurMode:= 'A';
            BCode[BInd]:= 103;
            BInd:= BInd + 1
          end else begin
            //Начало с режима B
            CurMode:= 'B';
            BCode[BInd]:= 104;
            BInd:= BInd + 1
          end;
        //Переключение по надобности в режим A
        if (ch < ' ') and (CurMode <> 'A') then begin
          CurMode:= 'A';
          BCode[BInd]:= 101;
          BInd:= BInd + 1
        //Переключение по надобности в режим B
        end else if (('@' <= ch) and (CurMode <> 'B')) or (CurMode = 'C') then begin
          CurMode:= 'B';
          BCode[BInd]:= 100;
          BInd:= BInd + 1
        end;
        //Служебные символы
        if (ch < ' ') then begin
          BCode[BInd]:= Ord(ch) + 64;
          BInd:= BInd + 1
        //Все другие символы
        end else begin
          BCode[BInd]:= Ord(ch) - 32;
          BInd:= BInd + 1
        end
      end
    end
  end;
  //Подсчитываем контрольную сумму
  CCode:= BCode[0] mod 103;
  for i:= 1 to BInd - 1 do
      CCode:= (CCode + BCode[I] * I) mod 103;
  BCode[BInd]:= CCode;
  BInd:= BInd + 1;
  //Завершающий символ
  BCode[BInd]:= 106;
  BInd:= BInd + 1;
  //Собираем строку символов шрифта
  Result:= '';
  for i:= 0 to BInd - 1 do
    Result:= Result + BarArray[BCode[i]]
end;

function crc(x, y: integer): integer;
begin
  Result:= 0;
  while x > 0 do begin
    Result:= Result xor (x mod 10);
    x:= x div 10;
  end;

  while y > 0 do begin
    Result:= Result xor (y mod 10);
    y:= y div 10;
  end;
end;

procedure TfmPrinter.PrintBlanks;
var
  barcode, CName: string;
  PrintRect: TRect;
  rows, cols, h, mm, rw,
  i, row, command, question: integer;
begin
  rows:= seRowCount.Value;
  cols:= seColCount.Value;
  if cbWithImage.Checked then
    rw:= RealImage.Width
  else
    rw:= 0;

  if rgPaperOrientation.ItemIndex = 0 then
    Printer.Orientation:= poPortrait
  else
  Printer.Orientation:= poLandscape;

  Printer.Title:= 'Карточки ответов';
  Printer.BeginDoc;

  for i:= 0 to (seMax.Value - seMin.Value + 1)*seQCount.Value - 1 do begin
    // номер строки в таблице команд
    row:= i div seQCount.Value + seMin.Value;
    command:= row;
    if cbUseR2D.Checked then begin
      command:= fmWWWTool.Row2Desk(command);
      if command = 0 then
        command:= row
    end;
    question:= i mod seQCount.Value + 1;

    PrintRect.Top:= i div cols mod rows * Printer.PageHeight div rows;
    PrintRect.Left:= i mod cols * Printer.PageWidth div cols;
    PrintRect.Bottom:= PrintRect.Top + Printer.PageHeight div rows;
    PrintRect.Right:= PrintRect.Left + Printer.PageWidth div cols;

    if cbQCoding.Checked then
      barcode:= Code128(format('%.3d-%.2d-%d', [command, question, crc(command, question)]))
    else
      barcode:= Code128(format('%.3d--%d', [command, crc(command, 0)]));

    with Printer.Canvas do begin
      Brush.Color:= clWhite;
      Rectangle(PrintRect);

      Font.Assign(lbComm.Font);
      Font.Color:= $DDDDDD;
      Font.Height:= PrintRect.Bottom - PrintRect.Top - Printer.Canvas.Font.PixelsPerInch div 2;

      // на заднем фоне - номер вопроса
      TextRect(
        PrintRect,
        PrintRect.Left + (PrintRect.Right - PrintRect.Left - TextWidth(format('%d', [question]))) div 2,
        PrintRect.Top + (PrintRect.Bottom - PrintRect.Top - TextHeight(format('%d', [question]))) div 2,
        format('%d', [question])
      );

      // рамочка для того, чтобы проще резать было
      Brush.Color:= clBlack;
      FrameRect(PrintRect);
      Brush.Color:= clWhite;

      Font.Assign(lbComm.Font);

      mm:= trunc(Font.PixelsPerInch /2.54 * 0.1);

      // что будет вверху
      if cbUseNames.Checked then
        // здесь command = <номер столика>
        CName:= Copy(fmWWWTool.sgGame.Cells[0, row], Length(IntToStr(command)) + 3, Length(fmWWWTool.sgGame.Cells[0, row]))
      else
        CName:= format('Команда №%d', [command]);

      if TextWidth(CName) > PrintRect.Right - (PrintRect.Left + 3*mm + rw) then
        Font.Size:= trunc(Font.Size / TextWidth(CName) * (PrintRect.Right - (PrintRect.Left + 3*mm + rw)));

      TextOut(
        PrintRect.Left + 3*mm + rw,
//        PrintRect.Left + (PrintRect.Right - PrintRect.Left - TextWidth(CName)) div 2,
        PrintRect.Top + mm,
        CName);

      h:= TextHeight('H');

      Font.Style:= [];
      Font.Size:= 16;
      Font.Charset:= ANSI_CHARSET;
      Font.Name:= 'Barcode';

      // урезаный по высоте штрих-код
      TextRect(
        Rect(
          PrintRect.Left + 1,
          PrintRect.Top + h + 2*mm,
          PrintRect.Right - 1,
          PrintRect.Top + h + 2*mm + 3*mm
        ),
        PrintRect.Left + 3*mm + rw,
//        PrintRect.Left + (PrintRect.Right - PrintRect.Left - TextWidth(barcode)) div 2,
        PrintRect.Top + 10 + h,
        barcode
      );

      if rw > 0 then
        Draw(PrintRect.Left + mm,
            PrintRect.Top + 10,
            RealImage.Picture.Graphic);

    end;

    if ((i + 1) mod (rows*cols) = 0) and (i <> (seMax.Value - seMin.Value + 1)*seQCount.Value - 1) then
      Printer.NewPage;
  end;
  Printer.EndDoc
end;

procedure TfmPrinter.cbWithImageClick(Sender: TObject);
begin
  if cbWithImage.Checked then
    if OpenPictureDialog.Execute then begin
      PreviewImage.Picture.LoadFromFile(OpenPictureDialog.FileName);
      RealImage.Picture.LoadFromFile(OpenPictureDialog.FileName)
    end else
      cbWithImage.Checked := false
  else begin
    PreviewImage.Picture.Assign(nil);
    RealImage.Picture.Assign(nil)
  end
end;

procedure TfmPrinter.lbCommClick(Sender: TObject);
begin
  FontDialog.Font.Assign(lbComm.Font);
  if FontDialog.Execute then begin
    lbComm.Font.Assign(FontDialog.Font);
    lbComm.Repaint
  end;
end;

procedure TfmPrinter.rgPaperOrientationClick(Sender: TObject);
var
  tmpValue: integer;
begin
  if OldOrientationItemIndex <> rgPaperOrientation.ItemIndex then begin
    tmpValue:= seColCount.Value;
    seColCount.Value:= seRowCount.Value;
    seRowCount.Value:= tmpValue
  end;

  OldOrientationItemIndex:= rgPaperOrientation.ItemIndex
end;

end.
