CLASS zcl_dw_dev_rap100_gen_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dw_dev_rap100_gen_data IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.

        DATA:
                "Variablen
                group_id   TYPE string VALUE '###',
                attachment TYPE /dmo/attachment,
                file_name  TYPE /dmo/filename,
                mime_type  TYPE /dmo/mime_type.


        "Clear Data
        DELETE FROM zdw_dev_atrav.

        "Insert Travel Demo Data
        INSERT zdw_dev_atrav FROM (
            SELECT
                FROM /dmo/travel AS travel
                FIELDS
                    travel~travel_id       AS travel_id,
                    travel~agency_id       AS agency_id,
                    travel~customer_id     AS customer_id,
                    travel~begin_date      AS begin_date,
                    travel~end_date        AS end_date,
                    travel~booking_fee     AS booking_fee,
                    travel~total_price     AS total_price,
                    travel~currency_code   AS currency_code,
                    travel~description     AS description,
                    CASE travel~status          "[N(New) | P(Planned) | B(Booked) | C(Cancelled)]
                        WHEN 'N' THEN 'O'
                        WHEN 'P' THEN 'O'
                        WHEN 'B' THEN 'A'
                        ELSE 'X'
                    END                    AS overall_status,
                    @attachment            AS attachement,
                    @mime_type             AS mime_type,
                    @file_name             AS file_name,
                    travel~createdby       AS created_by,
                    travel~createdat       AS created_dat,
                    travel~lastchangedby   AS last_changed_by,
                    travel~lastchangedat   AS last_changed_at,
                    travel~lastchangedat   AS local_last_changed_at
                    order by travel_id UP TO 10 rows

        ).

        COMMIT WORK.
        out->write( |[RAP100 Demo data generated for table zdw_dev_atrav]| ).

        SELECT *
          FROM zdw_dev_atrav
          INTO TABLE @DATA(lt_atrav).

        IF ( sy-subrc NE 0 ).
            CLEAR lt_atrav.
            RETURN.
        ENDIF.

        LOOP AT lt_atrav REFERENCE INTO DATA(lr_s_atrav).
           IF (  sy-tabix EQ 1 ).
            out->write( |Agency_ID| ).
           ENDIF.
           out->write( lr_s_atrav->agency_id ).
        ENDLOOP.

    ENDMETHOD.

ENDCLASS.
