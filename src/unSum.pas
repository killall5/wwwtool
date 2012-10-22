unit unSum;
(*
    WWWTool - "What? Where? When?" Tool -
    ���������� ��� ���������� ��� ���� "���? ���? �����?"
    Copyright (C) 2004-2007, ����������� ���� ���������� � ����������� �������

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

    � �������� ������ ��������� ����� ��������� �� ������ mirror@lyceum.nstu.ru.
*)
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, OleCtrls, SHDocVw, ExtCtrls, HTMLCreator;

type
  TfmSum = class(TForm)
    wbHiddenPrev: TWebBrowser;
    sgSum: TStringGrid;
    MainMenu: TMainMenu;
    mResults: TMenuItem;
    mLoadSum: TMenuItem;
    mSaveSum: TMenuItem;
    mEmpty1: TMenuItem;
    mAddResult: TMenuItem;
    mEmpty2: TMenuItem;
    mClose: TMenuItem;
    OpenResult: TOpenDialog;
    HTMLCreator: THTMLCreator;
    SaveTotals: TSaveDialog;
    mDelRow: TMenuItem;
    mDelCol: TMenuItem;
    procedure mCloseClick(Sender: TObject);
    procedure mAddResultClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure wbHiddenPrevDocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure mSaveSumClick(Sender: TObject);
    procedure HTMLCreatorGetValue(Sender: TObject; Name: String;
      var Value: String);
    procedure mDelRowClick(Sender: TObject);
    procedure mDelColClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  fmSum: TfmSum;

implementation
uses unAddResult;

{$R *.dfm}

procedure TfmSum.FormShow(Sender: TObject);
begin
  sgSum.ColCount:= 1;
  sgSum.RowCount:= 1;
//  wbHiddenPrev.Navigate('about:blank');
end;

procedure TfmSum.mAddResultClick(Sender: TObject);
begin
  if OpenResult.Execute then begin
    wbHiddenPrev.Tag:= (Sender as TMenuItem).Tag;
    wbHiddenPrev.Navigate('file://' + OpenResult.FileName);
  end
end;

procedure TfmSum.wbHiddenPrevDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  i, j, r, CommName, Place, Result, Level: integer;
  wbTable: OleVariant;
  Str: String;
begin
  try
    Str:= wbHiddenPrev.OleObject.Document.all.tags('H2').item(0).InnerText;
    Str:= wbHiddenPrev.OleObject.Document.all.tags('TABLE').item(0).InnerText;

    CommName:= -1;
    Place:= -1;
    Result:= -1;
    Level:= -1;

    if wbHiddenPrev.Tag = 0 then
      with fmAddResult do begin // ���� �������� ����������
        cbGameName.Clear;
        for i:= 1 to sgSum.ColCount-1 do
          cbGameName.AddItem(sgSum.Cells[i, 0], nil);

        rgAsResult.ItemIndex:= 1;
        sePrefix.Value:= 0;

        // ����� �� Delphi Russian Knowledge Base from Vit (vit@vingrad.ru)

        // ����� �� FAQ: http://blackman.km.ru/myfaq/cont4.phtml
        // ������� ��������� � ����� members.home.com/hfournier/webbrowser.htm

        cbGameName.Text:= wbHiddenPrev.OleObject.Document.all.tags('H2').item(0).innerText;
        Caption:= ExtractFileName(OpenResult.FileName) + ': ���������';
        if ShowModal = mrOk then begin
          wbTable:= wbHiddenPrev.OleObject.Document.getElementById('tbl');

          // ����� ����������� ��������
          for j:= 0 to wbTable.Rows.Item(0).Cells.Length-1 do begin
            Str:= wbTable.Rows.Item(0).Cells.Item(j).InnerText;
            if Str = '��������' then
              CommName:= j
            else
            if Str = '�����' then
              Place:= j
            else
            if Str = '���������' then
              Result:= j
            else
            if Str = '����' then
              Level:= j
          end;

          if (CommName = -1) or (Place = -1) or (Result = -1) or cbUseLevel.Checked and (Level = -1) then begin
            MessageBox(handle, '����������� ����������� �������(� �������, "�������� �������", �� �����, ��������� ��� ����). ���������� ���������� ����������', '������', MB_OK or MB_ICONERROR);
            exit
          end;

          // ���� ���� � ����� �� ���������
          i:= 1;
          while (i < sgSum.ColCount) and (sgSum.Cells[i, 0] <> cbGameName.Text) do
            inc(i);

          if i = sgSum.ColCount then begin
            sgSum.ColCount:= i + 1;
            for j:= 0 to sgSum.RowCount-1 do
              sgSum.Cells[i, j]:= '';

            sgSum.Cells[i, 0]:= cbGameName.Text;
          end;

          // �������� � ��������� ����
          sgSum.Col:= i;

          // ����� ���� �������� ����, � ������� ���
          if cbUseLevel.Checked and (sgSum.Cells[1, 0] <> '����') then begin

            // ����������� ���������� ��������
            sgSum.ColCount:= sgSum.ColCount + 1;

            // �������
            for i:= 0 to sgSum.RowCount-1 do
              for j:= sgSum.ColCount-2 downto 1 do
                sgSum.Cells[j + 1, i]:= sgSum.Cells[j, i];

            // �� � ��������� ���� ���� ���������...
            sgSum.Col:= sgSum.Col + 1;

            // �������� 1 �������
            for i:= 0 to sgSum.RowCount-1 do
              sgSum.Cells[1, i]:= '';

            // ����������������� �����-������ "����"...
            sgSum.Cells[1, 0]:= '����'

          end;

          for i:= 1 to wbTable.Rows.Length-1 do begin

            // ����� ������� �������
            r:= 1;
            while (r < sgSum.RowCount) and (sgSum.Cells[0, r] <> wbTable.Rows.Item(i).Cells.Item(CommName).InnerText) do
              inc(r);

            if r = sgSum.RowCount then begin
              sgSum.RowCount:= r + 1;
              for j:= 0 to sgSum.ColCount-1 do
                sgSum.Cells[j, r]:= '';

              sgSum.Cells[0, r]:= wbTable.Rows.Item(i).Cells.Item(CommName).InnerText;
            end;

            sgSum.Row:= r;

            if rgAsResult.ItemIndex = 0 then // �����
              Str:= wbTable.Rows.Item(i).Cells.Item(Place).InnerText
            else                             // ���������
              Str:= wbTable.Rows.Item(i).Cells.Item(Result).InnerText;


            if cbUseLevel.Checked then
              sgSum.Cells[1, sgSum.Row]:= wbTable.Rows.Item(i).Cells.Item(Level).InnerText;

            // ����� ����������� ������� � ��������
            r:= 1;
            while (r <= length(Str)) and (Str[r] <> '/') do
              inc(r);

            // ����� ��� ������� ����������
            j:= StrToInt(Copy(Str, 1, r - 1)) + sePrefix.Value;
            // �������
            r:= StrToIntDef(Copy(Str, r+1, length(Str)), 0);

            sgSum.Cells[sgSum.Col, sgSum.Row]:= IntToStr(j);
            if rgAsResult.ItemIndex = 1 then
              sgSum.Cells[sgSum.Col, sgSum.Row]:=
                sgSum.Cells[sgSum.Col, sgSum.Row] + '/' + IntToStr(r);

          end;

          // MessageBox(handle, PChar('�������� ���������� ����������� �� "' + ExtractFileName(OpenResult.FileName) + '"'), '���������� � �����������', MB_OK or MB_ICONINFORMATION)

        end;
      end
    else begin // ���� ��������� ����� ����
      wbTable:= wbHiddenPrev.OleObject.Document.getElementById('tbl');
      sgSum.ColCount:= wbTable.Rows.Item(0).Cells.Length - 2;
      sgSum.RowCount:= wbTable.Rows.Length;

      for i:= 0 to sgSum.ColCount-1 do
        for j:= 0 to sgSum.RowCount-1 do begin
          sgSum.Cells[i, j]:= wbTable.Rows.Item(j).Cells.Item(i + 1).InnerText;
          if sgSum.Cells[i, j] = ' ' then
            sgSum.Cells[i, j]:= '';
        end;
      sgSum.Cells[0, 0]:= '';
    end;
  except
  end;
