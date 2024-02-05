@AbapCatalog.sqlViewName: 'ZDW_DEV_FLIGTH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Test'
define view ZDW_DEV_TEST as select from zgw_flight
{
    key carrier_id as CarrierId,
    key emp_no as EmpNo,
    key connection_id as ConnectionId,
    key flight_date as FlightDate,
    price as Price,
    currency_code as CurrencyCode,
    plane_type_id as PlaneTypeId,
    seats_max as SeatsMax,
    seats_occupied as SeatsOccupied,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    locl_last_changed_at as LoclLastChangedAt
}
