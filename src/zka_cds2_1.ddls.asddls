@AbapCatalog.sqlViewName: 'ZKA_CDS22'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'İkinci Hafta Ödevi 2.CDS'
define view ZKA_CDS2_1
  as select from ZKA_CDS_2

{
  vbeln,
  sum(conversion_netwr)                                                                           as TotalNetValue,
  kunnrAd,
  count(*)                                                                                        as TotalInvoiceNumber,
  division(cast( sum(conversion_netwr) as abap.curr( 10, 3 ) ), cast( count(*) as abap.int1 ), 3) as AverageQuantity,
  left(fkdat,4)                                                                                   as InvoiceYear,
  substring(fkdat,5,2)                                                                            as InvoiceMonth,
  substring(fkdat,7,2)                                                                            as InvoiceDay,
  substring(inco2_l,1,3)                                                                          as IncotermLoc,
  fkdat
}
group by
  vbeln,
  kunnrAd,
  fkdat,
  inco2_l