end;

procedure TfmSum.mCloseClick(Sender: TObject);
begin
  Close
end;

procedure TfmSum.mSaveSumClick(Sender: TObject);
begin
  if SaveTotals.Execute then with HTMLCreator do begin
    TemplateFileName:= ExtractFilePath(Application.ExeName) + '�����.tht';
    HTMLFileName:= SaveTotals.FileName;
    WriteHTML
  end;
end;

procedure TfmSum.HTMLCreatorGetValue(Sender: TObject; Name: String;
  var Value: String);
var
  i, j: integer;
  tmpValue: String;
begin
  Name:= AnsiUpperCase(Name);
  if Name = 'COLCOUNT' then
    Value:= IntToStr(sgSum.ColCount)
  else
  if Name = 'ROWCOUNT' then
    Value:= IntToStr(sgSum.RowCount)
  else
  if Name = '���������' then begin
    Value:= formatDateTime('"����� ���� �� "d mmmm yyyy', Now);
    tmpValue:= Value;
    if InputQuery('��������� ���������', '������� ������ ��� ��������� ���������', tmpValue) then
      Value:= tmpValue
  end else
  if Name = '�����' then begin
    Value:= '';
    for i:= 0 to sgSum.RowCount-1 do
      for j:= 0 to sgSum.ColCount-1 do
        Value:= Value + '"' + sgSum.Cells[j, i] + '", ';
    Value:= Value + '""'
  end
end;

procedure TfmSum.mDelRowClick(Sender: TObject);
var
  i, j: integer;
begin
  if sgSum.Row > 0 then
    if MessageBox(handle, PChar('������������� ������� �� ������ ���������� ������� "' + sgSum.Cells[0, sgSum.Row] + '"?'), '��������', MB_YESNO or MB_ICONQUESTION) = mrYes then begin

      // ������� ������� ����� ���������� � ���������
      for j:= sgSum.Row + 1 to sgSum.RowCount-1 do
        for i:= 0 to sgSum.ColCount-1 do
          sgSum.Cells[i, j-1]:= sgSum.Cells[i, j];

      sgSum.RowCount:= sgSum.RowCount-1
    end;
end;

procedure TfmSum.mDelColClick(Sender: TObject);
var
  i, j: integer;
begin
  if MessageBox(handle, PChar('������������� ������� ������� "' + sgSum.Cells[sgSum.Col, 0] + '" �� �����������?'), '��������', MB_YESNO or MB_ICONQUESTION) = mrYes then begin

    // ���������� �����������
    for i:= sgSum.Col + 1 to sgSum.ColCount-1 do
      for j:= 0 to sgSum.RowCount-1 do
        sgSum.Cells[i-1, j]:= sgSum.Cells[i, j];

    sgSum.ColCount:= sgSum.ColCount-1
  end;
end;

end.
