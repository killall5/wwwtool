#   WWWTool - "What? Where? When?" Tool -
#   ���������� ��� ���������� ��� ���� "���? ���? �����?"
#   ������ ��� ��������� ���������
#   Copyright (C) 2004-2007, ����������� ���� ���������� � ����������� �������
#
#   This file is free software, and not subject to GNU Public License
#   restrictions; you can redistribute it and/or modify it in any way
#   you see fit. This file is suitable for inclusion in a derivative
#   work, regardless of license on the work or availability of source code
#   to the work. If you redistribute this file, you must leave this
#   header intact.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#   � �������� ������ ��������� ����� ��������� �� ������ mirror@lyceum.nstu.ru.


# ������������� ������ ������
SetCompressor /SOLID lzma
                             
# ������ ���������
!define VERSION     "0.4"
#!define SUFFIX      ""
#!define FILE_SUFFIX ""

# �������� ��� ���� (��������� ���������)
!define DATE_VAL "20070213"
# ��������� ����
!define DATE_STR "13 ������� 2007"

Function .onInit
  ClearErrors
  ReadRegStr $R0 HKLM "Software\Microsoft\Internet Explorer" "Version"
  IfErrors old_explorer lbl_456

  lbl_456: ; ie 4+
    StrCpy $R0 $R0 1
    StrCmp $R0 "4" old_explorer
  Goto lbl_done

  old_explorer:
    MessageBox MB_YESNO|MB_ICONEXCLAMATION \
      "��� ����������� ������ ��������� ���������� ������ Microsoft Internet Explorer ������ 4.$\n����������?" \
      IDYES lbl_done
    Abort

  lbl_done:
FunctionEnd

# ����������� ������������ �����
!include "FontReg.nsh"
!include "FontName.nsh"
!include "MUI.nsh"

# �������� ���������������� ����������
!ifndef SUFFIX
  Name    "WWWTool, ������ ${VERSION}"
!else
  Name    "WWWTool, ������ ${VERSION} ${SUFFIX}"
!endif
# ��� ����������� �����
!ifndef FILE_SUFFIX
  OutFile "..\stable\WWWTool-${VERSION}-${DATE_VAL}.exe"
!else
  OutFile "..\stable\WWWTool-${VERSION}-${FILE_SUFFIX}-${DATE_VAL}.exe"
!endif

# �������������� ������ "������..."
ShowInstDetails show
ShowUninstDetails show

# �� ��������� ������ � C:\Program Files
InstallDir "$PROGRAMFILES\WWWTool"

# ������ �������� ��������� � ��������
!define MUI_ICON   "${NSISDIR}\Contrib\Graphics\Icons\orange-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\orange-uninstall.ico"

# �������� ������
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP   "${NSISDIR}\Contrib\Graphics\Header\orange-r.bmp"
!define MUI_HEADERIMAGE_UNBITMAP "${NSISDIR}\Contrib\Graphics\Header\orange-uninstall-r.bmp"

# �������� ����� �� ��������� ����������� � ���������
!define MUI_WELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\orange.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\orange-uninstall.bmp"

# �������� �������� ����� ������ �����������
!define MUI_COMPONENTSPAGE_SMALLDESC
# ������������� � ����������
!define MUI_ABORTWARNING


# ����������:
	# �����������
	!define      MUI_WELCOMEPAGE_TITLE_3LINES
	!insertmacro MUI_PAGE_WELCOME
	# ��������
	!define      MUI_LICENSEPAGE_RADIOBUTTONS
	!insertmacro MUI_PAGE_LICENSE "..\gpl.txt"
	# ����� �����������
	!insertmacro MUI_PAGE_COMPONENTS
	# ����� ����������
	!insertmacro MUI_PAGE_DIRECTORY
	# ��������������� ���������
	!insertmacro MUI_PAGE_INSTFILES
	# ������
	!define      MUI_FINISHPAGE_TITLE_3LINES
	!insertmacro MUI_PAGE_FINISH
# /����������

# ��������:
	# �����������
	!define      MUI_WELCOMEPAGE_TITLE_3LINES
	!insertmacro MUI_UNPAGE_WELCOME
	# ����������� ��������
	!insertmacro MUI_UNPAGE_CONFIRM
	# ��������������� ��������
	!insertmacro MUI_UNPAGE_INSTFILES
	# ��������
	!define      MUI_FINISHPAGE_TITLE_3LINES
	!insertmacro MUI_UNPAGE_FINISH
# /��������

# ���� ���������� - �������
!insertmacro MUI_LANGUAGE "Russian"

