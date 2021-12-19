*&----------------------------------------------------------*
*  ABAP Name     : ZEG_ABAPGIT_001
*  Job-Name      : Parallel Cursor
*  Autor         : Eray GÖKCEN
*  GMP relevant  :
*  Date          : 19.12.2021
*  Description   :
*&----------------------------------------------------------*
REPORT zeg_abapgit_001.

TABLES:
  likp,
  lips.

DATA:
  gs_likp TYPE likp,
  gs_lips TYPE lips.

DATA:
  w_runtime1 TYPE i,
  w_runtime2 TYPE i,
  lv_tabix   LIKE sy-index.

START-OF-SELECTION.
  SELECT *
    FROM likp
    INTO TABLE @DATA(gt_likp).

  SELECT *
    FROM lips
    INTO TABLE @DATA(gt_lips).

  GET RUN TIME FIELD w_runtime1.
  SORT gt_likp BY vbeln.
  SORT gt_lips BY vbeln.

  LOOP AT gt_likp INTO likp.

    READ TABLE gt_lips TRANSPORTING NO FIELDS WITH KEY vbeln = likp-vbeln BINARY SEARCH.
    IF sy-subrc EQ 0.
      lv_tabix = sy-tabix.

      LOOP AT gt_lips INTO lips FROM lv_tabix.
        IF lips-vbeln <> likp-vbeln.
          EXIT.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDLOOP.

  GET RUN TIME FIELD w_runtime2.

  w_runtime2 = w_runtime2 - w_runtime1.

  WRITE w_runtime2.
