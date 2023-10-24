@AbapCatalog.sqlViewName: 'ZKA_DEV_CDS1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Örnek CDS-1'
define view ZKA_DEV_CDS_1
  as select from    ekko
    inner join      ekpo on ekko.ebeln = ekpo.ebeln
    inner join      mara on mara.matnr = ekpo.matnr
    inner join      lfa1 on lfa1.lifnr = ekko.lifnr
    left outer join makt on  makt.matnr = mara.matnr
                         and makt.spras = $session.system_language

{
  ekpo.ebeln,
  ekpo.ebelp,
  ekpo.matnr,
  makt.maktx,
  ekpo.werks,
  ekpo.lgort,
  ekpo.meins,
  lfa1.lifnr,
  lfa1.name1,
  concat( lfa1.stras, lfa1.mcod3 ) as Satici_adresi

}