Section "����������� �����" binary
	# ����� ������� ��� ������ �����������... �� �����?
	#SectionIn RO

	SetOutPath "$INSTDIR"
	File "..\*.*"

	# ����� �� http://nsis.sourceforge.net/Register_Fonts
	# ��������� ������
	StrCpy $FONT_DIR $FONTS
	!insertmacro InstallTTFFont "..\src\Stacc222.ttf"
	!insertmacro InstallTTFFont "..\src\Barcode.ttf"

	# ���������� ������ ������� ���������� ����������
	SendMessage ${HWND_BROADCAST} ${WM_FONTCHANGE} 0 0 /TIMEOUT=5000

	# ����� �� �������� �� ������� ���� �������� ������������
	SetOutPath "$DOCUMENTS"
	CreateShortcut "$DESKTOP\WWWTool.lnk" "$INSTDIR\WWWTool.exe"

	# ��� ��������� ������ - � "����" �� ���� �������������
	SetShellVarContext all

	CreateDirectory "$SMPROGRAMS\WWWTool"
	CreateShortcut "$SMPROGRAMS\WWWTool\WWWTool.lnk" "$INSTDIR\WWWTool.exe"
	CreateShortcut "$SMPROGRAMS\WWWTool\GNU General Public License.lnk" "$INSTDIR\gpl.txt"

	# ����������� ������ ����������
	WriteRegStr HKCR ".state" "" "WWWTool.state"
	WriteRegStr HKCR "WWWTool.state" "" "��������� ��������� WWWTool"
	WriteRegStr HKCR "WWWTool.state\shell\open\command" "" "$\"$INSTDIR\WWWTool.exe$\" $\"%1$\""
	WriteRegStr HKCR "WWWTool.state\DefaultIcon" "" "$INSTDIR\WWWTool.exe,0"
SectionEnd
LangString DESC_binary ${LANG_RUSSIAN} "���������������� ����� ��������� � ����������� ��� ������ �����"

SectionGroup /e "������������" doc
	Section "�������" manual
		SetOutPath "$INSTDIR\doc"
		File /a "..\doc\*.*"

		# ��� ��������� ������ - � "����" �� ���� �������������
		SetShellVarContext all

		CreateShortcut "$SMPROGRAMS\WWWTool\�������.lnk" "$INSTDIR\doc\index.html"
	SectionEnd
	LangString DESC_manual ${LANG_RUSSIAN} "����������� ������������"

	Section "������� GNU GPL" ru_GPL
		SetOutPath "$INSTDIR\ru gnu gpl"
		File /a "..\ru gnu gpl\*.*"

		# ��� ��������� ������ - � "����" �� ���� �������������
		SetShellVarContext all

		CreateShortcut "$SMPROGRAMS\WWWTool\������� ������� GNU GPL.lnk" "$INSTDIR\ru gnu gpl\ar01.html"
	SectionEnd
	LangString DESC_ru_GPL ${LANG_RUSSIAN} "������� General Public License �� ������� ����"
SectionGroupEnd

Section "�������� ���" src
	# ���� ����� ������������ ����� ������������
	CreateDirectory $INSTDIR\stable

	SetOutPath "$INSTDIR\src"
	File /a /x "*.dcu" /x "*.ddp" /x "*.~*" /x "*.cfg" "..\src\*.*"
SectionEnd
LangString DESC_src ${LANG_RUSSIAN} "�������� ������ ��������� � ������� �����������"

# ��������� �������� � ������ �����������
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${binary} $(DESC_binary)
	!insertmacro MUI_DESCRIPTION_TEXT ${manual} $(DESC_manual)
	!insertmacro MUI_DESCRIPTION_TEXT ${ru_GPL} $(DESC_ru_GPL)
	!insertmacro MUI_DESCRIPTION_TEXT ${src}    $(DESC_src)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

Section "-hidden"
	# ��� ������ � ����� ������
	# ������� ��������
	WriteUninstaller "$INSTDIR\eraser.exe"

	# ����� ���������/�������� ��������
	StrCpy $R0 "Software\Microsoft\Windows\CurrentVersion\Uninstall\WWWTool"
	!ifndef SUFFIX
		WriteRegStr   HKLM $R0 "DisplayName" "WWWTool, ${VERSION}"
	!else
		WriteRegStr   HKLM $R0 "DisplayName" "WWWTool, ${VERSION} ${SUFFIX}"
	!endif

	# ������
	WriteRegStr   HKLM $R0 "DisplayIcon" "$\"$INSTDIR\WWWTool.exe$\""
	# ���� � ���������
	WriteRegStr   HKLM $R0 "UninstallString" "$\"$INSTDIR\eraser.exe$\""
	# ��������
	WriteRegStr   HKLM $R0 "Publisher" "������� �����������"
	# ������ ��-����
	WriteRegStr   HKLM $R0 "HelpLink" "http://lyceum.nstu.ru/wwwtool/doc/"
	# ����������
	WriteRegStr   HKLM $R0 "URLUpdateInfo" "http://lyceum.nstu.ru/wwwtool/"
	# �������� � ���������
	WriteRegStr   HKLM $R0 "URLInfoAbout" "mailto:mirror@lyceum.nstu.ru"
	# ������
	WriteRegStr   HKLM $R0 "DisplayVersion" "${VERSION}, �� ${DATE_STR}"
	# ������ ������ "�������"
	WriteRegDWORD HKLM $R0 "NoModify" 1
	WriteRegDWORD HKLM $R0 "NoRepair" 1
SectionEnd

Section "Uninstall"
	# ������
	Delete $INSTDIR\eraser.exe
	RMDir /r $INSTDIR

	# ������ � �������� �����
	Delete "$DESKTOP\WWWTool.lnk"

	# ������ �� �������� ����
	SetShellVarContext all
	RMDir /r "$SMPROGRAMS\WWWTool"

	# ������������������ ����������
	DeleteRegKey HKCR ".state"
	DeleteRegKey HKCR "WWWTool.state"

	# �������� �� ������ ���������
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WWWTool"
SectionEnd