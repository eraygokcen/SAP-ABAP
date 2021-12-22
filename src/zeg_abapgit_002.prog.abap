*&----------------------------------------------------------*
*  ABAP Name     : ZEG_ABAPGIT_002
*  Job-Name      : Selection-Screen'da Tabloya göre Listbox Doldurma
*  Autor         : Eray GÖKCEN
*  Date          : 22.12.2021
*&----------------------------------------------------------*
REPORT zeg_abapgit_002.

INCLUDE ZEG_ABAPGIT_002_TOP.
INCLUDE ZEG_ABAPGIT_002_C01.
INCLUDE ZEG_ABAPGIT_002_F01.
INCLUDE ZEG_ABAPGIT_002_I01.
INCLUDE ZEG_ABAPGIT_002_O01.


AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
PERFORM fill_listbox.
