*&---------------------------------------------------------------------*
*& Include          ZEG_0008_01_TOP
*&---------------------------------------------------------------------*
TABLES: zeg_rest.
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETER p_file TYPE zeg_rest-email AS LISTBOX VISIBLE LENGTH 50 OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.
