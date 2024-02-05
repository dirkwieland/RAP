CLASS zdw_dev_rap_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS calculate IMPORTING iv_value TYPE int4.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdw_dev_rap_test IMPLEMENTATION.
    METHOD calculate.


        DATA: lv_message TYPE string.

        IF ( iv_value > 100 ).
            SELECT *
             FROM zgw_flight
             INTO TABLE @DATA(lt_sflight).

            IF ( sy-subrc NE 0 ).
              CLEAR lt_sflight.
            ENDIF.

            LOOP AT lt_sflight REFERENCE INTO DATA(lr_s_sflight).
               IF ( lr_s_sflight->carrier_id EQ '1' ).

               ENDIF.
            ENDLOOP.

        ELSEIF ( iv_value EQ 10 ).

        ENDIF.
    ENDMETHOD.
ENDCLASS.
