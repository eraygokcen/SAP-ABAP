*&---------------------------------------------------------------------*
*& Include          ZEG_0008_01_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form fill_listbox
*&---------------------------------------------------------------------*
FORM fill_listbox .

  DATA: lt_values TYPE vrm_values.

  SELECT * FROM zeg_rest INTO TABLE @DATA(lt_c01).

    LOOP AT lt_c01 INTO DATA(ls_c01).
      APPEND INITIAL LINE TO lt_values ASSIGNING FIELD-SYMBOL(<fs_values>).
      <fs_values>-key  = |{ ls_c01-id ALPHA = OUT }|.
      <fs_values>-text = ls_c01-email.
    ENDLOOP.

    CALL FUNCTION 'VRM_SET_VALUES'
      EXPORTING
        id              = CONV vrm_id( 'P_FILE' )
        values          = lt_values
      EXCEPTIONS
        id_illegal_name = 1
        OTHERS          = 2.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

ENDFORM.
